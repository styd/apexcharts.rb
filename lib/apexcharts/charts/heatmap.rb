module Apexcharts
  class HeatmapChart
    def chart_type
      'heatmap'
    end

    def more_options
      {
        plot_options: {
          heatmap: {}
        }
      }
    end
  end
end
