require_relative 'div_attributes'
require_relative 'chart'
require_relative 'stroke'
require_relative 'states'

module Apexcharts
  class RootOptions < ::SmartKv
    optional *%i[
                  annotations
                  chart
                  chart_id
                  colors
                  data_labels   dataLabels
                  fill
                  grid
                  group
                  labels
                  legend
                  markers
                  no_data       noData
                  plot_options  plotOptions
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
                  yaxis
                  ytitle
                ],
             *DivAttributes.optional_keys,
             *ChartOptions.optional_keys,
             *StrokeOptions.optional_keys,
             *StatesOptions.optional_keys
  end
end
