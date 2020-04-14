# frozen_string_literal: true

module ApexCharts::Options
  class DataLabelsOptions < ::SmartKv
    optional *%i[
      background
      distributed
      dropShadow
      enabled
      enabledOnSeries
      formatter
      offsetX
      offsetY
      style
      textAnchor
    ]
  end
end
