module Terminal
  class Table
    class CartesianRow < Row

      # Initialize with _width_ and _options_.

      def add_cell item
        options = item.is_a?(Hash) ? item : {:value => item}
        klass = (@cell_index == @table.style.y_column_number) ? YColumnCell : Cell
        cell = klass.new(options.merge(:index => @cell_index, :table => @table))
        @cell_index += cell.colspan
        @cells << cell
      end
      alias << add_cell



      def render

          cells.map.with_index do |cell,index|
            index == @table.style.y_column_divider ? "|" + cell.render : cell.render
          end.join

      end
    end
  end
end
