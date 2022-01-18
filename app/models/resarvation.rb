class Resarvation < ApplicationRecord

    belongs_to :user
    belongs_to :booking

    validates_presence_of :start_day, :end_day 
    validate :start_end_check
     def start_end_check
       errors.add(:end_day, "は開始日以降を登録してください。") unless
       self.start_day < self.end_day 
     end
 
    validate :menbers_check
    def menbers_check
      errors.add(:menbers, "は1人以上である必要があります。") unless
       self.menbers > 0
    end
end
