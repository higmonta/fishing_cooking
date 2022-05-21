class CookingMemoriesController < ApplicationController
  before_action :require_login

  def new
    @cooking_memory = CookingMemory.new
  end

  def create
    @cooking_memory = current_user.cooking_memories.new(cooking_memory_params)
    @cooking_memory.need_default_image?
    if @cooking_memory.save
      flash[:success] = '登録に成功しました'
      redirect_to cooking_memories_path
    else
      flash.now[:danger] = '登録に失敗しました'
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
  end

  def update
    @cooking_memory = CookingMemory.find(params[:id])
    if @cooking_memory.update(cooking_memory_params)
      flash[:success] = '更新に成功しました'
      redirect_to cooking_memories_path
    else
      flash.now[:danger] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy
    cooking_memory = CookingMemory.find(params[:id])
    cooking_memory.destroy
    flash[:success] = '削除に成功しました'
    redirect_to cooking_memories_path
  end

  private

  def cooking_memory_params
    params.require(:cooking_memory).permit(:cooking_name, :fish_name, :cooking_date, :cooking_memory_image, :memo)
  end
end
