class Event < ApplicationRecord
  
  belongs_to :admin, class_name: "User"
  has_many :attendances
  has_many :users, foreign_key: 'attendee_id'

  validates :start_date, presence: true
  validates :duration, 
    presence: true,
    numericality: { only_integer: true, :greater_than_or_equal_to => 0 }
  validates :title,
    presence: true,
    length: { in: 5..140 }
  validates :description,
    presence: true,
    length: { in: 20..1000 }
  validates :price,
    presence: true,
    numericality: { :only_integer => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 1000 }
  validates :location, presence: true
  validate :start_must_be_after_now
  #validate :multiple_of_5


  def start_must_be_after_now
    errors.add(:start_date, "must be after now") unless start_date.present? && start_date > Date.today
  end

  def multiple_of_5
    errors.add(:duration, "must be a positive multiple of 5") unless self.duration % 5 == 0
  end

end
