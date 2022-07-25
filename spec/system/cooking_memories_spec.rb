require 'rails_helper'

RSpec.describe 'CookingMemories', type: :system do
  describe 'ログイン前後のアクセスページの検証' do
    context 'ログイン前' do
      it '料理履歴登録ページへのアクセスに失敗する' do
        visit new_cooking_memory_path
        expect(page).to have_content 'ログインが必要です'
      end
    end
  end
end