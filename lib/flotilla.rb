
class Flotilla
  attr_reader :name, :personnel, :ships

  def initialize(flotilla_info)
    @name = flotilla_info[:designation]
    @personnel = []
    @ships = []
  end

  def add_ship(ship)
    @ships << ship
  end

  def add_personnel(person)
    @personnel << person
  end

  def recommend_personnel(ship) # I think I messed this up!
    recommend = []
    @personnel.each do |person|
      ship.requirements.each do |requirement|
        recommend << person if person.specialties.any?{|x|  requirement.keys.include?(x)} && person.experience > requirement.values.sum
      end
    end
    recommend = recommend.uniq
    recommend
  end

  def personnel_by_ship
    people_in_ship = Hash.new { |hash, key| hash[key] = []}
    @ships.each do |ship|
      people_in_ship[ship] = recommend_personnel(ship)
    end
    people_in_ship
  end

  def ready_ships(fuel)
    ready = []
    personnel_by_ship.each do |ship, personnel|
      ready << ship if ship.fuel > fuel && personnel.length >= ship.requirements.length
    end
    ready
  end
end
