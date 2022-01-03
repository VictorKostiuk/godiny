require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  context "CRUD" do
      let!(:user) {FactoryBot.create(:user)}
      before :each do
        login_user(user)
      end

    describe "GET index" do
      let!(:tasks) {FactoryBot.create_list(:task, 5) }
      it "index" do
        get :index
        expect(assigns(:tasks)).to eq(tasks)
      end

      it "renders the http status ok" do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end

    describe "GET show" do
      let!(:task) { create(:task) }
      it "show" do
        get :show, params: { id: task.id }

        expect(assigns["task"].title).to eq(task.title)
        expect(assigns["task"].description).to eq(task.description)
      end

      it "renders the http status ok" do
        get :show, params: { id: task.id }
        expect(response).to have_http_status(:ok)
      end
    end

    describe "PUT update" do
      let!(:task) { create(:task) }
      it "update" do
        post :update, params: { id: task.id , task:  {title: "default1"}}
        expect(assigns["task"].title).to eq("default1")
      end

      it "renders the http status found" do
        post :update, params: { id: task.id , task:  {title: "default1"}}
        expect(response).to have_http_status(:ok)
      end
    end

    describe "POST create" do
      it "create" do
        post :create, params: {  task:  {title: "default", description: "default", completed: true, deadline: Time.now + 1.day}}

        expect(assigns["task"].title).to eq("default")
        expect(assigns["task"].description).to eq("default")
      end

      it "renders the http status ok" do
       post :create, params: {  task:  {title: "default", description: "default", completed: true, deadline: Time.now + 1.day}}
       expect(response).to have_http_status(:ok)
      end
    end

    describe "DELETE destroy" do
      let!(:task) { create(:task) }
      it "destroy" do
        expect { delete :destroy, params: { id: task.id } }.to change { Task.count }.by(-1)
      end

      it "renders the http status no content" do
        delete :destroy, params: { id: task.id }
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end