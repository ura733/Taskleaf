require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      # ユーザAを作成しておく
      user_a = FactoryBot.create(:user, name: 'ユーザA', email: 'a@example.com')
      # 作成者がユーザAであるタスクを作成しておく
      FactoryBot.create(:task, name: '最初のタスク', user: user_a)
    end

    context 'ユーザAがログインしている時' do
      before do
        # ユーザAでログインする
        visit login_path
        fill_in 'seesion_email', with: 'a@example.com'
        fill_in 'session_password', with: 'password'
        click_button 'ログイン'
      end

      it 'ユーザAが作成したタスクが表示される' do
        # 作成済みタスクの名称が画面上に表示されている事を確認
        expect(page).to have_content '最初のタスク'
      end
    end
  end
end
