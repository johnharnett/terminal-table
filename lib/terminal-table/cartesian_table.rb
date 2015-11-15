
module Terminal
  class CartesianTable < Table
      DEFAULT_Y_COLUMN = 1

    def style= hash
       y = hash.fetch(:y_column_divider,DEFAULT_Y_COLUMN)
    padding_right= hash.fetch(:padding_right,0)
    alignment = hash.fetch(:alignment,:right)
       x =  {border_i: "", border_x: "", border_y: "",y_column_divider: y,padding_right: padding_right,alignment: alignment}
        super x
    end

    def add_row array
      row = array == :separator ? Table::CartesianSeparator.new(self) : CartesianRow.new(self, array)
      @rows << row
      recalc_column_widths row
    end
    alias :<< :add_row

    def align_column n, alignment
        r = rows
        column(n).each_with_index do |col, i|
        cell = r[i][n]
        cell.alignment = alignment unless cell.alignment?
      end
    end

end
end
