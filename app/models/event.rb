class Event < ApplicationRecord
  belongs_to :tag
  validates :title, :eventDate, :startTime, :endTime, presence: true
  validate :validStartAndEndTime
  
  def validStartAndEndTime
    if self.startTime <= self.endTime
        return true
    else
        self.errors[:base] << "Your staring time must be before your ending time!"
    end
  end
end
