# frozen_string_literal: true

module ApexCharts::Charts
  class ColumnChart < BarChart
    def more_options
      {plot_options: {bar: {horizontal: false}}}
    end
  end
end
