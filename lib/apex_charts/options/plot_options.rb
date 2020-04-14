# frozen_string_literal: true

module ApexCharts::Options
  class PlotOptions < ::SmartKv
    optional *%i[
      bar
      bubble
      candlestick
      heatmap
      pie
      polarArea
      radar
      radialBar
    ]
  end
end
