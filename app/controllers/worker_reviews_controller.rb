class WorkerReviewsController < ApplicationController
  def new
    @workerreview = WorkerReview.new
    @worker = params[:worker]
  end

  def create
    @worker = Worker.find(params[:worker_review][:worker_id])
    @workerreview = @worker.worker_reviews.create(review_params)

    @workerreview.save
    redirect_to worker_path(@worker)
    # binding.pry
  end

  def delete
    @workerreview = WorkerReview.find(params[:id])
    @worker = @workerreview.worker
    @workerreview.destroy
    flash[:notice] = "Review  for'#{@workerreview.worker.username}' destroyed successfully."
    redirect_to worker_path(@worker)
  end

  private
    def review_params
      params.require(:worker_review).permit(:content, :description, :worker_id)
    end


end
