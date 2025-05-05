# frozen_string_literal: true

require_relative "lib/thirdweb/engine/version"

Gem::Specification.new do |spec|
  spec.name = "thirdweb-engine"
  spec.version = Thirdweb::Engine::VERSION
  spec.authors = ["Andres Yebra"]
  spec.email = ["andres.yebracervantes@gmail.com"]

  spec.summary       = "Ruby SDK for ThirdWeb Engine"
  spec.description   = "A Ruby gem to interact with ThirdWeb Engine API"
  spec.homepage      = "https://github.com/andresyebra/thirdweb-engine"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.autorequire = "thirdweb-engine"
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "dry-configurable"
  spec.add_dependency "faraday"
  spec.add_dependency "faraday-retry"
  spec.add_development_dependency "byebug"
end
