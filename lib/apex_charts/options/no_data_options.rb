# frozen_string_literal: true

module ApexCharts::Options
  class NoDataOptions < ::SmartKv
    optional *%i[
      align
      offsetX
      offsetY
      style
      text
      verticalAlign
    ]
  end
end
