require 'spec_helper'
 describe Traveloka::Flight do
 		include DummySupport
 		subject{flight}
  	# it{should respond_to(:takeoff_at)}
  	# it{should respond_to(:landing_at)}
  	# it{should respond_to(:airline_code)}
  	# it{should respond_to(:publish_fare)}
  	# it{should respond_to(:promo)}
  	# it{should respond_to(:search_object)}
  	describe '#takeoff_at' do
  		subject{flight.takeoff_at}
		 	it_behaves_like 'instance of Time'
	  	it{should < @flight.landing_at}
	  end
  	describe "#landing_at" do
			subject{flight.landing_at}
		 	it_behaves_like 'instance of Time'
	  	it {should > @flight.takeoff_at}
	  end
	  describe "#publish_fare" do
			subject{flight.publish_fare}	  	
	  	it{should be_an_instance_of(Fixnum)}
	  	it{should > 0}
	  end
	  describe "#airline_code" do
	  	it{flight.airline_code.should match Regexp.new("^(#{Traveloka::Base::AIRLINE_ISO_CODE.keys.join("|")})$")}
	  end
	  describe "#origin" do
	  	subject{flight.origin}
			it_behaves_like 'valid airport code'
	  end
	  describe "#destination" do
	  	subject{flight.destination}
			it_behaves_like 'valid airport code'
	  end
	  describe "#flight_number" do
	  	subject{flight.flight_number}
	  	it{should match /[A-Z]+\-\d+/}
	  end

 end 