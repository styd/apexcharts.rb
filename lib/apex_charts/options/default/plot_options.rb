module ApexCharts::Options
  module Default
    class PlotOptions < ::SmartKv
      optional *%i[
        area
        bar
        boxPlot
        bubble
        candlestick
        heatmap
        pie
        polarArea
        radar
        radialBar
        treemap
      ]
    end
  end
end
