<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:preserve-space elements="*"/>
    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>
                    <xsl:value-of select="//titleStmt/title[@level='a']"/>
                </title>
            </head>
            <body>
                <xsl:apply-templates/>
                <div>
                    <h2>Notes</h2>
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
            <xsl:apply-templates select="/fileDesc"/>
        </div>
        <div>
            <xsl:apply-templates select="//sourceDesc"/>
        </div>
    </xsl:template>
    <xsl:template match="fileDesc">
        <h1>
            <xsl:value-of select="./titleStmt/title[@level='m']"/>
        </h1>
        <h1>
            <xsl:value-of select=".//author/forename"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select=".//author/surname"/>
        </h1>
        <p><xsl:value-of select="ancestor::teiHeader/encodingDesc/projectDesc/p"/></p>
    </xsl:template>
    <xsl:template match="notesStmt"/>
    <xsl:template match="sourceDesc">
        <h2>Le manuscrit</h2>
        <div>
            <h3>Identification</h3>
            <ul>
                <li><strong>Titre du manuscrit : </strong><i><xsl:value-of select=".//head/title[@level='m']"/></i>.</li>
                <li><strong>Titre de la partie éditée : </strong><i><xsl:value-of select=".//head/title[@level='a']"/></i>.</li>
                <li><strong>Auteur : </strong>
                    <xsl:for-each select=".//msItemStruct/author[@xml:lang='fr']">
                        <xsl:value-of select="."/>
                        <xsl:if test="position()!= last()"> ou </xsl:if>
                    </xsl:for-each>
                    <xsl:text> (</xsl:text>
                    <i><xsl:value-of select=".//msItemStruct/author[@xml:lang='fro']"/></i>
                    <xsl:text> en langue d'oïl).</xsl:text>
                </li>
                <li><strong>Datation : </strong><xsl:value-of select=".//head/origDate"/>.</li>
                <li><strong>Langue : </strong><xsl:value-of select=".//msItemStruct/textLang"/>.</li>
                <li><strong>Incipit : </strong><i><xsl:value-of select=".//msItemStruct/incipit"/></i>...</li>
                <li><strong>Explicit : </strong><i><xsl:value-of select=".//msItemStruct/explicit"/></i>...</li>
            </ul>
            <h3>Informations institutionnelles</h3>
            <ul>
                <li><strong>Localisation : </strong><xsl:value-of select=".//msIdentifier/settlement"/>, <xsl:value-of select=".//msIdentifier/country"/>.</li>
                <li><strong>Institution : </strong> <xsl:value-of select=".//msIdentifier/repository"/>, <xsl:value-of select=".//msIdentifier/collection"/>.</li>
                <li><strong>Cote : </strong><xsl:value-of select=".//msIdentifier/idno"/></li>
                <li>
                    <strong>Autres identifiants :</strong>
                    <ul>
                        <xsl:for-each select=".//msIdentifier/altIdentifier">
                            <li>
                                <xsl:value-of select="replace(./note,'\.',' : ')"/><xsl:value-of select="./idno"/>
                                <xsl:if test="position()!= last()"> ;</xsl:if>
                                <xsl:if test="position() = last()">.</xsl:if>
                            </li>
                        </xsl:for-each>
                    </ul>
                </li>
            </ul>
            <h3>Description matérielle</h3>
            <ul>
                
            </ul>
        </div>
    </xsl:template>
    <xsl:template match="encodingDesc/projectDesc/p"/>
    <xsl:template match="profileDesc"/>
    <xsl:template match="body">
        <div>
            <h2>
                <xsl:text>Édition</xsl:text>
            </h2>
            <div1>
                <h3>Texte original</h3>
                <xsl:apply-templates select="descendant::p" mode="orig"/>
            </div1>
            <div1>
                <h3>Texte normalisé</h3>
                <xsl:apply-templates select="descendant::p" mode="normal"/>
            </div1>
        </div>
    </xsl:template>
    <xsl:template match="p" mode="#all">
        <xsl:element name="p">
            <xsl:text>[§</xsl:text>
            <xsl:number count="div[@type='paragraph']" format="1" level="single"/>
            <xsl:text>] </xsl:text>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="choice" mode="orig">
        <xsl:value-of select="abbr/text() | orig/text()"/>
    </xsl:template>
    <xsl:template match="choice" mode="normal">
        <xsl:value-of select="expan/text() | reg/text()"/>
    </xsl:template>
    <!-- NOTES (faire des id) -->
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
    <!-- INDEX DES NOMS DE LIEUX -->
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
