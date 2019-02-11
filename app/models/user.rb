class User < ApplicationRecord
  after_create :welcome_send

  has_many :attendances, foreign_key: 'attendee_id'#, class_name: "Attendance"
  has_many :events, foreign_key: 'admin_id'#, class_name: "Event"

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
