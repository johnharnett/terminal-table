
module Terminal
  class Table
    class YColumnCell < Cell
      ##
      # Cell value.

      attr_reader :value

      ##
      # Column span.

      attr_reader :colspan

      ##
      # Initialize with _options_.

      def initialize options = nil
        @value, options = options, {} unless Hash === options
        @value = options.fetch :value, value
        @colspan = options.fetch :colspan, 1
        @width = options.fetch :width, @value.to_s.size
        @index = options.fetch :index
        @table = options.fetch :table
        @alignment = @table.style.y_column_alignment ||= :left
        @y_column_padding_left = @table.style.y_column_padding_left # ||= @table.style.padding_left
        @y_column_padding_right = @table.style.y_column_padding_right # ||= @table.style.padding_right
      end

      def alignment?
        !@alignment.nil?
      end

      def alignment
        @alignment || @table.style.y_column_alignment || :left
      end

      def alignment=(val)
        supported = %w(left center right)
        if supported.include?(val.to_s)
          @alignment = val
        else
          raise "Aligment must be one of: #{supported.join(' ')}"
        end
      end

      def align(val, position, length)
        positions = { :left => :ljust, :right => :rjust, :center => :center }
        val.public_send(positions[position], length, " ")
      end
      def lines
        @value.to_s.split(/\n/)
      end

      ##
      # Render the cell.

      def render(line = 0)
        left = " " * @y_column_padding_left
        right = " " * @y_column_padding_right
        render_width = @y_column_padding_left + width + @y_column_padding_right 
        align(@value.to_s, alignment, render_width)
      end
      alias :to_s :render

      ##
      # Returns the longest line in the cell and
      # removes all ANSI escape sequences (e.g. color)

      def value_for_column_width_recalc
        lines.map{ |s| escape(s) }.max_by{ |s| s.size }
      end

      ##
      # Returns the width of this cell

      def width
        padding = (colspan - 1) * @table.cell_spacing
        inner_width = (1..@colspan).to_a.inject(0) do |w, counter|
          w + @table.column_width(@index + counter - 1)
        end
        inner_width + padding
      end

      ##
      # removes all ANSI escape sequences (e.g. color)
      def escape(line)
        line.to_s.gsub(/\x1b(\[|\(|\))[;?0-9]*[0-9A-Za-z]/, '').
          gsub(/\x1b(\[|\(|\))[;?0-9]*[0-9A-Za-z]/, '').
          gsub(/(\x03|\x1a)/, '')
      end
    end
  end
end
