class FetchGroupsDataForCampaign
  def call(campaign_id)
    unamo_response = UnamoSeoAdapter.new.get_groups_for_campaign(campaign_id)
    return unless unamo_response.first
    campaign = Campaign.find_by_id(campaign_id)
    unamo_response.each do |value|
      campaign.groups.find_or_create_by(id: value['id']) do |gp|
        gp.name = value['name']
        gp.created_at = value['created_at']
      end
    end
  end
end
