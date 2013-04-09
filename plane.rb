class Plane
	attr_reader :fuel, :passengers, :type, :altitude
	attr_accessor :crew
	def initialize
		@fuel = 0
		@type = "787"
		@altitude = 0
		@crew = []
	end

	def fly
		"flying"
	end

	def take_off
		@altitude = 14000
		"taking off"
	end

	def land
		@altitude = 0
	end

	def refuel
		@fuel = 100
	end

	def crew_requirement?
		true
	end
end