class Everwing
  PLAY_PATH = '/purchase/listing'.freeze

  def play(params)
    params = play_params(coins: params[:coins], experience: params[:experience])
    params.merge!(left_sidekick_params(experience: params[:left_sidekick_experience])) if left_sidekick
    params.merge!(right_sidekick_params(experience: params[:right_sidekick_experience])) if right_sidekick

    response = RestClient.get(base_url + PLAY_PATH, params: params)
  end

  private

  def play_params(coins: 1994, experience: 1994)
    {
      global: global_key,
      coin: coins,
      xpPlayer: experience,
      k: user_key,
      l: play_key,
    }
  end

  def left_sidekick_params(experience: 1994)
    {
      sidekick1: left_sidekick['key'],
      xpSidekick1: experience,
    }
  end

  def right_sidekick_params(experience: 1994)
    {
      sidekick2: right_sidekick['key'],
      xpSidekick2: experience,
    }
  end
end
