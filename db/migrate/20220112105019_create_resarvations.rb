class CreateResarvations < ActiveRecord::Migration[6.1]
  def change
    create_table :resarvations do |t|
      t.integer :user_id
      t.integer :booking_id
      t.string :start_day
      t.string :end_day
      t.integer :menbers
      t.integer :total_cost

      t.timestamps
    end
  end
end
