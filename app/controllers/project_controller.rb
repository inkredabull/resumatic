require 'rubygems'
require 'xml/xslt'

class ProjectController < ApplicationController

  def show 
    @project_id = params[:id]
    render :inline => xslt( "#{Rails.root}/data/resume.xml", 
      "#{Rails.root}/public/templates/project/index.xslt"), 
      :content_type => 'text/html'
  end

  private 

  def xslt(_xml, _xslt)
    xlt = XML::XSLT.new
    xlt.parameters = { 'project' => @project_id, 'owner' => site_owner }
    xlt.xml = render_to_string :xml => _xml
    xlt.xsl = _xslt
    xlt.serve
  end

end
