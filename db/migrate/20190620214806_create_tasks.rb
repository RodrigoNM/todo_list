class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.boolean :done
      t.boolean :active,  default: true
      t.references :board

      t.timestamps
    end
  end
end
