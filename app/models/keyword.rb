class Keyword < ApplicationRecord
  has_many :groups_keywords
  has_many :groups, through: :groups_keywords
  has_many :positions
  belongs_to :campaign
end
