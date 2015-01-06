FactoryGirl.define do  

  factory :geo_country do
    country_code 'US'
    country_name 'United States'
    short_country_name 'US'
    rank_level 1
    has_geo_regions 1
    association :geo_continent
  end

end