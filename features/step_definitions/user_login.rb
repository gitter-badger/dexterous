Then(/^login link should be present$/) do
    expect(page).to have_selector '#login-thumb'
    expect(find_link('login-thumb').text).to eq 'Login'
end

When(/^login link is clicked$/) do
    click_link 'login-thumb'
end

Then(/^user should be directed to dedicated login page$/) do
    expect(current_path).to eq '/users/sign_in'
end

Given(/^a user account with email "(.*?)" and password "(.*?)" exists$/) do |arg1, arg2|
    create :user, email: arg1, password: arg2
end

Then(/^a popup should appear$/) do
    expect(find('.popup-form')).to be_visible
end

When(/^user enters login credentials as "(.*?)" and "(.*?)"$/) do |arg1, arg2|
    fill_in 'user_email', with: arg1
    fill_in 'user_password', with: arg2
end

When(/^user clicks on submit button in login form$/) do
    click_on 'login-submit'
end

Then(/^page should show message "(.*?)"$/) do |arg1|
    expect(page).to have_content arg1
end

When(/^user visits login page$/) do
    visit '/users/sign_in'
end

Then(/^Login form should be present$/) do
    expect(page).to have_selector '#login-form'
end

Then(/^user should be directed to home page$/) do
    expect(current_path).to eq '/'
end
