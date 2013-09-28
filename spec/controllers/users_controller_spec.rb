require 'spec_helper'

describe UsersController do

  before do
    @user = create(:user)
  end



  subject{@user}


  #GET
  describe 'GET #show' do
    it "assigns the requested user to @user" do
      get :show, id: subject
      expect(assigns(:user)).to eq subject
    end

    it "renders the :show templateresponse" do
      get :show, id: subject
      expect(response).to render_template :show
    end
  end



  describe 'Get #index' do
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end



  describe 'Get #new' do
    it "assigns a new User to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end



  describe 'Get #edit' do
    it "assigns the requested user to @user" do
      get :edit, id: subject
      expect(assigns(:user)).to eq subject
    end

    it "renders the :edit template" do
      get :edit, id: subject
      expect(response).to render_template :edit
    end
  end


  #POST
  describe 'Post #create' do
    context 'with valid attributes' do
      it "saves the new user in the database" do
        expect{
          post :create, user: attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      it "redirects to users#show" do
        post :create, user: attributes_for(:user)
        expect(response).to redirect_to user_path(assigns[:user])
      end
    end

    context "with invalid attributes" do
      it "does not save the new user in the database" do
        expect{
          post :create,
          user: attributes_for(:user, name: '')
        }.to_not change(User, :count)
      end

      it "re-renders the :new template" do
        post :create, user: attributes_for(:user, name: '')
        expect(response).to render_template :new
      end
    end
  end


  #PATCH
  describe 'PATCH #update' do
    context "valid attributes" do
      it "located the requested @user" do
        patch :update, id: subject, user: attributes_for(:user)
        expect(assigns(:user)).to eq(subject)
      end

      it "changes @user's attributes" do
        patch :update, id: subject,
          user: attributes_for(:user,
                               name: "Someuser")
          subject.reload
        expect(subject.name).to eq("Someuser")
      end

      it "redirects to the updated user" do
        patch :update, id: subject, user: attributes_for(:user)
        expect(response).to redirect_to subject
      end
    end


    context "with invalid attributes" do
      it "doesn't change the user's attributes" do
        patch :update, id: subject, user: attributes_for(:user,
                                                         name: "")
        subject.reload
        expect(subject.name).to_not eq("")
      end

      it "re-renders the edit template" do
        patch :update, id: subject,
          user: attributes_for(:user, name: "")
        expect(response).to render_template :edit
      end
    end
  end
end
