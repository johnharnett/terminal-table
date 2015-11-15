module Terminal
  class Table
    class CartesianSeparator < Row

      def initialize table, array = []
        super table, Array.new(table.number_of_columns() , '')
      end

      def render
        arr_x = (0...@table.number_of_columns() ).to_a.map do |i|

            p @table.column_width(i)
            p @table.cell_padding
         divider =  "-" * (@table.column_width(i) + @table.cell_padding)
         if i == @table.style.y_column_divider
             divider  = "+" + divider
         end
         divider
        end
        p arr_x
        arr_x.join
      end
    end
  end
end
