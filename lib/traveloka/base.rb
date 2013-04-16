module Traveloka
	class Base
		AIRLINE_ISO_CODE = {
			'GA'	=> 'Garuda Indonesia',
			'QG'	=> 'Citilink',
			'JT'  => 'Lion Air',
			'SJ'	=> 'Sriwijaya Air',
			'AirAsia' => 'Airasia'
		}

		def initialize
		end

		def search!
		end

		def serch_x_days
		end

		def build_request_body seqNo = false
			body_request = {
				'data' => {
					'flightDate' => model.flight_date,
					'sourceAirportOrArea' => {
						':v' => model.origin
					},
					'destinationAirportOrArea' => {
						':v' => model.destination
					},
					'numSeats' => {
						'numAdults' => {
							':v' => model.adults
						},
						'numChildren' => {
							':v' => model.children
						},
						'numInfants' => {
							':v' => model.infants 
						}
					}
				}
			}
			body_request['data']['seqNo'] = seqNo if seqNo
			body_request
		end

	end
end