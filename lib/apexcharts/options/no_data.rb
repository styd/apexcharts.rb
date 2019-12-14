# frozen_string_literal: true

module ApexCharts
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
