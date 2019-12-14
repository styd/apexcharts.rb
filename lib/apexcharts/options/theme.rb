# frozen_string_literal: true

module ApexCharts
  class ThemeOptions < ::SmartKv
    optional *%i[
      monochrome
      palette
    ]
  end
end
