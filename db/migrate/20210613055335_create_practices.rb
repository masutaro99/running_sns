class CreatePractices < ActiveRecord::Migration[6.0]
  def change
    create_table :practices do |t|
      t.string :title, null:false
      t.string :description
      t.float :distance, null:false

      t.timestamps
    end
  end
end
