Given(/^the following movies exist:$/) do |table|
	table.hashes.each do |movie|
		Movie.create(movie)
	end
end

Then(/^the director of "(.*?)" should be "(.*?)"$/) do |movie_title, director|
	expect(Movie.where(title: movie_title).first.director).to eq(director)
end
