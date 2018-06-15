class ProcessController < ApplicationController
  def index
    if params[:new]=="false"
      @id=params[:id]
      @company=Company.find(@id)
    end
    
  end
end
