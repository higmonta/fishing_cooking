require 'rails_helper'

RSpec.describe Cooking, type: :model do
  describe 'バリデーションの検証' do
    context '全ての属性が存在する場合' do
      it 'バリデーションエラーにならない' do
        cooking = build(:cooking)
        expect(cooking).to be_valid
      end
    end

    context '必要項目の属性が存在しない場合' do
      it '料理の種類の属性が無い場合バリデーションエラーになる' do
        cooking = build(:cooking, name: nil)
        cooking.valid?
        expect(cooking.errors[:name]).to include('を入力してください')
      end
    end

    context '料理の種類が同じ場合' do
      it 'バリデーションエラーになる' do
        cooking1 = create(:cooking)
        cooking2 = build(:cooking, name: cooking1.name)
        cooking2.valid?
        expect(cooking2.errors[:name]).to include('はすでに存在します')
      end
    end
  end
end
