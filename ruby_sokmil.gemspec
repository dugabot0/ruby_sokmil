# frozen_string_literal: true

require_relative "lib/ruby_sokmil/version"

Gem::Specification.new do |spec|
  spec.name = "ruby_sokmil"
  spec.version = RubySokmil::VERSION
  spec.authors = ["duga_bot"]
  spec.email = ["duga_bot@pm.me"]

  spec.summary = "Client for the Sokmil Web Service API"
  spec.description = "Client for the Sokmil Web Service API"
  spec.homepage = "https://github.com/dugabot0/ruby_sokmil"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/dugabot0/ruby_sokmil"
  spec.metadata["changelog_uri"] = "https://github.com/dugabot0/ruby_sokmil"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "faraday"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
