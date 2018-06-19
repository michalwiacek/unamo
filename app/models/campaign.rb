class Campaign < ApplicationRecord
  has_many :keywords
  has_many :groups
end
