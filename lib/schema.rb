class Neverwing
  attr_accessor :play_key, :equip_left_dragon_key, :equip_right_dragon_key, :swap_left_dragon_key, :swap_right_dragon_key

  def load_schema
    load_play_key
    load_equip_left_dragon_key
    load_equip_right_dragon_key
    load_swap_left_dragon_key
    load_swap_right_dragon_key
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
end
