Spree::Core::Engine.add_routes do
  # Add your extension routes here
  namespace :admin, path: Spree.admin_path do
    resources :reports, only: [:index] do
      collection do
        get :out_of_stock_report
      end
    end
  end
end
