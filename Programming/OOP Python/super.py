class Person:
  def __init__(self, name, age, occupation):
    self.name = name
    self.age = age
    self.occupation = occupation
  
  def say_hello(self):
    print(f"Hello, my name is {self.name}.")
  
  def say_age(self):
    print(f"I am {self.age} years old.")
    
"""class Superhero(Person):
  def say_hello(self):
    super().say_hello()
  
  def say_age(self):
    super().say_age()
  #pass
    
hero = Superhero("Wonder Woman", 27, "intelligence officer")
hero.say_hello()

hero.say_age()
"""
class Superhero(Person):
  def __init__(self, name, age, occupation):
    super().__init__(name, age, occupation)
  
  def say_two_things(self):
    super().say_hello()
    super().say_age()
    #significance of calling super in child method: to make two methods in one child methods
    
hero = Superhero("Batman", 32, "CEO")
print(hero.name)

hero.say_two_things()