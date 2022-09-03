require 'rails_helper'

RSpec.describe "CalculateCookingTimes", type: :system do
  let(:user) { create(:user) }

  shared_examples_for '料理の一覧が表示されない' do
    it { expect(page).to_not have_content '料理名:' }
    it { expect(page).to_not have_content '捌き方:' }
    it { expect(page).to_not have_selector('img') }
    it { expect(page).to_not have_content '調理する魚の数:' }
    it { expect(page).to_not have_content '魚を寝かせられるキャパシティ:' }
    it { expect(page).to_not have_content '調理機材のキャパシティ:' }
    it { expect(page).to_not have_selector('iframe') }
  end

  describe '料理時間計算機能の検証' do
    context 'ログイン前' do
      before { visit search_time_cooking_informations_path }

      context '料理時間検索画面にアクセスした時' do
        it_behaves_like '料理の一覧が表示されない'
      end

      context '検索条件を入れない時' do
        it '検索エラーになる' do
          find('.search-button').click
          expect(page).to have_content '検索フォームを全て入力してくだい'
          expect(current_path).to eq search_calculate_cooking_time_cooking_informations_path
        end
      end

      context '魚の種類のみを検索条件に入れた時' do
        it '検索エラーになる' do
          all_fish_kinds_array = []
          fishes = Fish.all
          fishes.each do |fish|
            all_fish_kinds_array << fish[:kind]
          end
          select_fish_kind = all_fish_kinds_array.sample
          select "#{select_fish_kind}", from: 'fish_kind'
          find('.search-button').click
          expect(page).to have_content '検索フォームを全て入力してくだい'
          expect(current_path).to eq search_calculate_cooking_time_cooking_informations_path
        end
      end

      context '料理の種類のみを検索条件に入れた時' do
        it '検索エラーになる' do
          all_cooking_names_array = []
          cookings = Cooking.all
          cookings.each do |cooking|
            all_cooking_names_array << cooking[:name]
          end
          select_cooking_name = all_cooking_names_array.sample
          select "#{select_cooking_name}", from: 'cooking_name'
          find('.search-button').click
          expect(page).to have_content '検索フォームを全て入力してくだい'
          expect(current_path).to eq search_calculate_cooking_time_cooking_informations_path
        end
      end

      context '魚の種類と料理の種類を検索条件に入れた時' do
        it '指定した魚の種類且つ料理の種類で検索ができる' do
          all_fish_kinds_array = []
          fishes = Fish.all
          fishes.each do |fish|
            all_fish_kinds_array << fish[:kind]
          end
          all_cooking_names_array = []
          cookings = Cooking.all
          cookings.each do |cooking|
            all_cooking_names_array << cooking[:name]
          end
          all_handle_patterns_array = []
          handles = Handle.all
          handles.each do |handle|
            all_handle_patterns_array.push("#{handle[:pattern]}")
          end
          select_fish_kind = all_fish_kinds_array.sample
          select_fish_kind_array = ["#{select_fish_kind}"]
          other_than_select_fish_kinds_array = all_fish_kinds_array - select_fish_kind_array
          random_other_than_select_fish_kind = other_than_select_fish_kinds_array.sample
          fish = Fish.find_by(kind: select_fish_kind)
          fish_cooking_names_array = []
          fish.cookings.each do |cooking|
            fish_cooking_names_array << cooking[:name]
          end
          select_cooking_name = fish_cooking_names_array.sample
          select_cooking_name_array = ["#{select_cooking_name}"]
          other_than_select_handle_patterns_array = all_cooking_names_array - select_cooking_name_array
          random_other_than_select_cooking_name = other_than_select_handle_patterns_array.sample
          cooking_id = Cooking.find_by(name: select_cooking_name).id
          fish_id = Fish.find_by(kind: select_fish_kind).id
          handle_id = CookingInformation.find_by(cooking_id: cooking_id, fish_id: fish_id).handle_id
          display_handle_pattern = Handle.find_by(id: handle_id).pattern
          display_handle_pattern_array = ["#{display_handle_pattern}"]
          other_than_display_handle_patterns_array = all_handle_patterns_array - display_handle_pattern_array
          random_other_than_display_handle_pattern = other_than_display_handle_patterns_array.sample
          select "#{select_fish_kind}", from: 'fish_kind'
          select "#{select_cooking_name}", from: 'cooking_name'
          find('.search-button').click
          within('.title') do
            expect(page).to have_content "料理名: #{select_cooking_name}(#{select_fish_kind})"
            expect(page).to_not have_content "#{random_other_than_select_cooking_name}"
            expect(page).to_not have_content "#{random_other_than_select_fish_kind}"
            expect(page).to have_content "捌き方: #{display_handle_pattern}"
            expect(page).to_not have_content "#{random_other_than_display_handle_pattern}"
          end
          expect(page).to have_selector("img[src*=#{select_fish_kind}]")
          expect(page).to_not have_selector("img[src*=#{random_other_than_select_fish_kind}]")
          expect(page).to have_content '調理する魚の数:'
          expect(page).to have_content '魚を寝かせられるキャパシティ:'
          expect(page).to have_content '調理機材のキャパシティ:'
          expect(page).to have_selector('iframe')
          expect(current_path).to eq search_calculate_cooking_time_cooking_informations_path
        end
      end

      context '魚の種類を選んだ時' do
        it '選んだ魚の種類によって料理の選択肢が変わる' do
          all_fish_kinds_array = []
          fishes = Fish.all
          fishes.each do |fish|
            all_fish_kinds_array << fish[:kind]
          end
          all_cooking_names_array = []
          cookings = Cooking.all
          cookings.each do |cooking|
            all_cooking_names_array << cooking[:name]
          end
          select_fish_kind = all_fish_kinds_array.sample
          fish = Fish.find_by(kind: select_fish_kind)
          select_fish_cooking_names_array = []
          fish.cookings.each do |cooking|
            select_fish_cooking_names_array << cooking[:name]
          end
          other_than_select_fish_cookings_names_array = all_cooking_names_array - select_fish_cooking_names_array
          random_other_than_select_fish_cooking_name = other_than_select_fish_cookings_names_array.sample
          random_select_fish_cooking_name = select_fish_cooking_names_array.sample
          select "#{select_fish_kind}", from: 'fish_kind'
          within('#cooking_name') do
            expect(page).to have_content "#{random_select_fish_cooking_name}"
            expect(page).to_not have_content "#{random_other_than_select_fish_cooking_name}"
          end
        end
      end
    end

    context 'ログイン後' do
      before do
        login_as(user)
        visit search_time_cooking_informations_path
      end

      context '料理時間検索画面にアクセスした時' do
        it_behaves_like '料理の一覧が表示されない'
      end

      context '検索条件を入れない時' do
        it '検索エラーになる' do
          find('.search-button').click
          expect(page).to have_content '検索フォームを全て入力してくだい'
          expect(current_path).to eq search_calculate_cooking_time_cooking_informations_path
        end
      end

      context '魚の種類のみを検索条件に入れた時' do
        it '検索エラーになる' do
          all_fish_kinds_array = []
          fishes = Fish.all
          fishes.each do |fish|
            all_fish_kinds_array << fish[:kind]
          end
          select_fish_kind = all_fish_kinds_array.sample
          select "#{select_fish_kind}", from: 'fish_kind'
          find('.search-button').click
          expect(page).to have_content '検索フォームを全て入力してくだい'
          expect(current_path).to eq search_calculate_cooking_time_cooking_informations_path
        end
      end

      context '料理の種類のみを検索条件に入れた時' do
        it '検索エラーになる' do
          all_cooking_names_array = []
          cookings = Cooking.all
          cookings.each do |cooking|
            all_cooking_names_array << cooking[:name]
          end
          select_cooking_name = all_cooking_names_array.sample
          select "#{select_cooking_name}", from: 'cooking_name'
          find('.search-button').click
          expect(page).to have_content '検索フォームを全て入力してくだい'
          expect(current_path).to eq search_calculate_cooking_time_cooking_informations_path
        end
      end

      context '魚の種類と料理の種類を検索条件に入れた時' do
        it '指定した魚の種類且つ料理の種類で検索ができる' do
          all_fish_kinds_array = []
          fishes = Fish.all
          fishes.each do |fish|
            all_fish_kinds_array << fish[:kind]
          end
          all_cooking_names_array = []
          cookings = Cooking.all
          cookings.each do |cooking|
            all_cooking_names_array << cooking[:name]
          end
          all_handle_patterns_array = []
          handles = Handle.all
          handles.each do |handle|
            all_handle_patterns_array.push("#{handle[:pattern]}")
          end
          select_fish_kind = all_fish_kinds_array.sample
          select_fish_kind_array = ["#{select_fish_kind}"]
          other_than_select_fish_kinds_array = all_fish_kinds_array - select_fish_kind_array
          random_other_than_select_fish_kind = other_than_select_fish_kinds_array.sample
          fish = Fish.find_by(kind: select_fish_kind)
          fish_cooking_names_array = []
          fish.cookings.each do |cooking|
            fish_cooking_names_array << cooking[:name]
          end
          select_cooking_name = fish_cooking_names_array.sample
          select_cooking_name_array = ["#{select_cooking_name}"]
          other_than_select_handle_patterns_array = all_cooking_names_array - select_cooking_name_array
          random_other_than_select_cooking_name = other_than_select_handle_patterns_array.sample
          cooking_id = Cooking.find_by(name: select_cooking_name).id
          fish_id = Fish.find_by(kind: select_fish_kind).id
          handle_id = CookingInformation.find_by(cooking_id: cooking_id, fish_id: fish_id).handle_id
          display_handle_pattern = Handle.find_by(id: handle_id).pattern
          display_handle_pattern_array = ["#{display_handle_pattern}"]
          other_than_display_handle_patterns_array = all_handle_patterns_array - display_handle_pattern_array
          random_other_than_display_handle_pattern = other_than_display_handle_patterns_array.sample
          select "#{select_fish_kind}", from: 'fish_kind'
          select "#{select_cooking_name}", from: 'cooking_name'
          find('.search-button').click
          within('.title') do
            expect(page).to have_content "料理名: #{select_cooking_name}(#{select_fish_kind})"
            expect(page).to_not have_content "#{random_other_than_select_cooking_name}"
            expect(page).to_not have_content "#{random_other_than_select_fish_kind}"
            expect(page).to have_content "捌き方: #{display_handle_pattern}"
            expect(page).to_not have_content "#{random_other_than_display_handle_pattern}"
          end
          expect(page).to have_selector("img[src*=#{select_fish_kind}]")
          expect(page).to_not have_selector("img[src*=#{random_other_than_select_fish_kind}]")
          expect(page).to have_content '調理する魚の数:'
          expect(page).to have_content '魚を寝かせられるキャパシティ:'
          expect(page).to have_content '調理機材のキャパシティ:'
          expect(page).to have_selector('iframe')
          expect(current_path).to eq search_calculate_cooking_time_cooking_informations_path
        end
      end

      context '魚の種類を選んだ時' do
        it '選んだ魚の種類によって料理の選択肢が変わる' do
          all_fish_kinds_array = []
          fishes = Fish.all
          fishes.each do |fish|
            all_fish_kinds_array << fish[:kind]
          end
          all_cooking_names_array = []
          cookings = Cooking.all
          cookings.each do |cooking|
            all_cooking_names_array << cooking[:name]
          end
          select_fish_kind = all_fish_kinds_array.sample
          fish = Fish.find_by(kind: select_fish_kind)
          select_fish_cooking_names_array = []
          fish.cookings.each do |cooking|
            select_fish_cooking_names_array << cooking[:name]
          end
          other_than_select_fish_cookings_names_array = all_cooking_names_array - select_fish_cooking_names_array
          random_other_than_select_fish_cooking_name = other_than_select_fish_cookings_names_array.sample
          random_select_fish_cooking_name = select_fish_cooking_names_array.sample
          select "#{select_fish_kind}", from: 'fish_kind'
          within('#cooking_name') do
            expect(page).to have_content "#{random_select_fish_cooking_name}"
            expect(page).to_not have_content "#{random_other_than_select_fish_cooking_name}"
          end
        end
      end
    end
  end
end
