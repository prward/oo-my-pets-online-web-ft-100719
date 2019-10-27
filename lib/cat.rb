class Cat
  attr_accessor :owner, :mood
  attr_reader :name
  
  def initialize(name, mood)
    @name = name
    @mood = "nervous"
  end
end