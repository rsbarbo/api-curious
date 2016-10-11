
require 'rails_helper'

  RSpec.feature "User can see login page" do
    scenario "when user enter address to website, it sees a login page" do

      visit root_path
      expect(page).to have_link("Sign In with GitHub")
    end
  end
