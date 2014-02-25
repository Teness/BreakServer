class UsersController < ApplicationController
  protect_from_forgery :except => [:createOrUpdate, :getUserByPhoneID]
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
      format.xml { render xml: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
      format.xml { render xml: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
      format.xml { render xml: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
        format.xml { render xml: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.xml { render xml: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def createOrUpdatePage
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # createOrUpdatePage.html.erb
      format.json { render json: @user }
      format.xml { render xml: @user }
    end
  end

  def getUserByPhoneID
    @user = User.find_by_phoneID params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
      format.xml { render xml: @user }
    end
  end

  # POST /createOrUpdate
  # POST /createOrUpdate.xml
  # POST /createOrUpdate.json
  def createOrUpdate
    user = User.new(params[:user])

    old_user = User.find_by_phoneID user.phoneID

    if old_user != nil
      puts old_user.name
      respond_to do |format|
        if old_user.update_attributes(params[:user])
          format.html { redirect_to old_user, notice: 'User was successfully updated.' }
          format.json { render json: old_user}
          format.xml { render xml: old_user}
        else
          format.html { render action: "new" }
          format.json { render json: old_user.errors, status: :unprocessable_entity }
          format.xml { render xml: old_user.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if user.save
          format.html { redirect_to user, notice: 'User was successfully created.' }
          format.json { render json: user, status: :created, location: user }
          format.xml { render xml: user, status: :created, location: user }
        else
          format.html { render action: "new" }
          format.json { render json: user.errors, status: :unprocessable_entity }
          format.xml { render xml: user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
        format.xml { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.xml { render xml: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
      format.xml { head :no_content }
    end
  end
end
