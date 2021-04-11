
Given /the following courses exist/ do |courses_table|
  courses_table.hashes.each do |course|
    Course.create course
  end
end

Given /the following users exist/ do |users|
  users.hashes.each do |user|
    User.create user
  end
end

Given /I login with username "(.*)" and password "(.*)"/ do |v1, v2|
    visit path_to("login page")
    fill_in('username', with: "admin")
    fill_in('password', with: "123")
    click_button('Login')
    #puts "driver.. #{Capybara.current_session.driver}"
    #Capybara.current_session.page.driver.set_cookie "#{:expires_at}=#{Time.now + 24.hours}"
end

And /I logout/ do
    click_link('Logout')
end


Given /the following course details exist/ do |coursedetail_table|
  coursedetail_table.hashes.each do |coursedetail|
    Coursedetails.create coursedetail
  end
end

Given /the following course faqs exist/ do |coursefaq_table|
  coursefaq_table.hashes.each do |coursefaq|
    CourseFaq.create coursefaq
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

When /I (un)?check the following course: (.*)/ do |uncheck, course_list|
  course_list.split(', ').each do |course|
    step %{I #{uncheck.nil? ? '' : 'un'}check "addCart[#{course}]"}
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  Course.all.each do |movie|
    step %{I should see "#{movie.title}"}
  end
end

Then /the director of "(.*)" should be "(.*)"/ do |movie, director|
  movie = Course.find_by_title(movie)
  expect(movie.director).to eq director
end