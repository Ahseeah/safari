class AnimalsController < ApplicationController
  # GET /animals
  def index
    @animals = Animal.all


    render json: @animals
  end

  # def index
  #   species = params[:species]
  #   if species
  #   @animals = Animal.all.where("species ilike ?", "%#{species}%")
  #   else
  #     @animals = Animal.all
    
  #   end
  #   render json: @animals
  # end

  # def index
  #   location = params[:location]
  #   if location
  #   @animals = Animal.all.where("last_seen_location ilike ?", "%#{location}%")
  #   else
  #     @animals = Animal.all
    
  #   end
  #   render json: @animals
  # end

  # GET /animals/1

  def show
    @animal = Animal.find(params[:id])
  
    @animals = Animal.all
  

    render json: @animal
  end

  def show
    animal_id = params[:id]
    @animal = Animal.find(animal_id)
    render json: @animal
  end

  # POST /animals
  def create
    @animal = Animal.new(animal_params)

    if @animal.save
      render json: @animal, status: :created, location: @animal
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /animals/1
  def increment
    @animal = Animal.find(params[:id])
    @animal.seen_count += 1

      #  if answer == "increment"
  #    puts "Enter the species you are looking for:"
   #   species = gets.chomp.downcase
   #   animal = Animal.find_by("species": species)
   #   animal.seen_count += 1
   #   animal.save
   #   puts "#{animal.species} count:#{animal.seen_count}"

    if @animal.save
      render json: @animal
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  def update
    @animal = Animal.find(params[:id])

    if @animal.update(animal_params)
      render json: @animal
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /animals/1
  def destroy
    @animal = Animal.find(params[:id])

    @animal.destroy
  end

  private

  # Only allow a trusted parameter "white list" through.
  def animal_params
    params.require(:animal).permit(:species, :last_seen_location, :seen_count)
  end
end



  # Get all the animals in the system

    # ask the database (MODELnamed Animal)
   

    # create JSON of all those animals (VIEW)
    

    # the above is the shortcut for:
    # render({json: all_the_animals})


# READ: Show information about ONE animal

  # get the id parameter from what the user sent us
  # and store the animal_id


  # find animals is database
 

  # give

# 'CRUD'

# 'CREATE'

# 'READ'

# 'UPDATE'

# 'DELETE'
