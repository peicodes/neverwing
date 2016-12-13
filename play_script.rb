require_relative 'everwing'

LOGIN_URL = 'the login url from the network log'.freeze
Everwing.new(LOGIN_URL).play(score: 1000, experience: 1000)
