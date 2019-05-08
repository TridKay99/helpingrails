class JobMailer < ApplicationMailer
  def new_job_email
    @customer = params[:customer]
    mail(to: @customer.email, subject: 'A new job was added')
  end

  def accept_email
    @customer = @job.customer
    mail(to: @customer.email, subject: "your posted job has been accepted by #{@customer.username}")
  end
end