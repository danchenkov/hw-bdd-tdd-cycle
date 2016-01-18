module NavigationHelpers
	def path_to(page_name)
		case page_name

		when /^the (RottenPotatoes\s*)?home\s?page$/
			root_path

		when /^the edit page for "([^"]+)"$/
			edit_movie_path(Movie.find_by_title($1))

		when /^the details page for "([^"]+)"$/
			movie_path(Movie.find_by_title($1))

		when /^the similar movies page for "([^"]+)"$/i
			if Movie.find_by_title($1).director.present?
				similar_path(Movie.find_by_title($1))
			else
				root_path
			end

		else
			begin
				page_name =~ /^the (.*) page$/
				path_components = $1.split(/\s+/)
				self.send(path_components.push('path').join('_').to_sym)
			rescue NoMethodError, ArgumentError
				raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
				"Now, go and add a mapping in #{__FILE__}"
			end
		end
	end
end

World(NavigationHelpers)
