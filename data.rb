class Everwing
  def characters
    @characters ||= inventory.select do |item|
      item['model'].include?('character')
    end
  end

  def sidekicks
    @sidekicks ||= inventory.select do |item|
      item['model'].include?('sidekick')
    end
  end

  def left_sidekick
    @left_sidekick ||= sidekicks.find do |sidekick|
      sidekick['state'] == 'equippedLeft'
    end
  end

  def right_sidekick
    @right_sidekick ||= sidekicks.find do |sidekick|
      sidekick['state'] == 'equippedRight'
    end
  end

  def inventory
    user_data['player']['inventory']
  end

  def global_settings
    @global ||= inventory.find do |item|
      item['model'] == 'item_global'
    end
  end

  def global_key
    global_settings['key']
  end

  def game_key
    user_data['schema']['listings'].find do |listing|
      listing['name'] == 'game_complete'
    end['key']
  end
end
