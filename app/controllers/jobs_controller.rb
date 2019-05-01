
class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def create
    
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
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

    @job.destroy
    redirect_to jobs_path
  end


  def param
    puts params
  end

  private
    def job_params
      params.permit(:title, :description, :price)
    end
end