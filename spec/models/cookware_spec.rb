require 'rails_helper'

RSpec.describe Cookware, type: :model do
  describe 'バリデーションの検証' do
    context '全ての属性が存在する場合' do
      it 'バリデーションエラーにならない' do
        cookware = build(:cookware)
        expect(cookware).to be_valid
      end
    end

    context '必須項目の属性が存在しない場合' do
      it '調理器具名の属性が無い場合バリデーションエラーになる' do
        cookware = build(:cookware, name: nil)
        cookware.valid?
        expect(cookware.errors[:name]).to include('を入力してください')
      end
    end

    context '調理器具名が同じ場合' do
      it 'バリデーションエラーになる' do
        cookware1 = create(:cookware)
        cookware2 = build(:cookware, name: cookware1.name)
        cookware2.valid?
        expect(cookware2.errors[:name]).to include('はすでに存在します')
      end
    end
  end
end
