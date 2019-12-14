# frozen_string_literal: true

module ApexCharts
  class TitleOptions < ::SmartKv
    optional *%i[
      align
      floating
      margin
      offsetX
      offsetY
      style
      text
    ]
  end
end
