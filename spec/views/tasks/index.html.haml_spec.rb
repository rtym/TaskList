require 'spec_helper'

describe "tasks/index" do
  before(:each) do
    @task = FactoryGirl.build(:task)
    @values = {:caption => @task.caption, :description => @task.description, :user => @task.user}

    assign(:tasks, [
      stub_model(Task, @values),
      stub_model(Task, @values)
    ])
  end

  it "renders a list of tasks" do
    render

    assert_select "tr>td", :text => @task.caption, :count => 2
    assert_select "tr>td", :text => @task.description, :count => 2
    assert_select "tr>td", :text => @task.user.full_name, :count => 2
  end
end
