Given /^the following links:$/ do |links|
  Link.create!(links.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) link$/ do |pos|
  visit links_url
  within("table > tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following links:$/ do |expected_links_table|
  expected_links_table.diff!(table_at('table').to_a)
end
