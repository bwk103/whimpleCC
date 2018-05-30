module ApplicationHelper
  def full_title(title = '')
    base_title = 'Whimple CC'
    if title.empty?
      base_title
    else
      "#{title} | #{base_title}"
    end
  end

  def formatted_date(datetime)
    datetime.strftime('%e %B %Y at %I:%M')
  end

  def is_logged_in?
    p 'hello'
    current_user && current_user.admin?
  end
end
