module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "Rosa Parks JBBP Macintosh Database"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

#  def sortable(column, title = nil)  
#    title ||= column.titleize  
#    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"  
#    link_to title, :sort => column, :direction => direction  
#  end 

  def sortable(column, title = nil)  
    title ||= column.titleize  
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil  
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"  
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}  
  end  


  def format_status(status)
    case status
      when 'Good'
      content_tag :font, status, :color => 'limegreen'
    when 'Minor Issues'
      content_tag :font, status, :color => 'orange'
    when 'Weak'
      content_tag :font, status, :color => 'orange'
    when 'Not Working'
      content_tag :font, status, :color => 'red'
    when 'Retired'
      content_tag :font, status, :color => 'black'
    else
      status
    end
  end


end



