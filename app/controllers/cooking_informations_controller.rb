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
end