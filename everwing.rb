require 'rest-client'
require 'json'

require_relative 'config'
require_relative 'data'
require_relative 'keys'
require_relative 'request'

class Everwing
  attr_accessor :login_url

  LOGIN_PATH = '/auth/login'

  def initialize(login_url)
    @login_url = login_url
    reload
  end

  def reload
    load_config
    load_data
    load_keys
  end
end
