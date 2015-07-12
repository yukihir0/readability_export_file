# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'readability_export_file/version'

Gem::Specification.new do |gem|
  gem.name          = "readability_export_file"
  gem.version       = ReadabilityExportFile::VERSION
  gem.authors       = ["yukihir0"]
  gem.email         = ["yukihiro.cotori@gmail.com"]
  gem.description   = %q{'readability_export_file' provides feature for parsing export file of 'Readability'.}
  gem.summary       = %q{'readability_export_file' provides feature for parsing export file of 'Readability'.}
  gem.homepage      = "https://github.com/yukihir0/readability_export_file"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "json", "~>1.8.3"
  gem.add_development_dependency "rake", "~>10.4.2"
  gem.add_development_dependency "rspec", "~>3.3.0"
  gem.add_development_dependency "coveralls", "~>0.8.2"
end
