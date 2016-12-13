class Everwing
  def train_dragons
    trainable_dragons.each_slice(2).with_index do |pair, i|
      puts "Training dragon pair #{i+1} of #{(trainable_dragons.count / 2.0).ceil}"
      equip_left_dragon(pair.first) if pair.first
      equip_right_dragon(pair.last) if pair.last
      play(dragon_experience: 99999)
    end
  end

  def equip_left_dragon(dragon)
    return swap_left_dragon(dragon) if left_dragon

    params = {
      sidekick1: dragon['key'],
      k: user_key,
      l: equip_left_dragon_key,
    }

    response = RestClient.get(base_url + LISTING_PATH, params: params)
  end

  def equip_right_dragon(dragon)
    return swap_right_dragon(dragon) if right_dragon

    params = {
      sidekick1: dragon['key'],
      k: user_key,
      l: equip_right_dragon_key,
    }

    response = RestClient.get(base_url + LISTING_PATH, params: params)
  end

  private

  def swap_left_dragon(dragon)
    return if dragon == left_dragon

    params = {
      sidekick1: dragon['key'],
      sidekick2: left_dragon['key'],
      k: user_key,
      l: swap_left_dragon_key,
    }

    response = RestClient.get(base_url + LISTING_PATH, params: params)
  end

  def swap_right_dragon(dragon)
    return if dragon == right_dragon

    params = {
      sidekick1: dragon['key'],
      sidekick2: right_dragon['key'],
      k: user_key,
      l: swap_right_dragon_key,
    }

    response = RestClient.get(base_url + LISTING_PATH, params: params)
  end
end
