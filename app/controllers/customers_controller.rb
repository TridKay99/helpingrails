class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  
  def show
    @customer = Customer.find(params[:id])
    # @review = Review.new
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    @customer.save
    flash[:notice] = "Customer updated successfully."
    redirect_to root_path
  end
  
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:notice] = "customer '#{@customer.username}' deleted successfully."
    redirect_to root_path
  end

  private
    def customer_params
      params.permit(:email, :firstname, :lastname, :username,)
    end
  
end
