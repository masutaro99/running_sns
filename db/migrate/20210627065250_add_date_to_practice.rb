class AddDateToPractice < ActiveRecord::Migration[6.0]
  def change
    add_column :practices, :datetime, :datetime
    add_column :practices, :date, :date
  end
end
