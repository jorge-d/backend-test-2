class CallsController < ApplicationController
  def index
    @calls = Call.order(created_at: :desc).includes(:user)
  end
end
