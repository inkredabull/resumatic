<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" encoding="utf-8" indent="yes" />

<!-- no default -->
<xsl:param name="project" value="argus"/>

<xsl:template match="/resume">

    <xsl:apply-templates
    select="experience/employer/position/project[@name=$project]"/> 

</xsl:template>
     
<xsl:template match="project">

    <h2 id="title"> <xsl:value-of select="@title"/></h2>

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
            <xsl:value-of select="summary"/>.
        </div>
        <div class='portfolioHeaderRightCol'>
            <img alt='{@name} icon' src='../wp-content/themes/bull/images/portfolio/{@name}_80x80.jpg' 
                class='portfolio_large'/>
        </div>
    </div>

    <xsl:if test="background">
    <div id="background">
        <h2>Background</h2>
        <xsl:value-of select="background" disable-output-escaping="yes"/>
    </div>
    </xsl:if>

    <xsl:if test="count(achievements/achievement) > 0">
    <div>
        <h2>Achievements</h2>
        <ul>
            <xsl:for-each select="achievements/achievement">
                <li><xsl:value-of select="." disable-output-escaping="yes"/>.</li>
            </xsl:for-each>
        </ul>
    </div>
    </xsl:if>

    <xsl:if test="count(contributions/contribution) > 0">
    <div>
        <h2>Other Contributions</h2>
        <ul>
            <xsl:for-each select="contributions/contribution">
                <li><xsl:value-of select="."/>.</li>
            </xsl:for-each>
        </ul>
    </div>
    </xsl:if>

    <div id="link">
        <xsl:apply-templates select="link"/>
    </div>

</xsl:template>

<xsl:template match="link">
    Link: <a href='{@url}' target='_new'><xsl:value-of select='@text'/></a>
</xsl:template>

</xsl:stylesheet>
