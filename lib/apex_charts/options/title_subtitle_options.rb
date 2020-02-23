# frozen_string_literal: true

module ApexCharts::Options
  class TitleSubtitleOptions < ::SmartKv
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
