require 'spec_helper'

describe User do
  describe "#get_omniauth_user" do
    let(:params) do
      {
        "info" => {
          "name" => "First Last",
          "first_name" => "First",
          "last_name" => "Last",
          "image" => "http://imgur.com/gallery/JUZvkhC",
          "email" => "email@domain.com"
        },
        "uid" => "1234"
      }
    end

    let(:user) {User.get_omniauth_user({omniauth_params: params})}

    it "returns nil if omniauth info is not passed in" do
      expect(User.get_omniauth_user).to eq(nil)
    end

    it "creates a new user if the email is passed in" do
      old_user_count = User.count
      expect(user).to be_a(User)
      expect(user.email).to eq(params["info"]["email"])
      expect(User.count).to eq(old_user_count + 1)
    end

    it "is not a guest user" do
      expect(user.guest).to eq(false)
    end

    it "retrieves other attributes from omniauth params" do
      expect(user.full_name).to eq(params["info"]["name"])
      expect(user.first_name).to eq(params["info"]["first_name"])
      expect(user.last_name).to eq(params["info"]["last_name"])
      expect(user.image_url).to eq(params["info"]["image"])
      expect(user.google_uid).to eq(params["uid"])
    end

    it "retrieves an old user if the email address is the same" do
      user # This line ensures the old user is created
      old_user_count = User.count
      new_user = User.get_omniauth_user({omniauth_params: params})
      expect(User.count).to eq(old_user_count)
      expect(new_user.id).to eq(user.id)
    end
  end

  describe "#get_guest_user" do
    let(:user) {User.get_guest_user}

    it "returns a guest user" do
      expect(user).to be_a(User)
    end

    it "sets guest to true" do
      expect(user.guest).to eq(true)
    end
  end
end