require 'spec_helper'

describe Terminal::Table do
  Cell = Terminal::Table::YColumnCell


  it "should override table alignment" do

  cartesian_style =  {
             y_column_alignment: :center
       }
    table =  Terminal::CartesianTable.new
    table.style = cartesian_style
    cell = Cell.new :value => 'foo', :table => table, :index => 0
    cell.value.should == 'foo'
    cell.alignment.should == :center
  end


end
