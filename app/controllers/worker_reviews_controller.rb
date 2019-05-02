class WorkerReviewsController < ApplicationController
  def new
    @workerreview = WorkerReview.new
  end

  def create
    @worker = WorkerReview.find(params[:worker_id])
    @workerreview = @worker.worker_reviews.create(review_params)

    @workerreview.save
    redirect_to worker_path(@worker)
    # binding.pry
  end

  def delete
    @workerreview = WorkerReview.find(params[:id])
    @worker = @workerreview.worker
    @workerreview.destroy
    redirect_to worker_path(@worker)
  end

  private
    def review_params
      params.require(:workerreview).permit(:content, :description)
    end


end
