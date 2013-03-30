class List < ActiveRecord::Base
  has_many :tasks
  belongs_to :group
  attr_accessible :color, :group_id, :title
end
