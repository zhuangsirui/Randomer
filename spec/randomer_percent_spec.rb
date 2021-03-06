require 'spec_helper'

describe Randomer::Percent do

  before(:each) do
    @percent_list = {
      :a => 900,
      :b => 1000,
      :c => 870,
      :e => 0,
      'd' => 10000,
    }
  end

  it "Pick one by percent list" do
    1000.times do
      result = Randomer::Percent.pick_one @percent_list
      @percent_list.include?(result).should == true
      (result == :e).should == false
    end
  end

  it "Pick some from percent list" do
    (0..10).each do |count|
      Randomer::Percent.pick_some(@percent_list, count).count.should <= @percent_list.keys.count
      Randomer::Percent.pick_some(@percent_list, count, false).count.should == count
    end
  end

end
