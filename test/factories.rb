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
    position { (0..100).to_a[rand(100)] }
    last_weeks_position { (0..100).to_a[rand(100)] }
    weeks_on_chart { (0..100).to_a[rand(100)] }
    peak_position { (0..100).to_a[rand(100)] }
  end
end