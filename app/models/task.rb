class Task < ActiveRecord::Base
  belongs_to :user
  has_many :sub_tasks, class_name: "Task", foreign_key: "parent_task_id"
  belongs_to :parent_task, class_name: "Task"
  validates :task_name, presence: true

  def private_task?
    self.task_type == true
  end
end
