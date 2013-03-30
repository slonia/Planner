class Task < ActiveRecord::Base
  belongs_to :list
  attr_accessible :list_id, :priority, :state, :title
end
