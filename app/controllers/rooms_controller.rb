class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @messages = Message.all
  end
end
