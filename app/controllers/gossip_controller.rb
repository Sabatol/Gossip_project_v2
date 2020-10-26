class GossipController < ApplicationController
  def show
    id = params[:id]
    @gossip = Gossip.find(params[:id])
  end
  def index
    @gossips = Gossip.all
  end
end
