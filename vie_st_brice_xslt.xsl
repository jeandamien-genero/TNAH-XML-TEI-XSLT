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
                <xsl:apply-templates/>
                <div>notes
                </div>
                <div>
                    <xsl:call-template name="noms"/>
                </div>
                <div>
                    <xsl:call-template name="lieux"/>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="teiHeader">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="fileDesc">
        <h1>
            <xsl:value-of select="//titleStmt/title[@level='a']"/>
        </h1>
        <h1>
            <xsl:value-of select="//author/forename"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="//author/surname"/>
        </h1>
    </xsl:template>
    <xsl:template match="notesStmt"/>
    <xsl:template match="sourceDesc"/>
    <xsl:template match="encodingDesc/projectDesc/p">
        <p>
            <xsl:value-of select="."/>
        </p>
    </xsl:template>
    <xsl:template match="profileDesc"/>
    <xsl:template match="body">
        <div>
            <xsl:for-each select="div[@type='paragraph']">
                <div1>
                    <xsl:apply-templates/>
                </div1>
            </xsl:for-each>
        </div>
    </xsl:template>
    <!-- INDEX DES NOMS DE PERSONNES -->
    <xsl:template name="noms">
        <xsl:element name="div">
            <h2>Index des noms de personnes</h2>
            <xsl:element name="div">
                <xsl:for-each select="//listPerson//persName">
                    <xsl:sort select="/forename[@xml:lang='fr']" order="ascending"/>
                    <xsl:element name="p">
                        <xsl:element name="b">
                            <xsl:value-of select="forename[@xml:lang='fr']"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="surname[@full='yes']"/>
                            <xsl:text> </xsl:text>
                            <xsl:text>(</xsl:text>
                            <xsl:if test="addName[@full='yes']">
                                <xsl:value-of select="addName[@full='yes']"/>
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when test="ancestor::person/birth/date and ancestor::person/death/date">
                                    <xsl:value-of select="ancestor::person/birth/date"/>
                                    <xsl:text>-</xsl:text>
                                    <xsl:value-of select="ancestor::person/death/date"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>†</xsl:text>
                                    <xsl:value-of select="ancestor::person/death/date"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:text>)</xsl:text>
                        </xsl:element>
                        <xsl:variable name="idPerson">
                            <xsl:value-of select="parent::person/@xml:id"/>
                        </xsl:variable>
                        <xsl:text> : </xsl:text>
                        <xsl:for-each-group select="ancestor::TEI//body//persName[translate(@ref, '#','')=$idPerson]" group-by="ancestor::div/@n">
                            <xsl:value-of select="ancestor::div/@n"/>
                            <xsl:if test="position()!= last()">, </xsl:if>
                            <xsl:if test="position() = last()">.</xsl:if>
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template name="lieux">
        <xsl:element name="div">
            <h2>Index des noms de lieux</h2>
            <xsl:element name="div">
                <xsl:for-each select="//place//name[@xml:lang='fr']">
                    <xsl:sort select="." order="ascending"/>
                    <xsl:element name="p">
                        <xsl:element name="b">
                            <xsl:value-of select="."/>
                        <xsl:text> (</xsl:text>
                        <xsl:value-of select="preceding-sibling::country"/>
                            <xsl:text>)</xsl:text>
                        </xsl:element>
                        <xsl:variable name="Placeid">
                            <xsl:value-of select="ancestor::place/@xml:id"/>
                        </xsl:variable>
                        <xsl:text> : </xsl:text>
                        <xsl:for-each-group select="ancestor::TEI//body//placeName[translate(@ref, '#','')=$Placeid]" group-by="ancestor::div/@n">
                            <xsl:value-of select="ancestor::div/@n"/>
                            <xsl:if test="position()!= last()">, </xsl:if>
                            <xsl:if test="position() = last()">.</xsl:if>
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>