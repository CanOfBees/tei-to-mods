<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:mods="http://www.loc.gov/mods/v3"
    xmlns:cob="http://canofbees.org/xslt/"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="tei xs"
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
        <xsl:value-of select="tei:fileDesc/tei:publicationStmt/tei:idno[1]"/>
      </mods:identifier>
      <!-- title -->
      <mods:titleInfo>
        <mods:title>
          <xsl:value-of select="normalize-space(tei:fileDesc/tei:sourceDesc/tei:bibl/tei:title)"/>
        </mods:title>
      </mods:titleInfo>
      <!-- abstract -->
      <mods:abstract>
        <xsl:value-of
            select="normalize-space(tei:fileDesc/tei:sourceDesc/tei:bibl/tei:note[@type='abstract' or @type='summary'])"/>
      </mods:abstract>
      <!-- originInfo/dateCreated -->
      <xsl:apply-templates select="tei:fileDesc/tei:sourceDesc/tei:bibl/tei:date"/>

      <!-- names -->
      <xsl:apply-templates select="tei:fileDesc/tei:sourceDesc/tei:bibl/tei:author/tei:name"/>

      <!-- subjects -->
      <xsl:apply-templates select="tei:profileDesc/tei:textClass/tei:keywords"/>
      <!-- recordInfo: recordContentSource, recordChangeDate, languageOfCataloging,
        recordOrigin
      -->
      <mods:recordInfo>
        <mods:languageOfCataloging>
          <mods:languageTerm type="code" authority="iso639=2b">eng</mods:languageTerm>
        </mods:languageOfCataloging>
        <mods:recordCreationDate><xsl:value-of select="current-date()"/></mods:recordCreationDate>
      </mods:recordInfo>
    </mods:mods>
  </xsl:template>

  <xsl:template match="tei:fileDesc/tei:sourceDesc/tei:bibl/tei:date">
    <xsl:variable name="vWhen" select="if (@when) then cob:date-proc(@when) else ''"/>
    <xsl:variable name="vDate" select="cob:date-proc(normalize-space(.))"/>

    <mods:originInfo>
      <xsl:choose>
        <xsl:when test="$vDate != '' and $vWhen != ''">
          <mods:dateCreated><xsl:value-of select="$vDate"/></mods:dateCreated>
          <mods:dateCreated encoding="edtf"><xsl:value-of select="$vWhen"/></mods:dateCreated>
        </xsl:when>
        <xsl:when test="$vDate != '' and cob:is-iso-date($vDate) and $vWhen = ''">
          <mods:dateCreated><xsl:value-of select="$vDate"/></mods:dateCreated>
          <mods:dateCreated encoding="edtf"><xsl:value-of select="$vDate"/></mods:dateCreated>
        </xsl:when>
        <xsl:otherwise>
          <mods:dateCreated><xsl:value-of select="$vDate"/></mods:dateCreated>
        </xsl:otherwise>
      </xsl:choose>
    </mods:originInfo>
  </xsl:template>

  <xsl:template match="tei:fileDesc/tei:sourceDesc/tei:bibl/tei:author/tei:name">
    <mods:name>
      <xsl:if test="@type = 'person'">
        <xsl:attribute name="type" select="'personal'"/>
      </xsl:if>
      <mods:namePart>
        <xsl:value-of select="normalize-space(.)"/>
      </mods:namePart>
      <mods:role>
        <mods:roleTerm authority="marcrelator" authorityURI="http://id.loc.gov/vocabulary/relators/cre">Creator</mods:roleTerm>
      </mods:role>
    </mods:name>
  </xsl:template>

  <xsl:template match="tei:profileDesc/tei:textClass/tei:keywords">
    <xsl:apply-templates select="tei:term[not(child::tei:name)]"/>
    <xsl:apply-templates select="tei:term[child::tei:name]"/>
  </xsl:template>

  <xsl:template match="tei:term[not(child::tei:name)]">
    <mods:subject>
      <mods:topic><xsl:value-of select="normalize-space(.)"/></mods:topic>
    </mods:subject>
  </xsl:template>

  <xsl:template match="tei:term[child::tei:name]">
    <mods:name>
      <xsl:if test="tei:name/@ref">
        <xsl:attribute name="valueURI" select="tei:name/@ref"/>
      </xsl:if>
      <mods:namePart><xsl:value-of select="normalize-space(tei:name)"/></mods:namePart>
      <xsl:if test="tei:name/@role">
        <xsl:variable name="vRole" select="tokenize(tei:name/@role, ' ')"/>
        <mods:role>
          <mods:roleTerm authority="marcrelator"
                         valueURI="{$vRole[2]}">
            <xsl:value-of select="$vRole[1]"/>
          </mods:roleTerm>
        </mods:role>
      </xsl:if>
    </mods:name>
  </xsl:template>

  <!-- ignore! -->
  <xsl:template match="/tei:TEI/tei:text"/>
  <xsl:template match="processing-instruction()"/>

  <!-- functions -->
  <xsl:function name="cob:is-iso-date" as="xs:boolean">
    <xsl:param name="date" as="xs:string"/>

    <xsl:sequence select="matches($date, '^\d{4}-\d{2}-\d{2}$')"/>
  </xsl:function>

  <xsl:function name="cob:date-proc" as="item()*">
    <xsl:param name="date" as="xs:string"/>

    <xsl:analyze-string select="$date" regex="^(\d{{4}})-(\d{{2}})-(\d{{2}})$">
      <xsl:matching-substring>
        <xsl:variable name="year" select="if (regex-group(1) = '0000') then '' else regex-group(1)"/>
        <xsl:variable name="month" select="if (regex-group(2) = '00') then '' else regex-group(2)"/>
        <xsl:variable name="day" select="if (regex-group(3)= '00') then '' else regex-group(3)"/>
        <xsl:choose>
          <!-- e.g. 0000-00-00 = [n.d.] -->
          <xsl:when test="$year = '' and $month = '' and $day = ''">
            <xsl:value-of select="'[n.d.]'"/>
          </xsl:when>
          <!-- e.g. 1795-00-00 = 1795 (YYYY) -->
          <xsl:when test="$year != '' and $month = '' and $day = ''">
            <xsl:value-of select="$year"/>
          </xsl:when>
          <!-- e.g. 1795-05-00 = 1795-05 (YYYY-MM) -->
          <xsl:when test="$year != '' and $month != '' and $day = ''">
            <xsl:value-of select="concat($year, '-', $month)"/>
          </xsl:when>
          <!-- e.g. 0000-05-00 = -\-05 (-\-MM) -->
          <xsl:when test="$year = '' and $month != '' and $day = ''">
            <xsl:value-of select="concat('--', $month)"/>
          </xsl:when>
          <!-- e.g. 1795-05-01 = 1795-05-01 (YYYY-MM-DD) -->
          <xsl:when test="$year != '' and $month != '' and $day != ''">
            <xsl:value-of select="concat($year, '-', $month, '-', $day)"/>
          </xsl:when>
          <!-- e.g. 0000-05-01 = -\-05-01 (-\-MM-DD) -->
          <xsl:when test="$year = '' and $month != '' and $day != ''">
            <xsl:value-of select="concat('--', $month, '-', $day)"/>
          </xsl:when>
          <!-- e.g. 0000-00-01 = -\-\-01 (-\-\-DD) -->
          <xsl:when test="$year = '' and $month = '' and $day != ''">
            <xsl:value-of select="concat('---', $day)"/>
          </xsl:when>
        </xsl:choose>
      </xsl:matching-substring>
      <xsl:non-matching-substring>
        <!--
            this second analyze-string template tries to catch year-only values;
            e.g. 1795/YYYY. Non-matching values pass through and are updated in-place.
          -->
        <xsl:analyze-string select="." regex="^(\d{{4}})$">
          <xsl:matching-substring>
            <xsl:value-of select="if (regex-group(1) = '0000') then '' else regex-group(1)"/>
          </xsl:matching-substring>
          <xsl:non-matching-substring>
            <xsl:value-of select="."/>
          </xsl:non-matching-substring>
        </xsl:analyze-string>
      </xsl:non-matching-substring>
    </xsl:analyze-string>
  </xsl:function>

</xsl:stylesheet>