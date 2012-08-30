class LocationController < ApplicationController
  def update
    user = User.where(:facebook_id => params[:facebook_id]).first || nil
    user.update_attribute(:current_location_id, params[:current_location_id])

    # 近くにいるpecori可能なユーザを返す
    near_users = User.find_all_by_current_location_id(params[:current_location_id])
    render :json => {:message => "ok", :near_users = near_users}
  end
end
