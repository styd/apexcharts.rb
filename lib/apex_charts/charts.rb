# frozen_string_literal: true

module ApexCharts::Charts
  %w[
    base cartesian line area bar column scatter
    candlestick heatmap bubble radar polar pie donut
  ].each do |type|
    autoload :"#{type.capitalize}Chart", "apex_charts/charts/#{type}_chart.rb"
  end

  autoload :BoxPlotChart, 'apex_charts/charts/box_plot_chart.rb'
  autoload :RangeBarChart, 'apex_charts/charts/range_bar_chart.rb'
  autoload :RadialBarChart, 'apex_charts/charts/radial_bar_chart.rb'

  autoload :MixedCharts, 'apex_charts/charts/mixed_charts.rb'
  autoload :SyncingCharts, 'apex_charts/charts/syncing_charts.rb'
end
