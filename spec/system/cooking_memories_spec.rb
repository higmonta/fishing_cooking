require 'rails_helper'

RSpec.describe 'CookingMemories', type: :system do
  let(:user) { create(:user) }

  describe 'ログイン前後のアクセスページの検証' do
    context 'ログイン前' do
      it '料理履歴登録ページへのアクセスに失敗する' do
        visit new_cooking_memory_path
        expect(page).to have_content 'ログインが必要です'
        expect(current_path).to eq login_path
      end

      it '料理の履歴ページへのアクセスに失敗する' do
        visit cooking_memories_path
        expect(page).to have_content 'ログインが必要です'
        expect(current_path).to eq login_path
      end
      
      it '料理履歴の編集ページへのアクセスに失敗する' do
        attached_image_cooking_memory = create(:cooking_memory, :attached_image)
        visit edit_cooking_memory_path(attached_image_cooking_memory)
        expect(page).to have_content 'ログインが必要です'
        expect(current_path).to eq login_path
      end
    end

    context 'ログイン後' do
      before { login_as(user) }

      it '料理履歴登録ページへのアクセスが成功する' do
        visit new_cooking_memory_path
        expect(current_path).to  eq new_cooking_memory_path
      end

      it '自分の料理の履歴ページへのアクセスに成功する' do
        attached_image_cooking_memory_list = create_list(:cooking_memory, 3, :attached_image, user: user)
        visit cooking_memories_path
        expect(page).to have_content attached_image_cooking_memory_list[0].cooking_name
        expect(page).to have_content attached_image_cooking_memory_list[0].fish_name
        expect(page).to have_content attached_image_cooking_memory_list[0].cooking_date.strftime("%Y年%m月%d日")
        expect(page.all('.cooking-memory-list')[0]).to have_selector("img[src$='test1_image.jpg']")
        expect(page).to have_content attached_image_cooking_memory_list[0].memo
        expect(page).to have_content attached_image_cooking_memory_list[1].cooking_name
        expect(page).to have_content attached_image_cooking_memory_list[1].fish_name
        expect(page).to have_content attached_image_cooking_memory_list[1].cooking_date.strftime("%Y年%m月%d日")
        expect(page.all('.cooking-memory-list')[1]).to have_selector("img[src$='test1_image.jpg']")
        expect(page).to have_content attached_image_cooking_memory_list[1].memo
        expect(page).to have_content attached_image_cooking_memory_list[2].cooking_name
        expect(page).to have_content attached_image_cooking_memory_list[2].fish_name
        expect(page).to have_content attached_image_cooking_memory_list[2].cooking_date.strftime("%Y年%m月%d日")
        expect(page.all('.cooking-memory-list')[2]).to have_selector("img[src$='test1_image.jpg']")
        expect(page).to have_content attached_image_cooking_memory_list[2].memo
        expect(current_path).to eq cooking_memories_path
      end

      it '自分以外の料理の履歴ページへのアクセスに失敗する' do
        attached_image_cooking_memory_list = create_list(:cooking_memory, 3, :attached_image)
        visit cooking_memories_path
        expect(page).to_not have_content attached_image_cooking_memory_list[0].cooking_name
        expect(page).to_not have_content attached_image_cooking_memory_list[0].fish_name
        expect(page).to_not have_content attached_image_cooking_memory_list[0].cooking_date.strftime("%Y年%m月%d日")
        expect(page.all('.cooking-memory-list')[1]).to_not have_selector("img[src$='test1_image.jpg']")
        expect(page).to_not have_content attached_image_cooking_memory_list[0].memo
        expect(page).to_not have_content attached_image_cooking_memory_list[1].cooking_name
        expect(page).to_not have_content attached_image_cooking_memory_list[1].fish_name
        expect(page).to_not have_content attached_image_cooking_memory_list[1].cooking_date.strftime("%Y年%m月%d日")
        expect(page.all('.cooking-memory-list')[2]).to_not have_selector("img[src$='test1_image.jpg']")
        expect(page).to_not have_content attached_image_cooking_memory_list[1].memo
        expect(page).to_not have_content attached_image_cooking_memory_list[2].cooking_name
        expect(page).to_not have_content attached_image_cooking_memory_list[2].fish_name
        expect(page).to_not have_content attached_image_cooking_memory_list[2].cooking_date.strftime("%Y年%m月%d日")
        expect(page.all('.cooking-memory-list')[2]).to_not have_selector("img[src$='test1_image.jpg']")
        expect(page).to_not have_content attached_image_cooking_memory_list[2].memo
        expect(current_path).to eq cooking_memories_path
      end

      it '自分の料理履歴の編集ページへのアクセスに成功する' do
        attached_image_cooking_memory = create(:cooking_memory, :attached_image, user: user)
        visit edit_cooking_memory_path(attached_image_cooking_memory)
        expect(page).to have_field 'cooking_memory_cooking_name', with: attached_image_cooking_memory.cooking_name
        expect(page).to have_field 'cooking_memory_fish_name', with: attached_image_cooking_memory.fish_name
        expect(page).to have_field 'cooking_memory_cooking_date', with: attached_image_cooking_memory.cooking_date
        expect(page).to have_selector("img[src$='test1_image.jpg']")
        expect(page).to have_field 'cooking_memory_memo', with: attached_image_cooking_memory.memo
        expect(current_path).to eq edit_cooking_memory_path(attached_image_cooking_memory)
      end

      it '自分以外の料理履歴の編集ページへのアクセスに失敗する' do
        attached_image_cooking_memory = create(:cooking_memory, :attached_image)
        visit edit_cooking_memory_path(attached_image_cooking_memory)
        expect(page).to_not have_field 'cooking_memory_cooking_name', with: attached_image_cooking_memory.cooking_name
        expect(page).to_not have_field 'cooking_memory_fish_name', with: attached_image_cooking_memory.fish_name
        expect(page).to_not have_field 'cooking_memory_cooking_date', with: attached_image_cooking_memory.cooking_date
        expect(page).to_not have_selector("img[src$='test1_image.jpg']")
        expect(page).to_not have_field 'cooking_memory_memo', with: attached_image_cooking_memory.memo
        expect(current_path).to eq cooking_memories_path
      end
    end
  end

  describe 'ログイン後の料理履歴の登録機能の検証' do
    before do
      login_as(user)
      visit new_cooking_memory_path
    end

    context '必要項目が全部入力されている時' do
      it '料理履歴の登録に成功する' do
        fill_in 'cooking_memory_cooking_name', with: 'test_cooking_name'
        fill_in 'cooking_memory_fish_name', with: 'test_fish_name'
        click_on '登録する'
        expect(page).to have_content 'test_cooking_name'
        expect(page).to have_content 'test_fish_name'
        expect(page).to have_selector("img[src*='default']")
        expect(current_path).to eq cooking_memories_path
      end
    end

    context '必須項目の料理名が入力されていない時' do
      it '料理履歴の登録に失敗する' do
        fill_in 'cooking_memory_fish_name', with: 'test_fish_name'
        fill_in 'cooking_memory_cooking_date', with: '002022-07-19'
        attach_file 'cooking_memory[cooking_memory_image]', "#{Rails.root}/spec/fixtures/images/test1_image.jpg"
        fill_in 'cooking_memory_memo', with: 'test_memo'
        click_on '登録する'
        expect(page).to have_content '登録に失敗しました'
        expect(page).to have_content '料理名を入力してください'
        expect(current_path).to eq cooking_memories_path
      end
    end

    context '必須項目の魚の種類が入力されていない時' do
      it '料理履歴の登録に失敗する' do
        fill_in 'cooking_memory_cooking_name', with: 'test_cooking_name'
        fill_in 'cooking_memory_cooking_date', with: '002022-07-19'
        attach_file 'cooking_memory[cooking_memory_image]', "#{Rails.root}/spec/fixtures/images/test1_image.jpg"
        fill_in 'cooking_memory_memo', with: 'test_memo'
        click_on '登録する'
        expect(page).to have_content '登録に失敗しました'
        expect(page).to have_content '魚の種類を入力してください'
        expect(current_path).to eq cooking_memories_path
      end
    end

    context '必須項目が全部入力されていない時' do
      it '料理履歴の登録に失敗する' do
        fill_in 'cooking_memory_cooking_date', with: '002022-07-19'
        attach_file 'cooking_memory[cooking_memory_image]', "#{Rails.root}/spec/fixtures/images/test1_image.jpg"
        fill_in 'cooking_memory_memo', with: 'test_memo'
        click_on '登録する'
        expect(page).to have_content '登録に失敗しました'
        expect(page).to have_content '料理名を入力してください'
        expect(page).to have_content '魚の種類を入力してください'
        expect(current_path).to eq cooking_memories_path
      end
    end

    context '入力欄全てに入力されている時' do
      it '料理履歴の登録に成功する' do
        fill_in 'cooking_memory_cooking_name', with: 'test_cooking_name'
        fill_in 'cooking_memory_fish_name', with: 'test_fish_name'
        fill_in 'cooking_memory_cooking_date', with: '002022-07-19'
        attach_file 'cooking_memory[cooking_memory_image]', "#{Rails.root}/spec/fixtures/images/test1_image.jpg"
        fill_in 'cooking_memory_memo', with: 'test_memo'
        click_on '登録する'
        expect(page).to have_content 'test_cooking_name'
        expect(page).to have_content 'test_fish_name'
        expect(page).to have_content '2022年07月19日'
        expect(page).to have_selector("img[src$='test1_image.jpg']")
        expect(page).to have_content 'test_memo'
        expect(current_path).to eq cooking_memories_path
      end
    end

    context '料理をした日以外の欄が入力されている時' do
      it '料理履歴の登録に成功する' do
        fill_in 'cooking_memory_cooking_name', with: 'test_cooking_name'
        fill_in 'cooking_memory_fish_name', with: 'test_fish_name'
        attach_file 'cooking_memory[cooking_memory_image]', "#{Rails.root}/spec/fixtures/images/test1_image.jpg"
        fill_in 'cooking_memory_memo', with: 'test_memo'
        click_on '登録する'
        expect(page).to have_content 'test_cooking_name'
        expect(page).to have_content 'test_fish_name'
        expect(page).to_not have_content '料理をした日'
        expect(page).to have_selector("img[src$='test1_image.jpg']")
        expect(page).to have_content 'test_memo'
        expect(current_path).to eq cooking_memories_path
      end
    end

    context '料理の画像以外が入力されている時' do
      it '料理履歴の登録に成功する' do
        fill_in 'cooking_memory_cooking_name', with: 'test_cooking_name'
        fill_in 'cooking_memory_fish_name', with: 'test_fish_name'
        fill_in 'cooking_memory_cooking_date', with: '002022-07-19'
        fill_in 'cooking_memory_memo', with: 'test_memo'
        click_on '登録する'
        expect(page).to have_content 'test_cooking_name'
        expect(page).to have_content 'test_fish_name'
        expect(page).to have_content '2022年07月19日'
        expect(page).to have_selector("img[src*='default']")
        expect(page).to have_content 'test_memo'
        expect(current_path).to eq cooking_memories_path
      end
    end

    context 'メモ欄以外が入力されている時' do
      it '料理履歴の登録に成功する' do
        fill_in 'cooking_memory_cooking_name', with: 'test_cooking_name'
        fill_in 'cooking_memory_fish_name', with: 'test_fish_name'
        fill_in 'cooking_memory_cooking_date', with: '002022-07-19'
        attach_file 'cooking_memory[cooking_memory_image]', "#{Rails.root}/spec/fixtures/images/test1_image.jpg"
        click_on '登録する'
        expect(page).to have_content 'test_cooking_name'
        expect(page).to have_content 'test_fish_name'
        expect(page).to have_content '2022年07月19日'
        expect(page).to have_selector("img[src$='test1_image.jpg']")
        expect(page).to_not have_content 'メモ'
        expect(current_path).to eq cooking_memories_path
      end
    end
  end

  describe 'ログイン後の料理履歴の編集機能の検証' do
    before { login_as(user) }

    context '画像を添付している時' do
      let!(:attached_image_cooking_memory) { create(:cooking_memory, :attached_image, user: user) }
      before do
        visit cooking_memories_path
        click_on '編集'
      end
  
      context '必要項目だけ新しい情報に更新して他の情報は削除する時' do
        it '料理履歴の編集に成功する' do
          fill_in 'cooking_memory_cooking_name', with: 'update_cooking_name'
          fill_in 'cooking_memory_fish_name', with: 'update_fish_name'
          fill_in 'cooking_memory_cooking_date', with: nil
          click_on '画像を削除'
          fill_in 'cooking_memory_memo', with: nil
          click_on '更新する'
          expect(page).to have_content 'update_cooking_name'
          expect(page).to have_content 'update_fish_name'
          expect(page).to_not have_content '2022年07月19日'
          expect(page).to have_selector("img[src*='default']")
          expect(page).to_not have_content attached_image_cooking_memory.memo
          expect(page).to have_content '更新に成功しました'
          expect(current_path).to eq cooking_memories_path
        end
      end
  
      context '必須項目の料理名だけ削除して他の情報は更新する時' do
        it '料理履歴の編集に失敗する' do
          fill_in 'cooking_memory_cooking_name', with: nil
          fill_in 'cooking_memory_fish_name', with: 'update_fish_name'
          fill_in 'cooking_memory_cooking_date', with: '002022-07-20'
          attach_file 'cooking_memory[cooking_memory_image]', "#{Rails.root}/spec/fixtures/images/test2_image.jpg"
          fill_in 'cooking_memory_memo', with: 'update_memo'
          click_on '更新する'
          expect(page).to have_content '更新に失敗しました'
          expect(page).to have_content '料理名を入力してください'
          expect(current_path).to eq cooking_memory_path(attached_image_cooking_memory)
        end
      end
  
      context '必須項目の魚の種類だけ削除して他の情報は更新する時' do
        it '料理履歴の編集に失敗する' do
          fill_in 'cooking_memory_cooking_name', with: 'update_cooking_name'
          fill_in 'cooking_memory_fish_name', with: nil
          fill_in 'cooking_memory_cooking_date', with: '002022-07-20'
          attach_file 'cooking_memory[cooking_memory_image]', "#{Rails.root}/spec/fixtures/images/test2_image.jpg"
          fill_in 'cooking_memory_memo', with: 'update_memo'
          click_on '更新する'
          expect(page).to have_content '更新に失敗しました'
          expect(page).to have_content '魚の種類を入力してください'
          expect(current_path).to eq cooking_memory_path(attached_image_cooking_memory)
        end
      end
  
      context '必須項目の情報を全て削除して他の情報は更新する時' do
        it '料理履歴の編集に失敗する' do
          fill_in 'cooking_memory_cooking_name', with: nil
          fill_in 'cooking_memory_fish_name', with: nil
          fill_in 'cooking_memory_cooking_date', with: '002022-07-20'
          attach_file 'cooking_memory[cooking_memory_image]', "#{Rails.root}/spec/fixtures/images/test2_image.jpg"
          fill_in 'cooking_memory_memo', with: 'update_memo'
          click_on '更新する'
          expect(page).to have_content '更新に失敗しました'
          expect(page).to have_content '料理名を入力してください'
          expect(page).to have_content '魚の種類を入力してください'
          expect(current_path).to eq cooking_memory_path(attached_image_cooking_memory)
        end
      end
  
      context '入力欄全ての情報を更新する時' do
        it '料理履歴の編集に成功する' do
          fill_in 'cooking_memory_cooking_name', with: 'update_cooking_name'
          fill_in 'cooking_memory_fish_name', with: 'update_fish_name'
          fill_in 'cooking_memory_cooking_date', with: '002022-07-20'
          attach_file 'cooking_memory[cooking_memory_image]', "#{Rails.root}/spec/fixtures/images/test2_image.jpg"
          fill_in 'cooking_memory_memo', with: 'update_memo'
          click_on '更新する'
          expect(page).to have_content 'update_cooking_name'
          expect(page).to have_content 'update_fish_name'
          expect(page).to have_content '2022年07月20日'
          expect(page).to have_selector("img[src$='test2_image.jpg']")
          expect(page).to have_content 'update_memo'
          expect(current_path).to eq cooking_memories_path
        end
      end
  
      context '料理をした日を削除して他の情報は更新する時' do
        it '料理履歴の編集に成功する' do
          fill_in 'cooking_memory_cooking_name', with: 'update_cooking_name'
          fill_in 'cooking_memory_fish_name', with: 'update_fish_name'
          fill_in 'cooking_memory_cooking_date', with: nil
          attach_file 'cooking_memory[cooking_memory_image]', "#{Rails.root}/spec/fixtures/images/test2_image.jpg"
          find('#cooking_memory_memo').click
          fill_in 'cooking_memory_memo', with: 'update_memo'
          click_on '更新する'
          expect(page).to have_content 'update_cooking_name'
          expect(page).to have_content 'update_fish_name'
          expect(page).to_not have_content '2022年07月19日'
          expect(page).to have_selector("img[src$='test2_image.jpg']")
          expect(page).to have_content 'update_memo'
          expect(current_path).to eq cooking_memories_path
        end
      end

      context '料理の画像を削除して他の情報は更新する時' do
        it '料理履歴の編集に成功する' do
          fill_in 'cooking_memory_cooking_name', with: 'update_cooking_name'
          fill_in 'cooking_memory_fish_name', with: 'update_fish_name'
          fill_in 'cooking_memory_cooking_date', with: '002022-07-20'
          click_on '画像を削除'
          fill_in 'cooking_memory_memo', with: 'update_memo'
          click_on '更新する'
          expect(page).to have_content 'update_cooking_name'
          expect(page).to have_content 'update_fish_name'
          expect(page).to have_content '2022年07月20日'
          expect(page).to have_selector("img[src*='default']")
          expect(page).to have_content 'update_memo'
          expect(current_path).to eq cooking_memories_path
        end
      end
  
      context 'メモ欄を削除して他の情報は更新する時' do
        it '料理履歴の編集に成功する' do
          fill_in 'cooking_memory_cooking_name', with: 'update_cooking_name'
          fill_in 'cooking_memory_fish_name', with: 'update_fish_name'
          fill_in 'cooking_memory_cooking_date', with: '002022-07-20'
          attach_file 'cooking_memory[cooking_memory_image]', "#{Rails.root}/spec/fixtures/images/test2_image.jpg"
          fill_in 'cooking_memory_memo', with: nil
          click_on '更新する'
          expect(page).to have_content 'update_cooking_name'
          expect(page).to have_content 'update_fish_name'
          expect(page).to have_content '2022年07月20日'
          expect(page).to have_selector("img[src$='test2_image.jpg']")
          expect(page).to_not have_content attached_image_cooking_memory.memo
          expect(current_path).to eq cooking_memories_path
        end
      end
    end

    context '画像を添付していない時' do
      let!(:not_attached_image_cooking_memory) { create(:cooking_memory, :not_attached_image, user: user) }
      before do
        visit cooking_memories_path
        click_on '編集'
      end

      context '入力欄全ての情報を更新する時' do
        it '料理履歴の編集に成功する' do
          fill_in 'cooking_memory_cooking_name', with: 'update_cooking_name'
          fill_in 'cooking_memory_fish_name', with: 'update_fish_name'
          fill_in 'cooking_memory_cooking_date', with: '002022-07-20'
          attach_file 'cooking_memory[cooking_memory_image]', "#{Rails.root}/spec/fixtures/images/test2_image.jpg"
          fill_in 'cooking_memory_memo', with: 'update_memo'
          click_on '更新する'
          expect(page).to have_content 'update_cooking_name'
          expect(page).to have_content 'update_fish_name'
          expect(page).to have_content '2022年07月20日'
          expect(page).to have_selector("img[src$='test2_image.jpg']")
          expect(page).to have_content 'update_memo'
          expect(current_path).to eq cooking_memories_path
        end
      end
    end
  end

  describe 'ログイン後の料理履歴の削除機能の検証' do
    before { login_as(user) }

    context '画像を添付している時' do
      let!(:attached_image_cooking_memory) { create(:cooking_memory, :attached_image, user: user) }
  
      it '料理履歴の削除に成功する' do
        visit cooking_memories_path
        click_on '削除'
        expect(page.accept_confirm).to have_content 'こちらの料理履歴を削除してもよろしいですか？'
        expect(page).to have_content '削除に成功しました'
        expect(page).to_not have_content attached_image_cooking_memory.cooking_name
        expect(page).to_not have_content attached_image_cooking_memory.fish_name
        expect(page).to_not have_content '2022年07月19日'
        expect(page).to_not have_selector("img[src$='test1_image.jpg']")
        expect(page).to_not have_content attached_image_cooking_memory.memo
      end
    end

    context '画像を添付していない時' do
      let!(:not_attached_image_cooking_memory) { create(:cooking_memory, :not_attached_image, user: user) }
  
      it '料理履歴の削除に成功する' do
        visit cooking_memories_path
        click_on '削除'
        expect(page.accept_confirm).to have_content 'こちらの料理履歴を削除してもよろしいですか？'
        expect(page).to have_content '削除に成功しました'
        expect(page).to_not have_content not_attached_image_cooking_memory.cooking_name
        expect(page).to_not have_content not_attached_image_cooking_memory.fish_name
        expect(page).to_not have_content '2022年07月19日'
        expect(page).to_not have_selector("img[src*='default']")
        expect(page).to_not have_content not_attached_image_cooking_memory.memo
      end
    end
  end
end