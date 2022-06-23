<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
    
    <xsl:template match="/">
    <GuestRooms>
        <xsl:apply-templates select="//RoomList/div[not(h3 = preceding-sibling::div/h3)]"/>
    </GuestRooms>
   </xsl:template>
   
    <xsl:template match="div">
        <xsl:variable name="roomName" select="h3"/>
        <xsl:variable name="roomCode" select="h3/@roomCode"/>
        <xsl:variable name="imgDiscription" select="div/picture/img/@alt"/>
        <xsl:variable name="discriptionText" select="div/div[@class='description']/p"/>
        <xsl:variable name="imgLang" select="div/picture/img/@src"/>
        <xsl:variable name="discriptionName" select="div/div[@class='description']/h4"/>
            <GuestRoom>
                <xsl:attribute name="Code">
                    <xsl:value-of select="$roomCode"/>
                </xsl:attribute>
                <xsl:attribute name="RoomTypeName">
                    <xsl:value-of select="$roomName"/>
                </xsl:attribute>
                <Amenities>
                    <xsl:for-each select="div/div/ul/li">
                        <xsl:variable name="serviceName" select="."/>
                        <Amenity>
                            <DescriptiveText>
                                <xsl:value-of select="concat('Services and equipment/', $serviceName)"/>
                            </DescriptiveText>
                        </Amenity>
                    </xsl:for-each>
                </Amenities>
                <MultimediaDescriptions>
                    <xsl:variable name="URL" select="div/picture/img/@src"/>
                    <MultimediaDescription>
                        <ImageItems>
                            <ImageItem>
                                <ImageFormat>
                                    <URL>
                                        <xsl:value-of select="$URL"/>
                                    </URL>
                                </ImageFormat>
                                <xsl:element name="Description">
                                    <xsl:attribute name="Caption">
                                        <xsl:value-of select="$imgDiscription" />
                                    </xsl:attribute>                
                                </xsl:element>
                            </ImageItem>
                        </ImageItems>
                    </MultimediaDescription>
                    <MultimediaDescription>
                        <TextItems>
                            <TextItem>
                                <xsl:attribute name="Title">
                                    <xsl:value-of select="'Description'"/>
                                </xsl:attribute>
                                <Description>
                                        <xsl:attribute name="Language">
                                            <xsl:value-of select="substring-before(substring-after(substring-after($imgLang, 'https://www.hilton.com/'), '/'), '/')"/>
                                        </xsl:attribute>
                                    <xsl:value-of select="$discriptionText"/>
                                </Description>
                            </TextItem>
                        </TextItems>
                    </MultimediaDescription>
                </MultimediaDescriptions>
            </GuestRoom>
    </xsl:template>
</xsl:transform>
