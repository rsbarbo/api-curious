
require 'rails_helper'

  RSpec.feature "User can see login page" do
    scenario "when user enter address to website, it sees a login page" do

      visit 'home_path'
      expect(page).to have_link("Login")
    end
  end
