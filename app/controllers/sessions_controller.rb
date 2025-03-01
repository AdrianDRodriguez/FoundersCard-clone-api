class SessionsController < ApplicationController
  def create
    member = Member.find_by(email: params[:email])
    if member && member.authenticate(params[:password])
      jwt = JWT.encode(
        {
          member_id: member.id, # the data to encode
          exp: 24.hours.from_now.to_i # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )
      render json: { jwt: jwt, email: member.email, member_id: member.id }, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end
end
