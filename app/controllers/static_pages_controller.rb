class StaticPagesController < ApplicationController
  def home
    @articles=Kiji.all
  end

  def index
  end

end
