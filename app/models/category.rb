class Category < ActiveRecord::Base
  has_many :notes
  belongs_to :user
  accepts_nested_attributes_for :notes, :allow_destroy => true
  attr_accessible :name, :user_id
  validates :name, presence: true
end
