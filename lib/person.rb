class Person
  attr_reader :name, :experience, :specialties

  def initialize(name, experience)
    @name = name
    @experience = experience
    @specialties = []
  end

  def add_specialty(specialty)
    @specialties << specialty
  end

  def has_speciality?(specialty)
    @specialties.include?(specialty)
  end

  def has_experience?(exp)
    @experience >= exp
  end

  def qualified_for?(position)
    pos = position.keys.first
    experience = position.values.first
    has_speciality?(pos) && has_experience?(experience)
  end
end
