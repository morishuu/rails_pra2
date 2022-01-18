class Booking < ApplicationRecord

    has_one_attached :room_pic

    validates_presence_of :room_name, :room_loc, :room_com, :room_price, :room_pic 

    belongs_to :user
    belongs_to :resarvation , optional: true

    
end

