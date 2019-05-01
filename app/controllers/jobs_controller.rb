class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    @job.save
    redirect_to jobs_path
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
      raise
      redirect_to @job
    else
      render 'edit'
    end
  end

  def param
    puts params
  end

  private
    def job_params
      params.permit(:title, :description)
    end
end
