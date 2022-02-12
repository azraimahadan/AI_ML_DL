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
  pass

hero = Superhero("Jessica Jones", 29, "private investigator")
print(f"Hero name is {hero.name}.")
print(help(Superhero))
print(hero.occupation)
print(hero.age)

print(help(Person))

hero.say_hello()
