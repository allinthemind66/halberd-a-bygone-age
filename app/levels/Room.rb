class Room

    attr_accessor :quit, :exit, :items, :floor

    def initialize(items)
        @quit = false
        @exit = false
        @items = items
        @floor = []
    end

    def remove_from_floor(item_to_pick_up)
      @floor.select! {|item| item != item_to_pick_up}
    end

    def play_music(music_name)
      fork{ exec "afplay", "./music/#{music_name}.mp3"}
    end

end