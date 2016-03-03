class Project < ActiveRecord::Base
  has_many :project_users
  has_many :users, through: :project_users
  has_many :tasks

  accepts_nested_attributes_for :tasks

  before_destroy :check_task_status

  private

  def check_task_status
    if tasks.started.present? || tasks.finished.present?
      self.errors[:base] << "Cannot delete Project while started and finished tasks exist."
      return false
    end
  end

end
