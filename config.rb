
class Everwing
  attr_reader :base_url, :user_id, :user_key, :data

  def load_config
    @base_url = login_url.split(LOGIN_PATH).first
    @user_id = login_params['uid']
    @user_key = login_params['k']
    @data = JSON.parse(RestClient.get(login_url).body)
  end


  private

  def login_params
    @login_params = login_url.split('?').last.split('&').map do |param|
      param.split('=')
    end.to_h
  end
end
