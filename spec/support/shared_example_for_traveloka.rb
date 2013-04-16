shared_examples_for 'valid airport code' do
	it{should match(/[A-Z]{3,}/)}
end
shared_examples_for 'instance of Time' do
	it{should be_an_instance_of(Time)}
end
