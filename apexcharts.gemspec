# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require_relative 'lib/apex_charts/version'

Gem::Specification.new do |spec|
  spec.name        = 'apexcharts'
  spec.version     = ApexCharts::VERSION
  spec.authors     = ['Adrian Setyadi']
  spec.email       = ['a.styd@yahoo.com']
  spec.homepage    = 'https://github.com/styd/apexcharts.rb'
  spec.summary     = 'Awesome charts for your ruby app'
  spec.description =
    'Create beautiful, interactive, and responsive web charts in ' \
    'ruby app powered by apexcharts.js.'
  spec.license     = 'MIT'

  spec.files = Dir['{lib,vendor}/**/*', 'LICENSE', 'README.md']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'nokogiri'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
end
