# frozen_string_literal: true

module ApexCharts::Series
  %w[cartesian bubble polar].each do |type|
    autoload :"#{type.capitalize}Series", "apex_charts/series/#{type}_series.rb"
  end
end
