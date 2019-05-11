class CustomerReviewsController < ApplicationController
  def new
    @customerreview = CustomerReview.new
    @customer = params[:customer]
  end

  def create
    @customer = Customer.find(params[:customer_review][:customer_id])
    @customerreview = @customer.customer_reviews.create(review_params)
    @customerreview.save
    redirect_to customer_path(@customer)
    # binding.pry
  end

  def destroy
    @customerreview = CustomerReview.find(params[:id])
    @customer = @customerreview.customer
    @customerreview.destroy
    flash[:notice] = "Review  for'#{@customerreview.customer.username}' destroyed successfully."
    redirect_to customer_path(@customer)
  end

  private
    def review_params
      params.require(:customer_review).permit(:content, :description, :customer_id)
    end
end
