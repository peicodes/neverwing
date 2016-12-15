class Neverwing
  attr_accessor :user_key, :play_key
  attr_accessor :equip_left_dragon_key, :equip_right_dragon_key, :swap_left_dragon_key, :swap_right_dragon_key
  attr_accessor :buy_common_egg_key, :buy_premium_egg_key, :claim_common_dragon_key, :claim_rare_dragon_key, :claim_legendary_dragon_key
  attr_accessor :fuse_zodiac_dragon_key

  def load_schema
    load_user_key
    load_play_key

    load_equip_left_dragon_key
    load_equip_right_dragon_key
    load_swap_left_dragon_key
    load_swap_right_dragon_key

    load_buy_common_egg_key
    load_buy_premium_egg_key
    load_claim_common_dragon_key
    load_claim_rare_dragon_key
    load_claim_legendary_dragon_key

    load_fuse_zodiac_dragon_key
  end

  def load_user_key
    @user_key = data['player']['key']
  end

  def load_play_key
    @play_key = data['schema']['listings'].find{ |listing| listing['name'] == 'game_complete' }['key']
  end

  def load_equip_left_dragon_key
    @equip_left_dragon_key = data['schema']['listings'].find{ |listing| listing['name'] == 'listing_equip_dragon_left' }['key']
  end

  def load_equip_right_dragon_key
    @equip_right_dragon_key = data['schema']['listings'].find{ |listing| listing['name'] == 'listing_equip_dragon_right' }['key']
  end

  def load_swap_left_dragon_key
    @swap_left_dragon_key = data['schema']['listings'].find{ |listing| listing['name'] == 'listing_equip_dragon_left_swap' }['key']
  end

  def load_swap_right_dragon_key
    @swap_right_dragon_key = data['schema']['listings'].find{ |listing| listing['name'] == 'listing_equip_dragon_right_swap' }['key']
  end

  def load_buy_common_egg_key
    @buy_common_egg_key = data['schema']['listings'].find{ |listing| listing['name'] == 'listing_common_dragon_egg' }['key']
  end

  def load_buy_premium_egg_key
    @buy_premium_egg_key = data['schema']['listings'].find{ |listing| listing['name'] == 'listing_epic_dragon_egg' }['key']
  end

  def load_claim_common_dragon_key
    @claim_common_dragon_key = data['schema']['listings'].find{ |listing| listing['name'] == 'common_dragon' }['key']
  end

  def load_claim_rare_dragon_key
    @claim_rare_dragon_key = data['schema']['listings'].find{ |listing| listing['name'] == 'rare_dragon' }['key']
  end

  def load_claim_legendary_dragon_key
    @claim_legendary_dragon_key = data['schema']['listings'].find{ |listing| listing['name'] == 'legendary_dragon' }['key']
  end

  def load_fuse_zodiac_dragon_key
    @fuse_zodiac_dragon_key = data['schema']['listings'].find{ |listing| listing['name'] == 'listing_fuse_dragon_zodiac_bonus' }['key']
  end
end
