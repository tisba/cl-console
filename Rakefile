require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "cl-console"
    gemspec.summary = "Little gem meant to be used in IRB sessions for querying CouchDB-Lucene indices."
    gemspec.description = "This is a little helper to query CouchDB-Lucene indices from an IRB session. It is meant to be used for a very easy inspection, query-testing and exploration of c-l indices."
    gemspec.email = "sebastian.cohnen@gmx.net"
    gemspec.homepage = "http://github.com/tisba/cl-console"
    gemspec.authors = ["Sebastian Cohnen"]
    
    gemspec.files = []
    gemspec.files = FileList['lib/**/*.rb']

    gemspec.has_rdoc = false

    gemspec.require_paths << 'lib'
    gemspec.autorequire = "lib/cl_console.rb"
    
    gemspec.add_dependency('activesupport')
    gemspec.add_dependency('json', '>=1.2.0')
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end