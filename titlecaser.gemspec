# frozen_string_literal: true

require_relative "lib/titlecaser/version"

Gem::Specification.new do |spec|
  spec.name = "titlecaser"
  spec.version = Titlecaser::VERSION
  spec.authors = ["Peter Cooper"]
  spec.email = ["git@peterc.org"]

  spec.summary = "Uses standard title casing rules to titleize strings"
  spec.description = "Uses standard title casing rules to titleize strings"
  spec.homepage = "https://github.com/peterc/titlecaser"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/peterc/titlecaser"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
