class ChangeSchedulingAttributeType < ActiveRecord::Migration[7.0]
  def change
    change_column :schedulings, :start_time, :string
  end
end
