Rails.application.routes.draw do
  post 'order/create', to: 'order#create'
end
