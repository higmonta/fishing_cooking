class CookingInformationsController < ApplicationController
  def index
    @fishes = Fish.all
    @handles = Handle.all
    @q = CookingInformation.ransack(params[:q])
    @cooking_informations = @q.result(distinct: true).includes(:cooking, :fish, :handle)
  end

  def search_time
    @fishes = Fish.all
    @cookings = Cooking.all
  end

  def calculate_cooking_time
    @fishes = Fish.all
    @cookings = Cooking.all
    search_time_format = CookingSearchTimeForm.new(fish_kind: params[:fish_kind], cooking_name: params[:cooking_name], count: params[:count])
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
end