# frozen_string_literal: true

module ApexCharts
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
