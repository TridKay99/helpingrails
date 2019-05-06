class BookMailer < ApplicationMailer
  def new_job_email
    @customer = params[:customer]
    mail(to: @customer.email, subject: 'A new job was added')
  end
end