class CookingMemoriesController < ApplicationController
  before_action :require_login

  def new
    @cooking_memory = CookingMemory.new
  end

  def create
    @cooking_memory = current_user.cooking_memories.new(cooking_memory_params)
    if @cooking_memory.save
      flash[:success] = t '.success_message'
      redirect_to cooking_memories_path
    else
      flash.now[:danger] = t '.error_message'
      render :new
    end
  end

  def index
    @q = CookingMemory.ransack(params[:q])
    @cooking_memories = @q.result(distinct: true)
    @current_user_cooking_memories = @cooking_memories.where(user_id: current_user.id)
  end

  def edit
    @cooking_memory = CookingMemory.find(params[:id])
    unless @cooking_memory.user == current_user
      redirect_to cooking_memories_path
    end
  end

  def update
    @cooking_memory = CookingMemory.find(params[:id])
    if @cooking_memory.update(cooking_memory_params)
      flash[:success] = t '.success_message'
      redirect_to cooking_memories_path
    else
      flash.now[:danger] = t '.error_message'
      render :edit
    end
  end

  def destroy
    cooking_memory = CookingMemory.find(params[:id])
    cooking_memory.destroy
    flash[:success] = t '.success_message'
    redirect_to cooking_memories_path
  end

  private

  def cooking_memory_params
    params.require(:cooking_memory).permit(:cooking_name, :fish_name, :cooking_date, :cooking_memory_image, :memo)
  end
end
