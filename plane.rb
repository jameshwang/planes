class Plane
	attr_reader :fuel, :crew, :passengers, :type
	def initialize
		@fuel = 0
		@type = "787"
	end

	def fly
		"flying"
	end

	def take_off
		"taking off"
	end

	def refuel
		@fuel = 100
	end

	private

	attr_writer :fuel
end