require 'rails_helper'

RSpec.describe FishHandleInformation, type: :model do
  describe 'バリデーションの検証' do
    context '全ての属性が存在する場合' do
      it 'バリデーションエラーにならない' do
        fish_handle_information = build(:fish_handle_information)
        expect(fish_handle_information).to be_valid
      end
    end

    context '必須項目の属性が存在しない場合' do
      it '捌く時間の属性が無い場合バリデーションエラーになる' do
        fish_handle_information = build(:fish_handle_information, handle_time: nil)
        fish_handle_information.valid?
        expect(fish_handle_information.errors[:handle_time]).to include('を入力してください')
      end

      it '捌く動画のURLの属性が無い場合バリデーションエラーになる' do
        fish_handle_information = build(:fish_handle_information, handle_url: nil)
        fish_handle_information.valid?
        expect(fish_handle_information.errors[:handle_url]).to include('を入力してください')
      end
    end

    context 'fish_idとhandle_idが互いにユニークになっていない場合' do
      it 'バリデーションエラーになる' do
        fish_handle_information1 = create(:fish_handle_information)
        fish_handle_information2 = build(:fish_handle_information, fish_id: fish_handle_information1.fish_id, handle_id: fish_handle_information1.handle_id)
        fish_handle_information2.valid?
        expect(fish_handle_information2.errors[:fish_id]).to include('はすでに存在します')
      end
    end
  end
end
