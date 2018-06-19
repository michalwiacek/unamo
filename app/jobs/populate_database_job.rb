class PopulateDatabaseJob < ApplicationJob
  queue_as :default

  def perform(*args)
    FetchCampaignDataFromUnamo.new.call
    Campaign.all.each do |c|
      FetchGroupsDataForCampaign.new.call(c.id)
      FetchKeywordsDataForCampaign.new.call(c.id)
      FetchPositionsForCampaign.new.call(c.id)
    end
  end
end
