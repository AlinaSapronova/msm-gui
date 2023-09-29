Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })
# Director routes ___________________________________
  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })
  post("/insert_director", { :controller => "directors", :action => "create" })
  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  post("/modify_director/:path_id", { :controller => "directors", :action => "update" })
  get("/delete_director/:path_id", { :controller => "directors", :action => "destroy" })
# Movies routes ______________________________________
  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  post("/insert_movie", {:controller => "movies", :action => "create"})
  post("/modify_movie/:path_id", {:controller => "movies", :action => "update"})
  get("/delete_movie/:path_id", {:controller => "movies", :action => "destroy"})

# Actors routes______________________________________
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post("/insert_actor", {:controller => "actors", :action => "create"})
  post("/modify_actor/:path_id", {:controller => "actors", :action => "update"})
  get("/delete_actor/:path_id",{:controller => "actors", :action => "destroy"})



end
