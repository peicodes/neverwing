require 'rest-client'
require 'json'
require_relative 'data'
require_relative 'request'

class Everwing
  attr_accessor :user_data, :login_url

  LOGIN_PATH = '/auth/login'

  def initialize(login_url)
    @login_url = login_url
    @user_data = JSON.parse(RestClient.get(login_url).body)
  end

  def base_url
    @base_url ||= login_url.split(LOGIN_PATH).first
  end

  def user_id
    params['uid']
  end

  def user_key
    params['k']
  end

  def params
    @params ||= login_url.split('?').last.split('&').map do |param|
      param.split('=')
    end.to_h
  end
end
