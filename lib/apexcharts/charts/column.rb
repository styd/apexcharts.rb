module Apexcharts
  class ColumnChart < BarChart
    def more_options
      {plot_options: {bar: {horizontal: false}}}
    end
  end
end
