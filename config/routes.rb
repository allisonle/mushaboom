module RouteHelpers
  def root_app_path
    "/"
  end

  def production_url
    ## Update this with you production URL
    "http://www.production_url.com"
  end

  def page_path
    "/page-name"
  end

  def templated_page_path(slug)
    "/page-name/#{slug}.html"
  end

  def page_path(page)
    "/page-name/#{page}"
  end
end