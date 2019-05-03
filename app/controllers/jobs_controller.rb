
class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def create
 
    @job = current_customer.jobs.new(job_params) if !current_customer.nil?

    if @job.save
      redirect_to customer_path
    else
      render 'new'
    end
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