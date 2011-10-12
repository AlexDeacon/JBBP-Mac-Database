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

  #
  # sortable implements the column sorting for index views.  
  #
  def sortable(column, title = nil)  
    title ||= column.titleize  
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil  
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"  
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}  
  end  

  #  
  # format_status implements the conditional formatting on the status field
  #
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

  #
  # Create a link to a battery based on the battery.computer_id field
  #
  def create_battery_link(id)
    @battery=Battery.find_by_computer_id(id)
    if @battery.nil?
      'No battery installed'
    else
      @jbbp_id=@battery.battery_jbbp_id
      link_to @jbbp_id, battery_path(@battery.id)
    end
  end

  #
  # Create a link to a computer based on the computer_id field
  #
  def create_computer_link(id)
    @computer=Computer.find_by_id(id)
    if @computer.nil?
      ''
    else
      link_to @computer.computer_name_en, computer_path(id)
    end
  end
    
  #
  # Get and display battery status for computer.index view
  #
  def get_battery_status(id)
    @battery=Battery.find_by_computer_id(id)
    if @battery.nil?
      ''
    else
      @battery.battery_status
    end
  end
    

  #
  # toggle_view display's index columns or not...depending on the view seleted
  #
  def toggle_view(field, view)
    if view
      field
    else
      nil
    end
  end

end


