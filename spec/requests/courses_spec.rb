require 'rails_helper'

RSpec.describe "Courses", type: :request do
  describe "GET /index" do
    # pending "add some examples (or delete) #{__FILE__}"
    it "assigns @courses and render template" do
      course1 = Course.create(title: "foo", description: "bar")
      course2 = Course.create(title: "bar", description: "foo")

      get :index

      expect(assigns[:courses]).to eq([course1, course2])
      expect(response).to render_template("index")
    end
  end
end
