# frozen_string_literal: true

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
        input_first, input_last = input.first, input.last
        case input_first
        when Time
          to_milliseconds_range(input_first, input_last)
        when ::DateTime, Date
          to_milliseconds_range(input_first.to_time, input_last.to_time)
        else
          if (datetime = ::DateTime.iso8601(input_first)).iso8601 == input_first
            to_milliseconds_range(datetime.to_time, ::DateTime.iso8601(input_last).to_time)
          elsif (date = Date.iso8601(input.first)).iso8601 == input_first
            to_milliseconds_range(date.to_time, ::Date.iso8601(input_last).to_time)
          end
        end
      rescue StandardError
        input
      end

      def to_milliseconds(input)
        (input.to_f * 1000).round
      end

      def to_milliseconds_range(first, last)
        to_milliseconds(first)..to_milliseconds(last)
      end

      def type(input)
        case input
        when Time, ::DateTime, Date
          'datetime'
        else
          if [
            ::DateTime.iso8601(input).iso8601,
            Date.iso8601(input).iso8601
          ].include? input
            'datetime'
          end
        end
      rescue StandardError
        nil
      end
    end
  end
end
