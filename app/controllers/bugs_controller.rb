class BugsController < ApplicationController
  before_action :find_bug, only: %i[show update destroy]

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
    determine_state(params)
    @bug.user = current_user
    @bug.save
    if @bug.save
      redirect_to bugs_path(@bug)
    else
      render :new
    end
  end

  def update
    @bug.update(state_done(@bug))
    redirect_to bugs_path(@bug)
  end

  def destroy
    @bug.destroy
    redirect_to bugs_path
  end

  private

  def bug_params
    params.require(:bug).permit(:title, :description, :user_id)
  end

  def find_bug
    @bug = Bug.find(params[:id])
  end

  def determine_state(params)
    # function that determines whether someone has been assigned to this bug
    # if yes, then state becomes 'assigned' & if no, then state becomes 'open'
    if params['bug']['user'] != ''
      @bug.state = 'assigned'
    else
      @bug.state = 'open'
    end
  end

  def state_done
    @bug.state = 'done'
  end
end
