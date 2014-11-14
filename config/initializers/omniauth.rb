Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
  provider :twitter, "1eflVHwPlh9xu29TdPbSPZqDS", "tjr5yp6gC7OedapbAnEkPNfxjsS4tgSE73A80geF7Yd3hjelvt"
end