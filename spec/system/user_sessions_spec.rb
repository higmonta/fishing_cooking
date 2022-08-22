require 'rails_helper'

RSpec.describe "UserSessions", type: :system do
  let!(:user) { create(:user) }

  describe 'ログインの検証' do
    before { visit login_path }

    context 'ログイン情報が正しい時' do
      it 'ログインに成功する' do
        fill_in 'email', with: user.email
        fill_in 'password', with: '123456789aA'
        within ('.login-button') do
          click_on 'ログイン'
        end
        expect(page).to have_content 'ログインに成功しました'
        expect(current_path).to eq cooking_memories_path
      end
    end

    context 'メールアドレスが正しくない時' do
      it 'ログインに失敗する' do
        fill_in 'email', with: 'test_user_email@gmali.com'
        fill_in 'password', with: '123456789aA'
        within ('.login-button') do
          click_on 'ログイン'
        end
        expect(page).to have_content 'ログインに失敗しました'
        expect(current_path).to eq login_path
      end
    end

    context 'パスワードが正しくない時' do
      it 'ログインに失敗する' do
        fill_in 'email', with: user.email
        fill_in 'password', with: '123456789aAaA'
        within ('.login-button') do
          click_on 'ログイン'
        end
        expect(page).to have_content 'ログインに失敗しました'
        expect(current_path).to eq login_path
      end
    end
  end

  describe 'ログアウトの検証' do
    it 'ログアウトに成功する' do
      login_as(user)
      visit root_path
      find('.menu-button').click
      click_on 'ログアウト'
      expect(page).to have_content 'ログアウトに成功しました'
      expect(current_path).to eq root_path
    end
  end
end
