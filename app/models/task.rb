class Task < ActiveRecord::Base
  validates :status, :inclusion=> { :in => %w(unstarted started finished), message: "%{value} is not a valid status" }
  validates :name, :description, presence: true

  belongs_to :project
  validates :project, presence: true


end
