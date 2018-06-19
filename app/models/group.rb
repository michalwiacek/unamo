class Group < ApplicationRecord
  has_many :groups_keywords
  has_many :keywords, through: :groups_keywords
  belongs_to :campaign
end
