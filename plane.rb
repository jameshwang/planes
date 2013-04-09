class Plane
	attr_reader :fuel, :passengers, :type, :altitude
	attr_accessor :crew
	def initialize(plane_type, crew_requirements)
		@fuel = 0
		@type = "787"
		@altitude = 0
		@crew = []
		@crew_requirements = crew_requirements || {}
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

	def add_crew(crew_member)
		crew << crew_member.to_h
	end

	def crew_requirement?
		role_count = role_call
		@crew_requirements.each{|role, count| return false if !role_count[role] || role_count[role] < count }
		return true
	end

	def role_call
		role_count = {}
		roles.each {|role| role_count[role.to_sym] ? role_count[role.to_sym] += 1 : role_count[role.to_sym] = 1 }
		return role_count
	end

	def roles
		crew.map{|m| m[:role].downcase.gsub(/-/, '_') }
	end

	def missing_crew_roles
		missing_crew_roles = @crew_requirements
		role_count = role_call
		missing_crew_roles.map do |role, count|
			!role_count[role] || role_count[role] >= count ? { role.to_sym => (count - (role_count[role] || 0)) } : nil
		end.inject(:merge)
	end
end