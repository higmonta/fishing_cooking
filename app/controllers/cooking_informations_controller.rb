class CookingInformationsController < ApplicationController
  def index
    @fishes = Fish.all
    @handles = Handle.all
    @q = CookingInformation.ransack(params[:q])
    @cooking_informations = @q.result(distinct: true)
  end
end
