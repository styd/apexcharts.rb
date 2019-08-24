module ApexCharts
  class BubbleSeries
    attr_reader :sanitized

    def initialize(data)
      data = deep_copy(data)
      @sanitized = case data
                   when Array
                     if array_of_threes?(data)
                       [{data: data}]
                     else
                       data
                     end

                   when Hash
                     if data_value = data[:data]
                       [data] if array_of_threes?(data_value)
                     end

                   end

      @sanitized = {series: @sanitized}
    end

    def deep_copy(data)
      Marshal.load(Marshal.dump(data))
    end

    def array_of_threes?(data)
      return false if data.empty?

      data.all? {|d| d.length == 3 }
    end
  end
end
