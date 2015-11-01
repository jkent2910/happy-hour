When /^(?:|I )visit (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  expect(page).to have_content(text)
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  expect(current_path).to be == path_to(page_name)
end

