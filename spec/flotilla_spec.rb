require './lib/spacecraft'
require './lib/person'
require './lib/flotilla'

RSpec.describe Flotilla do
  context 'initialize' do
    seventh_flotilla = seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})

    it 'exists' do
      expect(seventh_flotilla).to be_a(Flotilla)
    end

    it 'has attributes' do
      expect(seventh_flotilla.name).to eq('Seventh Flotilla')
      expect(seventh_flotilla.personnel).to eq([])
      expect(seventh_flotilla.ships).to eq([])
    end
  end

  context 'adding ships and personnel' do
    seventh_flotilla = seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})

    daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
    kathy = Person.new('Kathy Chan', 10)

    it 'can add a ship' do
      seventh_flotilla.add_ship(daedalus)

      expect(seventh_flotilla.ships).to eq([daedalus])
    end

    it 'can add personnel' do
      seventh_flotilla.add_personnel(kathy)

      expect(seventh_flotilla.personnel).to eq([kathy])
    end
  end

  context 'recommending personel' do
    seventh_flotilla = seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})

    daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
    daedalus.add_requirement({astrophysics: 6})
    daedalus.add_requirement({quantum_mechanics: 3})
    odyssey = Spacecraft.new({name: 'Odyssey', fuel: 300})
    odyssey.add_requirement({operations: 6})
    odyssey.add_requirement({maintenance: 3})

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

    seventh_flotilla.add_ship(daedalus)
    seventh_flotilla.add_personnel(kathy)
    seventh_flotilla.add_personnel(polly)
    seventh_flotilla.add_personnel(rover)
    seventh_flotilla.add_personnel(sampson)

    it 'can recommend personnel' do
      expected1 = [kathy, sampson]
      expected2 = [polly]

      expect(seventh_flotilla.recommend_personnel(daedalus)).to eq(expected1)
      expect(seventh_flotilla.recommend_personnel(odyssey)).to eq(expected2)
    end
  end

  context 'personnel by ship' do
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

    it 'can group personnel by ship' do
      expected = {
        daedalus => [kathy, sampson],
        odyssey => [polly]
      }
      expect(seventh_flotilla.personnel_by_ship).to eq(expected)
    end
  end

  context 'ready ship' do
    daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
    daedalus.add_requirement({astrophysics: 6})
    daedalus.add_requirement({quantum_mechanics: 3})
    prometheus = Spacecraft.new({name: 'Prometheus', fuel: 300})
    prometheus.add_requirement({operations: 6})
    prometheus.add_requirement({science: 3})

    seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})

    kathy = Person.new('Kathy Chan', 10)
    kathy.add_specialty(:astrophysics)
    kathy.add_specialty(:quantum_mechanics)
    polly = Person.new('Polly Parker', 4)
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
    seventh_flotilla.add_ship(prometheus)

    it 'can check ready ships' do
      expect(seventh_flotilla.ready_ships(100)).to eq([daedalus])
    end
  end
end
