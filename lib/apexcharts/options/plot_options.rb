module Apexcharts
  class PlotOptions < ::SmartKv
    optional *%i[
                  bar
                  candlestick
                  heatmap
                  pie
                  radial_bar   radialBar
                ]
  end
end
