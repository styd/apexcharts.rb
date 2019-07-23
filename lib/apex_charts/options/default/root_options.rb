require_relative 'helper_options'
require_relative 'chart_options'
require_relative 'stroke_options'
require_relative 'states_options'

module ApexCharts::Options
  module Default
    class RootOptions < ::SmartKv
      optional *%i[
        annotations
        chart
        colors
        dataLabels
        fill
        grid
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
        xaxis
        yaxis
      ],
               *HelperOptions.optional_keys,
               *ChartOptions.optional_keys,
               *StrokeOptions.optional_keys,
               *StatesOptions.optional_keys
    end
  end
end
