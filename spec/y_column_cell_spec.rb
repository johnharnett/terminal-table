require 'spec_helper'
require 'pp'

describe Terminal::Table::YColumnCell do
  Cell = Terminal::Table::YColumnCell



  it "should render table padding properly " do
    @table = Terminal::CartesianTable.new(:rows => [['foo', '2'], ['3', '4']], :style => {:padding_right => 0,padding_left: 1,alignment: :right, y_column_number: 0, y_column_divider: 1, y_column_alignment: :left, y_column_padding_right: 1,y_column_padding_left: 0})
    cell = @table.rows.first.cells.first
    cell.value.should == 'foo'
    cell.alignment.should == :left
    cell.render.should == "foo "
  end

  it "should render y_column padding properly " do

    @table = Terminal::CartesianTable.new(:rows => [['25', '2'], ['3', '4']], :style => {:padding_right => 0,padding_left: 1,alignment: :right,y_column_number: 0,y_column_divider: 1,y_column_alignment: :center,y_column_padding_right: 1,y_column_padding_left: 0})
    cell = @table.rows.first.cells.first
    cell.should be_kind_of(Terminal::Table::YColumnCell)
    cell.value.should == '25'
    cell.alignment.should == :center
    cell.render.should == "25 "
  end
  it "should render y_column padding properly " do

    @table = Terminal::CartesianTable.new(:rows => [['25', '2'], ['3', '24']], :style => {:padding_right => 0,padding_left: 1,alignment: :right,y_column_number: 1,y_column_divider: 1,y_column_alignment: :right,y_column_padding_right: 0,y_column_padding_left: 2})
    cell = @table.rows.last.cells.last
    cell.should be_kind_of(Terminal::Table::YColumnCell)
    cell.value.should == '24'
    cell.alignment.should == :right
    cell.render.should == "  24"
  end

end
