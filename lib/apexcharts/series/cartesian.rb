module ApexCharts
  class CartesianSeries
    attr_reader :sanitized

    def initialize(data)
      data = deep_copy(data)
      @sanitized = case data
                   when Array
                     case first_data = data[0]
                     when Array
                       [
                         {
                           data: array_of_array_to_array_of_xy(data)
                         }
                       ]

                     when Hash
                       if first_data[:data]
                         data.each{|h| h[:data] = array_of_array_to_array_of_xy(h[:data]) }
                         data
                       end

                     end

                   when Hash
                     if data_value = data[:data]
                       if array_of_pairs?(data_value)
                         data[:data] = array_of_array_to_array_of_xy(data_value)
                         [data]
                       end

                     else
                       if data[:x] && data[:y]
                         [{data: [data]}]

                       else
                         [
                           {
                             data: data.map do |k,v|
                                     {x: k, y: v}
                                   end
                           }
                         ]

                       end
                     end
                   end

      @sanitized = {series: @sanitized}
    end

    def deep_copy(data)
      Marshal.load(Marshal.dump(data))
    end

    def array_of_pairs?(data)
      !data.empty? && data.all?{|d| d.length == 2 }
    end

    def array_of_array_to_array_of_xy(data)
      data.map{|d| {x: d.first, y: d.last} }
    end
  end
end

