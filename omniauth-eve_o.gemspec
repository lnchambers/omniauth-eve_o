
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth/eve_o/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-eve_o"
  spec.version       = Omniauth::EveO::VERSION
  spec.authors       = ["Luke Chambers"]
  spec.email         = ["lukenatchambers@gmail.com"]

  spec.summary       = %q{An OmniAuth strategy for Eve Online ESI}
  spec.description   = %q{An OmniAuth strategy for Eve Online ESI}
  spec.homepage      = "https://www.github.com/omniauth-eve_o"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth-oauth2", "~> 1.5"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
