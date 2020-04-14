# frozen_string_literal: true

module ApexCharts::Options
  class ThemeOptions < ::SmartKv
    optional *%i[
      mode
      monochrome
      palette
    ]
  end
end
