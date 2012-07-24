<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 

<xsl:strip-space elements="achievement" />

<xsl:output method="html"/>

<xsl:template match="/resume">  

    <html>
    <head>
      <link href='http://fonts.googleapis.com/css?family=Simonetta' rel='stylesheet' type='text/css'/>
      <link href='/stylesheets/base.css' rel='stylesheet' type='text/css'/>
      <link href='/stylesheets/lightview.css' rel='stylesheet' type='text/css'/>
      <title><xsl:value-of select="$owner"/> : Project Showcase</title>
      <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/prototype/1/prototype.js'></script>
      <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/scriptaculous/1/scriptaculous.js'></script>
      <script type='text/javascript' src='/javascripts/lightview.js'></script>
      <script type='text/javascript' src='/javascripts/analytics.js'></script>
    </head>

    <body>
        <div id='project'>

            <xsl:apply-templates
                select="experience/employer/position/project[@name=$project]"/> 
                
        </div>

        <div id="resumatic-plug">
          Powered by <a href="https://github.com/inkredabull/resumatic" target="_blank">Resumatic</a>
        </div>

    </body>

  </html>

</xsl:template> 

<xsl:template match="project">

    <h2 id="title"> 
      <xsl:value-of select="@title"/>
    </h2>

    <xsl:if test="count(technologies/technology) > 0">
        <div id="technologies"> 
        <xsl:for-each select="technologies/technology">
            <xsl:sort select="."/>
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
                <xsl:text> | </xsl:text>
            </xsl:if>
        </xsl:for-each>
        </div> 
    </xsl:if>

    <div id="portfolio_page_top">
        <div class='portfolioHeaderLeftCol'>
            <h2>Summary</h2>
            <xsl:copy-of select="normalize-space(summary)"/>.
        </div>
        <div class='portfolioHeaderRightCol'>
            <img alt='{@name} icon' src='/images/{@name}_80x80.jpg' 
                class='portfolio_large'/>
        </div>
        <div style="clear:both;"/>
    </div>

    <xsl:if test="count(achievements/achievement) > 0">
    <div>
        <h2>Achievements</h2>
        <ul>
            <xsl:for-each select="achievements/achievement">
              <li>
                  <xsl:value-of select="normalize-space(.)" disable-output-escaping="yes"/>
              </li>
            </xsl:for-each>
        </ul>
    </div>
    </xsl:if>

    <xsl:if test="count(contributions/contribution) > 0">
    <div>
        <h2>Contributions</h2>
        <ul>
            <xsl:for-each select="contributions/contribution">
                <li><xsl:value-of select="normalize-space(.)"/></li>
            </xsl:for-each>
        </ul>
    </div>
    </xsl:if>

    <xsl:if test="description">
    <div id="description">
        <h2>Description</h2>
        <xsl:copy-of select="description"/>
    </div>
    </xsl:if>

    <div id="link">
        <xsl:apply-templates select="link"/>
    </div>

</xsl:template>

<xsl:template match="link">
    <a href='{@url}' target='_new'><xsl:value-of select='@text'/></a>
</xsl:template>

</xsl:stylesheet> 
