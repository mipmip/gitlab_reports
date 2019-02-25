
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gitlab_reports/version"

Gem::Specification.new do |spec|
  spec.name          = "gitlab_reports"
  spec.version       = GitlabReports::VERSION
  spec.authors       = ["Pim Snel"]
  spec.email         = ["pim@lingewoud.nl"]

  spec.summary       = %q{GitLab Reports Generator}
  spec.description   = %q{Configurable Reports Generator for Gitlab API data.}
  spec.homepage      = "https://github.com/mipmip/gitlab_reports"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_runtime_dependency "gitlab", "~> 4.5"
  spec.add_runtime_dependency "markdown-tables", "~> 1.0"
  spec.add_runtime_dependency "thor", "~> 0.20"
end
