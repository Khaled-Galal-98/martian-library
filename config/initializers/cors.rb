Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'  if Rails.env.development?
      resource '*', headers: :any, methods: [:get, :post]
    end
  end