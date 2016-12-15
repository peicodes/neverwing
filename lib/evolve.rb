class Neverwing

  def fuse_zodiac_dragons
    dragons_by_model = fusable_dragons.group_by{ |dragon| dragon['model'] }
    dragons_by_model.each do |model, model_dragons|
      dragons_by_zodiac = model_dragons.group_by do |dragon|
        zodiac = dragon['stats'].find{ |stat| stat['name'] == 'zodiac' }
        zodiac
      end

      dragons_by_zodiac.each do |zodiac, zodiac_dragons|
        zodiac_dragons.each_slice(2) do |pair|
          next if pair.count < 2

          response = request_fuse(pair.first, pair.last)
          puts "Fused dragons with matching zodiac" if response['error'].nil?
        end
      end
    end

    reload
    puts "Finished fusing dragons"
  end

  private

  def request_fuse(dragon_1, dragon_2)
    params = {
      sidekick1: dragon_1['key'],
      sidekick2: dragon_2['key'],
      k: user_key,
      l: fuse_zodiac_dragon_key,
    }

    JSON.parse(RestClient.get(base_url + LISTING_PATH, params: params).body)
  end
end
