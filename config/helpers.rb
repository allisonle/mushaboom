module ApplicationHelpers

  #########################
  # Metadata Helpers
  #########################
  def page_title
    title = "Company Name"
    if data.page.title
      title = data.page.title + " | " + title
    end
    title
  end

  def page_description
    if data.page.description
      description = data.page.description
    else
      description = "Set your site description in /helpers/site_helpers.rb"
    end
    description
  end

  #########################
  # Navigation Helpers
  #########################
  def navigation_class_for_path(path)
    request_path = "/#{request.path.gsub(/index\.html(.*?)$/, "")}"
    "active" if (path == request_path) || (path != "/" && request_path =~ /^(\/)?#{path}/i)
  end

  def navigation_item(label, path, optional_class = nil)
    content_tag(:li, link_to(label, path), :class => "#{navigation_class_for_path(path)} #{optional_class if optional_class}")
  end

  #########################
  # Utility Helpers
  #########################
  def slugify(string)
    string.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  # render Markdown. Strip wrapper <p> if wanted
  def md(key, options={})
    @markdown_renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    html = @markdown_renderer.render(key)
    html = html.gsub(/^\s*<p\s*>|<\s*\/\s*p\s*>\s*$/i, '') if options[:no_p]
    html
  end
end