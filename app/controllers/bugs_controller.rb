class BugsController < ApplicationController
  def index
    @bugs = Bugs.all
  end
end
