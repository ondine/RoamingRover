class UserMailer < ActionMailer::Base
  default from: "info@roamingrover.com"

  #Send out proposal emails

  def proposal_email(user, rate, description, name, walker_num, walker_mail)
  	@user = user
  	@proposal_rate = rate
  	@proposal_description = description
  	@walker_name = name
  	@walker_phone = walker_num
  	@walker_email = walker_mail
  	mail(to: @user.email, subject: "You received a new proposal")
  end
end
