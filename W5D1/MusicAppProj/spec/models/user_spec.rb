require 'rails_helper'

describe User do
  subject(:user) do
    FactoryBot.build(:user,
      email: "jonathan@fakesite.com",
      password: "good_password")
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  it "checks #is_password method" do
    expect(user.is_password?("password")).to be false
    expect(user.is_password?("good_password")).to be true
  end

  it "checks #reset_session_token" do
    oldsessiontoken = user.reset_session_token!
    newsession = user.reset_session_token!
    expect(oldsessiontoken).not_to eq(newsession)
  end

  it "checks ::find_by_credentials" do
    expect(:user).to eq(User.find_by_credentials(password: "good_password", email: "jonathan@fakesite.com"))
  end

end
