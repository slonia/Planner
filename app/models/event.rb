class Event < ActiveRecord::Base
  extend Enumerize
  belongs_to :user

  attr_accessible :description, :finished_at, :place, :repeat, :started_at, :title, :user_id

  enumerize :repeat, in: [:never, :daily,:weekly,:monthly,:yearly], default: :never

  def start_time
    started_at
  end
end
