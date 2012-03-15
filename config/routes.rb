Rails.application.routes.draw do

  scope :module => "etabliocms_pages" do
    namespace :admin do
      resources :pages do
        member do
          put :move
          post :update_attachments
        end
      end
    end
  end

end
