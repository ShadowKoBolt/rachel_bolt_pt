require 'rails_helper'

describe 'home page', type: :feature do
  it 'enables me to sign in' do
    visit root_path
    expect(page).to have_xpath("//a[@href='#{new_user_session_path}']")
  end
end
