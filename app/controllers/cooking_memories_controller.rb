class CookingMemoriesController < ApplicationController
  before_action :require_login
  def new
    @cooking_memory = CookingMemory.new
  end

  def create
    @cooking_memory = current_user.cooking_memories.new(cooking_memory_params)
    if @cooking_memory.save
      redirect_to cooking_memories_path, success: '登録に成功しました'
    else
      flash.now[:danger] = '登録に失敗しました'
      render :new
    end
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

  private

  def cooking_memory_params
    params.require(:cooking_memory).permit(:cooking_name, :fish_name, :cooking_date, :cooking_memory_image, :memo)
  end
end