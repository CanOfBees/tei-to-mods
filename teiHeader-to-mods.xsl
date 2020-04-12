<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:mods="http://www.loc.gov/mods/v3"
    exclude-result-prefixes="tei"
    version="2.0">

  <!-- output -->
  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
  <xsl:strip-space elements="*"/>

  <!-- transform -->
  <xsl:template match="tei:TEI/tei:teiHeader">
    <mods:mods xmlns:mods="http://www.loc.gov/mods/v3" version="3.5"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema"
          xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-5.xsd">
      <!-- identifiers -->
      <mods:identifier type="local">
        <xsl:value-of select="tei:fileDesc/tei:publicationStmt/tei:idno"/>
      </mods:identifier>
      <!-- title -->
      <mods:titleInfo>
        <mods:title>
          <xsl:value-of select="normalize-space(tei:fileDesc/tei:sourceDesc/tei:bibl/tei:title)"/>
        </mods:title>
      </mods:titleInfo>
      <!-- names -->
      <xsl:apply-templates select="tei:fileDesc/tei:sourceDesc/tei:bibl/tei:author/tei:name"/>
    </mods:mods>
  </xsl:template>

  <xsl:template match="tei:fileDesc/tei:sourceDesc/tei:bibl/tei:author/tei:name">
    <mods:name>
      <xsl:if test="@type = 'person'">
        <xsl:attribute name="type" select="'personal'"/>
      </xsl:if>
      <mods:namePart>
        <xsl:value-of select="normalize-space(.)"/>
      </mods:namePart>
    </mods:name>
  </xsl:template>

  <!-- ignore! -->
  <xsl:template match="/tei:TEI/tei:text"/>
  <xsl:template match="processing-instruction()"/>

</xsl:stylesheet>