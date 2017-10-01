module GameofStones
  class Game
    attr_reader :pile, :players

    def initialize
      greeting_message
      @players = initialize_players
      @pile = GameofStones::Models::Pile.new
    end

    def start!
      players.cycle do |player|
        player.make_turn!(pile)

        if pile.empty?
          player.lost
          break
        end
      end
    end

    private

    def initialize_players
      2.times.map do |i|
        puts "Player #{i + 1}, please enter your name:"
        GameofStones::Models::Player.new(gets.strip)
      end
    end

    def greeting_message
      puts '*' * 40
      puts 'weclome to the game of stones'
      puts '*' * 40
    end

  end
end
