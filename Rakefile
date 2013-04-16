require "bundler/gem_tasks"
require 'rspec/core/rake_task'
desc 'Default: run RSpec'
task :default => :rspec
desc "Run specs"

RSpec::Core::RakeTask.new do |t|
  t.pattern = "./spec/**/*_spec.rb"
end

task :rspec do
  Rake::Task["spec"].execute
end

