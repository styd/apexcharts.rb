# frozen_string_literal: true

module ApexCharts
  %w(cartesian bubble polar).each do |type|
    autoload :"#{type.capitalize}Series", "apexcharts/series/#{type}.rb"
  end
end
