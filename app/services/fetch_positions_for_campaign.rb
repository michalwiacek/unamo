class FetchPositionsForCampaign
  def call(campaign_id)
    unamo_response = UnamoSeoAdapter.new.get_last_31_positions_for_campaign(campaign_id)
    return unless unamo_response.first
    campaign = Campaign.find_by_id(campaign_id)
    keywords_ids = unamo_response['keywords'].map { |val| val['id'] }
    keywords = campaign.keywords.where(id: keywords_ids).each_with_object({}) { |el, acc| acc[el.id] = el }
    unamo_response['keywords'].each do |v|
      pos = v['positions'].transform_values(&:to_i)
      pos.each do |key, value|
        keywords[v['id']].positions.find_or_create_by(date: key) do |position|
          position.occurrences = value
        end
      end
    end
  end
end
