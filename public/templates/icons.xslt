<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/resume">  
    <div id='portfolio'>
		<xsl:for-each select="descendant::project">
        
        <xsl:if test="@name != ''"> 
            <a href='/?page_id=334&amp;project={@name}'>
                <img
                alt='{@name} icon' src='../wp-content/themes/bull/images/portfolio/{@name}_80x80.jpg'/>
            </a>
        </xsl:if>

		</xsl:for-each>
    </div>
</xsl:template>

</xsl:stylesheet>
