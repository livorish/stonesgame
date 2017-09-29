# game - stones

puts '*' * 40
puts 'weclome to the game of stones'
puts '*' * 40

stones = 10
players = []

2.times do |i|
  puts "Player #{i + 1}, please enter your name:"
  players << gets.strip
end

players.cycle do |player|
  puts "Player #{player} it's your turn now"

  number = 0
  loop do
    number = gets.to_i
      if number.between?(1,3) && number <= stones
        break
      else
        puts "please type the correct number"
      end
  end

  stones -= number

  puts "The current number of stones is #{stones}"

  if stones.zero?
    puts "Player #{player} lost"
    break
  end
end
