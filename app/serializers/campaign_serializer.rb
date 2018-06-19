class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :keywords, include_nested_associations: true
end
