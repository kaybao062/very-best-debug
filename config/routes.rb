Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "all_users" })
  get("/users", { :controller => "users", :action => "all_users" })
  get("/users/:username", { :controller => "users", :action => "users_details" })
  post("/insert_user_record", { :controller => "users", :action => "create" })
  post("/update_user/:user_name", { :controller => "users", :action => "update" })

  get("/venues", { :controller => "venues", :action => "venue_list" })
  post("/insert_venue_record", { :controller => "venues", :action => "create" })
  get("/venues/:venue_id", { :controller => "venues", :action => "show" })
  post("/update_venue/:an_id", { :controller => "venues", :action => "update" })
  get("/delete_venue/:an_id", { :controller => "venues", :action => "destroy" })
  
  post("/insert_comment_record", { :controller => "comments", :action => "create" })
end
