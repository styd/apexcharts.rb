module Apexcharts
  module Annotations
    def annotation(position, value:, text:, color: nil, **options)
      @annotations ||= {}

      unless [:xaxis, :yaxis, :points].include? position
        raise "unrecognized position: #{position}"
      end
      @annotations[position] ||= []
      @annotations[position] << annotation_value(position, value).merge(
                                   if position == :points
                                     {marker: {size: 8, fillColor: 'white', strokeColor: color, radius: 2}, **options}
                                   else
                                     {borderColor: color, fillColor: color, opacity: 0.2}
                                   end
                                 ).merge(
                                   annotation_label(text, color, **options)
                                 )
    end

    def x_annotation **args
      annotation :xaxis, **args
    end

    def y_annotation **args
      annotation :yaxis, **args
    end

    def point_annotation **args
      annotation :points, **args
    end

  private

    def annotation_value position, value
      position = position.to_s.delete_suffix('axis').to_sym
      case value
      when Range
        value = Utils::DateTime.convert_range(value)

        case position
        when :x
          {x: value.first, x2: value.last}
        when :y
          {y: value.first, y2: value.last}
        else
          raise "position :points doesn't accept value of type Range"
        end
      else
        if position == :points
          value.map!{ |x| Utils::DateTime.convert(x) }
          {x: value.first, y: value.last}
        else
          value = Utils::DateTime.convert(value)
          {position => value}
        end
      end
    end

    def annotation_label text, color, **options
      {
        label: {
          borderColor: color,
          style: {
            color: 'white',
            background: color
          },
          text: text
        }, **options
      }
    end

    include Utils::Hash
  end
end
