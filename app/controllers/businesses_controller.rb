class BusinessesController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update, :new, :create]

  def index

    @city = city_params[:city]
    @category = category_params[:category]

    if @category.blank? && @city.blank?
      @businesses = Business.all 
    else 
      @businesses = Business.by_category_and_city(city_params[:city], category_params[:category])
    end

    if sort_order == "open"
      @businesses = @businesses.select { |business| business.check_time }
    else sort_order == "alpha"
      @businesses = @businesses.order(:name)
    end

  end

  def show
    @business = Business.friendly.find(params[:id])
    @specials = Special.where(business_id: @business.id).order("created_at DESC")
  end

  def new
    @business = Business.new
    @business.build_address
    @business.specials.build 
  end

  def edit
    @business = Business.friendly.find(params[:id])
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      redirect_to @business, notice: 'Business was successfully created!'
    else
      render 'new'
    end
  end

  def update
    @business = Business.friendly.find(params[:id])

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
    @business = Business.friendly.find(params[:id])
    
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url, notice: 'Business was removed.' }
      format.json { head :no_content }
    end
  end

  private 

    def business_params
      params.require(:business).permit(:name, :start_time, :end_time, :website, :image, specials_attributes: [:id, :name, :price, :category, :day_of_the_week, :_destroy], address_attributes: [:id, :line1, :line2, :city, :state, :zip])
    end

    def sort_order
      %w[alpha open].include?(params[:order]) ? params[:order] : "alpha"
    end

    def category_params
      params.permit(:category)
    end

    def city_params
      params.permit(:city)
    end
end
