class Api::V1::PostsController < ApplicationController
  before_action :authenticate_user!

end
