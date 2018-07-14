module ApplicationHelper
  def run_flash(key)
    if flash[key]
      content_tag :p, flash[key], class: "flash #{key}"
    end
  end
end
