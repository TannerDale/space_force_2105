require './lib/spacecraft'
require './lib/person'

RSpec.describe Person do
  context 'initialize' do
    kathy = Person.new('Kathy Chan', 10)

    it 'exists' do
      expect(kathy).to be_a(Person)
    end

    it 'has attributes' do
      expect(kathy.name).to eq("Kathy Chan")
      expect(kathy.experience).to eq(10)
      expect(kathy.specialties).to eq([])
    end
  end

  context 'specialties' do
    kathy = Person.new('Kathy Chan', 10)

    it 'can add specialties' do
      kathy.add_specialty(:astrophysics)
      kathy.add_specialty(:quantum_mechanics)

      expect(kathy.specialties).to eq([:astrophysics, :quantum_mechanics])
    end

    it 'can check a specialty' do
      expect(kathy.has_speciality?(:astrophysics)).to be(true)
      expect(kathy.has_speciality?(:chicken)).to be(false)
    end

    it 'can check experience' do
      expect(kathy.has_experience?(6)).to be(true)
      expect(kathy.has_experience?(1000)).to be(false)
    end

    it 'can check if qualified for' do
      expect(kathy.qualified_for?({astrophysics: 6})).to be(true)
      expect(kathy.qualified_for?({astrophysics: 1000})).to be(false)
    end
  end
end
