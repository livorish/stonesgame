module GameofStones
  module Models
    class Player
      attr_reader :name

      def initialize(name)
        @name = name
      end

      def make_turn!(pile)
        puts "The current number of stones is #{pile.stones}"
        puts "Player #{self.name} it's your turn now"

        take_stones_from pile
      end

      def lost
        puts "Player #{name} lost"
      end

      private

      def take_stones_from(pile)
        number = loop do
          number = gets.to_i
            if pile.has_enough_stones? number
              break number
            else
              puts "please type the correct number"
            end
        end

        pile.take!(number)
      end
    end
  end
end
