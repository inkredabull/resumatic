<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:param name="version">short</xsl:param>

<xsl:template match="/resume">
<!--
	<html>
	<head>
		<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.8.0r4/build/reset/reset-min.css" /> 
		<link rel="stylesheet" type="text/css" href="resume.css" />
	</head>
	<body>

		<div>HEADER</div>
        -->

		<div id="resume">
		<!--
		<span id="version">Version: 
			<a href=''>
			<xsl:choose>
				<xsl:when test="$version = 'short'">Long</xsl:when>
				<xsl:when test="$version = 'long'">Short</xsl:when>
			</xsl:choose>
			</a>
		</span>
		-->
		<table>
			<tr> <xsl:apply-templates select="objective"/> </tr>

			<tr class="spacer"/>

			<xsl:if test="$version = 'long'">
			<tr> <xsl:apply-templates select="strengths"/> </tr>
			<tr class="spacer"/>
			</xsl:if>

			<tr> <xsl:apply-templates select="experience"/> </tr>
			<tr class="spacer"/>

			<tr> <xsl:apply-templates select="education"/> </tr>
			<tr class="spacer"/>

			<tr> <xsl:apply-templates select="honors"/> </tr>
			<tr class="spacer"/>

		<xsl:if test="$version = 'long'">
			<tr> <xsl:apply-templates select="presentations"/> </tr>
			<tr class="spacer"/>

			<tr> <xsl:apply-templates select="languages"/> </tr>

		</xsl:if>

		</table>
		</div>

<!--
		<div>FOOTER</div>
	</body>
	</html>
    -->

</xsl:template>

<xsl:template match="objective">
	<td class="topic"> 
		<xsl:value-of select="name()"/>
	</td>
	<td class="content"> 
		<xsl:value-of select="."/>
	</td>
</xsl:template>

<xsl:template match="experience">
	<td class="topic"> <xsl:value-of select="name()"/> </td>
	<td class="content">
		<xsl:for-each select="employer/position">
			<xsl:if test="count(project[@paid=1])">
			<h3><xsl:value-of select="@name"/>

            <xsl:if test="$version = 'long'"> 
                <xsl:if test="team"> (<xsl:value-of select="team"/>,) </xsl:if>
                <xsl:if test="not(team)">, </xsl:if>
            </xsl:if>
            <xsl:if test="$version != 'long'">, </xsl:if>

            <xsl:value-of select="../@name"/>, <xsl:value-of select="location"/> (<xsl:value-of select="start"/> to <xsl:value-of select="end"/>)</h3>
			<ul>
				<xsl:for-each select="project[@paid=1]">
					<li><xsl:value-of select="summary"/>.</li>

					<xsl:if test="$version = 'long'">
						<xsl:apply-templates select="achievements"/>
					</xsl:if>

				</xsl:for-each>
			</ul>
			</xsl:if>
		</xsl:for-each>
	</td>
</xsl:template>

<xsl:template match="achievements">
	<ul>
	<xsl:for-each select="achievement">
		<li><xsl:value-of select="."/>.</li>
	</xsl:for-each>
	</ul>
</xsl:template>

<xsl:template match="languages">
	<td class="topic">
		<xsl:value-of select="name()"/>
	</td>
	<td class="content">
		<div id="languages">
		<table>
		<tr>

		<xsl:for-each select="language">
			<xsl:variable name="td_class"> <xsl:if test="position() != last()">language_side</xsl:if></xsl:variable>
			<td class="{$td_class}">
				<xsl:value-of select="."/> <xsl:if test="@level"> (<xsl:value-of select="@level"/>)</xsl:if>
			</td>
		</xsl:for-each>
		</tr>
		</table>
		</div>
	</td>
</xsl:template>

<xsl:template match="strengths">
	<td class="topic">
		<xsl:value-of select="name()"/>
	</td>
	<td class="content">
		<ul>
		<xsl:for-each select="strength">
			<li> <xsl:value-of select="."/> </li> 
		</xsl:for-each>
		</ul>
	</td>
</xsl:template>

<xsl:template match="education">
	<td class="topic">
		<xsl:value-of select="name()"/>
	</td>
	<td class="content">
		<xsl:for-each select="institution">
            <!--<xsl:if test="@long = 1">-->
			<h3><xsl:value-of select="."/></h3>
				<xsl:if test="@note">
				<ul>
					<li><xsl:value-of select="@note"/></li>
				</ul>
				</xsl:if>
            <!--</xsl:if>-->
		</xsl:for-each>
	</td>
</xsl:template>

<xsl:template match="presentations">
	<td class="topic">
		<xsl:value-of select="name()"/>
	</td>
	<td class="content">
		<ul>
		<xsl:for-each select="presentation/title">
			<li> 
				<xsl:if test="@URL"> </xsl:if> 
				<xsl:value-of select="."/> 
			</li> 
		</xsl:for-each>
		</ul>
	</td>
</xsl:template>

<xsl:template match="honors">
	<td class="topic">
		<xsl:value-of select="name()"/>
	</td>
	<td class="content">
		<xsl:for-each select="honor">
			<div> <xsl:value-of select="."/> </div> 
		</xsl:for-each>
	</td>
</xsl:template>

</xsl:stylesheet>
