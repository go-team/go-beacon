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
		render :json=>{success: 1}.to_json, :calback => params['callback']
	end

	def remove_device

		render :json=>{success: 1}.to_json, :calback => params['callback']
	end

	def delete
		@GroupController = Group.find_or_create_by_id(params[:id])
		@GroupController.destroy
		render :json=>{success: 1}.to_json, :calback => params['callback']
	end

end
