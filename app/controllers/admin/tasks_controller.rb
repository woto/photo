class Admin::TasksController < Admin::ApplicationController
  # GET /admin_tasks
  # GET /admin_tasks.xml
  def index
    #@admin_tasks = Admin::Task.all

    @tasks_grid = initialize_grid(Task)


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_tasks }
    end
  end

  # GET /admin_tasks/1
  # GET /admin_tasks/1.xml
  def show
    @task = Admin::Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /admin_tasks/new
  # GET /admin_tasks/new.xml
  def new
    @task = Admin::Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /admin_tasks/1/edit
  def edit
    @task = Admin::Task.find(params[:id])
  end

  # POST /admin_tasks
  # POST /admin_tasks.xml
  def create
    @task = Admin::Task.new(params[:task])

    respond_to do |format|
      if @task.save
        flash[:notice] = 'Admin::Task was successfully created.'
        format.html { redirect_to(@task) }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin_tasks/1
  # PUT /admin_tasks/1.xml
  def update
    @task = Admin::Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        flash[:notice] = 'Admin::Task was successfully updated.'
        format.html { redirect_to(@task) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_tasks/1
  # DELETE /admin_tasks/1.xml
  def destroy
    @task = Admin::Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(admin_tasks_url) }
      format.xml  { head :ok }
    end
  end
end
