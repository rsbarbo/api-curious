require 'rails_helper'

RSpec.describe User, type: :model do
  it "assigns the auth properly" do
    auth = stub_omniauth

    result = User.find_or_create_user(auth)

    expect(result.provider).to eq("github")
    expect(result.uid).to eq("14164092")
    expect(result.name).to eq("Rapha Barbo")
  end
end
