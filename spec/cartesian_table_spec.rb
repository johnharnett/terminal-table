require 'spec_helper'


module Terminal
    class Table
        class Style
          attr_accessor :y_column_divider

        end
    end
  describe CartesianTable do
    before :each do

      @table = CartesianTable.new
    end

    it "should render a Cartesian Product" do
     table = Terminal::CartesianTable.new
     table.style = {:y_column_divider => 1,padding_right: 0,alignment: :right}

      table << ['', 2,3,5]
      table.add_separator
      table << [2, 4, 6, 10]
      table <<  [3, 6, 9, 15]
      table <<  [{value: 24, alignment: :right}, 10, 15, 25]

    table.align_column 0, :left
        print table.to_s
      table.render.should == <<-EOF
   |  2  3  5
---+---------
 2 |  4  6 10
 3 |  6  9 15
25 | 10 15 25
      EOF
    end

end
end
