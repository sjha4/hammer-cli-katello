# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))

require 'hammer_cli_katello/version'

begin
  Dir["locale/**/*.po"].each do |po|
    mo = po.sub(/hammer_cli_katello\.po$/, "LC_MESSAGES/hammer_cli_katello.mo")
    STDERR.puts "WARNING: File #{mo} does not exist, generate with 'make all-mo'!" unless File.exist?(mo)
    STDERR.puts "WARNING: File #{mo} outdated, regenerate with 'make all-mo'" if File.mtime(po) > File.mtime(mo)
    # Adding this so you can actually build the gem and the warnings come out, without this
    # we get an error when making the gem and it fails as well as a ruby error if the mo files don't exist
  end
rescue => e
  puts "#{e} not found"
end

Gem::Specification.new do |gem|
  gem.authors = [
    "Adam Price",
    "Adam Ruzicka",
    "Andrew Kofink",
    "Brad Buckingham",
    "Bryan Kearney",
    "Chris Duryee",
    "Chris Roberts",
    "Christine Fouant",
    "Daniel Lobato García",
    "David Davis",
    "Dustin Tsang",
    "Eric D. Helms",
    "Ivan Nečas",
    "Jason L Connor",
    "Jason Montleon",
    "John Mitsch",
    "Justin Sherrill",
    "Lucy Fu",
    "Martin Bačovský",
    "Michaux Kelley",
    "Og Maciel",
    "Partha Aji",
    "Pavel Moravec",
    "Quinn James",
    "Roman Plevka",
    "Stephen Benjamin",
    "Tomas Strachota",
    "Tom McKay",
    "Walden Raines",
    "Zach Huntington-Meath"
  ]
  gem.email = ['katello@lists.fedorahosted.org']
  gem.license = "GPL-3.0-or-later"
  gem.description = 'Hammer-CLI-Katello is a plugin for Hammer to provide' \
    ' connectivity to a Katello server.'
  gem.summary = 'Katello commands for Hammer'
  gem.homepage = 'https://github.com/Katello/hammer-cli-katello'

  gem.files = Dir['config/**/*', 'lib/**/*.rb', 'locale/**/**']
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split($ORS)

  gem.name = 'hammer_cli_katello'
  gem.require_paths = ['lib']
  gem.version = HammerCLIKatello.version
  gem.required_ruby_version = '>= 2.7', '< 4'

  gem.add_development_dependency 'csv', '~> 3.2.8'
  gem.add_development_dependency 'ostruct', '~> 0.6.0'
  gem.add_development_dependency 'syslog', '~> 0.1.2'
  gem.add_development_dependency 'theforeman-rubocop', '~> 0.1.0'

  gem.add_dependency 'hammer_cli_foreman', '~> 3.9'
  gem.add_dependency 'hammer_cli_foreman_tasks', '~> 0.0.20'
end
