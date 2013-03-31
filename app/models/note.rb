class Note < ActiveRecord::Base
  belongs_to :category
  attr_accessible :category_id, :text, :title
  validates :title, presence: true
  validates :text, presence: true
end
