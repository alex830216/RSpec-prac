FactoryBot.define do
  factory :course do
    # trait :en do
    #   title { "English" }
    #   description { "abc." }
    # end
    # trait :cn do
    #   title { "Chinese" }
    #   description { "hihi." }
    # end
    title { "Title." }
    description { "Description." }
  end
  # factory :teacher do
  #   name { "Bob" }
  #   language { "english teacher" }
  # end
end