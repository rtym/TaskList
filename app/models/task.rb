class Task < ActiveRecord::Base
  attr_accessible :id, :created_at, :updated_at, :caption, :description

  belongs_to :user

  validates_presence_of :caption
  validates_presence_of :description
  #validates_presence_of :user
end
