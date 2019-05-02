class WorkersController < ApplicationController
  def index
    @workers = Worker.all
  end

  def show
    @worker = Worker.find(params[:id])
  end

  def edit
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])

    if @worker.update(worker_params)
      redirect_to 'show_worker'
    else
      render 'edit'
    end
  end

  private
    def worker_params
      params.permit(:email, :username, :firstname, :lastname, :description, :experience)
    end
end
