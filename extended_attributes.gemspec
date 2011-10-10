$:.push File.dirname(__FILE__) + '/lib'
require 'extended_attributes.rb'

Gem::Specification.new do |gem|
  gem.name = %q{extended_attributes}
  gem.authors = ["Chirantan Rajhans"]
  gem.date = %q{2011-10-10}
  gem.description = %q{Extend behavior of attributes of your active record models.}
  gem.summary = "Objectify your active record attributes."
  gem.email = %q{chirantan.rajhans@gmail.com}
  gem.homepage = 'http://github.com/chirantan'

  gem.add_runtime_dependency 'active_record', '~> 3.1.0'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ['lib']
  gem.version       = '1.0.2'
end