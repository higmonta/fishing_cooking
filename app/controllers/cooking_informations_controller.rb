class CookingInformationsController < ApplicationController
  before_action :set_fishes
  before_action :set_cookings, only: %w[search_time search_calculate_cooking_time calculate_cooking_time]

  def index
    @handles = Handle.all
    @q = CookingInformation.ransack(params[:q])
    @cooking_informations = @q.result(distinct: true).includes(:cooking, :fish, :handle).page(params[:page])
  end

  def search_time; end

  def search_calculate_cooking_time
    search_time_format = CookingSearchTimeForm.new(cooking_information_params)
    if search_time_format.save
      @fish_kind = params[:fish_kind]
      @cooking_name = params[:cooking_name]
      @handle_pattern = search_time_format.handle_search
      @cooking_information = search_time_format.cooking_information_search
      @cookware_name = @cooking_information.cookware&.name
    else
      flash.now[:danger] = t '.search_error_message'
      render :search_time
    end
  end

  def calculate_cooking_time
    @fish_kind = params[:fish_kind]
    @cooking_name = params[:cooking_name]
    search_time_format = CookingSearchTimeForm.new(cooking_information_params)
    @cooking_information = search_time_format.cooking_information_search
    @cookware_name = @cooking_information.cookware&.name
    calculate_cooking_time_format = CalculateCookingTimeForm.new(calculate_cooking_time_form_params)
    if calculate_cooking_time_format.save
      calculate_cooking_time = CalculateCookingTime.new(calculate_cooking_time_params)
      @handle_total_time = calculate_cooking_time.calculate_handle_total_time
      @cooking_total_time = calculate_cooking_time.calculate_cooking_total_time
      @operation_total_time = @handle_total_time + @cooking_total_time
      render 'calculate_cooking_time.js.erb'
    else
      flash.now[:danger] = t '.calculate_error_message'
      render 'calculate_cooking_time_error.js.erb'
    end
  end

  private

  def set_fishes
    @fishes = Fish.all
  end

  def set_cookings
    @cookings = Cooking.all
  end

  def cooking_information_params
    params.permit(:fish_kind, :cooking_name)
  end

  def calculate_cooking_time_form_params
    params.permit(:let_foodstuff_capacity, :cookware_capacity, :count)
  end

  def calculate_cooking_time_params
    params.permit(:fish_kind, :cooking_name, :let_foodstuff_capacity, :cookware_capacity, :count)
  end
end
