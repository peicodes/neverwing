class Everwing
  PLAY_PATH = '/purchase/listing'.freeze

  def play(score: 1994, experience: 1994)
    url = "#{base_url}#{PLAY_PATH}?global=#{global_key}&coin=#{score}&xpPlayer=#{experience}&#{left_sidekick_params}#{right_sidekick_params}k=#{user_key}&l=#{game_key}"
    RestClient.get(url)
  end

  def left_sidekick_params
    if left_sidekick
      "sidekick1=#{left_sidekick['key']}&xpSidekick1=10000&"
    else
      ""
    end
  end

  def right_sidekick_params
    if right_sidekick
      "sidekick2=#{right_sidekick['key']}&xpSidekick2=10000&"
    else
      ""
    end
  end
end
