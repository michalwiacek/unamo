class GroupsKeyword < ActiveRecord::Base
  belongs_to :keyword
  belongs_to :group
end
