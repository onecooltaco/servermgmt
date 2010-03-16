class ServerInterfacesController < ApplicationController

  def show
    @server = Server.find(params[:server_id])
    @server_interface = ServerInterface.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def update
    @server = Server.find(params[:server_id])
    @server_interface = ServerInterface.find(params[:id])

    respond_to do |format|
      if @server_interface.update_attributes(params[:server_interface])
        flash[:notice] = 'Interface was successfully updated.'
        format.html { redirect_to(@server) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def edit
    @server = Server.find(params[:server_id])
    @server_interface = ServerInterface.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def destroy
    @server = Server.find(params[:server_id])
    @server_interface = ServerInterface.find(params[:id])
    @server_interface.destroy
    respond_to do |format|
      flash[:notice] = 'Interface was successfully deleted.'
      format.html { redirect_to(@server) }
    end
  end
end