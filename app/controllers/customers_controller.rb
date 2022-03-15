class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
    
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params) 
    if @customer.save
      flash[:success] = "Application has been added"
      redirect_to customers_path 
    else
      flash.now[:danger] = "Application has not been added"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      flash[:success] = "Application has been updated"
      redirect_to @customer 
    else
      flash.now[:danger] = "Application has not been updated"
      render :edit
    end
  end

  def destroy
    if @customer.destroy
      flash[:success] = "Application has been deleted."
      redirect_to customers_path 
    end
  end

  protected
  def resource_not_found
    message = "The information you are looking for could not be found" 
    flash[:alert] = message
    redirect_to root_path
  end

  private
  def set_customer
    @customer = Customer.find(params[:id])
    end

  def customer_params
  params.require(:customer).permit(:customerFirstName, :customerLastName, :customerPhone, :customerEmail, :businessName, 
    :businessLogo, :businessTrn, :businessEmail, :businessAddress, :businessPhone) 
  end
end
