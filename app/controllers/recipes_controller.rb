class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    # at some point this becomes
    #@recipes = Recipe.all.sort_by{|likes| likes.thumbs_up_total}.reverse
    #@recipes = Recipe.all
    @recipes = Recipe.paginate(page: params[:page], per_page: 4)
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    #@recipes = recipes.paginate(page: params[:page], per_page: 3)
    @recipe = Recipe.find(params[:id])
    #@recipe = Recipe.find(11)
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = current_user

    if @recipe.save
      flash[:success] = "Your recipe was created successfully"
      redirect_to recipes_path
    else
      render :new
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:success] = "Your recipe was updated successfully"
      redirect_to recipe_path(@recipe)
     else
      render :edit
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def like
    @recipe = Recipe.find(params[:id])
    like.new(like: params[:like], chef: Chef.first, recipe: @recipe)
    #like.save
    flash[:success] = "Your selection was successful"
    #binding.pry
    redirect_to :back
  end
  
  def unlike
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description, :chef_id, :picture)
    end
    
    def require_same_user
      if current_user != @chef
        flash[:danger] = "You can't mess with other people's stuff!"
        redirect_to root_path
      end
    end
    

end
