module Apexcharts
  class PlotOptions < ::SmartKv
    optional *%i[
                  bar
                  candlestick
                  heatmap
                  pie
                  radialBar
                ]
  end
end
