class SessionController < ApplicationController
  def index
      @Session = Session.where(done: false)
      @completed = Session.where(done: true)
  end

  def new
    @Session = Session.new
  end

  def _params
      params.require(:Session ).permit(:name, :done)
  end

  def create
    @Session = Session.new(Session_params)

    if @Session.save
        redirect_to Session_index_path, :notice => "Additional Session has been added!"
      else
        render "new"
    end
  end

  def update
      @Session = Session.find(params[:id])

      if @Session.update_attribute(:done, true)
          redirect_to sesssion_index_path, :notice => "You're making progress!"
        else
          redirect_to Session_index_path, :notice => "ERROR could not be marked as complete"
      end
  end

  def destroy
      @Session = Session.find(params[:id])
      @Session.destroy

      redirect_to Session_index_path, :notice => "Session item deleted"
  end
end
