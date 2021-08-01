class Spacecraft
  attr_reader :name, :fuel, :requirements

  def initialize(params)
    @name = params[:name]
    @fuel = params[:fuel]
    @requirements = []
  end

  def add_requirement(requirement)
    @requirements << requirement
  end
end
