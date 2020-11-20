require 'pry'
class Owner
  attr_reader :name, :species

  @@all =[]
  def initialize(name,species= "human") 
    @name = name
    @species =species
    self.class.all << self

  end 

  def say_species
    "I am a #{@species}."
  end 

  def self.all
    @@all
  end 
  def self.count
    self.all.count
  end 

  def self.reset_all
    self.all.clear()
  end
  
  def cats
    Cat.all.select do |cat_s|
      cat_s.owner == self
      
    end 
    
  end 

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end 
  end 

  def buy_cat(name)
    Cat.new(name, self)
  end 


  def buy_dog(name)
    Dog.new(name, self)

  end 
  
  def walk_dogs
    self.dogs.each do |dog|
      dog.mood="happy"
    end

  end 

 def feed_cats
  self.cats.each do |cat_s|
    cat_s.mood ="happy"  
  end
 end

 def sell_pets
  self.dogs.each do |dog|
    dog.mood="nervous"
    dog.owner=nil
  end
  self.cats.each do |cat_s|
    cat_s.mood ="nervous" 
    cat_s.owner=nil

  end 
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 

 end

end


# binding.pry
