class BugsController < ApplicationController
  before_action :find_bug, only: [:show]

  def index
    @bugs = Bug.all
  end

  def show
  end

  def new
    @bug = Bug.new
  end

  def create
    @bug = Bug.new(bug_params)
    # @fix = Fix.new
    @bug.user = current_user
    @bug.save
    if @bug.save
      redirect_to bugs_path(@bug)
    else
      render :new
    end
  end

  private

  def bug_params
    params.require(:bug).permit(:title, :description, :user)
  end

  def find_bug
    @bug = Job.find(params[:id])
  end
end
