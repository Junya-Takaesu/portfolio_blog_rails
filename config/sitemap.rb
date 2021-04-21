# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://junya-takaesu.site"

articles_list = Articles::List.new
SitemapGenerator::Sitemap.create do
  # More details here: https://github.com/kjvarga/sitemap_generator#sitemap-configuration
  add "/articles", :priority => 1, :changefreq => "weekly"
  articles_list.all.each do |key, article|
    add "/articles/#{key}", :changefreq => "yearly"
  end
end
