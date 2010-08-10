# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cl-console}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sebastian Cohnen"]
  s.autorequire = %q{lib/cl_console.rb}
  s.date = %q{2010-08-10}
  s.description = %q{This is a little helper to query CouchDB-Lucene indices from an IRB session. It is meant to be used for a very easy inspection, query-testing and exploration of c-l indices.}
  s.email = %q{sebastian.cohnen@gmx.net}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files = [
    "lib/cl_console.rb"
  ]
  s.homepage = %q{http://github.com/tisba/cl-console}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib", "lib", "lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Little gem meant to be used in IRB sessions for querying CouchDB-Lucene indices.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 1.2.0"])
    else
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<json>, [">= 1.2.0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<json>, [">= 1.2.0"])
  end
end

