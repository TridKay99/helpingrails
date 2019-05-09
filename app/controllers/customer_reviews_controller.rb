class CustomerReviewsController < ApplicationController
  def new
    @customerreview = CustomerReview.new
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @customerreview = @customer.customer_reviews.create(review_params)

    @customerreview.save
    redirect_to customer_path(@customer)
    # binding.pry
  end

  def delete
    @customerreview = CustomerReview.find(params[:id])
    @customer = @customerreview.customer
    @customerreview.destroy
    redirect_to customer_path(@customer)
  end

  private
    def review_params
      params.require(:customerreview).permit(:content, :description)
    end
end
