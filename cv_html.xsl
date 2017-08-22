<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="ISO-8859-1"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="yes"/>
	<xsl:template match="cv">
		<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
			<head>
				<title>CV: <xsl:apply-templates select="name"/>
				</title>
				<link href="cv.css" type="text/css" rel="stylesheet"/>
				<style type="text/css">
					table.listing {background-color: rgb(248, 248, 248);}
					tr.table-odd {background-color: rgb(245, 245, 248); vertical-align:top; padding-top:103px; padding-bottom:13px}
					tr.table-even{vertical-align:top; padding-top:3px; padding-bottom:3px}
					img.portrait {padding-top:10px; float:right; width:43%}
					div.maxim {width: 100%; float:left; font-size:1.1em; color: rgb(150, 150, 150); padding-bottom: 2px; border-bottom: 5px solid rgb(204, 204, 204);}
					div.contentsection {width: 100%; float:left; padding-top:10px; padding-bottom:4px; border-bottom:1px solid #ccc;overflow:hidden}
					div.address {text-align: right}
					div.creation {width: 100%; float:left; font-size:0.8em; padding-bottom:0.5em}
					div.knowledge {width: 48%; float:left;  padding-bottom:3000px; margin-bottom:-2990px;  }
					div.technology {width: 50%; float:right; padding-bottom:3000px; margin-bottom:-2990px; margin-left:3px}
					div.halfpage{width: 350px; float:left}
					div.fullpage{width: 100%; float:left}
					a.email {color: rgb(150, 150, 150);font-size:0.9em;}
					a.web {color: rgb(150, 150, 150);font-size:0.9em;}
					span.contentname {font-weight: bold;}
					table.content {text-align: left; width: 100%; margin:2px;}
					ul.items{list-style:square outside; margin-top:0.1em; margin-bottom:0.3em; margin-left: 16px; padding: 0}
					td.title{width:120px; padding-top:5px; padding-bottom:5px; padding-right:15px;}
					td.value{padding-top:5px; padding-bottom:5px}
				</style>
			</head>
			<body>
				<div id="main">
					<xsl:call-template name="Header"/>

					<div class="maxim">
						<xsl:apply-templates select="maxim"/>
					</div>

					<div>
						<xsl:call-template name="Portrait"/>
						<div class="halfpage">
							<xsl:call-template name="Creation"/>
							<xsl:call-template name="PersonalData"/>
							<xsl:call-template name="Languages"/>
							<xsl:call-template name="School"/>
						</div>
					</div>
					<div class="fullpage">
						<xsl:call-template name="University"/>
						<xsl:call-template name="FurtherEducation"/>
						<xsl:call-template name="courses"/>
						<xsl:call-template name="activities"/>
						<xsl:call-template name="internship"/>
						<xsl:call-template name="work"/>
						<xsl:call-template name="project"/>
						<xsl:call-template name="knowledgetechnlogy"/>
						<div class="creation"> 
							Created using Ant and Saxon.
						</div>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="Header">
		<div style="overflow:hidden; ">
			<div
				style="float: left;  width: 300px; padding-bottom:3000px; margin-bottom:-2990px; padding-top:5px">
				<h1 style="">
					<xsl:apply-templates select="name"/>
				</h1>
				<div class="email">
					mail: 
					<a class="email">
						<xsl:attribute name="href">mailto:<xsl:value-of select="address/email"/>
						</xsl:attribute>
						<xsl:apply-templates select="address/email"/>
					</a>
				</div>
				<div class="web">
					web: 
					<a class="web">
						<xsl:attribute name="href">http://<xsl:value-of select="address/web"/>
						</xsl:attribute>
						<xsl:apply-templates select="address/web"/>
					</a>
				</div>
				<div class="web">
					blog: 
					<a class="web">
						<xsl:attribute name="href">http://<xsl:value-of select="address/blog"/>
						</xsl:attribute>
						<xsl:apply-templates select="address/blog"/>
					</a>
				</div>
			</div>
			<div style="float: right; padding-bottom:3000px; margin-bottom:-3000px;">
				<xsl:apply-templates select="address/addresspart"/>

			</div>
		</div>
	</xsl:template>

	<xsl:template name="Portrait">
		<img src="portrait.jpg" class="portrait"/>
	</xsl:template>

	<xsl:template name="PersonalData">
		<div class="contentsection">
			<span class="contentname">
				<xsl:value-of select="//sections/section[@name='personalData']"/>
			</span>
			<br/>
			<table class="content" cellspacing="0">
				<xsl:apply-templates select="personalData/items"/>
			</table>
		</div>
	</xsl:template>

	<xsl:template name="School">
		<div class="contentsection">
			<span class="contentname">
				<xsl:value-of select="//sections/section[@name='school']"/>
			</span>
			<br/>
			<table class="content" cellspacing="0">
				<xsl:apply-templates select="school/items"/>
			</table>
		</div>
	</xsl:template>

	<xsl:template name="Languages">
		<div class="contentsection">
			<span class="contentname">
				<xsl:value-of select="//sections/section[@name='languages']"/>
			</span>
			<br/>
			<table class="content" cellspacing="0">
				<xsl:apply-templates select="languages/items"/>
			</table>
		</div>
	</xsl:template>

	<xsl:template name="University">
		<div class="contentsection">
			<span class="contentname">
				<xsl:value-of select="//sections/section[@name='university']"/>
			</span>
			<br/>
			<table class="content" cellspacing="0">
				<xsl:apply-templates select="university/items"/>
			</table>
		</div>
	</xsl:template>

	<xsl:template name="FurtherEducation">
		<div class="contentsection">
			<span class="contentname">
				<xsl:value-of select="//sections/section[@name='furtherEducation']"/>
			</span>
			<br/>
			<table class="content" cellspacing="0">
				<xsl:apply-templates select="furtherEducation/items"/>
			</table>
		</div>
	</xsl:template>
	
	<xsl:template name="courses">
		<div class="contentsection">
			<span class="contentname">
				<xsl:value-of select="//sections/section[@name='courses']"/>
			</span>
			<br/>
			<table class="content" cellspacing="0">
				<xsl:apply-templates select="courses/items"/>
			</table>
		</div>
	</xsl:template>
	
	<xsl:template name="activities">
		<div class="contentsection">
			<span class="contentname">
				<xsl:value-of select="//sections/section[@name='activities']"/>
			</span>
			<br/>
			<table class="content" cellspacing="0">
				<xsl:apply-templates select="activities/items"/>
			</table>
		</div>
	</xsl:template>

	<xsl:template name="internship">
		<div class="contentsection">
			<span class="contentname">
				<xsl:value-of select="//sections/section[@name='internship']"/>
			</span>
			<br/>
			<table class="content" cellspacing="0">
				<xsl:apply-templates select="internship/items"/>
			</table>
		</div>
	</xsl:template>

	<xsl:template name="work">
		<div class="contentsection">
			<span class="contentname">
				<xsl:value-of select="//sections/section[@name='work']"/>
			</span>
			<br/>
			<table class="content" cellspacing="0">
				<xsl:apply-templates select="work/items"/>
			</table>
		</div>
	</xsl:template>

	<xsl:template name="project">
		<div class="contentsection">
			<span class="contentname">
				<xsl:value-of select="//sections/section[@name='project']"/>
			</span>
			<br/>
			<table class="content" cellspacing="0">
				<xsl:apply-templates select="project/items"/>
			</table>
		</div>
	</xsl:template>

	<xsl:template name="knowledgetechnlogy">
		<div class="contentsection">
			<div class="knowledge">
				<xsl:call-template name="knowledge"/>
			</div>
			<div class="technology">
				<xsl:call-template name="technology"/>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="knowledge">
		<div>
			<span class="contentname">
				<xsl:value-of select="//sections/section[@name='knowledge']"/>

			</span>
			<br/>
			<xsl:apply-templates select="knowledge"/>
		</div>
	</xsl:template>

	<xsl:template name="technology">
		<div>
			<span class="contentname">
				<xsl:value-of select="//sections/section[@name='technology']"/>
			</span>
			<br/>
			<xsl:apply-templates select="technology"/>
		</div>
	</xsl:template>

	<xsl:decimal-format name="euro" decimal-separator="," grouping-separator="." zero-digit="0"/>

	<xsl:template name="Creation">
		<xsl:variable name="date" select="current-dateTime()"/>
		<xsl:variable name="hours" select="hours-from-dateTime($date)"/>
		<xsl:variable name="minutes" select="minutes-from-dateTime($date)"/>
		<div class="creation"> 
			<xsl:value-of select="//sections/section[@name='lastUpdate']"/>
			<xsl:text>: </xsl:text>
			<xsl:value-of select="day-from-dateTime($date)"/>
			<xsl:text>-</xsl:text>
			<xsl:value-of select="month-from-dateTime($date)"/>
			<xsl:text>-</xsl:text>
			<xsl:value-of select="year-from-dateTime($date)"/>
			<xsl:text>, </xsl:text>
			<xsl:if test="string-length(string($hours)) > 1">
				<xsl:value-of select="$hours"/>
			</xsl:if>
			<xsl:if test="string-length(string($hours)) = 1">0<xsl:value-of select="$hours"/>
			</xsl:if>
			<xsl:text>:</xsl:text>
			<xsl:if test="string-length(string($minutes)) > 1">
				<xsl:value-of select="$minutes"/>
			</xsl:if>
			<xsl:if test="string-length(string($minutes)) = 1">0<xsl:value-of select="$minutes"/>
			</xsl:if>
		</div>
	</xsl:template>

	<xsl:template match="items">
		<xsl:for-each select="item">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<tr class="table-odd">
						<xsl:apply-templates select="."/>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr class="table-even">
						<xsl:apply-templates select="."/>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="item">
		<td class="title">
			<xsl:value-of select="title"/>
		</td>
		<td class="value">
			<xsl:apply-templates select="value"/>
		</td>
	</xsl:template>

	<xsl:template match="subitem">
		<xsl:value-of select="."/>
		<br/>
	</xsl:template>
	<xsl:template match="list">
		<ul class="items">
			<xsl:apply-templates select="listitem"/>
		</ul>
	</xsl:template>
	<xsl:template match="listitem">
		<li>
			<xsl:value-of select="."/>
		</li>
	</xsl:template>
	<xsl:template match="addresspart">
		<div class="address">
			<xsl:value-of select="."/>
		</div>
	</xsl:template>
</xsl:stylesheet>
