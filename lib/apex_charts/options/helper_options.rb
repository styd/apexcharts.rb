# frozen_string_literal: true

module ApexCharts::Options
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
