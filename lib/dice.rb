require "dice/version"

module Dice
  def report(results, modifier)
    results = get_results(results)
    case results.length
    when 0
      "I didn't roll any dice"
    when 1
      if modifier == 0
        "I rolled a #{green(results[0])}."
      else
        "I rolled a (#{results[0]}) + #{modifier} is #{green(results[0].to_i + modifier.to_i)}."
      end
    else
      total = results.reduce do |sum, value|
        /\\e\[(\d+)m(\d+)\\e\[0m/i.match value.to_s do |m|
          value = m[2].to_i
        end
        sum + value.to_i
      end
      finalComma = (results.length > 2) ? "," : ""
      last = results.pop
      if modifier == 0
        "I rolled #{results.join(", ")}#{finalComma} and #{last}, making #{green(total)}"
      else
        "I rolled #{results.join(", ")}#{finalComma} and #{last}, making (#{total}) + #{modifier} is #{green(total.to_i + modifier.to_i)}"
      end
    end
  end

  def roll(dice, sides)
    dice.times.map{ 1+Random.rand(sides) } 
  end

  def get_results(results)
    results.map do |r|
      if r == 20
        blue(r.to_s)
      elsif r == 1
        red(r.to_s)
      else
        r
      end
    end
  end

  def parseLine(line)
    if line =~ /quit/ or line =~ /exit/
      exit
    end
    /(\d+)d(\d+) ?(\+)? ?(\d+)?/i.match line do |m|
      dice = m[1].to_i
      sides = m[2].to_i
      modifier = m[4].to_i
      report(roll(dice, sides), modifier)
    end
  end

  def colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
  end

  def red(text); colorize(text, 31); end
  def green(text); colorize(text, 32); end
  def blue(text); colorize(text, 34); end
end