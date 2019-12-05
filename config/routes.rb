Rails.application.routes.draw do
  root :to => "users#index"
  # Routes for the Restriction resource:

  # CREATE
  get("/restrictions/new", { :controller => "restrictions", :action => "new_form" })
  post("/create_restriction", { :controller => "restrictions", :action => "create_row" })

  # READ
  get("/restrictions", { :controller => "restrictions", :action => "index" })
  get("/restrictions/:id_to_display", { :controller => "restrictions", :action => "show" })

  # UPDATE
  get("/restrictions/:prefill_with_id/edit", { :controller => "restrictions", :action => "edit_form" })
  post("/update_restriction/:id_to_modify", { :controller => "restrictions", :action => "update_row" })

  # DELETE
  get("/delete_restriction/:id_to_remove", { :controller => "restrictions", :action => "destroy_row" })

  #------------------------------

  # Routes for the User resource:

  # CREATE
  get("/users/new", { :controller => "users", :action => "new_form" })
  post("/create_user", { :controller => "users", :action => "create_row" })

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  # UPDATE
  get("/users/:prefill_with_id/edit", { :controller => "users", :action => "edit_form" })
  post("/update_user/:id_to_modify", { :controller => "users", :action => "update_row" })

  # DELETE
  get("/delete_user/:id_to_remove", { :controller => "users", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
