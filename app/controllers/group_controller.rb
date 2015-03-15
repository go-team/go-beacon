class GroupController < ApplicationController

	def create
		@GroupController = Group.create
		puts @GroupController
		render :json=>{id: @GroupController.id}.to_json, :calback => params['callback']
	end

	def set_callback
		@GroupController = Group.find_or_create_by_id(params[:id])
		@GroupController.update_attribute(:callback_url, params[:callback])
		render :json=>{success: 1}.to_json, :calback => params['callback']
	end

	def add_device
		@GroupController = Group.find_or_create_by_id(params[:id])
		@GroupController.devices << Device.find_or_create_by_uuid(params[:uuid])
		render :json=>{success: 1}.to_json, :calback => params['callback']
	end

	def remove_device
		@GroupController = Group.find_or_create_by_id(params[:id])
		@GroupController.devices.destroy Device.find_or_create_by_uuid(params[:uuid])
		render :json=>{success: 1}.to_json, :calback => params['callback']
	end

	def delete
		@GroupController = Group.find_or_create_by_id(params[:id])
		@GroupController.destroy
		render :json=>{success: 1}.to_json, :calback => params['callback']
	end

end
