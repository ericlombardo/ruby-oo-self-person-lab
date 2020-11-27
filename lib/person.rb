require 'pry'

class Person
  attr_accessor :bank_account              # bank reads and writes w/ no restrictions
  attr_reader :name, :hygiene, :happiness  # name never changes, so just read after created on initialize
  def happiness=(happiness)                # custom writer method to make sure hap > 0 && hap < 10
    @happiness = happiness.clamp(0,10)
  end

  def hygiene=(hygiene)                    # custom writer method to make sure hyg > 0 && hyg < 10
    @hygiene = hygiene.clamp(0,10)
  end

  def initialize(name)                     # takes name, creates @variables for name, bank, happiness, and hygiene
    @name = name
    @bank_account = 25
    @happiness = 8
    @hygiene = 8
  end
  def happy?
    @happiness > 7 ? true : false
  end

  def clean?
    @hygiene > 7 ? true : false
  end

  def get_paid(salary)
    @bank_account += salary
    "all about the benjamins"
  end
  
  def take_bath                               # calls self.hygiene so it checks with custom writer
    self.hygiene += 4                         # method for min and max before adjusting @variable
    "♪ Rub-a-dub just relaxing in the tub ♫"
  end

  def work_out
    self.happiness += 2
    self.hygiene -= 3
    "♪ another one bites the dust ♫"
  end

  def call_friend(friend)
    self.happiness += 3
    friend.happiness += 3
    "Hi #{friend.name}! It's #{self.name}. How are you?"
  end

  def start_conversation(friend, topic)
    case topic
      when 'politics'
        self.happiness -= 2
        friend.happiness -= 2
        "blah blah partisan blah lobbyist"
      when 'weather'
        self.happiness += 1
        friend.happiness += 1
        "blah blah sun blah rain"
      else
        'blah blah blah blah blah'
    end
  end
end

