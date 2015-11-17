module Terminal
  class Table
    class CartesianSeparator < Separator

            def initialize table,array = []
            @cell_index = 0
            @table = table
            @cells = []
            (0...table.number_of_columns).to_a.each { |item| self << item }
            end

      def render
        arr_x = (0...table.number_of_columns()).to_a.map do |i|
         divider =  "-" * (@table.column_width(i) + @table.cell_padding)
         if i == @table.style.y_column_divider
             divider  = "+" + divider
         end
         divider
        end
        arr_x.join
      end
    end
  end
end
