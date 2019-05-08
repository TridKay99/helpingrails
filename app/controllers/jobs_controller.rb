
class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def create
    @customer_exists = Customer.all.find_by(username: params[:customer])
    @customer = @customer_exists.nil? ? Customer.create(username: params[:job][:customer]) : @customer_exists

    @job = current_customer.jobs.new(job_params) if !current_customer.nil?
    if @job.save
      @customer = current_customer
      JobMailer.with(customer: @customer, job: @job).new_job_email.deliver_now
      redirect_to customer_path(current_customer)
    else
      render 'new'
    end
    # New job was created. Now send email alerting me
  end

  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job.accepted = true
    @job.save
    
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path
    else
      render 'edit'
    end
  end

  def destroy
    @job = Job.find(params[:id])
    customer = @job.customer
    @job.destroy
    redirect_to customer_path(customer)
  end


  def param
    puts params
  end

  private
    def job_params
      params.require(:job).permit(:title, :description, :price, :uploaded_image)
    end
end