require 'rails_helper'

RSpec.describe Fish, type: :model do
  describe 'バリデーションの検証' do
    context '全ての属性が存在する場合' do
      it 'バリデーションエラーにならない' do
        fish = build(:fish)
        expect(fish).to be_valid
      end
    end

    context '必須項目の属性が存在しない場合' do
      it '魚の種類の属性が無い場合バリデーションエラーになる' do
        fish = build(:fish, kind: nil)
        fish.valid?
        expect(fish.errors[:kind]).to include('を入力してください')
      end
    end

    context '魚の種類が同じ場合' do
      it 'バリデーションエラーになる' do
        fish1 = create(:fish)
        fish2 = build(:fish, kind: fish1.kind)
        fish2.valid?
        expect(fish2.errors[:kind]).to include('はすでに存在します')
      end
    end
  end
end
