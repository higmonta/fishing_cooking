require 'rails_helper'

RSpec.describe "Commons", type: :system do
  let(:user) { create(:user) }

  describe '表示ヘッダーの検証' do
    context 'ログイン前' do
      it 'ログイン前のヘッダーが表示される' do
        visit root_path
        find('.menu-button').click
        expect(page).to have_content 'Fishing Cook'
        expect(page).to have_content '料理検索'
        expect(page).to have_content '調理時間検索'
        expect(page).to have_content '新規会員登録'
        expect(page).to have_content 'ログイン'
        expect(page).to have_content '利用規約'
      end
    end

    context 'ログイン後' do
      it 'ログイン後のヘッダーが表示される' do
        login_as(user)
        visit root_path
        find('.menu-button').click
        expect(page).to have_content 'Fishing Cook'
        expect(page).to have_content '料理検索'
        expect(page).to have_content '調理時間検索'
        expect(page).to have_content '料理の履歴'
        expect(page).to have_content '料理記録の登録'
        expect(page).to have_content 'ログアウト'
        expect(page).to have_content '利用規約'
        expect(page).to have_content "#{user.name}"
      end
    end
  end

  describe 'タイトルの検証' do
    context 'ログイン前' do
      it 'TOPページでタイトルが表示される' do
        visit root_path
        expect(page).to have_title 'Fishing Cook'
      end

      it '料理検索ページでタイトルが表示される' do
        visit cooking_informations_path
        expect(page).to have_title '料理検索'
      end

      it '調理時間検索ページでタイトルが表示される' do
        visit search_time_cooking_informations_path
        expect(page).to have_title '調理時間検索'
      end

      it '調理時間検索ページで対象の料理が表示された後にタイトルが表示される' do
        visit search_time_cooking_informations_path
        select 'アジ', from: 'fish_kind'
        select 'フライ', from: 'cooking_name'
        find('.search-button').click
        expect(page).to have_title '調理時間検索'
      end

      it '新規会員登録ページでタイトルが表示される' do
        visit new_user_path
        expect(page).to have_title '新規会員登録'
      end

      it 'ログインページでタイトルが表示される' do
        visit login_path
        expect(page).to have_title 'ログイン'
      end

      it 'パスワードのリセットページでタイトルが表示される' do
        visit new_password_reset_path
        expect(page).to have_title 'パスワードのリセット'
      end

      it 'パスワードの更新ページでタイトルが表示される' do
        visit login_path
        click_on 'パスワードを忘れた方はこちら'
        fill_in 'email', with: user.email
        click_button '送信'
        visit "password_resets/#{user.reload.reset_password_token}/edit"
        expect(page).to have_title 'パスワードの更新'
      end

      it '利用規約ページでタイトルが表示される' do
        visit terms_path
        expect(page).to have_title '利用規約'
      end
    end

    context 'ログイン後' do
      before { login_as(user) }

      it 'TOPページでタイトルが表示される' do
        visit root_path
        expect(page).to have_title 'Fishing Cook'
      end

      it '料理検索ページでタイトルが表示される' do
        visit cooking_informations_path
        expect(page).to have_title '料理検索'
      end

      it '調理時間検索ページでタイトルが表示される' do
        visit search_time_cooking_informations_path
        expect(page).to have_title '調理時間検索'
      end

      it '調理時間検索ページで対象の料理が表示された後にタイトルが表示される' do
        visit search_time_cooking_informations_path
        select 'アジ', from: 'fish_kind'
        select 'フライ', from: 'cooking_name'
        find('.search-button').click
        expect(page).to have_title '調理時間検索'
      end

      it '料理の履歴ページでタイトルが表示される' do
        visit cooking_memories_path
        expect(page).to have_title '料理の履歴'
      end

      it '料理の履歴の編集ページでタイトルが表示される' do
        create(:cooking_memory, :attached_image, user: user)
        visit cooking_memories_path
        click_on '編集'
        expect(page).to have_title '料理履歴の編集'
      end

      it '料理履歴の新規登録ページでタイトルが表示される' do
        visit new_cooking_memory_path
        expect(page).to have_title '料理記録の登録'
      end

      it '利用規約ページでタイトルが表示される' do
        visit terms_path
        expect(page).to have_title '利用規約'
      end

      it '会員情報のページでタイトルが表示される' do
        visit profile_path
        expect(page).to have_title '会員情報'
      end

      it '会員情報の編集ページでタイトルが表示される' do
        visit edit_profile_path
        expect(page).to have_title '会員情報の編集'
      end

      it 'パスワードのリセットページでタイトルが表示される' do
        visit new_password_reset_path
        expect(page).to have_title 'パスワードのリセット'
      end

      it 'パスワードの更新ページでタイトルが表示される' do
        visit profile_path
        click_on 'パスワードのリセット'
        fill_in 'email', with: user.email
        click_button '送信'
        visit "password_resets/#{user.reload.reset_password_token}/edit"
        expect(page).to have_title 'パスワードの更新'
      end
    end
  end
end
