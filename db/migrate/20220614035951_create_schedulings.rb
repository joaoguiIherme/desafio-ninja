class CreateSchedulings < ActiveRecord::Migration[7.0]
  def change
    create_table :schedulings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.datetime :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
