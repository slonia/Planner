class Group < ActiveRecord::Base
  has_many :lists
  belongs_to :user
  attr_accessible :title, :user_id
end
