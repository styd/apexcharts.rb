# frozen_string_literal: true

module ApexCharts::Options
  class FillOptions < ::SmartKv
    optional *%i[
      colors
      gradient
      image
      opacity
      pattern
      type
    ]
  end
end
