class Neverwing
  COINS_PER_GAME = 96000
  COMMON_EGG_COST = 4000
  PREMIUM_EGG_COST = 12000

  def buy_common_eggs(count=1)
    total_cost = COMMON_EGG_COST * count
    games_needed = (total_cost / COINS_PER_GAME.to_f).ceil
    buy_response = nil

    games_needed.times { make_coins }
    count.times { buy_response = buy_common_egg }

    claim_dragons(buy_response['wallet'])
  end

  def buy_premium_eggs(count=1)
    total_cost = PREMIUM_EGG_COST * count
    games_needed = (total_cost / COINS_PER_GAME.to_f).ceil
    buy_response = nil

    games_needed.times { make_coins }
    count.times { buy_response = buy_premium_egg }

    claim_dragons(buy_response['wallet'])
  end

  private

  def make_coins
    response = play(coins: COINS_PER_GAME, experience: 0, dragon_experience: 0)
    puts 'Playing a game for coins' if response['error'].nil?
  end

  def buy_common_egg
    response = submit_command(buy_common_egg_key)
    puts 'Bought a common egg' if response['error'].nil?
    response
  end

  def buy_premium_egg
    response = submit_command(buy_premium_egg_key)
    puts 'Bought a premium egg' if response['error'].nil?
    response
  end

  def claim_dragons(wallet)
    common_dragon_balance = wallet.find{ |item| item['model'] == 'rarity:common' }['balance']
    rare_dragon_balance = wallet.find{ |item| item['model'] == 'rarity:rare' }['balance']
    legendary_dragon_balance = wallet.find{ |item| item['model'] == 'rarity:legendary' }['balance']

    common_dragon_balance.times do
      claim_common_dragon
    end
    rare_dragon_balance.times do
      claim_rare_dragon
    end
    legendary_dragon_balance.times do
      claim_legendary_dragon
    end
  end

  def claim_common_dragon
    response = submit_command(claim_common_dragon_key)
    puts 'Hatched a common dragon' if response['error'].nil?
  end

  def claim_rare_dragon
    response = submit_command(claim_rare_dragon_key)
    puts 'Hatched a rare dragon' if response['error'].nil?
  end

  def claim_legendary_dragon
    response = submit_command(claim_legendary_dragon_key)
    puts 'Hatched a legendary dragon' if response['error'].nil?
  end

  def submit_command(key)
    response = RestClient.get(base_url + LISTING_PATH, params: { k: user_key, l: key })
    JSON.parse(response.body)
  end
end
