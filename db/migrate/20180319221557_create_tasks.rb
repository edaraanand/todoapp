class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :parent_task, index: true
      t.timestamps null: false
      t.text :task_name
      t.boolean :task_type
      t.belongs_to :user, index: true
    end
  end
end
