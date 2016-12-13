class Everwing
  attr_accessor :inventory, :characters, :sidekicks, :trainable_sidekicks, :left_sidekick, :right_sidekick

  def load_data
    load_inventory
    load_characters
    load_sidekicks
    load_trainable_sidekicks
    load_left_sidekick
    load_right_sidekick
  end

  def load_inventory
    @inventory = data['player']['inventory']
  end

  def load_characters
    @characters = inventory.select do |item|
      item['model'].include?('character')
    end
  end

  def load_sidekicks
    @sidekicks = inventory.select do |item|
      item['model'].include?('sidekick')
    end
  end

  def load_trainable_sidekicks
    @trainable_sidekicks = sidekicks.reject do |sidekick|
      experience = sidekick['stats'].find{ |stat| stat['name'] == 'xp' }
      experience['value'] == experience['maximum']
    end
  end

  def load_left_sidekick
    @left_sidekick ||= sidekicks.find do |sidekick|
      sidekick['state'] == 'equippedLeft'
    end
  end

  def load_right_sidekick
    @right_sidekick ||= sidekicks.find do |sidekick|
      sidekick['state'] == 'equippedRight'
    end
  end
end
