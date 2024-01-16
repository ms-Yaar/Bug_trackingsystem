class BugsController < ApplicationController
    before_action :authenticate_user!

    def index
      @bugs = current_user.assigned_bugs
    end
end
