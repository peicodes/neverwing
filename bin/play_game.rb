require_relative '../neverwing'

LOGIN_URL = 'the login url from the network log'.freeze
Neverwing.new(LOGIN_URL).play(coins: 1000, experience: 1000)
