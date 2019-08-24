require 'date'

module ApexCharts
  module Utils
    module DateTime
    module_function

      def convert(input)
        case input
        when Time
          (input.to_f * 1000).round
        when ::DateTime, Date
          (input.to_time.to_f * 1000).round
        else
          if (dt = ::DateTime.iso8601(input)).iso8601 == input
            (dt.to_time.to_f * 1000).round
          elsif (d = Date.iso8601(input)).iso8601 == input
            (d.to_time.to_f * 1000).round
          end
        end
      rescue StandardError
        input
      end

      def convert_range(input)
        case input.first
        when Time
          ((input.first.to_f * 1000).round..(input.last.to_f * 1000).round)
        when ::DateTime, Date
          ((input.first.to_time.to_f * 1000).round..(input.last.to_time.to_f * 1000).round)
        else
          if (dt = ::DateTime.iso8601(input.first)).iso8601 == input.first
            ((dt.to_time.to_f * 1000).round..(::DateTime.iso8601(input.last).to_time.to_f * 1000).round)
          elsif (d = Date.iso8601(input.first)).iso8601 == input.first
            ((d.to_time.to_f * 1000).round..(Date.iso8601(input.last).to_time.to_f * 1000).round)
          end
        end
      rescue StandardError
        input
      end

      def type(input)
        case input
        when Time, ::DateTime, Date
          'datetime'
        else
          if ::DateTime.iso8601(input).iso8601 == input
            'datetime'
          elsif Date.iso8601(input).iso8601 == input
            'datetime'
          else
            'numeric'
          end
        end
      rescue StandardError
        'numeric'
      end
    end
  end
end
