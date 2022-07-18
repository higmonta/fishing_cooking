require 'rails_helper'

RSpec.describe CookingMemory, type: :model do
  describe 'バリデーションの検証' do
    context '全ての属性が存在する場合' do
      it 'バリデーションエラーにならない' do
        cooking_memory = build(:cooking_memory)
        expect(cooking_memory).to be_valid
      end
    end

    context '必須項目の属性が存在しない場合' do
      it '料理の名前属性が無い場合バリデーションエラーになる' do
        cooking_memory = build(:cooking_memory, cooking_name: nil)
        cooking_memory.valid?
        expect(cooking_memory.errors[:cooking_name]).to include('を入力してください')
      end

      it '料理の魚の種類属性がばい場合バリデーションエラーになる' do
        cooking_memory = build(:cooking_memory, fish_name: nil)
        cooking_memory.valid?
        expect(cooking_memory.errors[:fish_name]).to include('を入力してください')
      end
    end
  end
end
