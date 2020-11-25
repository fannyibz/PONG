class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :components]

  def home
    authorize(:page, :home?)
  end

  def components
     authorize(:page, :components?)
  end

end
