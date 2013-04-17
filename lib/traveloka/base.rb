module Traveloka
	class Base
		AIRLINE_ISO_CODE = {
			'GA'	=> 'Garuda Indonesia',
			'QG'	=> 'Citilink',
			'JT'  => 'Lion Air',
			'SJ'	=> 'Sriwijaya Air',
			'AirAsia' => 'Airasia',
			'MZ'	=> 'Merpati Air'
		}
		attr_reader :model, :agent, :raw_source, :result_raw

		def initialize model
			@model = model
			@agent = Mechanize.new
			@agent.user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.65 Safari/537.31"
			@raw_source = {
				'data' => {},
				'metadata' => {
					'seqNo' => {}
				}
			}
			@result_raw = []
			@search_counter = 0

		end

		def search!
			while complete? == false or @search_counter >= 10
				_search
				@search_counter += 1
				sleep 1
			end
			@result
		end

		def result
			if @result.blank?
				@result = FlightsCollection.new(model , result_raw) unless  @result_raw.blank?
			else
				@result
			end
		end

		def serch_x_days
		end

		def _search
			begin
				url = "http://traveloka.com/flightsearch?getNewResult=#{@search_counter >= 1 ? 'false' : 'true' }"
				raw_body = agent.post(url, build_request_body.to_json, {
					"Content-Type" => "application/json; charset=UTF-8", 
					'Origin' => 'http://traveloka.com',
					'Accept-Charset'=> 'ISO-8859-1,utf-8;q=0.7,*;q=0.3'
					})
				@raw_source = JSON.parse(raw_body.body)
				@result_raw += @raw_source['data']	
			rescue Exception => e
				puts e.message
				raise e
			end

		end

		def complete?
			(raw_source['metadata'] and raw_source['metadata']['searchCompleted'] and  raw_source['metadata']['searchCompleted'] == 'true') == true ? true : false
		end

		def build_request_body
			body_request = {
				'data' => {
					'numSeats' => {
						'numAdults' => {
							':v' => model.adults.to_s
						},
						'numChildren' => {
							':v' => model.children.to_s
						},
						'numInfants' => {
							':v' => model.infants.to_s
						}
					},
					'destinationAirportOrArea' => {
						':v' => model.destination
					},
					'sourceAirportOrArea' => {
						':v' => model.origin
					},

					'flightDate' => {
						':v' => model.flight_date.strftime("%d-%m-%Y")
					},
				},
			}
			raw_source.merge(body_request)
		end

	end
end