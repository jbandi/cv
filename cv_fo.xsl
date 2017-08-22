<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cs="http://www.isbe.ch/catalogFunctions"
	xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:import href="pageMaster.xsl"/>
	<xsl:output encoding="utf-8" method="xml"/>

	<xsl:attribute-set name="halfPageTable">
		<xsl:attribute name="border-bottom">1pt solid grey</xsl:attribute>
		<xsl:attribute name="padding-bottom">1pt </xsl:attribute>
		<xsl:attribute name="width">10cm</xsl:attribute>
		<xsl:attribute name="table-layout">fixed</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="sectionTitle">
		<xsl:attribute name="font-size">12pt</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
		<xsl:attribute name="padding-top">12pt</xsl:attribute>
		<xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="oddItem">
		<xsl:attribute name="background-color">#EEEEEE</xsl:attribute>
	</xsl:attribute-set>

	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<xsl:call-template name="layoutMasterSet"/>
			<!-- use layoutMasterSet template from pageMaster.xsl -->
			<fo:page-sequence master-reference="ersteSeite">
				<xsl:call-template name="regionBefore"/>
				<!-- use regionBefore template from pageMaster.xsl -->
				<xsl:call-template name="regionAfter"/>
				<!-- use regionAfter template from pageMaster.xsl -->

				<fo:flow flow-name="xsl-region-body">
					<fo:table>
						<fo:table-column/>
						<fo:table-column/>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell padding="2pt">
									<fo:block font-size="22pt" font-weight="bold"
										padding-bottom="2pt">
										<xsl:apply-templates select="cv/name"/>
									</fo:block>
									<fo:block font-size="8pt">
										mail: 
										<xsl:apply-templates select="cv/address/email"/>
									</fo:block>
									<fo:block font-size="8pt">
										web:
										<xsl:apply-templates select="cv/address/web"/>
									</fo:block>
									<fo:block font-size="8pt">
										blog: 
										<xsl:apply-templates select="cv/address/blog"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="2pt">
									<fo:block padding-top="6pt">
										<xsl:apply-templates select="cv/address/addresspart"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
					<fo:block padding-top="5pt" font-size="11pt" color="grey"
						border-bottom="3pt solid #EEEEEE">
						<xsl:apply-templates select="cv/maxim"/>
					</fo:block>

					<fo:block padding-bottom="5pt" font-size="7pt">
						<xsl:call-template name="Creation"/>
					</fo:block>

					<fo:block font-size="11pt">
						<xsl:apply-templates select="cv"/>
					</fo:block>

				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>

	<xsl:template match="cv">

		<fo:table>
			<fo:table-column column-width="10.3cm"/>
			<fo:table-column/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell>
						<xsl:call-template name="leftHalfPage"/>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block padding-top="12pt">
							<fo:external-graphic src="portrait.jpg"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>



		<fo:block xsl:use-attribute-sets="sectionTitle">
			<xsl:value-of select="//sections/section[@name='university']"/>
		</fo:block>
		<xsl:apply-templates select="university/items"/>

		<fo:block xsl:use-attribute-sets="sectionTitle">
			<xsl:value-of select="//sections/section[@name='furtherEducation']"/>
		</fo:block>
		<xsl:apply-templates select="furtherEducation/items"/>

		<fo:block xsl:use-attribute-sets="sectionTitle">
			<xsl:value-of select="//sections/section[@name='courses']"/>
		</fo:block>
		<xsl:apply-templates select="courses/items"/>

		<fo:block xsl:use-attribute-sets="sectionTitle">
			<xsl:value-of select="//sections/section[@name='activities']"/>
		</fo:block>
		<xsl:apply-templates select="activities/items"/>

		<fo:block xsl:use-attribute-sets="sectionTitle">
			<xsl:value-of select="//sections/section[@name='internship']"/>
		</fo:block>
		<xsl:apply-templates select="internship/items"/>

		<fo:block xsl:use-attribute-sets="sectionTitle">
			<xsl:value-of select="//sections/section[@name='work']"/>
		</fo:block>
		<xsl:apply-templates select="work/items"/>

		<fo:block xsl:use-attribute-sets="sectionTitle">
			<xsl:value-of select="//sections/section[@name='project']"/>
		</fo:block>
		<xsl:apply-templates select="project/items"/>

		<fo:block>
			<fo:block xsl:use-attribute-sets="sectionTitle">
				<xsl:value-of select="//sections/section[@name='presentation']"/>
			</fo:block>
			<fo:block padding-bottom="3pt" keep-with-next.within-column="always">
				<xsl:value-of select="//sections/section[@name='slides']"/>
			</fo:block>
			<xsl:apply-templates select="presentation/items"/>
		</fo:block>
		
		<fo:block>
			<fo:table border-bottom="1pt solid grey">

				<fo:table-column/>
				<fo:table-column/>

				<fo:table-body>

					<fo:table-row>
						<fo:table-cell>
							<fo:block font-weight="bold" padding-bottom="3pt" padding-top="10pt">
								<xsl:value-of select="//sections/section[@name='knowledge']"/>
							</fo:block>
							<xsl:apply-templates select="knowledge/list"/>
						</fo:table-cell>
						<fo:table-cell padding-left="15pt">
							<fo:block font-weight="bold" padding-bottom="3pt" padding-top="10pt">
								<xsl:value-of select="//sections/section[@name='technology']"/>
							</fo:block>
							<xsl:apply-templates select="technology/list"/>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
		
		<fo:block font-size="7pt">
			Created using Ant, Saxon and Apache FOP
		</fo:block>
		
	</xsl:template>

	<xsl:template name="leftHalfPage">
		<fo:block>
			<fo:block xsl:use-attribute-sets="sectionTitle">
				<xsl:value-of select="//sections/section[@name='personalData']"/>
			</fo:block>

			<fo:table xsl:use-attribute-sets="halfPageTable">

				<fo:table-column/>
				<fo:table-column/>

				<fo:table-body>

					<xsl:for-each select="personalData/items/item">

						<xsl:choose>
							<xsl:when test="position() mod 2 = 1">
								<fo:table-row xsl:use-attribute-sets="oddItem">
									<xsl:apply-templates select="."/>
								</fo:table-row>
							</xsl:when>
							<xsl:otherwise>
								<fo:table-row>
									<xsl:apply-templates select="."/>
								</fo:table-row>
							</xsl:otherwise>
						</xsl:choose>

					</xsl:for-each>
				</fo:table-body>
			</fo:table>


			<fo:block xsl:use-attribute-sets="sectionTitle">
				<xsl:value-of select="//sections/section[@name='languages']"/>
			</fo:block>

			<fo:table xsl:use-attribute-sets="halfPageTable">

				<fo:table-column/>
				<fo:table-column/>

				<fo:table-body>

					<xsl:for-each select="languages/items/item">

						<xsl:choose>
							<xsl:when test="position() mod 2 = 1">
								<fo:table-row xsl:use-attribute-sets="oddItem">
									<xsl:apply-templates select="."/>
								</fo:table-row>
							</xsl:when>
							<xsl:otherwise>
								<fo:table-row>
									<xsl:apply-templates select="."/>
								</fo:table-row>
							</xsl:otherwise>
						</xsl:choose>

					</xsl:for-each>
				</fo:table-body>
			</fo:table>

			<fo:block xsl:use-attribute-sets="sectionTitle">
				<xsl:value-of select="//sections/section[@name='school']"/>
			</fo:block>

			<fo:table xsl:use-attribute-sets="halfPageTable">

				<fo:table-column/>
				<fo:table-column/>

				<fo:table-body>

					<xsl:for-each select="school/items/item">

						<xsl:choose>
							<xsl:when test="position() mod 2 = 1">
								<fo:table-row xsl:use-attribute-sets="oddItem">
									<xsl:apply-templates select="."/>
								</fo:table-row>
							</xsl:when>
							<xsl:otherwise>
								<fo:table-row>
									<xsl:apply-templates select="."/>
								</fo:table-row>
							</xsl:otherwise>
						</xsl:choose>

					</xsl:for-each>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>

	<xsl:template match="items">
		<fo:table border-bottom="1pt solid grey" table-layout="fixed" padding-bottom="2pt">

			<fo:table-column column-width="5cm"/>
			<fo:table-column/>

			<fo:table-body>

				<xsl:for-each select="item">

					<xsl:choose>
						<xsl:when test="position() mod 2 = 1">
							<fo:table-row xsl:use-attribute-sets="oddItem">
								<xsl:apply-templates select="."/>
							</fo:table-row>
						</xsl:when>
						<xsl:otherwise>
							<fo:table-row>
								<xsl:apply-templates select="."/>
							</fo:table-row>
						</xsl:otherwise>
					</xsl:choose>

				</xsl:for-each>
			</fo:table-body>
		</fo:table>
	</xsl:template>

	<xsl:template match="item">

		<fo:table-cell padding="2pt">
			<fo:block font-family="Arial, Helvetica">
				<xsl:apply-templates select="title"/>
			</fo:block>
		</fo:table-cell>

		<fo:table-cell padding="2pt" padding-left="8pt">
			<fo:block font-family="Helvetica">
				<xsl:apply-templates select="value"/>
			</fo:block>
		</fo:table-cell>

	</xsl:template>

	<xsl:template match="subitem">
		<fo:block>
			<xsl:value-of select="."/>
		</fo:block>
	</xsl:template>

	<xsl:template match="list">
		<fo:list-block padding-bottom="3pt">
			<xsl:apply-templates select="listitem"/>
		</fo:list-block>
	</xsl:template>
	<xsl:template match="listitem">
		<fo:list-item>
			<fo:list-item-label>
				<fo:block>&#x2022;</fo:block>
			</fo:list-item-label>
			<fo:list-item-body start-indent="10pt">
				<fo:block>
					<xsl:value-of select="."/>
				</fo:block>
			</fo:list-item-body>
		</fo:list-item>
	</xsl:template>

	<xsl:template match="addresspart">
		<fo:block font-size="8pt" text-align="right">
			<xsl:value-of select="."/>
		</fo:block>
	</xsl:template>

	<xsl:template name="Creation">
		<xsl:variable name="date" select="current-dateTime()"/>
		<xsl:variable name="hours" select="hours-from-dateTime($date)"/>
		<xsl:variable name="minutes" select="minutes-from-dateTime($date)"/>
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
	</xsl:template>
</xsl:stylesheet>
