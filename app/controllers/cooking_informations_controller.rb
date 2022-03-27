class CookingInformationsController < ApplicationController
  def index
    @fishes = Fish.all
    @handles = Handle.all
    @q = CookingInformation.ransack(params[:q])
    @cooking_informations = @q.result(distinct: true).includes(:cooking, :fish, :handle).page(params[:page])
  end

  def search_time
    @fishes = Fish.all
    @cookings = Cooking.all
  end

  def search_calculate_cooking_time
    @fishes = Fish.all
    @cookings = Cooking.all
    search_time_format = CookingSearchTimeForm.new(fish_kind: params[:fish_kind], cooking_name: params[:cooking_name])
    if search_time_format.save
      @fish_kind = params[:fish_kind]
      @cooking_name = params[:cooking_name]
      @handle_pattern = search_time_format.handle_search
      @cooking_information = search_time_format.cooking_information_search
    else
      flash.now[:notice] = "検索フォームを全て入力してくだい"
      render :search_time
    end
  end

  def calculate_cooking_time
    @fishes = Fish.all
    @cookings = Cooking.all
    @fish_kind = params[:fish_kind]
    @cooking_name = params[:cooking_name]
    calculate_cooking_time_format = CalculateCookingTimeForm.new(let_foodstuff_capacity: params[:let_foodstuff_capacity], cookware_capacity: params[:cookware_capacity], count: params[:count])
    if calculate_cooking_time_format.save
      calculate_cooking_time = CalculateCookingTime.new(fish_kind: params[:fish_kind], cooking_name: params[:cooking_name], let_foodstuff_capacity: params[:let_foodstuff_capacity], cookware_capacity: params[:cookware_capacity], count: params[:count])
      @handle_total_time = calculate_cooking_time.calculate_handle_total_time
      @cooking_total_time = calculate_cooking_time.calculate_cooking_total_time
      @operation_total_time = @handle_total_time + @cooking_total_time
      render "calculate_cooking_time.js.erb"
    else
      @fish_kind = params[:fish_kind]
      @cooking_name = params[:cooking_name]
      flash.now[:notice] = "計算フォームを全て入力してください"
      render "calculate_cooking_time_error.js.erb"
    end
  end
end