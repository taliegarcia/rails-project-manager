class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :project, index: true
      # t.references :user, index: true
      t.string :name
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
