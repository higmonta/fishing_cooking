require 'rails_helper'

RSpec.describe Handle, type: :model do
  describe 'バリデーションの検証' do
    context '全ての属性が存在する場合' do
      it 'バリデーションエラーにならない' do
        handle = build(:handle)
        expect(handle).to be_valid
      end
    end

    context '必須項目の属性が存在しない場合' do
      it '捌き方の種類の属性が無い場合バリデーションエラーになる' do
        handle = build(:handle, pattern: nil)
        handle.valid?
        expect(handle.errors[:pattern]).to include('を入力してください')
      end
    end

    context '捌き方の種類が同じ場合' do
      it 'バリデーションエラーになる' do
        handle1 = create(:handle)
        handle2 = build(:handle, pattern: handle1.pattern)
        handle2.valid?
        expect(handle2.errors[:pattern]).to include('はすでに存在します')
      end
    end
  end
end
