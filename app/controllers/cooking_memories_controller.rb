class CookingMemoriesController < ApplicationController
  def new
  end

  def create
  end

  def index
    @q = CookingMemory.ransack(params[:q])
    @cooking_memories = @q.result(distinct: true)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
