<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

    <xsl:template match="/Amenities">
        <xsl:variable name="Ok" select="TopAmenityHeader"></xsl:variable>
        <xsl:value-of select="$Ok"></xsl:value-of>
        <h1>AGsdgdsgsdg</h1>
    </xsl:template>
</xsl:transform>