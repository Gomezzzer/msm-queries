class DirectorsController < ApplicationController

  def index
  #  @List_of_directors = Director.all

  render({ :template => "director_templates/list"})
  end

  def wisest
    @oldest = Director.where.not({ :dob => nil }).order({ :dob => :asc }).at(0)

    render({ :template => "director_templates/eldest.hmtl.erb" })
  end

 def youngest
   @youngest = Director.order({ :dob => :desc }).at(0)

   render({ :template => "director_templates/youngest.html.erb" })
 end

 def show 
  # params looks like this {"an_id"=>"42"}

 the_id =  params.fetch("the_id")

 @the_director = Director.where({ :id => the_id }).at(0) 
 @filmography =  Movie.where({ :director_id => @the_director.id })
 
  render({ :template => "director_templates/details" })
end

end
