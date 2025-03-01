class MembershipsController < ApplicationController
  def index
    @memberships = Membership.all
    render template: "memberships/index"
  end

  def show
    @membership = Membership.find_by(id: params[:id])
    render :show
  end

  def create
    @membership = Membership.new(
      membership_name: params[:membership_name],
      price: params[:price],
      benefits: params[:benefits],
    )
    @membership.save
    render :show
  end

  def update
    @membership = Membership.find_by(id: params[:id])
    @membership.update(
      membership_name: params[:membership_name] || @membership.membership_name,
      price: params[:price] || @membership.price,
      benefits: params[:benefits] || @membership.benefits,
    )
    render :show
  end

  def destroy
    @membership = Membership.find_by(id: params[:id])
    @membership.destroy
    render json: { message: "Membership Deleted" }
  end
end
