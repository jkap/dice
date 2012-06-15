require "dice/version"

module Dice
  def report(results)
    results = get_results(results)
    case results.length
    when 0
      "I didn't roll any dice"
    when 1
      "I rolled a #{results[0]}."
    else
      total = results.reduce do |sum, value|
        sum.to_i + value.to_i
      end
      finalComma = (results.length > 2) ? "," : ""
      last = results.pop
      "I rolled #{results.join(", ")}#{finalComma} and #{last}, making #{total}"
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
    /(\d+)d(\d+)/i.match line do |m|
      dice = m[1].to_i
      sides = m[2].to_i
      report(roll(dice, sides))
    end
  end

  def colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
  end

  def red(text); colorize(text, 31); end
  def green(text); colorize(text, 32); end
  def blue(text); colorize(text, 34); end
end