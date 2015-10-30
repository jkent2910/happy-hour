class BusinessesController < ApplicationController

  def index
    @businesses = Business.all
  end

  def show
    @business = Business.find(params[:id])
  end

  def new
    @business = Business.new
    @business.build_address
  end

  def edit
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      redirect_to @business 
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: 'Business was successfully updated.' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url, notice: 'Business was removed.' }
      format.json { head :no_content }
    end
  end

  private 

    def business_params
      params.require(:business).permit(:name, :start_time, :end_time, :website, address_attributes: [:id, :line1, :line2, :city, :state, :zip])
    end

end
