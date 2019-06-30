class AddStageToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :stage, foreign_key: true
  end
end
