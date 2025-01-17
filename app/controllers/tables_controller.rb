class TablesController < ApplicationController
  before_action :user_login

  def new
    @table = Table.new
  end

  def create
    @table.new
    respond_to do |format|
      if @table.save(table_params)
        format.html(redirect_to company_project_path, notice: "登録しました。新規にカラムも追加してください")
      else
        format.html(render :new)
      end
    end
  end

  def show
    @table = Table.find(params[:id])
    @columns = Column.where(:table_id => params[:id])
  end

  def edit
    @columns = Column.where(:table_id => params[:id])
    @table = Table.find(params[:id])
  end

  def update
    @table= Table.find(params[:id])
    respond_to do |format|
      if @table.update(table_params)
        format.html {redirect_to project_table_path(params[:id]), notice: "更新しました"}
        format.json{}
      else
        format.html{render :edit}
      end
    end
  end

  private

  def table_params
    params.require(:table).permit(:physical_name, :logical_name, columns_attributes: [:id, :physical_name, :logical_name, :data_type, :null_false, :default_value, :foreign_key, :_destroy])
  end

  def user_login
    if !current_user
      redirect_to user_session_path, notice: "ログインしてください"
    end
  end
end
