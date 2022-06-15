<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

    <xsl:template match="/Hotel">
        
        <xsl:variable name="HotelName" select="HotelName"></xsl:variable>
        
        <xsl:variable name="HotelCategory" select="HotelName/@category"></xsl:variable>
        
        <xsl:variable name="HotelNumberStar" select="HotelName/@rating"></xsl:variable>
        
        <xsl:variable name="HotelAddress" select="Address/ContactItem"></xsl:variable>
        
        <xsl:variable name="HotelPhone" select="Contact/ContactItem[@class='phone']"></xsl:variable>
        
        <xsl:variable name="HotelWebsite" select="Contact/ContactItem/Link/@href"></xsl:variable>
        
        <Property>
            <PropertyName>
                <xsl:value-of select="HotelName"/>
            </PropertyName>
            <PropertyType>
                <xsl:value-of select="$HotelCategory"/>
            </PropertyType>
            <StarRating>
                <xsl:attribute name="type">
                    <xsl:value-of select="substring-before($HotelNumberStar, '-' )"/>
                </xsl:attribute>
                <xsl:value-of select="substring-after($HotelNumberStar, '-' )"/>
            </StarRating>
            <ContactIfo>
                <Address>
                    <AddressLine>
                        <xsl:value-of select="$HotelAddress"/>
                    </AddressLine>
                    <StreetNumber>
                         <xsl:value-of select="substring-before($HotelAddress, ',' )"/>
                    </StreetNumber>
                </Address>
                <Phone>
                    <xsl:value-of select="concat('+1 ', translate(translate($HotelPhone, '(', ' '), ') ', '-'))"/>
                </Phone>
                <Websaite>
                    <xsl:value-of select="translate(translate(substring-after($HotelWebsite, 'url=' ), '%2F', '/'),'s%3A' , ':')"/>
                </Websaite>
            </ContactIfo>
        </Property>
    </xsl:template>
</xsl:transform>
