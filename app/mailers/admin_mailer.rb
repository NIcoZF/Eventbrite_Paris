class AdminMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def new_attendance_email(attendance)
    
    @admin = attendance.event.admin
    @attendee = attendance.attendee.first_name
    @event = attendance.event.title

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin.email, subject: 'Nouvelle participation !') 
  end
end
