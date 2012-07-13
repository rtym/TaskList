require 'spec_helper'

describe "tasks/new" do
  before(:each) do
    @task = FactoryGirl.build(:task)
  end

  it "renders new task form" do
    render

    assert_select "form", :action => tasks_path, :method => "post" do
      assert_select "input#task_caption", :name => @task.caption
      assert_select "textarea#task_description", :name => @task.description
    end
  end
end
