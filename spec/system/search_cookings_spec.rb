require 'rails_helper'

RSpec.describe "SearchCookings", type: :system do
  let(:user) { create(:user) }

  shared_examples_for '全ての料理が表示される' do
    it { expect(page).to have_content '料理名:' }
    it { expect(page).to have_content '捌き方:' }
    it { expect(page).to have_content '1匹あたりの目安時間' }
    it { expect(page).to have_content '作業時間の合計(捌く時間+料理時間):' }
    it { expect(page).to have_content '捌く時間:' }
    it { expect(page).to have_content '調理時間:' }
    it { expect(page).to have_selector('img') }
    it { expect(page).to have_selector('iframe') }
  end

  describe '料理検索の検証' do
    context 'ログイン前' do
      before { visit cooking_informations_path }

      context '料理検索画面にアクセスした時' do
        it_behaves_like '全ての料理が表示される'
      end

      context '検索条件を入れない時' do
        it_behaves_like '全ての料理が表示される'
      end

      context '魚の種類のみを検索条件に入れた時' do
        it '指定した魚の料理のみが検索できる' do
          all_fish_kinds_array = []
          fishes = Fish.all
          fishes.each do |fish|
            all_fish_kinds_array << fish[:kind]
          end
          select_fish_kind = all_fish_kinds_array.sample
          select_fish_kind_array = ["#{select_fish_kind}"]
          other_than_select_fish_kinds_array = all_fish_kinds_array - select_fish_kind_array
          random_other_than_select_fish_kind = other_than_select_fish_kinds_array.sample
          select "#{select_fish_kind}", from: 'q_fish_kind_eq'
          find('.search-button').click
          if page.all('.page-item').present?
            page.all('.page-item').last.click
            page.all('.cooking-list').first do
              within('.title') do
                expect(page).to have_content "#{select_fish_kind}"
                expect(page).to_not have_content "#{random_other_than_select_fish_kind}"
              end
              expect(page).to have_selector("img[src*=#{select_fish_kind}]")
              expect(page).to_not have_selector("img*=#{random_other_than_select_fish_kind}]")
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
            page.all('.cooking-list').last do
              within('.title') do
                expect(page).to have_content "#{select_fish_kind}"
                expect(page).to_not have_content "#{random_other_than_select_fish_kind}"
              end
              expect(page).to have_selector("img[src*=#{select_fish_kind}]")
              expect(page).to_not have_selector("img*=#{random_other_than_select_fish_kind}]")
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
          else
            page.all('.cooking-list').first do
              within('.title') do
                expect(page).to have_content "#{select_fish_kind}"
                expect(page).to_not have_content "#{random_other_than_select_fish_kind}"
              end
              expect(page).to have_selector("img[src*=#{select_fish_kind}]")
              expect(page).to_not have_selector("img*=#{random_other_than_select_fish_kind}]")
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
            page.all('.cooking-list').last do
              within('.title') do
                expect(page).to have_content "#{select_fish_kind}"
                expect(page).to_not have_content "#{random_other_than_select_fish_kind}"
              end
              expect(page).to have_selector("img[src*=#{select_fish_kind}]")
              expect(page).to_not have_selector("img*=#{random_other_than_select_fish_kind}]")
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
          end
        end
      end

      context '捌き方のみを検索条件に入れた時' do
        it '指定した捌き方のみが検索ができる' do
          all_handle_patterns_array = []
          handles = Handle.all
          handles.each do |handle|
            all_handle_patterns_array << handle[:pattern]
          end
          select_handle_pattern = all_handle_patterns_array.sample
          select_handle_pattern_array = ["#{select_handle_pattern}"]
          other_than_select_handle_patterns_array = all_handle_patterns_array - select_handle_pattern_array
          random_other_than_select_handle_pattern = other_than_select_handle_patterns_array.sample
          select "#{select_handle_pattern}", from: 'q_handle_pattern_eq'
          find('.search-button').click
          if page.all('.page-item').present?
            page.all('.page-item').last.click
            page.all('.cooking-list').first do
              expect(page).to have_content "捌き方: #{select_handle_pattern}"
              expect(page).to_not have_content "捌き方: #{random_other_than_select_handle_pattern}"
              expect(page).to have_selector('img')
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
            page.all('.cooking-list').last do
              expect(page).to have_content "捌き方: #{select_handle_pattern}"
              expect(page).to_not have_content "捌き方: #{random_other_than_select_handle_pattern}"
              expect(page).to have_selector('img')
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
          else
            page.all('.cooking-list').first do
              expect(page).to have_content "捌き方: #{select_handle_pattern}"
              expect(page).to_not have_content "捌き方: #{random_other_than_select_handle_pattern}"
              expect(page).to have_selector('img')
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
            page.all('.cooking-list').last do
              expect(page).to have_content "捌き方: #{select_handle_pattern}"
              expect(page).to_not have_content "捌き方: #{random_other_than_select_handle_pattern}"
              expect(page).to have_selector('img')
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
          end
        end
      end

      context '魚の種類と捌き方を検索条件に入れた時' do
        it '指定した魚の種類且つ捌き方の検索ができる', js: true do
          all_fish_kinds_array = []
          fishes = Fish.all
          fishes.each do |fish|
            all_fish_kinds_array << fish[:kind]
          end
          all_handle_patterns_array = []
          handles = Handle.all
          handles.each do |handle|
            all_handle_patterns_array << handle[:pattern]
          end
          select_fish_kind = all_fish_kinds_array.sample
          select_fish_kind_array = ["#{select_fish_kind}"]
          other_than_select_fish_kinds_array = all_fish_kinds_array - select_fish_kind_array
          random_other_than_select_fish_kind = other_than_select_fish_kinds_array.sample
          fish = Fish.find_by(kind: select_fish_kind)
          fish_handle_patterns_array = []
          fish.handles.each do |handle|
            fish_handle_patterns_array << handle[:pattern]
          end
          select_handle_pattern = fish_handle_patterns_array.sample
          other_than_select_handle_patterns_array = all_handle_patterns_array - fish_handle_patterns_array
          random_other_than_select_handle_pattern = other_than_select_handle_patterns_array.sample
          select "#{select_fish_kind}", from: 'q_fish_kind_eq'
          select "#{select_handle_pattern}", from: 'q_handle_pattern_eq'
          find('.search-button').click
          if page.all('.page-item').present?
            page.all('.page-item').last.click
            page.all('.cooking-list').first do
              within('.title') do
                expect(page).to have_content "#{select_fish_kind}"
                expect(page).to_not have_content "#{random_other_than_select_fish_kind}"
                expect(page).to have_content "捌き方: #{select_handle_pattern}"
                expect(page).to_not have_content "捌き方: #{random_other_than_select_handle_pattern}"
              end
              expect(page).to have_selector("img[src*=#{select_fish_kind}]")
              expect(page).to_not have_selector("img*=#{random_other_than_select_fish_kind}]")
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
            page.all('.cooking-list').last do
              within('.title') do
                expect(page).to have_content "#{select_fish_kind}"
                expect(page).to_not have_content "#{random_other_than_select_fish_kind}"
                expect(page).to have_content "捌き方: #{select_handle_pattern}"
                expect(page).to_not have_content "捌き方: #{random_other_than_select_handle_pattern}"
              end
              expect(page).to have_selector("img[src*=#{select_fish_kind}]")
              expect(page).to_not have_selector("img*=#{random_other_than_select_fish_kind}]")
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
          else
            page.all('.cooking-list').first do
              within('.title') do
                expect(page).to have_content "#{select_fish_kind}"
                expect(page).to_not have_content "#{random_other_than_select_fish_kind}"
                expect(page).to have_content "捌き方: #{select_handle_pattern}"
                expect(page).to_not have_content "捌き方: #{random_other_than_select_handle_pattern}"
              end
              expect(page).to have_selector("img[src*=#{select_fish_kind}]")
              expect(page).to_not have_selector("img*=#{random_other_than_select_fish_kind}]")
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
            page.all('.cooking-list').last do
              within('.title') do
                expect(page).to have_content "#{select_fish_kind}"
                expect(page).to_not have_content "#{random_other_than_select_fish_kind}"
                expect(page).to have_content "捌き方: #{select_handle_pattern}"
                expect(page).to_not have_content "捌き方: #{random_other_than_select_handle_pattern}"
              end
              expect(page).to have_selector("img[src*=#{select_fish_kind}]")
              expect(page).to_not have_selector("img*=#{random_other_than_select_fish_kind}]")
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
          end
        end
      end

      context '魚の種類を選んだ時' do
        it '選んだ魚の種類によって捌き方の選択肢が変わる', js: true do
          all_fish_kinds_array = []
          fishes = Fish.all
          fishes.each do |fish|
            all_fish_kinds_array << fish[:kind]
          end
          all_handle_patterns_array = []
          handles = Handle.all
          handles.each do |handle|
            all_handle_patterns_array << handle[:pattern]
          end
          select_fish_kind = all_fish_kinds_array.sample
          fish = Fish.find_by(kind: select_fish_kind)
          select_fish_handle_patterns_array = []
          fish.handles.each do |handle|
            select_fish_handle_patterns_array << handle[:pattern]
          end
          other_than_select_fish_handles_patterns_array = all_handle_patterns_array - select_fish_handle_patterns_array
          random_other_than_select_fish_handle_pattern = other_than_select_fish_handles_patterns_array.sample
          random_select_fish_handle_pattern = select_fish_handle_patterns_array.sample
          select "#{select_fish_kind}", from: 'q_fish_kind_eq'
          within('#q_handle_pattern_eq') do
            expect(page).to have_content "#{random_select_fish_handle_pattern}"
            expect(page).to_not have_content "#{random_other_than_select_fish_handle_pattern}"
          end
        end
      end
    end

    context 'ログイン後' do
      before do
        login_as(user)
        visit cooking_informations_path
      end

      context '料理検索画面にアクセスした時' do
        it_behaves_like '全ての料理が表示される'
      end

      context '検索条件を入れない時' do
        it_behaves_like '全ての料理が表示される'
      end

      context '魚の種類のみを検索条件に入れた時' do
        it '指定した魚の料理のみが検索できる' do
          all_fish_kinds_array = []
          fishes = Fish.all
          fishes.each do |fish|
            all_fish_kinds_array << fish[:kind]
          end
          select_fish_kind = all_fish_kinds_array.sample
          select_fish_kind_array = ["#{select_fish_kind}"]
          other_than_select_fish_kinds_array = all_fish_kinds_array - select_fish_kind_array
          random_other_than_select_fish_kind = other_than_select_fish_kinds_array.sample
          select "#{select_fish_kind}", from: 'q_fish_kind_eq'
          find('.search-button').click
          if page.all('.page-item').present?
            page.all('.page-item').last.click
            page.all('.cooking-list').first do
              within('.title') do
                expect(page).to have_content "#{select_fish_kind}"
                expect(page).to_not have_content "#{random_other_than_select_fish_kind}"
              end
              expect(page).to have_selector("img[src*=#{select_fish_kind}]")
              expect(page).to_not have_selector("img*=#{random_other_than_select_fish_kind}]")
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
            page.all('.cooking-list').last do
              within('.title') do
                expect(page).to have_content "#{select_fish_kind}"
                expect(page).to_not have_content "#{random_other_than_select_fish_kind}"
              end
              expect(page).to have_selector("img[src*=#{select_fish_kind}]")
              expect(page).to_not have_selector("img*=#{random_other_than_select_fish_kind}]")
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
          else
            page.all('.cooking-list').first do
              within('.title') do
                expect(page).to have_content "#{select_fish_kind}"
                expect(page).to_not have_content "#{random_other_than_select_fish_kind}"
              end
              expect(page).to have_selector("img[src*=#{select_fish_kind}]")
              expect(page).to_not have_selector("img*=#{random_other_than_select_fish_kind}]")
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
            page.all('.cooking-list').last do
              within('.title') do
                expect(page).to have_content "#{select_fish_kind}"
                expect(page).to_not have_content "#{random_other_than_select_fish_kind}"
              end
              expect(page).to have_selector("img[src*=#{select_fish_kind}]")
              expect(page).to_not have_selector("img*=#{random_other_than_select_fish_kind}]")
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
          end
        end
      end

      context '捌き方のみを検索条件に入れた時' do
        it '指定した捌き方のみが検索ができる' do
          all_handle_patterns_array = []
          handles = Handle.all
          handles.each do |handle|
            all_handle_patterns_array << handle[:pattern]
          end
          select_handle_pattern = all_handle_patterns_array.sample
          select_handle_pattern_array = ["#{select_handle_pattern}"]
          other_than_select_handle_patterns_array = all_handle_patterns_array - select_handle_pattern_array
          random_other_than_select_handle_pattern = other_than_select_handle_patterns_array.sample
          select "#{select_handle_pattern}", from: 'q_handle_pattern_eq'
          find('.search-button').click
          if page.all('.page-item').present?
            page.all('.page-item').last.click
            page.all('.cooking-list').first do
              expect(page).to have_content "捌き方: #{select_handle_pattern}"
              expect(page).to_not have_content "捌き方: #{random_other_than_select_handle_pattern}"
              expect(page).to have_selector('img')
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
            page.all('.cooking-list').last do
              expect(page).to have_content "捌き方: #{select_handle_pattern}"
              expect(page).to_not have_content "捌き方: #{random_other_than_select_handle_pattern}"
              expect(page).to have_selector('img')
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
          else
            page.all('.cooking-list').first do
              expect(page).to have_content "捌き方: #{select_handle_pattern}"
              expect(page).to_not have_content "捌き方: #{random_other_than_select_handle_pattern}"
              expect(page).to have_selector('img')
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
            page.all('.cooking-list').last do
              expect(page).to have_content "捌き方: #{select_handle_pattern}"
              expect(page).to_not have_content "捌き方: #{random_other_than_select_handle_pattern}"
              expect(page).to have_selector('img')
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
          end
        end
      end

      context '魚の種類と捌き方を検索条件に入れた時' do
        it '指定した魚の種類且つ捌き方の検索ができる', js: true do
          all_fish_kinds_array = []
          fishes = Fish.all
          fishes.each do |fish|
            all_fish_kinds_array << fish[:kind]
          end
          all_handle_patterns_array = []
          handles = Handle.all
          handles.each do |handle|
            all_handle_patterns_array << handle[:pattern]
          end
          select_fish_kind = all_fish_kinds_array.sample
          select_fish_kind_array = ["#{select_fish_kind}"]
          other_than_select_fish_kinds_array = all_fish_kinds_array - select_fish_kind_array
          random_other_than_select_fish_kind = other_than_select_fish_kinds_array.sample
          fish = Fish.find_by(kind: select_fish_kind)
          fish_handle_patterns_array = []
          fish.handles.each do |handle|
            fish_handle_patterns_array << handle[:pattern]
          end
          select_handle_pattern = fish_handle_patterns_array.sample
          other_than_select_handle_patterns_array = all_handle_patterns_array - fish_handle_patterns_array
          random_other_than_select_handle_pattern = other_than_select_handle_patterns_array.sample
          select "#{select_fish_kind}", from: 'q_fish_kind_eq'
          select "#{select_handle_pattern}", from: 'q_handle_pattern_eq'
          find('.search-button').click
          if page.all('.page-item').present?
            page.all('.page-item').last.click
            page.all('.cooking-list').first do
              within('.title') do
                expect(page).to have_content "#{select_fish_kind}"
                expect(page).to_not have_content "#{random_other_than_select_fish_kind}"
                expect(page).to have_content "捌き方: #{select_handle_pattern}"
                expect(page).to_not have_content "捌き方: #{random_other_than_select_handle_pattern}"
              end
              expect(page).to have_selector("img[src*=#{select_fish_kind}]")
              expect(page).to_not have_selector("img*=#{random_other_than_select_fish_kind}]")
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
            page.all('.cooking-list').last do
              within('.title') do
                expect(page).to have_content "#{select_fish_kind}"
                expect(page).to_not have_content "#{random_other_than_select_fish_kind}"
                expect(page).to have_content "捌き方: #{select_handle_pattern}"
                expect(page).to_not have_content "捌き方: #{random_other_than_select_handle_pattern}"
              end
              expect(page).to have_selector("img[src*=#{select_fish_kind}]")
              expect(page).to_not have_selector("img*=#{random_other_than_select_fish_kind}]")
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
          else
            page.all('.cooking-list').first do
              within('.title') do
                expect(page).to have_content "#{select_fish_kind}"
                expect(page).to_not have_content "#{random_other_than_select_fish_kind}"
                expect(page).to have_content "捌き方: #{select_handle_pattern}"
                expect(page).to_not have_content "捌き方: #{random_other_than_select_handle_pattern}"
              end
              expect(page).to have_selector("img[src*=#{select_fish_kind}]")
              expect(page).to_not have_selector("img*=#{random_other_than_select_fish_kind}]")
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
            page.all('.cooking-list').last do
              within('.title') do
                expect(page).to have_content "#{select_fish_kind}"
                expect(page).to_not have_content "#{random_other_than_select_fish_kind}"
                expect(page).to have_content "捌き方: #{select_handle_pattern}"
                expect(page).to_not have_content "捌き方: #{random_other_than_select_handle_pattern}"
              end
              expect(page).to have_selector("img[src*=#{select_fish_kind}]")
              expect(page).to_not have_selector("img*=#{random_other_than_select_fish_kind}]")
              expect(page).to have_selector('iframe')
              expect(current_path).to eq cooking_informations_path
            end
          end
        end
      end

      context '魚の種類を選んだ時' do
        it '選んだ魚の種類によって捌き方の選択肢が変わる', js: true do
          all_fish_kinds_array = []
          fishes = Fish.all
          fishes.each do |fish|
            all_fish_kinds_array << fish[:kind]
          end
          all_handle_patterns_array = []
          handles = Handle.all
          handles.each do |handle|
            all_handle_patterns_array << handle[:pattern]
          end
          select_fish_kind = all_fish_kinds_array.sample
          fish = Fish.find_by(kind: select_fish_kind)
          select_fish_handle_patterns_array = []
          fish.handles.each do |handle|
            select_fish_handle_patterns_array << handle[:pattern]
          end
          other_than_select_fish_handles_patterns_array = all_handle_patterns_array - select_fish_handle_patterns_array
          random_other_than_select_fish_handle_pattern = other_than_select_fish_handles_patterns_array.sample
          random_select_fish_handle_pattern = select_fish_handle_patterns_array.sample
          select "#{select_fish_kind}", from: 'q_fish_kind_eq'
          within('#q_handle_pattern_eq') do
            expect(page).to have_content "#{random_select_fish_handle_pattern}"
            expect(page).to_not have_content "#{random_other_than_select_fish_handle_pattern}"
          end
        end
      end
    end
  end
end
