# frozen_string_literal: true

module ApexCharts::Options
  class ThemeOptions < ::SmartKv
    optional *%i[
      monochrome
      palette
    ]
  end
end
