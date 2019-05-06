class JobMailer < ApplicationMailer
  def new_job_email
    @customer = params[:customer]
    mail(to: @customer.email), subject: 'A new job added to the listings')
  end
end
