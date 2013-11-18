Then /^I should see the decision$/ do
  page.should have_content(@motion.discussion.title[0..25])
end

Then /^I should see an empty discussion list$/ do
  page.should have_css("#discussion-list")
end
