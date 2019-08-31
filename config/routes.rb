Rails.application.routes.draw do
  root :to => "measurements#index"
  # Routes for the Measurement resource:

  # CREATE
  get("/measurements/new", { :controller => "measurements", :action => "new_form" })
  post("/create_measurement", { :controller => "measurements", :action => "create_row" })

  # READ
  get("/measurements", { :controller => "measurements", :action => "index" })
  get("/measurements/:id_to_display", { :controller => "measurements", :action => "show" })

  # UPDATE
  get("/measurements/:prefill_with_id/edit", { :controller => "measurements", :action => "edit_form" })
  post("/update_measurement/:id_to_modify", { :controller => "measurements", :action => "update_row" })

  # DELETE
  get("/delete_measurement/:id_to_remove", { :controller => "measurements", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
