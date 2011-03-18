class RelationshipsController < ApplicationController
  before_filter :have_to_be_admin, :only => [:destroy, :create]

  def destroy
    @rel = Relationship.find_by_id(params[:id])
    if @rel.destroy
      redirect_to :back, :notice => "Relationship destroyed"
    end
  end

  def create
    @relationship = Relationship.new(params[:relationship])
    respond_to do |format|
      if @relationship.save
        format.js do
          flash[:notice] = "Person successfully added to movie"
          redirect_from_facebox movie_path(@relationship.movie)
        end
      end
    end
  end
end
