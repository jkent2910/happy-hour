Given(/^the following happy hours?:$/) do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:business, hash)
  end
end

Given(/^the happy hours have the following start and end times$/) do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:business, hash)
  end
end

Given(/^the current time is "(.*?)"$/) do |time_string|
  travel_to Time.parse(time_string) do
    t = Time.current
  end
end

Then(/^I should see the following happy hours?:$/) do |expected_table|
  businesses = find("div.business-container").all("div.business")
  actual_table = [%w[name]] + businesses.map do |business|
    name = business.all("a")[0].text.strip
    [name]
  end
  expected_table.diff!(actual_table)
end

Then(/^I should see the following businesses:$/) do |expected_table|
  travel_to Time.new(2015, 11, 24, 04, 00, 00)
  businesses = find("div.business-container").all("div.business")
  actual_table = [%w[name]] + businesses.map do |business|
    name = business.all("a")[0].text.strip
    [name]
  end
  expected_table.diff!(actual_table)
end

