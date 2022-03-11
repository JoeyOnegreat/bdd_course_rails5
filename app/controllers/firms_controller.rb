class FirmsController < ApplicationController
  before_action :set_firm, only: [:show, :edit, :update, :destroy]

  def index
    @firms = Firm.all
  end

  def new
    @firm = Firm.new
  end

  def create
    @firm = Firm.new(firm_params) 
    if @firm .save
      flash[:success] = "Infomation has been added"
      redirect_to firms_path 
    else
      flash.now[:danger] = "Infomation has not been added"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @firm.update(firm_params)
      flash[:success] = "Infomation has been updated"
      redirect_to @firm 
    else
      flash.now[:danger] = "Infomation has not been updated"
      render :edit
    end
  end

  def destroy
    if @firm.destroy
      flash[:success] = "Information has been deleted."
      redirect_to firms_path 
    end
  end

  protected
  def resource_not_found
    message = "The information you are looking for could not be found" 
    flash[:alert] = message
    redirect_to root_path
  end

  private
  def set_firm
    @firm  = Firm.find(params[:id])
    end

  def firm_params
  params.require(:firm ).permit(:name, :trn, :phone, :email, :address) 
  end
end
