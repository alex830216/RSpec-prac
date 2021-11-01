require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
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
end