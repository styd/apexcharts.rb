# frozen_string_literal: true


require_relative 'charts/features/annotations'
require_relative 'charts/features/mixable'

module ApexCharts
  %w(
    base cartesian line area bar column scatter
    candlestick heatmap bubble radar polar pie donut
  ).each do |type|
    autoload :"#{type.capitalize}Chart", "apexcharts/charts/#{type}.rb"
  end

  autoload :RangeBarChart, 'apexcharts/charts/range_bar.rb'
  autoload :RadialBarChart, 'apexcharts/charts/radial_bar.rb'

  autoload :MixedCharts, 'apexcharts/charts/mixed.rb'
  autoload :SyncingCharts, 'apexcharts/charts/syncing.rb'
end
