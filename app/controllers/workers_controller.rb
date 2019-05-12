class WorkersController < ApplicationController
  def index
    @workers = Worker.all
  end

  def show
    @worker = Worker.find(params[:id])
    
    if @worker.description?
      @data_value1 = @worker.description
    else
      @data_value1 = "There is nothing about me to show"
    end

    if @worker.experience?
      @data_value2 = @worker.experience
    else
      @data_value2 = "There is nothing  to show"
    end



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

  def destroy
    @worker = Worker.find(params[:id])
    @worker.destroy
    flash[:notice] = "worker '#{@worker.username}' deleted successfully."
    redirect_to root_path
  end

  private
    def worker_params
      params.permit(:email, :username, :firstname, :lastname, :description, :experience)
    end
end
