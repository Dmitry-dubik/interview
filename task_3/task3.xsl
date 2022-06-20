<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

    <xsl:template match="/Amenities">
    
      <xsl:variable
        name="uppercase"
        select="concat('АБВГ', 'ДЕЁЖЗ', 'ИЙКЛ', 'МНОП', 'РСТУ', 'ФХЦЧ', 'ШЩЪЫ', 'ЬЭЮЯ')"
      />
      <xsl:variable
        name="lowercase"
        select="concat('абвг', 'деёжз', 'ийкл', 'мноп', 'рсту', 'фхцч', 'шщъы', 'ьэюя')"
      />
      
        <xsl:variable
        name="AmenitiesString"
        select="AmenitiesString"
      />
      
      
        <Services>
            <xsl:variable name="amenityStringHeader" select="AmenityStringHeader"/>
            <xsl:variable name="TopType" select="TopAmenityHeader"> </xsl:variable>
            
            <xsl:variable name="AmenityType" select="AmenityHeader"> </xsl:variable>
            
            <xsl:for-each select="TopAmenityList/TopAmenityItem"> 
            
                 <xsl:variable name="information" select="."> </xsl:variable>
                 <xsl:variable name="class" select="./@class"> </xsl:variable>
                 
                <Service>
                    <xsl:choose>
                        <xsl:when test="$class = 'active'">
                            <xsl:value-of select="concat($TopType, '/', $information)"/>
                        </xsl:when>
                        <xsl:when test="$class = 'inactive'">
                            <xsl:value-of select="concat($TopType, '/', $information, ' (absent)')"/>
                        </xsl:when>
                      </xsl:choose>
                </Service>
            </xsl:for-each>                 
            <xsl:for-each select="AmenityList/AmenityItem"> 
                <xsl:variable name="information" select="."> </xsl:variable>
                <Service><xsl:variable name="TopType" select="TopAmenityHeader"> </xsl:variable>
                    <xsl:variable name="OnReturn" select="concat($AmenityType, '/', concat(upper-case(substring($information,1,1)), substring(., 2), ' '[not(last())]))"></xsl:variable>
                    <xsl:value-of select="normalize-space(translate($OnReturn, '/ ', '/'))"/>
                </Service>
            </xsl:for-each>
            <xsl:for-each select="tokenize($AmenitiesString, ',')"> 
                <Service>
                    <xsl:variable name="ok" select="."> </xsl:variable>
                    <xsl:variable name="OnReturn" select="normalize-space(concat($amenityStringHeader, '/', $ok))"> </xsl:variable>
                    <xsl:value-of select="normalize-space(translate($OnReturn, '/ ', '/'))"/>
                </Service>
            </xsl:for-each>
            <xsl:for-each select="AmenitiesFromHTML/div/div/div">
                <xsl:variable name="name" select="h3/button/span[1]"> </xsl:variable>
                <xsl:variable name="description" select="div"> </xsl:variable>
                <xsl:variable name="attribut" select="@data-state"> </xsl:variable>
                <xsl:variable name="ForCheck" select="normalize-space(translate($description, ' ', ''))"> </xsl:variable>
                <xsl:if test="string-length(normalize-space($ForCheck)) &lt;= 30">
                    <Service>
                         <xsl:value-of select="translate(normalize-space(concat($name, '/', $description)), '/ ', '/')"/>
                    </Service>
                </xsl:if>
            </xsl:for-each>
        </Services>
        <Descriptions>
            <xsl:for-each select="AmenitiesFromHTML/div/div/div">
                <xsl:variable name="name" select="h3/button/span[1]"> </xsl:variable>
                <xsl:variable name="description" select="div"> </xsl:variable>
                <xsl:variable name="attribut" select="@data-state"> </xsl:variable>
                <xsl:variable name="ForCheck" select="normalize-space(translate($description, ' ', ''))"> </xsl:variable>
                <xsl:if test="string-length(normalize-space($ForCheck)) &gt; 30">
                    <Description>
                        <xsl:attribute name="Title">
                            <xsl:value-of select="$name"/>
                        </xsl:attribute>
                        <Text>
                            <xsl:value-of select="normalize-space(translate($description, '&amp;', ''))"/>
                        </Text>
                    </Description>
                </xsl:if>
                    
            </xsl:for-each>
        </Descriptions>
    </xsl:template>
</xsl:transform>
