class Owner
  attr_accessor :name, :pets
  attr_reader :species

  @@owners = []

  def initialize (species)
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @species = species
    @@owners << self
  end

  def self.all
    @@owners
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    @@owners.clear
  end

  def say_species
    return "I am a #{@species}."
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    @pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    @pets.each do |key, pets|
      pets.each do |pet_name|
        pet_name.mood = "nervous"
      end
    end
    @pets.clear
  end

  def list_pets
    fish = @pets[:fishes].count
    dogs = @pets[:dogs].count
    cats = @pets[:cats].count

    "I have #{fish} fish, #{dogs} dog(s), and #{cats} cat(s)."

  end

end
