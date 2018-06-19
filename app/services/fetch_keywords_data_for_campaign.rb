class FetchKeywordsDataForCampaign
  def call(campaign_id)
    unamo_response = UnamoSeoAdapter.new.get_keywords_for_campaign(campaign_id)
    return unless unamo_response.first
    campaign = Campaign.find_by_id(campaign_id)
    unamo_response.each do |value|
      campaign.keywords.find_or_create_by(id: value['id']) do |k|
        k.name = value['name']
        k.created_at = value['created_at']
        k.group_id = value['groups']
      end
      campaign.keywords.each do |k|
        value['groups'].each do |g|
          GroupsKeyword.find_or_create_by(keyword_id: k.id) do |group|
             group.group_id = g
          end
        end
      end
    end
  end
end
