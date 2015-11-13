Given /^I am not signed in$/ do
  step "I sign out"
end

Given /^I am signed in$/ do
  step "I sign in"
end

When /^I sign in$/ do
  step "I sign in using \"password\""
end

When /^I sign in using "([^"]*)"$/ do |password|
  step "I am on sign in page"
  step "I should see \"Sign up\""
  step "I fill in \"user[email]\" with \"#{@user.email}\""
  step "I fill in \"user[password]\" with \"#{password}\""
  step "I press \"Sign in\""
  @user.save!
end

When /^I sign out$/ do
  visit destroy_user_session_path
end

When /^I sign in with the wrong email$/ do
  step "I am on sign in page"
  step "I should see \"Sign up\""
  step "I fill in \"user[email]\" with \"bogus\""
  step "I fill in \"user[password]\" with \"password\""
  step "I press \"Sign in\""
end

When /^I sign in with the wrong password$/ do
  step "I sign in using \"bogus\""
end