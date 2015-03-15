class GroupController < ApplicationController

	def create
		@Group = Group.create
		puts @Group
		render :json=>{id: @Group.id}.to_json, :calback => params['callback']
	end

	def set_callback
		@Group = Group.find_or_create_by_id(params[:id])
		@Group.update_attribute(:callback_url, params[:callback])
		render :json=>{success: 1}.to_json, :calback => params['callback']
	end

	def send_callback(uuid, msg)
		@Group = Group.find_or_create_by_id(params[:id])
		put @Group.callback_url, {uuid: uuid, msg: msg}.to_json
		render :json=>{success: 1}.to_json, :calback => params['callback']
	end

	def add_device
		@Group = Group.find_or_create_by_id(params[:id])
		@Group.devices << Device.find_or_create_by_uuid(params[:uuid])
		render :json=>{success: 1}.to_json, :calback => params['callback']
	end

	def remove_device
		@Group = Group.find_or_create_by_id(params[:id])
		@Group.devices.destroy Device.find_or_create_by_uuid(params[:uuid])
		render :json=>{success: 1}.to_json, :calback => params['callback']
	end

	def delete
		@Group = Group.find_or_create_by_id(params[:id])
		@Group.destroy
		render :json=>{success: 1}.to_json, :calback => params['callback']
	end

end
