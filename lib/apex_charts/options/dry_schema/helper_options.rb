# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    class HelperOptions < Schema
      define do
        optional(:brushTarget)
        optional(:class)
        optional(:chartId)
        optional(:defer)
        optional(:group)
        optional(:id)
        optional(:style)
        optional(:var)
        optional(:xtitle)
        optional(:xtype)
        optional(:ytitle)
        optional(:ytype)
      end
    end
  end
end
