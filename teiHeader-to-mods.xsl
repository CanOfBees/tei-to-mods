<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei"
    version="2.0">
    
    <!-- 
       This probably gets a lot of particulars wrong, but this was whipped up for testing purposes
       (so maybe that's okay). 
    -->
    
    <!-- output -->
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    
    <!-- transform -->
    <xsl:template match="/*:TEI/*:teiHeader">
        <mods 
            xmlns="http://www.loc.gov/mods/v3" 
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-5.xsd">
            
            <!-- identifiers -->
            <identifier type="local">
                <xsl:value-of select="*:fileDesc/*:publicationStmt/*:idno"/>
            </identifier>
            <identifier type="filename">
                <xsl:value-of select="concat(*:fileDesc/*:publicationStmt/*:idno,'.xml')"/>
            </identifier>
            
            <!-- name stuff -->
            <!-- type='personal' for testing purposes only!! -->                                                                      <name type="personal">
                <namePart>
                    <xsl:value-of select="*:fileDesc/*:sourceDesc/*:bibl/*:author/*:name"/>
                </namePart>
                <!-- probably wrong, but went with 'cre'/Creator for this. will change. -->
                <role>
                    <roleTerm type="text" authority="marcrelator" 
                        valueURI="http://id.loc.gov/vocabulary/relators/cre">Creator</roleTerm>
                </role>
            </name>
            
            <!-- title -->
            <titleInfo>
                <title>
                    <xsl:value-of select="normalize-space(*:fileDesc/*:titleStmt/*:title)"/>
                </title>
            </titleInfo>

            <!-- type -->
            <typeOfResource>
                <xsl:text>text</xsl:text>
            </typeOfResource>

            <!-- abstract -->
            <abstract>
                <xsl:value-of select="*:fileDesc/*:sourceDesc/*:bibl/*:note[@type='abstract']"/>
            </abstract>


        </mods>
    </xsl:template>
    
    <!-- ignore! -->
    <xsl:template match="/*:TEI/*:text"/>
    <xsl:template match="processing-instruction()"/>
    
</xsl:stylesheet>