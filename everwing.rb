require 'rest-client'
require 'json'
require_relative 'data'
require_relative 'request'

class Everwing
  attr_accessor :user_data

  LOGIN_URL = 'the login url from the network log'
  LOGIN_PATH = '/auth/login'

  def initialize
    @user_data = JSON.parse(RestClient.get(LOGIN_URL).body)
  end

  def base_url
    @base_url ||= LOGIN_URL.split(LOGIN_PATH).first
  end

  def user_id
    params['uid']
  end

  def user_key
    params['k']
  end

  def params
    @params ||= LOGIN_URL.split('?').last.split('&').map do |param|
      param.split('=')
    end.to_h
  end
end
