# frozen_string_literal: true

module ApexCharts
  %w(
    base cartesian line area bar column scatter candlestick
    heatmap bubble radar mixed syncing polar pie donut
  ).each do |type|
    autoload :"#{type.capitalize}Chart", "apexcharts/charts/#{type}.rb"
  end

  autoload :RangeBarChart, 'apexcharts/charts/range_bar.rb'
  autoload :RadialBarChart, 'apexcharts/charts/radial_bar.rb'
end
