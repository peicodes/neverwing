require_relative 'everwing'

LOGIN_URL = 'the login url from the network log'.freeze
Everwing.new(LOGIN_URL).train_sidekicks
