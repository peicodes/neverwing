class Everwing
  attr_accessor :global_key, :play_key

  def load_keys
    load_global_key
    load_play_key
  end

  def load_global_key
    @global_key = inventory.find{ |item| item['model'] == 'item_global' }['key']
  end

  def load_play_key
    @play_key = data['schema']['listings'].find{ |listing| listing['name'] == 'game_complete' }['key']
  end
end
