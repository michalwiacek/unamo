class UnamoSeoAdapter
  require "http"
  UNAMO_TOKEN = ENV['UNAMO_SEO_API_TOKEN'] || 'zmvmswboR_1H2cqsDEV303jM4wEI5ptV'
  UNAMO_API_URL = 'https://seo.unamo.com/api/v1'

  def initialize(api_token: ENV['UNAMO_SEO_API_TOKEN'])
    @api_token = api_token
  end

  def fetch_resource(resource_path)
    make_request_with_token(resource_path)
  end
  def fetch_resource_with_params(resource_path, params)
    make_request_with_token_and_params(resource_path, params)
  end

  def get_campaigns()
    path = 'campaigns'
    result = fetch_resource(path)
    if result
      #byebug
      JSON.parse(result)
    else
      {}
    end
  end
  def get_keywords_for_campaign(campaign_id)
    path = "campaigns/#{campaign_id}/keywords"
    result = fetch_resource(path)
    if result
      JSON.parse(result)
    else
      {}
    end
  end
  def get_groups_for_campaign(campaign_id)
    path = "campaigns/#{campaign_id}/groups"
    result = fetch_resource(path)
    if result
      JSON.parse(result)
    else
      {}
    end
  end

  def get_last_31_positions_for_campaign(campaign_id)
    path = "campaigns/#{campaign_id}/positions.json"
    date_from = (Date.today - 31).to_s(:db)
    date_to = Date.today.to_s(:db)
    params = {date_from: date_from, date_to: date_to }
    result = fetch_resource_with_params(path, params)
    if result
      JSON.parse(result)
    else
      {}
    end
  end

  private

  def make_request_with_token(path)
    headers = {
      token: @api_token
    }
    make_request(path, headers)
  end

  def make_request_with_token_and_params(path, params)
    headers = {
      token: @api_token
    }
    make_request_with_params(path, headers, params)
  end

  def make_request_with_params(path, headers, params)
    uri = URI("#{UNAMO_API_URL}/#{path}")
    HTTP.headers(headers).get(uri, params: params)
  end

  def make_request(path, headers)
    uri = URI("#{UNAMO_API_URL}/#{path}")
    HTTP.headers(headers).get(uri)
  end
end
