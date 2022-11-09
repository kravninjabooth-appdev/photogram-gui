class UsersController < ApplicationController

  def index
    render({:template => "user_templates/index.html.erb"})
  end
end
