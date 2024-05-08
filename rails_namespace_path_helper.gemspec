# frozen_string_literal: true

require_relative "lib/rails_namespace_path_helper/version"

Gem::Specification.new do |spec|
  spec.name = "rails_namespace_path_helper"
  spec.version = RailsNamespacePathHelper::VERSION
  spec.authors = ["BenenB"]
  spec.email = ["benenbruen@gmail.com"]

  spec.summary = "An extension for namespaced controllers in Rails"
  spec.homepage = "https://github.com/BenenB/rails_namespace_path_helper"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
