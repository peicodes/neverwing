require_relative '../neverwing'
require_relative 'env'

Neverwing.new(LOGIN_URL).play(coins: 1000, experience: 1000)
