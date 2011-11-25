FactoryGirl.define do
  factory :artist do
    name "Lady Gaga"
    billboard_id "1234567890"
  end

  factory :chart do
    title "Chart Title"
    url "http://www.billboard.com/charts/chart-title"
    chart_type "Singles"
  end

  factory :chart_instance do
    chart

    date { 7.days.ago }
  end

  factory :chart_instance_item do
    chart_instance
    artist

    title "A Song Title"
    album "An Album Title"
    position { (1..100).to_a[rand(99)] }
    last_weeks_position { (1..100).to_a[rand(99)] }
    weeks_on_chart { (1..20).to_a[rand(19)] }
    peak_position { (1..100).to_a[rand(99)] }
  end
end