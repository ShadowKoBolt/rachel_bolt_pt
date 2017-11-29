require 'rails_helper'

describe 'set password' do
  it 'enables me to set my password' do
    create(:user, reset_password_token: '123')
    visit set_password_path(reset_password_token: '123')
    fill_form_and_submit(:user, :update, attributes_for(:user_set_password))
    expect(page).to have_content t('users.set_password.success')
  end
end
