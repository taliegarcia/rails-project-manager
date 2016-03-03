class Task < ActiveRecord::Base
  validates :status, :inclusion=> { :in => %w(unstarted started finished), message: "%{value} is not a valid status" }
  validates :name, :description, presence: true

  belongs_to :project
  validates :project, presence: true

  scope :unstarted, -> { where(status: 'unstarted') }
  scope :started, -> { where(status: 'started') }
  scope :finished, -> { where(status: 'unstarted') }


end
