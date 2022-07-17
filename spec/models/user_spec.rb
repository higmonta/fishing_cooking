require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションの検証' do
    context '全ての属性が存在する場合' do
      it 'バリデーションエラーにならない' do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    context '必須項目の属性が存在しない場合' do
      it '名前属性が無い場合バリデーションエラーになる' do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include('を入力してください')
      end

      it 'メールアドレスが無い場合バリデーションエラーになる' do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include('を入力してください')
      end

      it 'パスワードが無い場合バリデーションエラーになる' do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include('は3文字以上で入力してください')
      end

      it '確認用パスワードが無い場合バリデーションエラーになる' do
        user = build(:user, password_confirmation: nil)
        user.valid?
        expect(user.errors[:password_confirmation]).to include('を入力してください')
      end
    end

    context 'メールアドレスが同じ場合' do
      it 'バリデーションエラーになる' do
        user1 = create(:user)
        user2 = build(:user, email: user1.email)
        user2.valid?
        expect(user2.errors[:email]).to include('はすでに存在します')
      end
    end

    context 'パスワードが3文字未満の場合' do
      it 'バリデーションエラーになる' do
        user = build(:user, password: '12', password_confirmation: '12')
        user.valid?
        expect(user.errors[:password]).to include('は3文字以上で入力してください')
      end
    end

    context 'パスワードと確認パスワードが一致しない場合' do
      it 'バリデーションエラーになる' do
        user = build(:user, password: '12345aA', password_confirmation: '12345AA')
        user.valid?
        expect(user.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
      end
    end
  end
end
