When(/^user visits home page$/) do
    visit '/'
end

Then(/^Project tagline should be visible$/) do
    expect(page).to have_content('Time and Resource planner for motivated self-learners')
end
