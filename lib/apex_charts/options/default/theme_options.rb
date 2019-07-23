module ApexCharts::Options
  module Default
    class ThemeOptions < ::SmartKv
      optional *%i[
        mode
        monochrome
        palette
      ]
    end
  end
end
