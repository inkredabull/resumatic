require 'rubygems'
require 'xml/xslt'

class IndexController < ApplicationController

  def index 
    render :inline => xslt( "#{Rails.root}/data/resume.xml", 
      "#{Rails.root}/public/templates/welcome/index.xslt"),
      :content_type => 'text/html'
  end

  private 

  def xslt(_xml, _xslt)
    xlt = XML::XSLT.new
    xlt.parameters = { 'owner' => site_owner, 'email' => site_email }
    xlt.xml = render_to_string :xml => _xml
    xlt.xsl = _xslt
    xlt.serve
  end

end
