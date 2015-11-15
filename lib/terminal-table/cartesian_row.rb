module Terminal
  class Table
    class CartesianRow < Row

      # Initialize with _width_ and _options_.

#      def initialize table, array = []
#          super
#      #  @cell_index = 0
#      #  @table = table
#      #  @cells = []
#      #  array.each { |item| self << item }
#      end
#
#      def add_cell item
#        options = item.is_a?(Hash) ? item : {:value => item}
#        cell = Cell.new(options.merge(:index => @cell_index, :table => @table))
#        @cell_index += cell.colspan
#        @cells << cell
#      end
#      alias << add_cell



      def render

          cells.map.with_index do |cell,index|
            index == @table.style.y_column_divider ? "|" + cell.render : cell.render
          end.join

      end
    end
  end
end
