require "dice/version"

module Dice
  def report(results)
    case results.length
    when 0
      "I didn't roll any dice"
    when 1
      "I rolled a #{results[0]}."
    else
      total = results.reduce do |sum, value|
        sum + value
      end
      finalComma = (results.length > 2) ? "," : ""
      last = results.pop
      "I rolled #{results.join(", ")}#{finalComma} and #{last}, making #{total}"
    end
  end

  def roll(dice, sides)
    dice.times.map{ 1+Random.rand(sides) } 
  end
end
