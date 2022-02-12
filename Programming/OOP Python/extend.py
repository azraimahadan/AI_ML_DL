class Person:
  def __init__(self, name, age, occupation):
    self.name = name
    self.age = age
    self.occupation = occupation
  
  def say_hello(self):
    print(f"Hello, my name is {self.name}.")
  
  def say_age(self):
    print(f"I am {self.age} years old.")
    
class Superhero(Person):
  def __init__(self, name, age, occupation, secret_identity,nemesis):
    super().__init__(name, age, occupation)
    self.secret_identity = secret_identity
    self.nemesis = nemesis
  
  def reveal_secret_identity(self):
    print(f"My real name is {self.secret_identity}.")
  
  def say_nemesis(self):
    print(f"My nemesis is {self.nemesis}.")
    
hero = Superhero("Spider-Man", 17, "student", "Peter Parker","Doc Octopus")
print(hero.secret_identity)
#print(hero.nemesis)
hero.reveal_secret_identity()
hero.say_nemesis()