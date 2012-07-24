<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:key name="uniqTechKey" match="technologies" use="./technology"/>

<xsl:template match="/resume">  

    <div id='skills'>
        <ul>
        <xsl:for-each select="//technology[not(.=preceding::technology)]">
            <xsl:sort select="."/> 
            <li> <xsl:value-of select="."/> </li>
		</xsl:for-each>
        </ul>
    </div>
</xsl:template>

</xsl:stylesheet>
