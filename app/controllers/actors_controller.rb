class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def create
    @new_actor = Actor.new
    @new_actor.name = params.fetch("query_name")
    @new_actor.dob = params.fetch("query_dob")
    @new_actor.bio = params.fetch("query_bio")
    @new_actor.image = params.fetch("query_image")
    @new_actor.save

    if @new_actor.valid?
      @new_actor.save
      redirect_to("/actors/#{@new_actor.id}", { :notice => "Actor created successfully."} )
    else
      redirect_to("/actors/#{@new_actor.id}", { :alert => "Actor failed to create successfully." })
    end
  end

  def update
    actor_id = params.fetch("path_id")
    @the_actor = Actor.where({:id => actor_id})[0]

    @the_actor.name = params.fetch("query_name")
    @the_actor.dob = params.fetch("query_dob")
    @the_actor.bio = params.fetch("query_bio")
    @the_actor.image = params.fetch("query_image")
   

    if @the_actor.valid?
      @the_actor.save
      redirect_to("/actors/#{@the_actor.id}", { :notice => "Actor updated successfully."} )
    else
      redirect_to("/actors/#{@the_actor.id}", { :alert => "Actor failed to update successfully." })
    end

  end

  def destroy
    actor_id = params.fetch("path_id")
    @the_actor = Actor.where({:id => actor_id})[0]

    @the_actor.destroy

    redirect_to("/actors")
  end



end
