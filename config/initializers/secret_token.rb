# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Laundrette::Application.config.secret_key_base = if Rails.env.production?
                                                   ENV['SECRET_TOKEN']
                                                 else
                                                   'fc533aec8d90fad94af3435e1b24db2810e7b5550e860302294111fbb51c1d2508f670a88f5a3004576918b6eeb70a4317099fac9285b36b022f319cd2c27f69'
                                                 end
