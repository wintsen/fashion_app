module ApplicationHelper
  def full_title(page_title)
    base_title = "Fashion App"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def button(name, url, options={})
    content_tag :button, type: "button", onclick: "window.location.href = '#{url_for(url)}';", class: options[:class] do
      "#{name}"
    end
  end

end
