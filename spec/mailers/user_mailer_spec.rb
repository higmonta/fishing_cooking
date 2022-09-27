require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe 'パスワードリセットのメール送信の検証' do
    let(:user) { create(:user) }
    let(:mail) { UserMailer.reset_password_email(user) }
    before do
      user.generate_reset_password_token!
      mail.deliver_now
    end
    
    context 'メールを送信した時' do
      it 'ヘッダー情報,ボディ情報が正しい' do
        expect(mail.subject).to eq 'パスワード再発行のお知らせ'
        expect(mail.to).to eq [user.email]
        expect(mail.from).to eq [Rails.application.credentials.sendgrid.dig(:sender_address)]
      end

      it 'メール本文が正しい' do
        expect(mail.html_part.body.to_s).to have_content "#{user.name} 様"
        expect(mail.html_part.body.to_s).to have_content 'パスワード再発行の依頼を受け付けました。'
        expect(mail.html_part.body.to_s).to have_content 'こちらのリンクからパスワードの再発行を行ってください。'
        expect(mail.html_part.body.to_s).to have_content "http://localhost:3000/password_resets/#{user.reset_password_token}/edit"
        expect(mail.text_part.body.to_s).to have_content "#{user.name} 様"
        expect(mail.text_part.body.to_s).to have_content 'パスワード再発行の依頼を受け付けました。'
        expect(mail.text_part.body.to_s).to have_content 'こちらのリンクからパスワードの再発行を行ってください。'
        expect(mail.text_part.body.to_s).to have_content "http://localhost:3000/password_resets/#{user.reset_password_token}/edit"
      end
    end
  end
end