# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    class ChartOptions < Schema
      define do
        optional(:animations)
        optional(:background)
        optional(:brush)
        optional(:defaultLocale)
        optional(:dropShadow)
        optional(:events)
        optional(:fontFamily)
        optional(:foreColor)
        optional(:group)
        optional(:height)
        optional(:id)
        optional(:locales)
        optional(:offsetX)
        optional(:offsetY)
        optional(:parentHeightOffset)
        optional(:redrawOnParentResize)
        optional(:redrawOnWindowResize)
        optional(:selection)
        optional(:sparkline)
        optional(:stackType)
        optional(:stacked)
        optional(:toolbar)
        optional(:type)
        optional(:width)
        optional(:zoom)
      end
    end
  end
end
