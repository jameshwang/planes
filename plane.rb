class Plane
	attr_reader :fuel
	def initialize
		self.fuel = 0
	end

	def fly
		"flying"
	end

	def take_off
		"taking off"
	end

	def refuel
		self.fuel = 100
	end

	private

	attr_writer :fuel
end