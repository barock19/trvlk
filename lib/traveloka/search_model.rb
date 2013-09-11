module Traveloka
	class SearchModel
		attr_accessor :flight_date, :origin, :destination, :adults , :children, :infants
		def initialize *args
			if args[0].class == Hash
				args[0].each{|k, v|
					send("#{k}=".to_sym, v)
				}
			end
		end

		def adults
			@adults ||= 1
		end

		def children
			@children ||= 0
		end

		def infants
			@infants ||= 0
		end

		def flight_date=(str)
			@flight_date = str.to_date
		end

	end
end