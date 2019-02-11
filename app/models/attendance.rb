class Attendance < ApplicationRecord
  after_create :new_attendance_send

  belongs_to :attendee, class_name: "User"
  belongs_to :event

  def new_attendance_send
    AdminMailer.new_attendance_email(self).deliver_now
  end

end
