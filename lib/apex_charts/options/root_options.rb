# frozen_string_literal: true

require_relative 'div_attributes'
require_relative 'chart_options'
require_relative 'stroke_options'
require_relative 'states_options'

module ApexCharts::Options
  class RootOptions < ::SmartKv
    optional *%i[
      annotations
      brushTarget
      chart
      chartId
      colors
      dataLabels
      defer
      fill
      grid
      group
      labels
      legend
      markers
      noData
      plotOptions
      responsive
      series
      states
      stroke
      subtitle
      theme
      title
      tooltip
      var
      xaxis
      xtitle
      xtype
      yaxis
      ytitle
      ytype
    ],
             *DivAttributes.optional_keys,
             *ChartOptions.optional_keys,
             *StrokeOptions.optional_keys,
             *StatesOptions.optional_keys
  end
end
