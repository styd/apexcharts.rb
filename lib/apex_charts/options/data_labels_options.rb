# frozen_string_literal: true

module ApexCharts::Options
  class DataLabelsOptions < ::SmartKv
    optional *%i[
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
