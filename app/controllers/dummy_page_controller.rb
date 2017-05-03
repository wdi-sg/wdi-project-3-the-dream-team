class DummyPageController < ApplicationController
  def index
    @dummies = DummyModel.all
  end
end
