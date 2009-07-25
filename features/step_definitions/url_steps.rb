Given /^the following urls:$/ do |urls|
  Url.create!(urls.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) url$/ do |pos|
  visit urls_url
  within("table > tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following urls:$/ do |expected_urls_table|
  expected_urls_table.diff!(table_at('table').to_a)
end
