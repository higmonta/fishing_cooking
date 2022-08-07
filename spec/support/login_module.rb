module LoginModule
  def login_as(user)
    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: "123456789aA"
    click_button "ログイン"
  end
end