require 'rails_helper'

RSpec.describe "Courses", type: :request do
  describe "GET /index" do
    # pending "add some examples (or delete) #{__FILE__}"
    it "assigns @courses and render template" do
      course1 = Course.create(title: "foo", description: "bar")
      course2 = Course.create(title: "bar", description: "foo")

      # request 跟 controller 用法類似，request 是後來出的，用在 rails 5 之後可以提升測試的速度
      # 參考:https://ithelp.ithome.com.tw/articles/10263416?sc=iThelpR
      get '/courses'

      expect(assigns[:courses]).to eq([course1, course2])
      expect(response).to render_template("index")
    end
  end
end