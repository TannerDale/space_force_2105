require 'rspec'
require './lib/person'
require './lib/spacecraft'
require './lib/flotilla'

RSpec.describe Flotilla do
  it 'exists' do
    seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})

    expect(seventh_flotilla).to be_an_instance_of(Flotilla)
  end

  it 'has a attributes' do
    seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})

    expect(seventh_flotilla.name).to eq('Seventh Flotilla')
    expect(seventh_flotilla.personnel).to eq([])
    expect(seventh_flotilla.ships).to eq([])
  end

  it 'can add ships' do
    daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
    daedalus.add_requirement({astrophysics: 6})
    daedalus.add_requirement({quantum_mechanics: 3})
    seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})

    seventh_flotilla.add_ship(daedalus)

    expect(seventh_flotilla.ships).to eq([daedalus])
  end

  it 'can add people' do
    seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})

    kathy = Person.new('Kathy Chan', 10)
    kathy.add_specialty(:astrophysics)
    kathy.add_specialty(:quantum_mechanics)

    polly = Person.new('Polly Parker', 8)
    polly.add_specialty(:operations)
    polly.add_specialty(:maintenance)

    rover = Person.new('Rover Henriette', 1)
    rover.add_specialty(:operations)
    rover.add_specialty(:maintenance)

    sampson = Person.new('Sampson Edwards', 7)
    sampson.add_specialty(:astrophysics)
    sampson.add_specialty(:quantum_mechanics)

    seventh_flotilla.add_personnel(kathy)
    seventh_flotilla.add_personnel(polly)
    seventh_flotilla.add_personnel(rover)
    seventh_flotilla.add_personnel(sampson)

    expected = [kathy, polly, rover, sampson]

    expect(seventh_flotilla.personnel).to eq(expected)
  end

  it 'can recommend personnel' do
    daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
    daedalus.add_requirement({astrophysics: 6})
    daedalus.add_requirement({quantum_mechanics: 3})
    seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})
    seventh_flotilla.add_ship(daedalus)

    kathy = Person.new('Kathy Chan', 10)
    kathy.add_specialty(:astrophysics)
    kathy.add_specialty(:quantum_mechanics)

    polly = Person.new('Polly Parker', 8)
    polly.add_specialty(:operations)
    polly.add_specialty(:maintenance)

    rover = Person.new('Rover Henriette', 1)
    rover.add_specialty(:operations)
    rover.add_specialty(:maintenance)

    sampson = Person.new('Sampson Edwards', 7)
    sampson.add_specialty(:astrophysics)
    sampson.add_specialty(:quantum_mechanics)

    seventh_flotilla.add_personnel(kathy)
    seventh_flotilla.add_personnel(polly)
    seventh_flotilla.add_personnel(rover)
    seventh_flotilla.add_personnel(sampson)

    expected = [kathy, sampson]

    expect(seventh_flotilla.recommend_personnel(daedalus)).to eq(expected)
  end

  it 'can recommend personnel to a different ship' do
    daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
    daedalus.add_requirement({astrophysics: 6})
    daedalus.add_requirement({quantum_mechanics: 3})
    seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})
    seventh_flotilla.add_ship(daedalus)

    kathy = Person.new('Kathy Chan', 10)
    kathy.add_specialty(:astrophysics)
    kathy.add_specialty(:quantum_mechanics)

    polly = Person.new('Polly Parker', 8)
    polly.add_specialty(:operations)
    polly.add_specialty(:maintenance)

    rover = Person.new('Rover Henriette', 1)
    rover.add_specialty(:operations)
    rover.add_specialty(:maintenance)

    sampson = Person.new('Sampson Edwards', 7)
    sampson.add_specialty(:astrophysics)
    sampson.add_specialty(:quantum_mechanics)

    seventh_flotilla.add_personnel(kathy)
    seventh_flotilla.add_personnel(polly)
    seventh_flotilla.add_personnel(rover)
    seventh_flotilla.add_personnel(sampson)

    odyssey = Spacecraft.new({name: 'Odyssey', fuel: 300})
    odyssey.add_requirement({operations: 6})
    odyssey.add_requirement({maintenance: 3})
    seventh_flotilla.add_ship(odyssey)

    expected = [polly]
    # I messed this up!
    expect(seventh_flotilla.recommend_personnel(odyssey)).to eq(expected)
  end

  # iteration 3

  it 'can show personnel by ship' do
    daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
    daedalus.add_requirement({astrophysics: 6})
    daedalus.add_requirement({quantum_mechanics: 3})
    seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})
    seventh_flotilla.add_ship(daedalus)

    kathy = Person.new('Kathy Chan', 10)
    kathy.add_specialty(:astrophysics)
    kathy.add_specialty(:quantum_mechanics)

    polly = Person.new('Polly Parker', 8)
    polly.add_specialty(:operations)
    polly.add_specialty(:maintenance)

    rover = Person.new('Rover Henriette', 1)
    rover.add_specialty(:operations)
    rover.add_specialty(:maintenance)

    sampson = Person.new('Sampson Edwards', 7)
    sampson.add_specialty(:astrophysics)
    sampson.add_specialty(:quantum_mechanics)

    seventh_flotilla.add_personnel(kathy)
    seventh_flotilla.add_personnel(polly)
    seventh_flotilla.add_personnel(rover)
    seventh_flotilla.add_personnel(sampson)

    odyssey = Spacecraft.new({name: 'Odyssey', fuel: 300})
    odyssey.add_requirement({operations: 6})
    odyssey.add_requirement({maintenance: 3})
    seventh_flotilla.add_ship(odyssey)

    expected = [daedalus, odyssey]

    expect(seventh_flotilla.ships).to eq(expected)

    expected2 = {
          daedalus => [kathy, sampson],
          odyssey => [polly] #Wasn't sure about the correct person here, it appears to be Samson in the interaction pattern but I think it is Polly
    }

    expect(seventh_flotilla.personnel_by_ship).to eq(expected2)
  end

  # Iteration 4

  it 'can show ships that are fully staffed and have enough fuel' do
    daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
    daedalus.add_requirement({astrophysics: 6})
    daedalus.add_requirement({quantum_mechanics: 3})
    odyssey = Spacecraft.new({name: 'Odyssey', fuel: 300})
    odyssey.add_requirement({operations: 6})
    odyssey.add_requirement({maintenance: 3})

    seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})

    kathy = Person.new('Kathy Chan', 10)
    kathy.add_specialty(:astrophysics)
    kathy.add_specialty(:quantum_mechanics)

    polly = Person.new('Polly Parker', 8)
    polly.add_specialty(:operations)
    polly.add_specialty(:maintenance)

    rover = Person.new('Rover Henriette', 1)
    rover.add_specialty(:operations)
    rover.add_specialty(:maintenance)

    sampson = Person.new('Sampson Edwards', 7)
    sampson.add_specialty(:astrophysics)
    sampson.add_specialty(:quantum_mechanics)

    seventh_flotilla.add_personnel(kathy)
    seventh_flotilla.add_personnel(polly)
    seventh_flotilla.add_personnel(rover)
    seventh_flotilla.add_personnel(sampson)
    seventh_flotilla.add_ship(daedalus)
    seventh_flotilla.add_ship(odyssey)

    expect(seventh_flotilla.ready_ships(100)).to eq([daedalus])
  end
end
