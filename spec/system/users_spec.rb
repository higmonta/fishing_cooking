require 'rails_helper'

RSpec.describe "UsersSpec.rbs", type: :system do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    describe 'ユーザーの会員登録の検証' do
      before { visit new_user_path }

      context '全ての項目が入力されている時' do
        it 'ユーザー登録に成功する' do
          fill_in 'user_name', with: 'test_user_name'
          fill_in 'user_email', with: 'test_test@gmail.com'
          fill_in 'user_password', with: 'test_password'
          fill_in 'user_password_confirmation', with: 'test_password'
          click_on '登録する'
          expect(page).to have_content '登録に成功しました'
          expect(current_path).to eq login_path
        end
      end

      context 'ニックネームの欄が入力されていない時' do
        it 'ユーザー登録に失敗する' do
          fill_in 'user_email', with: 'test_test@gmail.com'
          fill_in 'user_password', with: 'test_password'
          fill_in 'user_password_confirmation', with: 'test_password'
          click_on '登録する'
          expect(page).to have_content '登録に失敗しました'
          expect(page).to have_content 'ニックネームを入力してください'
          expect(current_path).to eq users_path
        end
      end

      context 'Eメールの欄が入力されていない時' do
        it 'ユーザー登録に失敗する' do
          fill_in 'user_name', with: 'test_user_name'
          fill_in 'user_password', with: 'test_password'
          fill_in 'user_password_confirmation', with: 'test_password'
          click_on '登録する'
          expect(page).to have_content '登録に失敗しました'
          expect(page).to have_content 'Eメールを入力してください'
          expect(current_path).to eq users_path
        end
      end

      context '大文字小文字が完全一致のEメールが既に存在している時' do
        it 'ユーザー登録に失敗する' do
          user1 = create(:user)
          fill_in 'user_name', with: 'test_user_name'
          fill_in 'user_email', with: user1.email
          fill_in 'user_password', with: 'test_password'
          fill_in 'user_password_confirmation', with: 'test_password'
          click_on '登録する'
          expect(page).to have_content '登録に失敗しました'
          expect(page).to have_content 'Eメールはすでに存在します'
          expect(current_path).to eq users_path
        end
      end

      context '大文字小文字違いのEメールが既に存在している時' do
        it 'ユーザー登録に失敗する' do
          user1 = create(:user)
          fill_in 'user_name', with: 'test_user_name'
          fill_in 'user_email', with: user1.email.upcase
          fill_in 'user_password', with: 'test_password'
          fill_in 'user_password_confirmation', with: 'test_password'
          click_on '登録する'
          expect(page).to have_content '登録に失敗しました'
          expect(page).to have_content 'Eメールはすでに存在します'
          expect(current_path).to eq users_path
        end
      end

      context 'パスワードの欄が入力されていない時' do
        it 'ユーザー登録に失敗する' do
          fill_in 'user_name', with: 'test_user_name'
          fill_in 'user_email', with: 'test_test@gmail.com'
          fill_in 'user_password_confirmation', with: 'test_password'
          click_on '登録する'
          expect(page).to have_content '登録に失敗しました'
          expect(page).to have_content 'パスワードは10文字以上で入力してください'
          expect(page).to have_content 'パスワード再確認とパスワードの入力が一致しません'
          expect(current_path).to eq users_path
        end
      end

      context 'パスワード再確認の欄が入力されていない時' do
        it 'ユーザー登録に失敗する' do
          fill_in 'user_name', with: 'test_user_name'
          fill_in 'user_email', with: 'test_test@gmail.com'
          fill_in 'user_password', with: 'test_password'
          click_on '登録する'
          expect(page).to have_content '登録に失敗しました'
          expect(page).to have_content 'パスワード再確認とパスワードの入力が一致しません'
          expect(page).to have_content 'パスワード再確認を入力してください'
          expect(current_path).to eq users_path
        end
      end

      context 'パスワードの欄とパスワード再確認の欄に入力されている文字数が10文字未満の時' do
        it 'ユーザー登録に失敗する' do
          fill_in 'user_name', with: 'test_user_name'
          fill_in 'user_email', with: 'test_test@gmail.com'
          fill_in 'user_password', with: '1234aA'
          fill_in 'user_password_confirmation', with: '1234aA'
          click_on '登録する'
          expect(page).to have_content '登録に失敗しました'
          expect(page).to have_content 'パスワードは10文字以上で入力してください'
          expect(current_path).to eq users_path
        end
      end

      context 'パスワードの欄とパスワード再確認の欄に入力されている内容が違う時' do
        it 'ユーザー登録に失敗する' do
          fill_in 'user_name', with: 'test_user_name'
          fill_in 'user_email', with: 'test_test@gmail.com'
          fill_in 'user_password', with: 'test_password1'
          fill_in 'user_password_confirmation', with: 'test_password'
          click_on '登録する'
          expect(page).to have_content '登録に失敗しました'
          expect(page).to have_content 'パスワード再確認とパスワードの入力が一致しません'
          expect(current_path).to eq users_path
        end
      end
    end

    describe 'プロフィールページのアクセスの検証' do
      it 'プロフィールページへのアクセスに失敗する' do
        visit profile_path
        expect(page).to have_content 'ログインが必要です'
        expect(current_path).to eq login_path
      end 

      it 'プロフィールの編集ページへのアクセスに失敗する' do
        visit edit_profile_path
        expect(page).to have_content 'ログインが必要です'
        expect(current_path).to eq login_path
      end
    end

    describe 'パスワードリセットメールの送信の検証' do
      before do
        visit login_path
        click_on 'パスワードを忘れた方はこちら'
      end

      context '存在するEメールにパスワードリセットのメールを送信した時' do
        it 'パスワードリセットのメールが送信された旨のメッセージが表示される' do
          fill_in 'email', with: user.email
          click_button '送信'
          expect(page).to have_content('パスワードリセットのメールを送信しました')
          expect(current_path).to eq login_path
        end
      end

      context '存在しないEメールにパスワードリセットのメールを送信した時' do
        it '存在しないアドレスの旨が表示されない' do
          fill_in 'email', with: 'test_user_email@gmali.com'
          click_button '送信'
          expect(page).to have_content('パスワードリセットのメールを送信しました')
          expect(current_path).to eq login_path
        end
      end
    end

    describe 'パスワードの変更機能の検証' do
      before do
        visit login_path
        click_on 'パスワードを忘れた方はこちら'
        fill_in 'email', with: user.email
        click_button '送信'
        visit "password_resets/#{user.reload.reset_password_token}/edit"
      end

      context 'パスワードの欄とパスワード再確認に有効なパスワードが入力されている時' do
        it 'パスワードの変更に成功する' do
          expect(page).to have_content user.email
          fill_in 'user_password', with: 'update_password'
          fill_in 'user_password_confirmation', with: 'update_password'
          click_button '更新する'
          expect(page).to have_content('パスワードの更新に成功しました')
          expect(current_path).to eq login_path
        end
      end

      context 'パスワードの欄が入力されていない時' do
        it 'パスワードの変更に失敗する' do
          expect(page).to have_content user.email
          fill_in 'user_password_confirmation', with: 'update_password'
          click_button '更新する'
          expect(page).to have_content('パスワードを入力してください')
          expect(current_path).to eq password_reset_path(user.reload.reset_password_token)
        end
      end

      context 'パスワード再確認の欄が入力されていない時' do
        it 'パスワードの変更に失敗する' do
          expect(page).to have_content user.email
          fill_in 'user_password', with: 'update_password'
          click_button '更新する'
          expect(page).to have_content('パスワード再確認とパスワードの入力が一致しません')
          expect(page).to have_content('パスワード再確認を入力してください')
          expect(current_path).to eq password_reset_path(user.reload.reset_password_token)
        end
      end

      context 'パスワードの欄とパスワード再確認の欄が入力されていない時' do
        it 'パスワードの変更に失敗する' do
          expect(page).to have_content user.email
          click_button '更新する'
          expect(page).to have_content('パスワードを入力してください')
          expect(current_path).to eq password_reset_path(user.reload.reset_password_token)
        end
      end

      context 'パスワードの欄とパスワード再確認の欄に入力されている文字数が10文字未満の時' do
        it 'パスワードの変更に失敗する' do
          expect(page).to have_content user.email
          fill_in 'user_password', with: '12345aA'
          fill_in 'user_password_confirmation', with: '12345aA'
          click_button '更新する'
          expect(page).to have_content('パスワードは10文字以上で入力してください')
          expect(current_path).to eq password_reset_path(user.reload.reset_password_token)
        end
      end

      context 'パスワードの欄とパスワード再確認の欄に入力されている内容が違う時' do
        it 'パスワードの変更に失敗する' do
          expect(page).to have_content user.email
          fill_in 'user_password', with: 'update_password'
          fill_in 'user_password_confirmation', with: 'update_password1'
          click_button '更新する'
          expect(page).to have_content('パスワード再確認とパスワードの入力が一致しません')
          expect(current_path).to eq password_reset_path(user.reload.reset_password_token)
        end
      end
    end
  end

  describe 'ログイン後' do
    before { login_as(user) }

    describe 'プロフィールページのアクセスの検証' do
      it '自分のプロフィールページへのアクセスに成功する' do
        visit profile_path
        expect(page).to have_content user.name
        expect(page).to have_content user.email
        expect(current_path).to eq profile_path
      end

      it '自分以外のプロフィールページへのアクセスに失敗する' do
        user1 = create(:user)
        visit profile_path
        expect(page).to_not have_content user1.name
        expect(page).to_not have_content user1.email
        expect(current_path).to eq profile_path
      end

      it '自分のプロフィールの編集ページへのアクセスに成功する' do
        visit profile_path
        click_on '編集'
        expect(page).to have_field 'user_name', with: user.name
        expect(page).to have_field 'user_email', with: user.email
        expect(current_path).to eq edit_profile_path
      end

      it '自分以外のプロフィールの編集ページへのアクセスに失敗する' do
        user1 = create(:user)
        visit profile_path
        click_on '編集'
        expect(page).to_not have_field 'user_name', with: user1.name
        expect(page).to_not have_field 'user_email', with: user1.email
        expect(current_path).to eq edit_profile_path
      end
    end

    describe 'プロフィールの編集機能の検証' do
      before do
        visit profile_path
        click_on '編集'
      end

      context 'ニックネームの欄とEメールの欄の両方を編集する時' do
        it 'プロフィールの編集に成功する' do
          fill_in 'user_name', with: 'update_user_name'
          fill_in 'user_email', with: 'test_test@gmail.com'
          click_on '更新する'
          expect(page).to have_content '会員情報の変更に成功しました'
          expect(page).to have_content 'update_user_name'
          expect(page).to have_content 'test_test@gmail.com'
          expect(current_path).to eq profile_path
        end
      end

      context 'ニックネームの欄が未入力でEメールアドレスを編集する時' do
        it 'プロフィールの編集に失敗する' do
          fill_in 'user_name', with: nil
          fill_in 'user_email', with: 'test_test@gmail.com'
          click_on '更新する'
          expect(page).to have_content '登録に失敗しました'
          expect(page).to have_content 'ニックネームを入力してください'
          expect(current_path).to eq profile_path
        end
      end

      context 'Eメールの欄が未入力でニックネームを編集する時' do
        it 'プロフィールの編集に失敗する' do
          fill_in 'user_name', with: 'update_user_name'
          fill_in 'user_email', with: nil
          click_on '更新する'
          expect(page).to have_content '登録に失敗しました'
          expect(page).to have_content 'Eメールを入力してください'
          expect(current_path).to eq profile_path
        end
      end

      context 'ニックネームの欄とEメールの欄の両方が未入力で編集する時' do
        it 'プロフィールの編集に失敗する' do
          fill_in 'user_name', with: nil
          fill_in 'user_email', with: nil
          click_on '更新する'
          expect(page).to have_content '登録に失敗しました'
          expect(page).to have_content 'Eメールを入力してください'
          expect(page).to have_content 'ニックネームを入力してください'
          expect(current_path).to eq profile_path
        end
      end

      context '既に存在しているEメールでニックネームを編集する時' do
        it 'プロフィールの編集に失敗する' do
          user1 = create(:user)
          fill_in 'user_name', with: 'update_user_name'
          fill_in 'user_email', with: user1.email
          click_on '更新する'
          expect(page).to have_content '登録に失敗しました'
          expect(page).to have_content 'Eメールはすでに存在します'
          expect(current_path).to eq profile_path
        end
      end
    end

    describe 'パスワードリセットメールの送信の検証' do
      before do
        visit profile_path
        click_on 'パスワードのリセット'
      end

      context '存在するEメールにパスワードリセットのメールを送信した時' do
        it 'パスワードリセットのメールが送信された旨のメッセージが表示される' do
          fill_in 'email', with: user.email
          click_button '送信'
          expect(page).to have_content('パスワードリセットのメールを送信しました')
          expect(current_path).to eq profile_path
        end
      end

      context '存在しないEメールにパスワードリセットのメールを送信した時' do
        it '存在しないアドレスの旨が表示されない' do
          fill_in 'email', with: 'test_user_email@gmali.com'
          click_button '送信'
          expect(page).to have_content('パスワードリセットのメールを送信しました')
          expect(current_path).to eq profile_path
        end
      end
    end

    describe 'パスワードの変更機能の検証' do
      before do
        visit profile_path
        click_on 'パスワードのリセット'
        fill_in 'email', with: user.email
        click_button '送信'
        visit "password_resets/#{user.reload.reset_password_token}/edit"
      end

      context 'パスワードの欄とパスワード再確認に有効なパスワードが入力されている時' do
        it 'パスワードの変更に成功する' do
          expect(page).to have_content user.email
          fill_in 'user_password', with: 'update_password'
          fill_in 'user_password_confirmation', with: 'update_password'
          click_button '更新する'
          expect(page).to have_content('パスワードの更新に成功しました')
          expect(current_path).to eq profile_path
        end
      end

      context 'パスワードの欄が入力されていない時' do
        it 'パスワードの変更に失敗する' do
          expect(page).to have_content user.email
          fill_in 'user_password_confirmation', with: 'update_password'
          click_button '更新する'
          expect(page).to have_content('パスワードを入力してください')
          expect(current_path).to eq password_reset_path(user.reload.reset_password_token)
        end
      end

      context 'パスワード再確認の欄が入力されていない時' do
        it 'パスワードの変更に失敗する' do
          expect(page).to have_content user.email
          fill_in 'user_password', with: 'update_password'
          click_button '更新する'
          expect(page).to have_content('パスワード再確認とパスワードの入力が一致しません')
          expect(page).to have_content('パスワード再確認を入力してください')
          expect(current_path).to eq password_reset_path(user.reload.reset_password_token)
        end
      end

      context 'パスワードの欄とパスワード再確認の欄が入力されていない時' do
        it 'パスワードの変更に失敗する' do
          expect(page).to have_content user.email
          click_button '更新する'
          expect(page).to have_content('パスワードを入力してください')
          expect(current_path).to eq password_reset_path(user.reload.reset_password_token)
        end
      end

      context 'パスワードの欄とパスワード再確認の欄に入力されている文字数が10文字未満の時' do
        it 'パスワードの変更に失敗する' do
          expect(page).to have_content user.email
          fill_in 'user_password', with: '12345aA'
          fill_in 'user_password_confirmation', with: '12345aA'
          click_button '更新する'
          expect(page).to have_content('パスワードは10文字以上で入力してください')
          expect(current_path).to eq password_reset_path(user.reload.reset_password_token)
        end
      end

      context 'パスワードの欄とパスワード再確認の欄に入力されている内容が違う時' do
        it 'パスワードの変更に失敗する' do
          expect(page).to have_content user.email
          fill_in 'user_password', with: 'update_password'
          fill_in 'user_password_confirmation', with: 'update_password1'
          click_button '更新する'
          expect(page).to have_content('パスワード再確認とパスワードの入力が一致しません')
          expect(current_path).to eq password_reset_path(user.reload.reset_password_token)
        end
      end
    end
  end
end
