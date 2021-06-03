require 'rspec'
require './lib/person'
require './lib/spacecraft'

RSpec.describe Person do
  it 'exists' do
    kathy = Person.new('Kathy Chan', 10)

    expect(kathy).to be_an_instance_of(Person)
  end

  it 'has attributes' do
    kathy = Person.new('Kathy Chan', 10)

    expect(kathy.name).to eq('Kathy Chan')
    expect(kathy.experience).to eq(10)
    expect(kathy.specialties).to eq([])
  end

  it 'can add specialties' do
    kathy = Person.new('Kathy Chan', 10)
    
    kathy.add_specialty(:astrophysics)
    kathy.add_specialty(:quantum_mechanics)

    expect(kathy.specialties).to eq([:astrophysics, :quantum_mechanics])
  end
end
