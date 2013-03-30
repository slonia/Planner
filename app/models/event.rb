class Event < ActiveRecord::Base
  belongs_to :user

  attr_accessible :description, :finished_at, :place, :repeat, :started_at, :title, :user_id
end
