class WelcomeController < ApplicationController
  def say_hello
    @gossips = Gossip.all
  end
end
