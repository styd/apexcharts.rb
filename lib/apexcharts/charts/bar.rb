module Apexcharts
  class BarChart < CartesianChart
    def chart_type
      'bar'
    end

    def more_options
      {plot_options: {bar: {horizontal: true}}}
    end
  end
end
