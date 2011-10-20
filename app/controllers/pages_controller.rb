class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:contact, :about]
  def contact
    @title = "Home"
  end
  def about
    @title = "About"
  end
  def software
    @title = "Software"
  end
  def wifi
    @title = "Passwords"
  end
  def passwords
    @title = "Passwords"
  end
  def todo
    @title = "Todo"
  end


end
