<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 

<xsl:strip-space elements="*"/>

<xsl:output method="html" version="4.0" encoding="iso-8859-1" />

<xsl:template match="/resume">

  <html>
    <head>
      <link href='http://fonts.googleapis.com/css?family=Simonetta' rel='stylesheet' type='text/css'></link>
      <link href='/stylesheets/base.css' rel='stylesheet' type='text/css'></link>
      <title><xsl:value-of select="$owner"/> : Portfolio</title>
      <script type='text/javascript' src='/javascripts/analytics.js'></script>
    </head>

    <body>
        <div id='portfolio'>
          <h1>
            Portfolio for <xsl:value-of select="$owner"/>
          </h1>

          <div id='contact'>
            <xsl:value-of select="$email"/>
          </div>

          <xsl:for-each select="descendant::employer/position/team">
           <div class="team">
            <h2>
              <xsl:value-of select="../../@name"/>
            </h2>
            <h3>
              <xsl:value-of select="."/> (<xsl:value-of select="../start"/>-<xsl:value-of select="../end"/>)
            </h3>
            <hr/>
            <xsl:for-each select="../project">
              <xsl:if test="@name != '' and @private = 0"> 
                <div class="inline-block">
                  <a href='/project/{@name}'>
                      <img alt='{@name} icon' src='images/{@name}_80x80.jpg'/>
                  </a> 
                </div>
                <div class="technology-cloud inline-block">
                  <xsl:for-each select="technologies/technology">
                    <xsl:value-of select="."/> 
                    <xsl:if test="position() != last()">
                        <xsl:text> | </xsl:text>
                    </xsl:if>
                  </xsl:for-each>
                </div>
              </xsl:if>
            </xsl:for-each>
           </div>
          </xsl:for-each>
        </div>

        <div id="resumatic-plug">
          Powered by <a href="https://github.com/inkredabull/reumatic" target="_blank">Resumatic</a>
        </div>

    </body>

    </html>

</xsl:template> 

</xsl:stylesheet> 
