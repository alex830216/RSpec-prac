require 'rails_helper'

# 因為 spec/rails_helper.rb 有 config.infer_spec_type_from_file_location! 所以可省略type: :controller
RSpec.describe CoursesController do
  describe "GET index" do
    # pending "add some examples (or delete) #{__FILE__}"
    it "assigns @courses and render" do
      course1 = create(:course)
      course2 = create(:course)
      # request 跟 controller 用法類似，request 是後來出的，用在 rails 5 之後可以提升測試的速度
      # 參考:https://ithelp.ithome.com.tw/articles/10263416?sc=iThelpR
      # get '/courses'
      get :index
      expect(assigns[:courses]).to eq([course1, course2])
    end

    it "render template" do
      course1 = create(:course)
      course2 = create(:course)
      # get '/courses'
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET show" do
    it "assigns @course" do
      course = create(:course)
      get :show, params: { id: course.id }
      expect(assigns[:course]).to eq(course)
    end

    it "render template" do
      course = create(:course)
      get :show, params: { id: course.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET new" do
    it "assigns @course" do
      course = build(:course)
      get :new
      expect(assigns[:course]).to be_a_new(Course)
    end

    it "render template" do
      course = build(:course)
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    context "when course doesn't have title" do
      it "doesn't create a new course record" do
        expect { post :create, params: { course: { description: "bar" } } }.to change{ Course.count }.by(0)
      end
      it "render new template" do
        post :create, params: { course: { description: "bar" } }
        expect(response).to render_template(:new)
      end
    end
    
    context "when course has title" do
      it "create a new course record" do
        course = build(:course)
        # 舊版寫法 params: { :course => attributes_for(:course) }
        expect { post :create, params: { course: attributes_for(:course) } }.to change{ Course.count }.by(1)
      end
      it "redirects to courses_path" do
        course = build(:course)
        post :create, params: { course: attributes_for(:course) }
        expect(response).to redirect_to courses_path
      end
    end
  end

  describe "GET edit" do
    it "assigns @course" do
      course = create(:course)
      get :edit, params: { id: course.id }
      expect(assigns[:course]).to eq(course)
    end

    it "render template" do
      course = create(:course)
      get :edit, params: { id: course.id }
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT update" do
    context "when course has title" do
      it "assigns @course" do
        course = create(:course)
        put :update, params: { id: course.id, course: { title: "Title", description: "Description" } }
        expect(assigns[:course]).to eq(course)
      end
  
      it "changes value" do
        course = create(:course)
        put :update, params: { id: course.id, course: { title: "Title", description: "Description" } }
        expect(assigns[:course].title).to eq("Title")
        expect(assigns[:course].description).to eq("Description")
      end
  
      it "redirects to course_path" do
        course = create(:course)
        put :update, params: { id: course.id, course: { title: "Title", description: "Description" } }
        expect(response).to redirect_to course_path(course)
      end
    end

    context "when course doesn't have title" do
      it "doesn't update a record" do
        course = create(:course)
        put :update, params: { id: course.id, course: { title: "", description: "Description" } }
        expect(course.description).not_to eq("Description")
      end
 
      it "renders edit template" do
        course = create(:course)
        put :update, params: { id: course.id, course: { title: "", description: "Description" } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE destroy" do
    it "assigns @course" do
      course = create(:course)
      delete :destroy, params: { id: course.id }
      expect(assigns[:course]).to eq(course)
    end

    it "deletes a record" do
      course = create(:course)
      expect { delete :destroy, params: { id: course.id } }.to change { Course.count }.by(-1)
    end

    it "redirects to courses_path" do
      course = create(:course)
      delete :destroy, params: { id: course.id }
      expect(response).to redirect_to courses_path
    end
  end
end