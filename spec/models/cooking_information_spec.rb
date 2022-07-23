require 'rails_helper'

RSpec.describe CookingInformation, type: :model do
  describe 'バリデーションの検証' do
    context '全ての属性が存在する場合' do
      it 'バリデーションエラーにならない' do
        cooking_information = build(:cooking_information)
        expect(cooking_information).to be_valid
      end
    end

    context '必須項目の属性が存在しない場合' do
      it '調理時間属性が無い場合バリデーションエラーになる' do
        cooking_information = build(:cooking_information, cooking_time: nil)
        cooking_information.valid?
        expect(cooking_information.errors[:cooking_time]).to include('を入力してください')
      end

      it '料理のURL属性が無い場合バリデーションエラーになる' do
        cooking_information = build(:cooking_information, cooking_url: nil)
        cooking_information.valid?
        expect(cooking_information.errors[:cooking_url]).to include('を入力してください')
      end

      it '材料を寝かす時間属性が無い場合バリデーションエラーになる' do
        cooking_information = build(:cooking_information, rest_fish_time: nil)
        cooking_information.valid?
        expect(cooking_information.errors[:rest_fish_time]).to include('を入力してください')
      end

      it '料理の合計時間属性が無い場合バリデーションエラーになる' do
        cooking_information = build(:cooking_information, cooking_total_time: nil)
        cooking_information.valid?
        expect(cooking_information.errors[:cooking_total_time]).to include('を入力してください')
      end
    end

    context 'ユニーク制約に抵触する場合' do
      it 'cooking_idとfish_idユニークになっていない場合バリデーションエラーになる' do
        cooking_information1 = create(:cooking_information)
        cooking_information2 = build(:cooking_information, cooking_id: cooking_information1.cooking_id, fish_id: cooking_information1.fish_id)
        cooking_information2.valid?
        expect(cooking_information2.errors[:cooking_id]).to include('はすでに存在します')
      end

      it 'cooking_idとfish_idとhandle_idが互いにユニークになっていない場合バリデーションエラーになる' do
        cooking_information1 = create(:cooking_information)
        cooking_information2 = build(:cooking_information, cooking_id: cooking_information1.cooking_id, fish_id: cooking_information1.fish_id, handle_id: cooking_information1.handle_id)
        cooking_information2.valid?
        expect(cooking_information2.errors[:cooking_id]).to include('はすでに存在します')
      end
    end
  end
end
