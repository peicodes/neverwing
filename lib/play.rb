require 'pp'

class Neverwing

  def play(coins: 100, experience: 100, dragon_experience: 100)
    params = play_params(coins: coins, experience: experience)
    params.merge!(left_dragon_params(experience: dragon_experience)) if left_dragon
    params.merge!(right_dragon_params(experience: dragon_experience)) if right_dragon

    response = RestClient.get(base_url + LISTING_PATH, params: params)
  end

  private

  def play_params(coins:, experience:)
    {
      global: global_key,
      coin: coins,
      xpPlayer: experience,
      k: user_key,
      l: play_key,
    }
  end

  def left_dragon_params(experience:)
    {
      sidekick1: left_dragon['key'],
      xpSidekick1: experience,
    }
  end

  def right_dragon_params(experience:)
    {
      sidekick2: right_dragon['key'],
      xpSidekick2: experience,
    }
  end
end
