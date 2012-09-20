class VotesController < ApplicationController

  before_filter :require_user
  before_filter :require_admin ,:only => [:index,:show,:destroy]
  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @votes }
    end
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
    @vote = Vote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vote }
    end
  end

  # GET /votes/new
  # GET /votes/new.json
  def new
    #@vote = Vote.new

    create
    #respond_to do |format|
    #  format.html # new.html.erb
    #  format.json { render json: @vote }
    #end


  end

  # GET /votes/1/edit
  def edit
    @vote = Vote.find(params[:id])
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(params[:vote])
    if params[:comment_id]
      @vote.comment_id = params[:comment_id]
      @comment = Comment.find(params[:comment_id])
      @post = @comment.post
    else
      @vote.post_id = params[:post_id]
      @post = Post.find(params[:post_id])
    end


    @vote.user_id = current_user.id

    respond_to do |format|
      if @vote.save
        @post.touch
        format.html { redirect_to @post, notice: 'Vote was successfully created.' }
        format.json { render json: @post, status: :created, location: @vote }
      else
        format.html { render action: "new" }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /votes
  # POST /votes.json
  def create_vote_for_post (post_id)
    @vote = Vote.new(params[:vote])
    @vote.post_id = post_id
    @vote.user_id = current_user.id

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render json: @vote, status: :created, location: @vote }
      else
        format.html { render action: "new" }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /votes/1
  # PUT /votes/1.json
  def update
    @vote = Vote.find(params[:id])

    respond_to do |format|
      if @vote.update_attributes(params[:vote])
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy

    respond_to do |format|
      format.html { redirect_to votes_url }
      format.json { head :no_content }
    end
  end
end
