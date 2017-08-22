<?xml version="1.0" encoding="UTF-8" ?>
<!-- definition of page layout-->
<xsl:stylesheet version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="layoutMasterSet">
    <fo:layout-master-set>
      <fo:simple-page-master margin-bottom="2.5cm" margin-left="1.5cm" margin-right="1.5cm"
        margin-top="1.2cm" master-name="ersteSeite" page-height="29.7cm" page-width="21cm">
        <fo:region-body margin-bottom="0.7cm" margin-top="0.5cm"/>
        <fo:region-before background-color="grey" extent="0.02cm"/>
        <fo:region-after extent="0.5cm"/>
      </fo:simple-page-master>
    </fo:layout-master-set>
  </xsl:template>


  <!-- Definition of page header -->
  <xsl:template name="regionBefore">

  </xsl:template>

    

  <!-- Definition of page footer -->
  <xsl:template name="regionAfter">
    <fo:static-content flow-name="xsl-region-after">
      <fo:block text-align="end" font-size="10pt">
         <fo:page-number/>
      </fo:block>
    </fo:static-content>
  </xsl:template>


</xsl:stylesheet>
