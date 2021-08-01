# Space Force

## Instructions

* Fork this Repository
* Clone your forked repo to your computer.
* Complete the activity below.
* COMMIT YOUR TESTS FIRST! We will check for TDD via your git history.
* Push your solution to your forked repo
* Submit a pull request from your repository to this repository
* Put your name in your PR! (Optional: and your least favorite emoji)

### Iteration 1

Use TDD to create a `Spacecraft` and a `Person` class that respond to the following interaction pattern:
```ruby
pry(main)> require './lib/spacecraft'
#=> true
pry(main)> require './lib/person'
#=> true
pry(main)> daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
#=> #<Spacecraft:0x00007ff88ea3fc30...>
pry(main)> daedalus.name
#=> 'Daedalus'
pry(main)> daedalus.fuel
#=> 400
pry(main)> kathy = Person.new('Kathy Chan', 10)
#=> #<Person:0x00007ff88ea979a8...>
pry(main)> kathy.name
#=> "Kathy Chan"
pry(main)> kathy.experience
#=> 10
pry(main)> kathy.specialties
#=> []
pry(main) kathy.add_specialty(:astrophysics)
pry(main) kathy.add_specialty(:quantum_mechanics)
pry(main)> kathy.specialties
#=>[:astrophysics, :quantum_mechanics]
```

### Iteration 2

Use TDD to create a `Flotilla` class that responds to the following interaction pattern. For the `recommend_personnel` method, the
`Flotilla` should recommend `Person`s that match that ships requirements. (A person matches the requirements if they have a specialty that matches a requirement and experience equal to or greater than the requirement)

```ruby
pry(main)> require './lib/spacecraft'
#=> true
pry(main)> require './lib/person'
#=> true
pry(main)> require './lib/flotilla'
#=> true
pry(main)> daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
#=> #<Spacecraft:0x00007ff88ea3fc30...>
pry(main)> daedalus.requirements
#=> []
pry(main)> daedalus.add_requirement({astrophysics: 6})
pry(main)> daedalus.add_requirement({quantum_mechanics: 3})
pry(main)> daedalus.requirements
#=> [{astrophysics: 6}, {quantum_mechanics: 3}]
pry(main)> seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})
#=> #<Flotilla:0x00007fe593a28728...>
pry(main)> seventh_flotilla.name
#=> 'Seventh Flotilla'
pry(main)> seventh_flotilla.personnel
#=> []
pry(main)> seventh_flotilla.ships
#=> []
pry(main) seventh_flotilla.add_ship(daedalus)
pry(main)> seventh_flotilla.ships
#=> [#<Spacecraft:0x00007ff88ea3fc30...>]
pry(main)> kathy = Person.new('Kathy Chan', 10)
#=> #<Person:0x00007ff88ea979a8...>
pry(main)> kathy.add_specialty(:astrophysics)
pry(main)> kathy.add_specialty(:quantum_mechanics)
pry(main)> polly = Person.new('Polly Parker', 8)
#=> #<Person:0x00007ff88ea374f9...>
pry(main)> polly.add_specialty(:operations)
pry(main)> polly.add_specialty(:maintenance)
pry(main)> rover = Person.new('Rover Henriette', 1)
#=> #<Person:0x00007fe59506ede8...>
pry(main)> rover.add_specialty(:operations)
pry(main)> rover.add_specialty(:maintenance)
pry(main)> sampson = Person.new('Sampson Edwards', 7)
#=> #<Person:0x000013b59506e2e8...>
pry(main)> sampson.add_specialty(:astrophysics)
pry(main)> sampson.add_specialty(:quantum_mechanics)
pry(main)> seventh_flotilla.add_personnel(kathy)
pry(main)> seventh_flotilla.add_personnel(polly)
pry(main)> seventh_flotilla.add_personnel(rover)
pry(main)> seventh_flotilla.add_personnel(sampson)
pry(main)> seventh_flotilla.personnel
#=> [#<Person:0x00007ff88ea979a8...>, #<Person:0x00007ff88ea374f9...>, #<Person:0x00007fe59506ede8...>, #<Person:0x000013b59506e2e8...>]
pry(main)> seventh_flotilla.recommend_personnel(daedalus)
#=> [#<Person:0x00007ff88ea979a8...>, #<Person:0x000013b59506e2e8...]
pry(main)> odyssey = Spacecraft.new({name: 'Odyssey', fuel: 300})
#=> #<Spacecraft:0x00007ff88ea3fc30...>
pry(main)> odyssey.add_requirement({operations: 6})
pry(main)> odyssey.add_requirement({maintenance: 3})
pry(main)> seventh_flotilla.recommend_personnel(odyssey)
#=> [#<Person:0x00007ff88ea374f9...>]
```

### Iteration 3

Use TDD to update your `Flotilla` class so that it responds to the following interaction pattern.

Notes:
* For `personnel_by_ship` this method takes no arguments and returns a hash where the keys are ships and the values are an array of personnel that are qualified to be on said ship.

```ruby
pry(main)> require './lib/spacecraft'
#=> true
pry(main)> require './lib/person'
#=> true
pry(main)> require './lib/flotilla'
#=> true
pry(main)> daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
#=> #<Spacecraft:0x00007ff88ea3fc30...>
pry(main)> daedalus.add_requirement({astrophysics: 6})
pry(main)> daedalus.add_requirement({quantum_mechanics: 3})
pry(main)> odyssey = Spacecraft.new({name: 'Odyssey', fuel: 300})
#=> #<Spacecraft:0x00007ff88ea3fc30...>
pry(main)> odyssey.add_requirement({operations: 6})
pry(main)> odyssey.add_requirement({maintenance: 3})
pry(main)> seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})
#=> #<Flotilla:0x00007fe593a28728...>
pry(main)> kathy = Person.new('Kathy Chan', 10)
#=> #<Person:0x00007ff88ea979a8...>
pry(main)> kathy.add_specialty(:astrophysics)
pry(main)> kathy.add_specialty(:quantum_mechanics)
pry(main)> polly = Person.new('Polly Parker', 8)
#=> #<Person:0x00007ff88ea374f9...>
pry(main)> polly.add_specialty(:operations)
pry(main)> polly.add_specialty(:maintenance)
pry(main)> rover = Person.new('Rover Henriette', 1)
#=> #<Person:0x00007fe59506ede8...>
pry(main)> rover.add_specialty(:operations)
pry(main)> rover.add_specialty(:maintenance)
pry(main)> sampson = Person.new('Sampson Edwards', 7)
#=> #<Person:0x000013b59506e2e8...>
pry(main)> sampson.add_specialty(:astrophysics)
pry(main)> sampson.add_specialty(:quantum_mechanics)
pry(main)> seventh_flotilla.add_personnel(kathy)
pry(main)> seventh_flotilla.add_personnel(polly)
pry(main)> seventh_flotilla.add_personnel(rover)
pry(main)> seventh_flotilla.add_personnel(sampson)
pry(main)> seventh_flotilla.ships
#=> []
pry(main) seventh_flotilla.add_ship(daedalus)
pry(main) seventh_flotilla.add_ship(odyssey)
pry(main)> seventh_flotilla.ships
#=> [#<Spacecraft:0x00007ff88ea3fc30...>, #<Spacecraft:0x00007ff88ea3fc30...>]
pry(main)> seventh_flotilla.personnel_by_ship
#=> {#<Spacecraft:0x00007ff88ea3fc30...> => [#<Person:0x00007ff88ea979a8...>, #<Person:0x000013b59506e2e8...]
    #<Spacecraft:0x00007ff88ea3fc30...> => [#<Person:0x000013b59506e2e8...>]
}
```


### Iteration 4

Use TDD to update your `Flotilla` class to respond to the following interaction pattern.

Notes:
* `ready_ships` returns an array of ship objects that have all of their requirements staffed and enough fuel. The method takes fuel
as an argument.


```ruby
pry(main)> require './lib/spacecraft'
#=> true
pry(main)> require './lib/person'
#=> true
pry(main)> require './lib/flotilla'
#=> true
pry(main)> daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
#=> #<Spacecraft:0x00007ff88ea3fc30...>
pry(main)> daedalus.add_requirement({astrophysics: 6})
pry(main)> daedalus.add_requirement({quantum_mechanics: 3})
pry(main)> prometheus = Spacecraft.new({name: 'Prometheus', fuel: 300})
#=> #<Spacecraft:0x00007ff88ea3fc30...>
pry(main)> prometheus.add_requirement({operations: 6})
pry(main)> prometheus.add_requirement({science: 3})
pry(main)> seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})
#=> #<Flotilla:0x00007fe593a28728...>
pry(main)> kathy = Person.new('Kathy Chan', 10)
#=> #<Person:0x00007ff88ea979a8...>
pry(main)> kathy.add_specialty(:astrophysics)
pry(main)> kathy.add_specialty(:quantum_mechanics)
pry(main)> polly = Person.new('Polly Parker', 4)
#=> #<Person:0x00007ff88ea374f9...>
pry(main)> polly.add_specialty(:operations)
pry(main)> polly.add_specialty(:maintenance)
pry(main)> rover = Person.new('Rover Henriette', 1)
#=> #<Person:0x00007fe59506ede8...>
pry(main)> rover.add_specialty(:operations)
pry(main)> rover.add_specialty(:maintenance)
pry(main)> sampson = Person.new('Sampson Edwards', 7)
#=> #<Person:0x000013b59506e2e8...>
pry(main)> sampson.add_specialty(:astrophysics)
pry(main)> sampson.add_specialty(:quantum_mechanics)
pry(main)> seventh_flotilla.add_personnel(kathy)
pry(main)> seventh_flotilla.add_personnel(polly)
pry(main)> seventh_flotilla.add_personnel(rover)
pry(main)> seventh_flotilla.add_personnel(sampson)
pry(main)> seventh_flotilla.add_ship(daedalus)
pry(main)> seventh_flotilla.add_ship(prometheus)
pry(main)> seventh_flotilla.ready_ships(100)
#=> [#<Spacecraft:0x00007ff88ea3fc30...>]
```
