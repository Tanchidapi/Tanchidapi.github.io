require 'time'

Jekyll::Hooks.register :site, :post_read do |site|
  categories = Hash.new { |hash, key| hash[key] = [] }

  site.posts.docs.each do |post|
    Array(post.data['categories']).each do |category|
      categories[category] << post
    end
  end

  site.data['category_index'] = categories.map do |name, posts|
    posts.sort_by! { |post| post.date || Time.at(0) }
    latest_update = posts.map do |post|
      modified_at = post.data['last_modified_at']
      begin
        modified_at ? Time.parse(modified_at.to_s) : post.date
      rescue ArgumentError
        post.date
      end
    end.max || Time.at(0)

    {
      'name' => name,
      'posts' => posts.reverse,
      'latest_update' => latest_update
    }
  end.sort_by { |category| category['latest_update'] }.reverse
end
