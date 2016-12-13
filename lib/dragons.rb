class Neverwing
  def train_dragons
    trainable_dragons.each_slice(2).with_index do |pair, i|
      puts "Training dragon pair #{i+1} of #{(trainable_dragons.count / 2.0).ceil}"
      equip_left_dragon(pair.first) if pair.first
      equip_right_dragon(pair.last) if pair.last
      play(dragon_experience: 99999)
    end
  end

  private

  def equip_left_dragon(dragon)
    return swap_left_dragon(dragon) if left_dragon

    params = equip_params(dragon, equip_left_dragon_key)
    response = RestClient.get(base_url + LISTING_PATH, params: params)
    @left_dragon = dragon if JSON.parse(response.body)['error'].nil?
  end

  def equip_right_dragon(dragon)
    return swap_right_dragon(dragon) if right_dragon

    params = equip_params(dragon, equip_right_dragon_key)
    response = RestClient.get(base_url + LISTING_PATH, params: params)
    @right_dragon = dragon if JSON.parse(response.body)['error'].nil?
  end

  def swap_left_dragon(dragon)
    return if dragon == left_dragon

    params = swap_params(left_dragon, dragon, swap_left_dragon_key)
    response = RestClient.get(base_url + LISTING_PATH, params: params)
    @left_dragon = dragon if JSON.parse(response.body)['error'].nil?
  end

  def swap_right_dragon(dragon)
    return if dragon == right_dragon

    params = swap_params(right_dragon, dragon, swap_right_dragon_key)
    response = RestClient.get(base_url + LISTING_PATH, params: params)
    @right_dragon = dragon if JSON.parse(response.body)['error'].nil?
  end

  def equip_params(new_dragon, key)
    params = {
      sidekick1: new_dragon['key'],
      k: user_key,
      l: key,
    }
  end

  def swap_params(old_dragon, new_dragon, key)
    {
      sidekick1: old_dragon['key'],
      sidekick2: new_dragon['key'],
      k: user_key,
      l: key,
    }
  end
end
