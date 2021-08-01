class Flotilla
  attr_reader :name, :personnel, :ships

  def initialize(params)
    @name = params[:designation]
    @personnel = []
    @ships = []
  end

  def add_ship(ship)
    @ships << ship
  end

  def add_personnel(person)
    @personnel << person
  end

  def recommend_personnel(ship)
    @personnel.find_all do |person|
      ship.requirements.all? do |req|
        person.qualified_for?(req)
      end
    end
  end

  def personnel_by_ship
    @ships.map do |ship|
      [ship, recommend_personnel(ship)]
    end.to_h
  end

  def ready_ships(fuel)
    @ships.find_all do |ship|
      recommend_personnel(ship).size >= ship.requirements.size && ship.fuel >= fuel
    end
  end
end
