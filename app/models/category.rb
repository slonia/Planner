class Category < ActiveRecord::Base
  has_many :notes
  belongs_to :user
  attr_accessible :name, :user_id
end
