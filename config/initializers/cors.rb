Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
  origins "localhost:5173", "localhost:3000", "founderscard-clone-frontend.onrender.com"
    resource "*", headers: :any, credentials: true, methods: [ :get, :post, :patch, :put, :delete ]
  end
end
