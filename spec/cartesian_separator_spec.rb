require 'spec_helper'

describe Terminal::Table do
  Separator = Terminal::Table::CartesianSeparator

  it "should default alignment to the left" do
          table = Terminal::CartesianTable.new
          table << ["a", "b", "c"]
    sep = Separator.new table 
    sep.render.should == '--+----'
  end
  it "should do the business" do
          table = Terminal::CartesianTable.new
          table.style = {:padding_right => 0,padding_left: 1,alignment: :right,y_column_number: 0,y_column_divider: 1,y_column_alignment: :center,y_column_padding_right: 1,y_column_padding_left: 0}

      table << ['25', 25,10,15]
    sep = Separator.new table 
    sep.render.should == '---+---------'
  end
  it "should do the business" do 
          table = Terminal::CartesianTable.new
      table.style = {:padding_right => 1,padding_left: 0, 
                     alignment: :right,y_column_number: 4,  
                     y_column_divider: 3,y_column_alignment: :center, 
                     y_column_padding_right: 0, y_column_padding_left: 1}
      table << [25, 25,10,15]
    sep = Separator.new table 
    sep.render.should == '---------+---'


  end

#  it "should allow overriding of alignment" do
#    row = Row.new Terminal::Table.new, [{:value => 'a', :alignment => :center}, "b", "c"]
#    cell = row.cells.first
#    cell.value.should == 'a'
#    cell.alignment.should == :center
#  end
#
#  it "should calculate height for multiline cells" do
#    row = Row.new Terminal::Table.new, [{:value => 'a', :alignment => :center}, "b", "c\nb"]
#    row.height.should == 2
#  end
end
