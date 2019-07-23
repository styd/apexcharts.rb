require 'smart_kv'

module ApexCharts::Options
  module Default
    class HelperOptions < ::SmartKv
      optional *%i[
        brushTarget
        class
        chartId
        defer
        group
        id
        style
        var
        xtitle
        xtype
        ytitle
        ytype
      ]
    end
  end
end
