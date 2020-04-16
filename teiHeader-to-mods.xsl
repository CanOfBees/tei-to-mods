<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:mods="http://www.loc.gov/mods/v3"
    xmlns:cob="http://canofbees.org/xslt/"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="tei xs"
    version="2.0">

  <!-- output -->
  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
  <xsl:strip-space elements="*"/>

  <!-- transform -->
  <xsl:template match="tei:TEI/tei:teiHeader">

    <!-- variables -->
    <xsl:variable name="vAvail">
      <!-- generated from all TDH availability statements, lower-cased and spacing normalized, then deduplicated -->
      <cob:avail inst="University of Tennesse Knoxville. Libraries">this work is the property of the special collections library, university of tennessee, knoxville, tn. it may be used freely by individuals for research, teaching, and personal use as long as this statement of availability is included in the text. for all other use contact the special collections librarian, hoskins library, university of tennessee, 1401 cumberland avenue, knoxville, tn 37996. (865) 974-4480.</cob:avail>
      <cob:avail inst="University of Tennesse Knoxville. Libraries">this work is the property of the special collections library, university of tennessee, knoxville, tn. it may be used freely by individuals for research, teaching, and personal use as long as this statement of availability is included in the text.</cob:avail>
      <cob:avail inst="University of Tennesse Knoxville. Libraries">this work is the property of the special collections library, university of tennessee, knoxville, tn. it may be used freely by individuals for research, teaching, and personal use as long as this statement of availability is included in the text. for commercial use contact the special collections librarian, hoskins library, university of tennessee, 1401 cumberland avenue, knoxville, tn 37996. (865) 974-4480.</cob:avail>
      <cob:avail inst="University of Tennesse Knoxville. Libraries">this work is the property of the university of tennessee special collections library. it may be used freely by individuals for research, teaching, and personal use as long as this statement of availability is included in the text.</cob:avail>
      <cob:avail inst="University of Tennesse Knoxville. Libraries">this work is the property of the university of tennessee special collections library, knoxville, tn. it may be used freely by individuals for research, teaching, and personal use as long as this statement of availability is included in the text.</cob:avail>
      <cob:avail inst="Frank H. McClung Museum">this work is the property of the mcclung museum, university of tennessee, knoxville, tn. it may be used freely by individuals for research, teaching, and personal use as long as this statement of availability is included in the text.</cob:avail>
      <cob:avail inst="Frank H. McClung Museum">this work in the property of the frank h. mcclung museum, university of tennessee, knoxville, tn. it may be used freely by individuals for research, teaching, and personal use as long as this statement of availability is included in the text. all other use is prohibited without the express written permission of the copyright holder.</cob:avail>
      <cob:avail inst="Calvin M. McClung Historical Collection">this work is the property of the mcclung historical collection, knox county public library, knoxville, tn. it may be used freely by individuals for research, teaching, and personal use as long as this statement of availability is included in the text. for all other use contact the manager of the mcclung historical collection, 500 west church avenue, knoxville, tn, 37902-2505. (865) 215-8801.</cob:avail>
      <cob:avail inst="Memphis Public Library">this work is the property of the memphis public library, memphis, tn. it may be used freely by individuals for research, teaching, and personal use as long as this statement of availability is included in the text. for all other use contact the memphis public library, 3030 poplar avenue, memphis, tn 38111</cob:avail>
      <cob:avail inst="University of Memphis. University Libraries">this work is the property of the university of
        memphis libraries, special collections department, ned r. mcwherter library, memphis, tn. it may be used freely by individuals for research, teaching, and personal use as long as this statement of availability is included in the text. for all other use contact the university of memphis libraries, 126 ned r. mcwherter library, the university of memphis, memphis, tn 38152-6500.</cob:avail>
      <cob:avail inst="Tennessee State Library and Archives">this work is the property of the tennessee state library and archives, nashville, tennessee. it may be used freely by individuals for research, teaching, and personal use as long as this statement of availability is included in the text.</cob:avail>
      <cob:avail inst="Tennessee State Library and Archives">this work is the property of the tennessee state library and archives, nashville, tn. it may be used freely by individuals for research, teaching, and personal use as long as this statement of availability is included in the text. for all other use contact the tennessee state library and archives, 403 seventh avenue north, nashville, tn 37243-0312. (615) 741-2764.</cob:avail>
      <cob:avail inst="Tennessee State Library and Archives">this work is the property of the tennessee state library and archives, nashville, tn. it may be used freely by individuals for research, teaching, and personal use as long as this statement of availability is included in the text.</cob:avail>
      <cob:avail inst="Tennessee State Library and Archives">this work is the property of the tennessee state library and archives, nashville,tn. it may be used freely by individuals for research, teaching, and personal use as long as this statement of availability is included in the text.</cob:avail>
      <cob:avail inst="Tennessee State Library and Archives">this work is the property of the tennessee state library and archives, nashville, tn. it may be used freely by individuals for research, teaching, and personal use as long as this ! statement of availability is included in the text. for all other use contact the tennessee state library and archives, 403 seventh avenue north, nashville, tn 37243-0312. (615) 741-2764.</cob:avail>
      <cob:avail inst="University of Georgia Libraries">this work is the property of the university of georgia libraries. it may be used freely by individuals for research, teaching, and personal use as long as this statement of availability is included in the text.</cob:avail>
      <cob:avail inst="Middle Tennessee State University. Albert Gore Research Center">this work is the property of the albert gore research center, middle tennessee state university, murfreesboro, tn 37132. it may be used freely by individuals for research, teaching, and personal use as long as this statement of availability is included in the text. for all other use contact the albert gore research center, p.o. box 193, middle tennessee state university, murfreesboro, tn 37132.</cob:avail>
      <cob:avail inst="Tennessee State Museum">this work is the property of the tennessee state museum, nashville, tennessee. it may be used freely by individuals for research, teaching, and personal use as long as this statement of availability is included in the text.</cob:avail>
      <!-- from SPC TEI -->
      <cob:avail inst="University of Tennessee Knoxville. Libraries">the copyright interests in this collection remain with the creator. for more information, contact the special collections library.</cob:avail>
      <cob:avail inst="University of Tennessee Knoxville. Libraries">the copyright interests in this collection remain with the creator. for more information, contact thespecial collections library.</cob:avail>
    </xsl:variable>

    <xsl:variable name="tei-avail"
                  select="normalize-space(lower-case(tei:fileDesc/tei:publicationStmt/tei:availability))"/>

    <xsl:variable name="tei-location"
                  select="if ($tei-avail = $vAvail/cob:avail) then ($vAvail/cob:avail[. = $tei-avail]/@inst) else ()"/>

    <mods:mods xmlns:mods="http://www.loc.gov/mods/v3" version="3.5"
          xmlns:xlink="http://www.w3.org/1999/xlink"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema"
          xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-5.xsd">
      <!-- identifiers -->
      <mods:identifier type="local">
        <xsl:value-of select="tei:fileDesc/tei:publicationStmt/tei:idno[1]"/>
      </mods:identifier>
      <xsl:if
          test="matches(lower-case(normalize-space(tei:fileDesc/tei:publicationStmt/tei:idno[2])), '^.*:\s+\d{2,}$')">
        <mods:identifier type="oclc">
          <xsl:value-of select="normalize-space(substring-after(tei:fileDesc/tei:publicationStmt/tei:idno[2], ':'))"/>
        </mods:identifier>
      </xsl:if>
      <!-- title -->
      <mods:titleInfo>
        <mods:title>
          <xsl:value-of select="normalize-space(tei:fileDesc/tei:sourceDesc/tei:bibl/tei:title[1])"/>
        </mods:title>
      </mods:titleInfo>
      <!-- abstract -->
      <mods:abstract>
        <xsl:value-of
            select="normalize-space(tei:fileDesc/tei:sourceDesc/tei:bibl/tei:note[@type='abstract' or @type='summary'])"/>
      </mods:abstract>
      <!-- originInfo/dateCreated -->
      <xsl:apply-templates select="tei:fileDesc/tei:sourceDesc/tei:bibl/tei:date[1]"/>

      <!-- names -->
      <xsl:apply-templates select="tei:fileDesc/tei:sourceDesc/tei:bibl/tei:author/tei:name"/>

      <!-- subjects -->
      <xsl:apply-templates select="tei:profileDesc/tei:textClass/tei:keywords"/>

      <!-- rights/accessCondition -->
      <mods:accessCondition type="use and reproduction"
                            xlink:href="http://rightsstatement.org/vocab/CNE/1.0/">Copyright Not Evaluated</mods:accessCondition>

      <!-- location/physicalLocation -->
      <xsl:if test="not($tei-location = '')">
        <mods:location>
          <mods:physicalLocation><xsl:value-of select="$tei-location"/></mods:physicalLocation>
        </mods:location>
      </xsl:if>

      <!-- relatedItem[@displayLabel="Project" -->

      <!-- relatedItem[@displayLabel="Collection" -->

      <!-- mods:typeOfResource -->
      <mods:typeOfResource>text</mods:typeOfResource>

      <!-- recordInfo: recordContentSource, recordChangeDate, languageOfCataloging,
        recordOrigin
      -->
      <mods:recordInfo>
        <xsl:if test="not($tei-location = '')">
          <mods:recordContentSource><xsl:value-of select="$tei-location"/></mods:recordContentSource>
        </xsl:if>
        <mods:languageOfCataloging>
          <mods:languageTerm type="code" authority="iso639=2b">eng</mods:languageTerm>
        </mods:languageOfCataloging>
        <mods:recordCreationDate><xsl:value-of select="current-date()"/></mods:recordCreationDate>
        <mods:recordOrigin>This MODS record was generated into MODS v3.5 from the TEI teiHeader by
          University of Tennessee Libraries Digital Initiatives, using a stylesheet available at
          https://github.com/utkdigitalinitiatives/tei-to-mods.</mods:recordOrigin>
      </mods:recordInfo>
    </mods:mods>
  </xsl:template>

  <xsl:template match="tei:fileDesc/tei:sourceDesc/tei:bibl/tei:date[1]">
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
      <mods:namePart>
        <xsl:value-of select="normalize-space(tei:name)"/>
      </mods:namePart>
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