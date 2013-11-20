require 'spec_helper'

describe Admin::PostsController do
  describe "admin panel" do
    it "#index" do
      get :index
      response.status.should eq 200
    end

    it "#new" do
      get :new
      response.status.should eq 200
      expect(response.status).to eq 200
    end

    context "#create" do
      let(:params){{:title => "Our TESTS", :content => "Our Content"}}
      it "creates a post with valid params" do
        expect {
          post :create, { post: params }
        }.to change(Post, :count).by 1
      end

      it "doesn't create a post when params are invalid" do
        params[:content] = nil
        expect {
          post :create, { post: params }
        }.to change(Post, :count).by 0
      end
    end

    context "#edit" do
      let(:params){{:title => "New title", :content => "New content"}}
      let(:the_last_post){ Post.create(title: "Original title",
                  content: "Original content") }
      it "updates a post with valid params" do
        expect {
          put :update, {id: the_last_post.id}, {post: params}
      }.to change(Post.last)
      end
      it "doesn't update a post when params are invalid" do
        pending
      end
    end

    it "#destroy" do
      pending
    end
  end
end
