<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/resume">  
        <ul> 
		<xsl:for-each select="descendant::project">
            <xsl:if test="link"> <xsl:apply-templates select="link"/> </xsl:if>
		</xsl:for-each>
        </ul> 
</xsl:template>

<xsl:template match="link">  
    <li> <a href='{@url}' target='_new'><xsl:value-of select='@text'/></a> </li>
</xsl:template>

</xsl:stylesheet>
