correct_answer = rand(10) + 1
puts 'Guess number from 1 to 10:'

until correct_answer == (answer = gets().to_i)
  if correct_answer > answer
    puts "try bigger!"
  else
    puts "try smaller!"
  end
end

puts "Perfect guess, congratiolations!!!"


