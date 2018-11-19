class Elf
  @@number_of_elves = 0

  attr_accessor :name
  attr_reader :hp
  def initialize(name,gender, level=1, hp_base=100)
    @name = name
    @level = level
    @gender = gender
    @hp = hp_base + (level * 5)
    @@number_of_elves += 1
    @attack = 5 + level

    @m_pronouns = ["he","him","his","his"]
    @f_pronouns = ["she","her","her","hers"]
    @i_pronouns = ["it","it","its","its"]
    
  end
  
  def take_damage(dmg)
    @hp -= dmg
  end

  def elf_strike(target)
    dmg = rand(1..5)
    puts "#{@name} strikes #{target.name} for " << dmg.to_s << " damage!"
    target.take_damage(dmg)
  end

  def attack
    return @attack
  end

  def declare_attack
    case @gender
      when 'm'
        puts "#{@name} says #{@m_pronouns[2]} attack is "  + @attack.to_s + "."
      when 'f'
        puts "#{@name} says #{@f_pronouns[2]} attack is "  + @attack.to_s + "."
      when 'i'
        puts "#{@name} says #{@i_pronouns[2]} attack is "  + @attack.to_s + "."
    end
  end

  def hello
    puts "Hello, my name is #{@name}. I am level #{@level}. I have #{@hp}HP."
  end

  def elf_count
    return @@number_of_elves
  end

  def greet(target)
    puts "Hello, #{target.name}! I am #{@name}! Nice to meet you."
  end

  def start_attack(target)
    puts "Die, fool! Take this, #{target.name}!"
  end
end

legolas = Elf.new("Legolas","m")


galendriel = Elf.new("Galendriel", "f", 5)

legolas.greet(galendriel)
galendriel.greet(legolas)

legolas.start_attack(galendriel)
legolas.elf_strike(galendriel)
puts "Galendriel's hp is now #{galendriel.hp}."