Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  get("/", { :controller => "pictures" , :action => "index"})
  
  get("/photos", { :controller => "pictures" , :action => "index"})
  
  get("/photos/new", { :controller => "pictures", :action => "add_new_photo"})
  
  get("/create_photo", { :controller => "pictures", :action => "photo_created"})
  
  get("/photos/:id_number", { :controller => "pictures", :action => "show_details"})
  
  get("/photos/:photo_id/edit", { :controller => "pictures", :action => "edit_photos"})
  
  get("/update_photo/:pic_id", { :controller => "pictures", :action => "updated_row"})
  
  get("/delete_photo/:photo_id", { :controller => "pictures", :action => "delete_row"})
  
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
