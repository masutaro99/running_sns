class CreateImgs < ActiveRecord::Migration[6.0]
  def change
    create_table :imgs do |t|
      t.string :username, null:false
      t.string :imagepath, null:false
      t.timestamps
    end
  end
end
