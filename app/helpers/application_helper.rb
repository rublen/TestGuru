module ApplicationHelper
  def display_flash(key)
    content_tag :p, flash[key], class: "flash #{key}" if flash[key]
  end
end
