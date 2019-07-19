# frozen_string_literal: true

module ApexCharts
  module Mixable
    def mixed_series
      series[:series].each{|d| d.merge!(type: chart_type) }
      series[:series]
    end
  end
end

