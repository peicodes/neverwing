class Neverwing
  attr_accessor :inventory, :global_key, :characters, :dragons, :trainable_dragons, :fusable_dragons, :left_dragon, :right_dragon

  def load_data
    load_inventory
    load_global_key
    load_characters
    load_dragons
    load_trainable_dragons
    load_fusable_dragons
    load_left_dragon
    load_right_dragon
  end

  def load_inventory
    @inventory = data['player']['inventory']
  end

  def load_global_key
    @global_key = inventory.find{ |item| item['model'] == 'item_global' }['key']
  end

  def load_characters
    @characters = inventory.select do |item|
      item['model'].include?('character')
    end
  end

  def load_dragons
    @dragons = inventory.select do |item|
      item['model'].include?('sidekick')
    end
  end

  def load_trainable_dragons
    @trainable_dragons = dragons.reject do |dragon|
      experience = dragon['stats'].find{ |stat| stat['name'] == 'xp' }
      experience['value'] == experience['maximum']
    end
  end

  def load_fusable_dragons
    @fusable_dragons = dragons.select do |dragon|
      experience = dragon['stats'].find{ |stat| stat['name'] == 'xp' }
      maturity = dragon['stats'].find{ |stat| stat['name'] == 'maturity' }

      experience['value'] == experience['maximum'] && maturity['value'] != maturity['maximum']
    end
  end

  def load_left_dragon
    @left_dragon = dragons.find do |dragon|
      dragon['state'] == 'equippedLeft'
    end
  end

  def load_right_dragon
    @right_dragon = dragons.find do |dragon|
      dragon['state'] == 'equippedRight'
    end
  end
end
