class MembersController < ApplicationController
  def index
    @members = Member.all
    render :index
  end

  def show
    @member = Member.find_by(id: params[:id])
    render :show
  end

  def create
    @member = Member.new(
      name: params[:name],
      email: params[:email],
      password_digest: params[:password_digest],
      membership: params[:membership]
    )
    @member.save
    render :show
  end

  def update
    @member = Member.find_by(id: params[:id])
    @member.update(
      name: params[:name] || @member.name,
      email: params[:email] || @member.email,
      password_digest: params[:password_digest] || @member.password_digest,
      membership: params[:membership] || @member.membership,
    )
    render :show
  end

  def destroy
    @member = Member.find_by(id: params[:id])
    @member.destroy
    render json: { message: "Membership Cancelled" }
  end
end
