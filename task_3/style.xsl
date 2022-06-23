<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/TR/WD-xsl">
<xsl:template match="/">
    
</xsl:template>
</xsl:stylesheet>


<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

    <xsl:template match="/Amenities">
        <Services>
            <xsl:for-each select="TopAmenityList/TopAmenityItem"> 
                <Service></Service>
            </xsl:for-each>
        </Services>
    </xsl:template>
</xsl:transform>
