# frozen_string_literal: true

module Sinatra
  def self.const_missing(const_name)
    if const_name == :ApexCharts
      warn "[DEPRECATION] specifying `Sinatra::#{const_name}` as " \
           'helper is deprecated and will raise an error in next ' \
           'release. Requiring ApexCharts (`require "apexcharts"`) ' \
           'is enough to use its chart helper methods.'
      ::ApexCharts::SinatraHelper
    else
      super
    end
  end
end

module ApexCharts
  module SinatraHelper
    include ::ApexCharts::Helper
  end
end

Sinatra::Base.helpers ApexCharts::SinatraHelper
