class FetchCampaignDataFromUnamo
  def call()
    unamo_response = UnamoSeoAdapter.new.get_campaigns()
    return unless unamo_response.first
    unamo_response.each do |value|
      Campaign.find_or_create_by(id: value['id']) do |campaign|
        campaign.name = value['name']
        campaign.title = value['title']
        campaign.active = value['active']
        campaign.created_at = value['created_at']
      end
    end
  end
end
