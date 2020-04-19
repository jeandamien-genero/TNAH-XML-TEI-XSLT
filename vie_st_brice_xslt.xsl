<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>Vie de saiint Brice</title>
            </head>
            <body>
                <xsl:element name="div">
                    <xsl:element name="div">
                        <xsl:element name="h1">
                            <xsl:value-of select="//titleStmt/title[@level='a']"/>
                        </xsl:element>
                        <xsl:element name="h2">
                            <xsl:value-of select="//author/forename"/><xsl:text> </xsl:text><xsl:value-of select="//author/surname"/>
                        </xsl:element>
                        <xsl:element name="p">
                            <xsl:value-of select="//resp"/><xsl:text> par </xsl:text><xsl:value-of select="//respStmt/persName/forename"/><xsl:text> </xsl:text><xsl:value-of select="//respStmt/persName/surname"/><xsl:text>.</xsl:text>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
