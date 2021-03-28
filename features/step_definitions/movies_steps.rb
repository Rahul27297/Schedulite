
Given /the following courses exist/ do |courses_table|
  courses_table.hashes.each do |course|
    Course.create course
  end
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

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(', ').each do |rating|
    step %{I #{uncheck.nil? ? '' : 'un'}check "ratings_#{rating}"}
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