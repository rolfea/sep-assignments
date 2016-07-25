# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    members << person
  end

  # this deletes all instances of person
  def leave(person)
    members.delete(person)
  end

  def front
    members[0]
  end

  def middle
    find_middle = members.length / 2
    if members.length % 2 == 0
      members[find_middle]
    else
      members[find_middle.round - 1]
    end
  end

  def back
    members[-1]
  end

  def search(person)
    if members.include?(person)
      person
    end
  end

  private

  def index(person)
  end

end
