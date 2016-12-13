class Everwing
  attr_accessor :play_key

  def load_schema
    load_play_key
  end

  def load_play_key
    @play_key = data['schema']['listings'].find{ |listing| listing['name'] == 'game_complete' }['key']
  end
end
