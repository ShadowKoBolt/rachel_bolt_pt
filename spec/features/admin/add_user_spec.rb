require 'rails_helper'

describe 'admin' do
  it 'enables me to add a user' do
    login_as(create(:admin))
    visit new_admin_user_path
    fill_form_and_submit(:user, :new, attributes_for(:user_admin_create))
    expect(page).to have_content t('admin.users.create.success')
  end
end
