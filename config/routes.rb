Rails.application.routes.draw do

  scope :module => "etabliocms_pages" do
    namespace :admin do
      resources :pages do
        member do
          put :move
        end
      end
    end
  end

end
