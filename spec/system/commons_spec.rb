require 'rails_helper'

RSpec.describe "Commons", type: :system do
  let(:user) { create(:user) }
  describe '表示ヘッダーの検証' do
    context 'ログイン前' do
      fit 'ログイン前のヘッダーが表示される' do
        visit root_path
        find('.navbar-toggler-icon').click
        expect(page).to have_content 'Fishing Cook'
        expect(page).to have_content '料理検索'
        expect(page).to have_content '調理時間検索'
        expect(page).to have_content '新規会員登録'
        expect(page).to have_content 'ログイン'
        expect(page).to have_content '利用規約'
      end
    end

    context 'ログイン後' do
      fit 'ログイン後のヘッダーが表示される' do
        login_as(user)
        visit root_path
        find('.navbar-toggler-icon').click
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
end
