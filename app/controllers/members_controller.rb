class MembersController < ApplicationController
  def index
    @members = Member.all
    render :index
  end

  def create
    @member = Member.new(
      name: params[:name],
      email: params[:email],
      password_digest: params[:password_digest],
      membership: params[:membership]
    )
    if member.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end


  def update
    @member = Member.find_by(id: params[:id])
    @member.update(
      name: params[:name] || @member.name,
      email: params[:email] || @member.email,
      password_digest: params[:password_digest] || @member.password_digest,
      membership: params[:membership] || @member.membership,
    )
    @member.save
    render :show
  end

  def destroy
    @member = Member.find_by(id: params[:id])
    @member.destroy
    render json: { message: "Membership Cancelled" }
  end
end
