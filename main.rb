def generate_question
  num1 = rand(1..20)
  num2 = rand(1..20)
  operator = ['+', '-', '*', '/'].sample
  "#{num1} #{operator} #{num2}"
end

def ask_question(question)
  puts "What is #{question}?"
  gets.chomp.to_i
end

def correct_answer?(question, answer)
  eval(question) == answer rescue false
end

def game_over(player, score)
  puts "Player #{player} wins with a score of #{score}!"
end

def math_game
  player = 1
  scores = [0, 0]

  loop do
    question = generate_question
    answer = ask_question(question)

    if correct_answer?(question, answer)
      scores[player - 1] += 1
      puts "Correct! Player #{player}'s score: #{scores[player - 1]}"
    else
      game_over(player, scores[player - 1])
      break
    end

    player = (player % 2) + 1 # Switch players (1 -> 2, 2 -> 1)
  end
end

math_game