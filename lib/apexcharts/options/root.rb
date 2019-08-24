require_relative 'div_attributes'
require_relative 'chart'
require_relative 'stroke'
require_relative 'states'

module ApexCharts
  class RootOptions < ::SmartKv
    optional *%i[
                annotations
                brushTarget
                chart
                chartId
                colors
                dataLabels
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
