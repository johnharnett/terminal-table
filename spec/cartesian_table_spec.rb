require 'spec_helper'


module Terminal
  describe CartesianTable do
    before :each do
      @table = CartesianTable.new
    end

    it "should render a Cartesian Product" do
     table = Terminal::CartesianTable.new
      table.style = {:padding_right => 0,padding_left: 1,alignment: :right,y_column_number: 0,y_column_divider: 1,y_column_alignment: :center,y_column_padding_right: 1,y_column_padding_left: 0}

      table << ['', 2,3,5]
      table.add_separator
      table << [2, 4, 6, 10]
      table <<  [3, 6, 9, 15]
      table <<  [25, 10, 15, 25]

    table.align_column 0, :right
      table.render.should == <<-EOF

   |  2  3  5
---+---------
 2 |  4  6 10
 3 |  6  9 15
25 | 10 15 25
      EOF
    end
    it "should render a Cartesian Product" do
     table = Terminal::CartesianTable.new
table.style = {:padding_right => 1,
               padding_left: 0,
               alignment: :right,
               y_column_number: 3,
               y_column_divider: 3,
               y_column_alignment: :right,
               y_column_padding_right: 0,
               y_column_padding_left: 1}
      table << [2,3,5, '']
      table.add_separator
      table << [ 4, 6, 10,2]
      table <<  [6, 9, 15,3]
      table <<  [25, 10, 15, 28]

    table.align_column 0, :right
      table.render.should == <<-EOF

 2  3  5 |   
---------+---
 4  6 10 |  2
 6  9 15 |  3
25 10 15 | 28
      EOF

    end

end
end
