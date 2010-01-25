class UploadController < ApplicationController
  
  before_filter :select_current_tab

  def simple_upload
  end
  
  def javascript_upload
  end

  def flash_upload
  end

  private

  def select_current_tab
    set_tab action_name.to_sym
  end

end
