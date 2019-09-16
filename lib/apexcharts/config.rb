module ApexCharts
  @@helper_prefix = ENV['APEXCHARTS_PREFIX']

  def self.helper_prefix
    @@helper_prefix
  end

  def self.helper_prefix=(prefix)
    @@helper_prefix = prefix
  end
end
