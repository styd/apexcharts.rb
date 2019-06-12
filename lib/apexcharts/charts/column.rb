module Apexcharts
  class ColumnChart < BarChart
    def plot_options
      {plot_options: {bar: {horizontal: false}}}
    end
  end
end
