require 'spec_helper'

describe TasksController do
  before(:each) do
    @task = FactoryGirl.create(:task)
  end

  def valid_attributes
    {:caption => @task.caption, :description => @task.description, :user_id => @task.user.id}
  end

  def valid_session
    {:user_id => @task.user.id, :expire_time => 20.minutes.seconds.from_now}
  end

  describe "GET index" do
    it "assigns all tasks as @tasks" do
      get :index, {}, valid_session
      assigns(:tasks).should eq([@task])
    end
  end

  describe "GET show" do
    it "assigns the requested task as @task" do
      get :show, {:id => @task.to_param}, valid_session
      assigns(:task).should eq(@task)
    end
  end

  describe "GET new" do
    it "assigns a new task as @task" do
      get :new, {}, valid_session
      assigns(:task).should be_a_new(Task)
    end
  end

  describe "GET edit" do
    it "assigns the requested task as @task" do
      get :edit, {:id => @task.to_param}, valid_session
      assigns(:task).should eq(@task)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Task" do
        expect {
          post :create, {:task => FactoryGirl.build(:task).attributes}, valid_session
        }.to change(Task, :count).by(1)
      end

      it "assigns a newly created task as @task" do
        post :create, {:task => valid_attributes}, valid_session
        assigns(:task).should be_a(Task)
        assigns(:task).should be_persisted
      end

      it "redirects to the created task" do
        post :create, {:task => valid_attributes}, valid_session
        response.should redirect_to(Task.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved task as @task" do
        Task.any_instance.stub(:save).and_return(false)
        post :create, {:task => {}}, valid_session
        assigns(:task).should be_a_new(Task)
      end

      it "re-renders the 'new' template" do
        Task.any_instance.stub(:save).and_return(false)
        post :create, {:task => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested task" do
        Task.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => @task.to_param, :task => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested task as @task" do
        put :update, {:id => @task.to_param, :task => valid_attributes}, valid_session
        assigns(:task).should eq(@task)
      end

      it "redirects to the task" do
        put :update, {:id => @task.to_param, :task => valid_attributes}, valid_session
        response.should redirect_to(@task)
      end
    end

    describe "with invalid params" do
      it "assigns the task as @task" do
        Task.any_instance.stub(:save).and_return(false)
        put :update, {:id => @task.to_param, :task => {}}, valid_session
        assigns(:task).should eq(@task)
      end

      it "re-renders the 'edit' template" do
        Task.any_instance.stub(:save).and_return(false)
        put :update, {:id => @task.to_param, :task => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested task" do
      expect {
        delete :destroy, {:id => @task.to_param}, valid_session
      }.to change(Task, :count).by(-1)
    end

    it "redirects to the tasks list" do
      delete :destroy, {:id => @task.to_param}, valid_session
      response.should redirect_to(tasks_url)
    end
  end

end
