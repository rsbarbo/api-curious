require 'rails_helper'

RSpec.feature "User can see login page" do
  it "logins with credentials" do
    visit root_path
    stub_omniauth

    within 'header' do
      expect(page).to have_content("Sign in")
    end

    click_on 'Sign in'
    save_and_open_page
  end
end
