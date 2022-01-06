class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :room_name
      t.integer :room_price
      t.string :room_com
      t.string :room_img
      t.string :room_loc

      t.timestamps
    end
  end
end
