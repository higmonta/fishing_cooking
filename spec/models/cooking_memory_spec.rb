require 'rails_helper'

RSpec.describe CookingMemory, type: :model do
  describe 'バリデーションの検証' do
    context '画像を添付している時' do
      context '全ての属性が存在する場合' do
        it 'バリデーションエラーにならない' do
          attached_image_cooking_memory = build(:cooking_memory, :attached_image)
          expect(attached_image_cooking_memory).to be_valid
        end
      end
  
      context '必須項目の属性が存在しない場合' do
        it '料理の名前属性が無い場合バリデーションエラーになる' do
          attached_image_cooking_memory = build(:cooking_memory, :attached_image, cooking_name: nil)
          attached_image_cooking_memory.valid?
          expect(attached_image_cooking_memory.errors[:cooking_name]).to include('を入力してください')
        end
  
        it '料理の魚の種類属性が無い場合バリデーションエラーになる' do
          attached_image_cooking_memory = build(:cooking_memory, :attached_image, fish_name: nil)
          attached_image_cooking_memory.valid?
          expect(attached_image_cooking_memory.errors[:fish_name]).to include('を入力してください')
        end
      end
    end

    context '画像を添付していない時' do
      context '全ての属性が存在する場合' do
        it 'バリデーションエラーにならない' do
          not_attached_image_cooking_memory = build(:cooking_memory)
          expect(not_attached_image_cooking_memory).to be_valid
        end
      end
  
      context '必須項目の属性が存在しない場合' do
        it '料理の名前属性が無い場合バリデーションエラーになる' do
          not_attached_image_cooking_memory = build(:cooking_memory, cooking_name: nil)
          not_attached_image_cooking_memory.valid?
          expect(not_attached_image_cooking_memory.errors[:cooking_name]).to include('を入力してください')
        end
  
        it '料理の魚の種類属性が無い場合バリデーションエラーになる' do
          not_attached_image_cooking_memory = build(:cooking_memory, fish_name: nil)
          not_attached_image_cooking_memory.valid?
          expect(not_attached_image_cooking_memory.errors[:fish_name]).to include('を入力してください')
        end
      end
    end
  end
end
