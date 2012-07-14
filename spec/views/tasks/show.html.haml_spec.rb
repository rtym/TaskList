require 'spec_helper'

describe "tasks/show" do
  before(:each) do
    @task = FactoryGirl.build(:task)
    @values = {:caption => @task.caption, :description => @task.description, :user => @task.user}

    assign(:task, stub_model(Task, @values))
  end

  it "renders attributes in <p>" do
    render

    rendered.should match(@task.caption)
    rendered.should match(@task.user.full_name)
    rendered.should match(@task.description)
  end
end
