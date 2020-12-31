Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "users#new"
  scope(path_names: { new: 'novo', edit: 'editar' }) do
    draw :guest_routes
    draw :user_routes
    draw :admin_routes
  end
end
