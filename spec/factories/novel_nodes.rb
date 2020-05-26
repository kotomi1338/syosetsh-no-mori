FactoryBot.define do
  factory :novel_node do
    content { "MyText" }
    author { nil }
    is_temp { false }
    theme { nil }
    parent { nil }
  end
end
