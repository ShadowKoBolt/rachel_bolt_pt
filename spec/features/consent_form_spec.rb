require 'rails_helper'

describe 'consent form' do
  it 'enables me to give content information' do
    login_as(create(:user))
    visit consent_path
    fill_consent_form_and_submit
    expect(page).to have_content t('consent.update.success')
  end

  def fill_consent_form_and_submit
    fill_form(:user_consent,
              :update,
              attributes_for(:user_consent).except(:accept_2))
    check 'user_consent[accept_2]'
    click_button t('helpers.submit.user_consent.update')
  end
end
