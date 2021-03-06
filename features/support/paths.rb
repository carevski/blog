module NavigationHelpers
  def path_to(page_name)
    case page_name
    
    when /the homepage/
      root_path
    when /^admin root page in administration$/
      admin_root_path
    when /^list of posts$/
      posts_path
    when /^list of posts in administration$/
      admin_posts_path
    when /^list of comments in administration$/
      admin_comments_path
    when /^post with id "([^\"]*)"$/
      post_path($1)
    when /^post with id (\d+) in administration$/
      admin_post_path($1)
    when /^edit post with id (\d+) in administration$/
      edit_admin_post_path($1)
    when /^new post in administration$/
      new_admin_post_path
    when /^delete post with id (\d+) in administration$/
      delete_admin_post_path($1)


    # Add more page name => path mappings here
    
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in features/support/paths.rb"
    end
  end
end

World(NavigationHelpers)


#  World do |world|
#    world.extend NavigationHelpers
#    world
#  end

