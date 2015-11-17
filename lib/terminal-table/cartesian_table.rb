
module Terminal
    class Table
        class Style
          attr_accessor :y_column_divider,:y_column_number,:y_column_alignment,:y_column_padding_left,:y_column_padding_right

        end
    end
  class CartesianTable < Table
      DEFAULT_Y_COLUMN = 0

    def style= hash
       y = hash.fetch(:y_column_divider,DEFAULT_Y_COLUMN + 1)
       padding_right= hash.fetch(:padding_right,0)
       padding_left = hash.fetch(:padding_left,1)
       alignment = hash.fetch(:alignment,:right)
       y_column_number = hash.fetch(:y_column_number,DEFAULT_Y_COLUMN)
       y_column_alignment = hash.fetch(:y_column_alignment,:left)
       y_column_padding_left = hash.fetch(:y_column_padding_left,0)
       y_column_padding_right = hash.fetch(:y_column_padding_right,1)

       x =  {border_i: "", border_x: "", border_y: "",
             y_column_divider: y,
             padding_right: padding_right,
             padding_left: padding_left,
             alignment: alignment,y_column_number: y_column_number,
             y_column_alignment: y_column_alignment,y_column_padding_left: y_column_padding_left,
             y_column_padding_right: y_column_padding_right

       }
        super x
    end

    def add_row array
      row = array == :separator ? Table::CartesianSeparator.new(self) : CartesianRow.new(self, array)
      @rows << row
      recalc_column_widths row
    end
    alias :<< :add_row

#/    def align_column n, alignment
#/        r = rows
#/        column(n).each_with_index do |col, i|
#/        cell = r[i][n]
#/        cell.alignment = alignment unless cell.alignment?
#/      end
#/    end

end
end
