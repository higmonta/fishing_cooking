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
    @cooking_name = params[:cooking_name]
    search_time_format = CookingSearchTimeForm.new(fish_kind: params[:fish_kind], cooking_name: params[:cooking_name], count: params[:count])
    @handle_pattern = search_time_format.handle_search
  end
end