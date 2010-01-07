# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def cleardiv
    "<span class='cleardiv'><!-- clear --></span>"
  end
  
  def format_date(date)
    date.strftime("%d %B %Y")
  end
  
end
