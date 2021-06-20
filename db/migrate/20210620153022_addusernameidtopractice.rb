class Addusernameidtopractice < ActiveRecord::Migration[6.0]
  def change
    add_column :practices, :username, :string
    add_column :practices, :userid, :string
  end
end
