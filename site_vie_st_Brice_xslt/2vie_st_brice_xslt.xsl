<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:preserve-space elements="*"/>
    <xsl:template match="/">
        <!-- RÈGLES DE SORTIE -->
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(vie_st_brice_tei), '.xml', '')"/>
            <!-- récupération du nom et du chemin du fichier courant -->
        </xsl:variable>
        <xsl:variable name="pathHome">
            <xsl:value-of select="concat($witfile,'home','.html')"/>
            <!-- variable pour le contenu de home.html  -->
        </xsl:variable>
        <xsl:variable name="pathms">
            <xsl:value-of select="concat($witfile,'manuscrit','.html')"/>
            <!-- variable pour le contenu de manuscrit.html  -->
        </xsl:variable>
        <xsl:variable name="pathorig">
            <xsl:value-of select="concat($witfile,'txtorig','.html')"/>
            <!-- variable pour le contenu de txtorig.html  -->
        </xsl:variable>
        <xsl:variable name="pathnorm">
            <xsl:value-of select="concat($witfile,'txtnorm','.html')"/>
            <!-- variable pour le contenu de txtnorm.html  -->
        </xsl:variable>
        <xsl:variable name="pathIndex">
            <xsl:value-of select="concat($witfile,'index','.html')"/>
            <!-- variable pour le contenu de index.html  -->
        </xsl:variable>
        <!-- VARIABLES CONTENANT LES PARTIES COMMUNES À TOUTES LES PAGES -->
        <xsl:variable name="doc_head">
            <!-- variable contenant le <head> -->
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <link rel="stylesheet" type="text/css" href="css_vie_st_Brice.css"/>
                <title>Vie de saint Brice</title>
            </head>
        </xsl:variable>
        <xsl:variable name="navheader">
            <!-- variable contenant la navbar et le <header> -->
            <nav class="nav-global fixed-top">
                <form class="nav-form" action="{$pathHome}" method="get">
                    <button class="dropbtn" style="margin-right: 3%;">Accueil</button>
                </form>
                <div class="nav-list">
                    <form class="nav-form" action="{$pathms}" method="get">
                        <button class="dropbtn">Manuscrit</button>
                    </form>
                    <form class="dropdown nav-form">
                        <button class="dropbtn">Éditions</button>
                        <div class="dropdown-content">
                            <a href="{$pathorig}">Texte original</a>
                            <a href="{$pathnorm}">Texte normalisé</a>
                        </div>
                    </form>
                    <form class="nav-form" action="{$pathIndex}" method="get">
                        <button class="dropbtn">Index</button>
                    </form>
                </div>
            </nav>
            <header class="header-global">
                <div>
                    <h1><xsl:value-of select="//sourceDesc//head/title[@level='m']"/></h1>
                    <h2 style="font-family: Garamont;"><xsl:value-of select="replace(//sourceDesc//head/title[@level='a'],', deuxième partie','')"/></h2>
                    <h3>(<xsl:value-of select="//sourceDesc//msIdentifier/repository"/>, ms. <xsl:value-of select="replace(//sourceDesc//msIdentifier/idno[@type='cote'],'français','fr.')"/>)</h3>
                </div>
            </header>
        </xsl:variable>
        <xsl:variable name="footer">
            <!-- variable contenant le <footer> -->
            <div>
                <footer class="bloc-footer">
                    <div>
                        <div class="global-footer">
                            <div class="text-footer">
                                <div class="name-footer-global">
                                    <div class="name-footer">
                                        © Jean-Damien Généro
                                    </div>
                                </div>
                                <p class="credit-footer">Site développé en 2020 dans le cadre des enseignements du <a href="http://www.chartes.psl.eu/fr/cursus/master-technologies-numeriques-appliquees-histoire" target="_blank">Master &#171; Technologies numériques appliquées à l'histoire &#187;</a> de l'École nationale des chartes.</p>
                            </div>
                            <div class="box-img-footer">
                                <a href="http://www.chartes.psl.eu/" target="_blank">
                                    <img src="logo_enc.png" alt="Logo de l'École des chartes" class="img-footer"/>
                                </a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </xsl:variable>
        <!-- ÉCRITURE DES PAGES DU SITE -->
        <!-- PAGE D'ACCUEIL -->
        <xsl:result-document href="{$pathHome}" method="html" indent="yes">
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="fr">
                <xsl:copy-of select="$doc_head"/>
                <body>
                    <xsl:copy-of select="$navheader"/>
                    <div class="arriere_plan">
                        <div class="global_home">
                            <figure class="div_img">
                                <img src="img-vie-st-brice-f169-170.jpeg" alt="Bnf ms. fr. 411 folios 169-170" class="img"/>
                            </figure>
                            <div class="p_home">
                                <h1 style="text-indent: 5%;">Bienvenue !</h1>
                                <p>Cet espace est dédié à l'édition des folios <xsl:value-of select="//physDesc//handNote//locus/@from"/> et <xsl:value-of select="//physDesc//handNote//locus/@to"/> du manuscrit <xsl:value-of select="//sourceDesc//msIdentifier/idno[@type='cote']"/> de la <xsl:value-of select="//sourceDesc//msIdentifier/repository"/> <i> (image ci-contre)</i>. Ils portent sur la deuxième partie de la <xsl:value-of select="replace(replace(//sourceDesc//head/title[@level='a'],'Vie','vie'),', deuxième partie',' de Tours')"/>.</p>
                                <p><xsl:value-of select="//notesStmt/note[1]"/>.</p>
                                <p><xsl:text>Le site est développé par </xsl:text><xsl:value-of select="//respStmt//forename"/><xsl:text> </xsl:text><xsl:value-of select="//respStmt//surname"/><xsl:text> </xsl:text><xsl:value-of select="replace(replace(//respStmt/resp,'Encodage réalisé en janvier 2020','en avril 2020'),'XML-TEI','XSLT')"/></p>
                            </div>
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
        <!-- PAGE DE PRÉSENTATION DU MANUSCRIT -->
        <xsl:result-document href="{$pathms}" method="html" indent="yes">
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="fr">
                <xsl:copy-of select="$doc_head"/>
                <body>
                    <xsl:copy-of select="$navheader"/>
                    <div class="arriere_plan">
                        <div class="page-global">
                            <h1>Le manuscrit</h1>
                            <div>
                                <h2>Identification</h2>
                                <ul>
                                    <li><strong>Titre du manuscrit : </strong><i><xsl:value-of select="//sourceDesc//head/title[@level='m']"/></i>.</li>
                                    <li><strong>Titre de la partie éditée : </strong><i><xsl:value-of select="//sourceDesc//head/title[@level='a']"/></i>.
                                        <ul>
                                            <li><strong>Incipit : </strong><i><xsl:value-of select="//sourceDesc//msItemStruct/incipit"/></i>...</li>
                                            <li><strong>Explicit : </strong><i>...<xsl:value-of select="//sourceDesc//msItemStruct/explicit"/></i>.</li>
                                        </ul>
                                    </li>
                                    <li><strong>Auteur : </strong>
                                        <xsl:for-each select="//sourceDesc//msItemStruct/author[@xml:lang='fr']">
                                            <xsl:value-of select="."/>
                                            <xsl:if test="position()!= last()"> ou </xsl:if>
                                        </xsl:for-each>
                                        <xsl:text> (</xsl:text>
                                        <i><xsl:value-of select="//sourceDesc//msItemStruct/author[@xml:lang='fro']"/></i>
                                        <xsl:text> en langue d'oïl).</xsl:text>
                                    </li>
                                    <li><strong>Datation : </strong><xsl:value-of select="//sourceDesc//head/origDate"/>.</li>
                                    <li><strong>Langue : </strong><xsl:value-of select="//sourceDesc//msItemStruct/textLang"/>.</li>
                                </ul>
                            </div>
                            <div>
                                <h2>Conservation</h2>
                                <ul>
                                    <li><strong>Localisation : </strong><xsl:value-of select="//sourceDesc//msIdentifier/settlement"/>, <xsl:value-of select="//sourceDesc//msIdentifier/country"/>.</li>
                                    <li><strong>Institution : </strong> <xsl:value-of select="//sourceDesc//msIdentifier/repository"/>, <xsl:value-of select="//sourceDesc//msIdentifier/collection"/>.</li>
                                    <li><strong>Cote : </strong><xsl:value-of select="//sourceDesc//msIdentifier/idno"/></li>
                                    <li>
                                        <strong>Autres identifiants :</strong>
                                        <ul>
                                            <xsl:for-each select="//msIdentifier/altIdentifier">
                                                <li>
                                                    <strong><xsl:value-of select="replace(./note,'\.',' : ')"/></strong><xsl:value-of select="./idno"/>
                                                    <xsl:if test="position()!= last()"> ;</xsl:if>
                                                    <xsl:if test="position() = last()">.</xsl:if>
                                                </li>
                                            </xsl:for-each>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                            <div>
                                <h2>Description matérielle</h2>
                                <ul>
                                    <li>
                                        <strong>Supports : </strong>
                                        <xsl:for-each select="//sourceDesc//material">
                                            <xsl:value-of select="lower-case(.)"/>
                                            <xsl:if test="position()!= last()">, </xsl:if>
                                            <xsl:if test="position() = last()">.</xsl:if>
                                        </xsl:for-each>
                                    </li>
                                    <li><strong>Dimensions : </strong>
                                        <xsl:value-of select="//extent/width"/>
                                        <xsl:text>mm. x </xsl:text>
                                        <xsl:value-of select="//extent/height"/>
                                        <xsl:text>mm.</xsl:text>
                                    </li>
                                    <li><strong>Foliotation : </strong> <xsl:value-of select="//foliation/p"/></li>
                                    <li><strong>État de conservation : </strong> <xsl:value-of select="//condition"/></li>
                                    <li><strong>Mise en page :</strong>
                                        <ul>
                                            <li><strong>Nombre de colonnes par folio : </strong><xsl:value-of select="//layout/@columns"/>.</li>
                                            <li><strong>Hauteur de colonne : </strong><xsl:value-of select="//layoutDesc//height"/> mm.</li>
                                            <li><strong>Largeur de colonne : </strong><xsl:value-of select="//layoutDesc//width"/> mm.</li>
                                            <li><strong>Nombre de lignes par colonne : </strong><xsl:value-of select="//layout/@writtenLines"/>.</li>
                                            <li><strong>Largeur de l'entrecolonne : </strong><xsl:value-of select="replace(//layout/note,'Entrecolonne : ','')"/></li>
                                        </ul>
                                    </li>
                                    <li><strong>Écriture : </strong> <xsl:value-of select="//handNote//p"/>.</li>
                                </ul>
                            </div>
                            <div>
                                <h2>Décorations et marques</h2>
                                <ul>
                                    <li><strong>Décorations :</strong>
                                        <ul>
                                            <xsl:for-each select="//decoNote/p">
                                                <li><xsl:value-of select="."/></li>
                                            </xsl:for-each>
                                        </ul>
                                    </li>
                                    <li><strong>Reliure : </strong><xsl:value-of select="//bindingDesc/p"/></li>
                                    <li><strong>Marques : </strong><xsl:value-of select="//provenance"/></li>
                                </ul>
                            </div>
                            <div>
                                <h2>Indications bibliographiques</h2>
                                <ul>
                                    <xsl:for-each select="//monogr">
                                        <li>
                                            <xsl:if test=".//forename">
                                                <!-- Une référence bibliographique n'a pas d'auteur (celle de l'IRHT) -->
                                                <xsl:value-of select=".//forename"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select=".//surname"/>
                                                <xsl:text>, </xsl:text>
                                            </xsl:if>
                                            <xsl:text>&#171; </xsl:text>
                                            <xsl:value-of select=".//title[@level='a']"/>
                                            <xsl:text> &#187;</xsl:text>
                                            <xsl:choose>
                                                <!-- deux cas : il y a un titre de niveau j (journal, revue) / il y a un titre de niveau m (monography) -->
                                                <xsl:when test=".//title[@level='j']">
                                                    <!-- titre de niveau j  -->
                                                    <xsl:text> dans </xsl:text>
                                                    <i><xsl:value-of select=".//title[@level='j']"/></i>
                                                    <xsl:text> </xsl:text>
                                                    <xsl:choose>
                                                        <!-- deux cas : il y a une ISSN pour la revue (xsl:when), il n'y en a pas (xsl:otherwise) -->
                                                        <xsl:when test=".//idno[@type='ISSN']">
                                                            <xsl:text>(ISSN </xsl:text>
                                                            <xsl:value-of select=".//idno[@type='ISSN']"/>
                                                            <xsl:text>), </xsl:text>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:text>(</xsl:text>
                                                            <xsl:value-of select=".//idno"/>
                                                            <xsl:text>), </xsl:text>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                    <xsl:text>vol. </xsl:text>
                                                    <xsl:value-of select=".//biblScope[@unit='volume']"/>
                                                </xsl:when>
                                                <xsl:when test=".//title[@level='m']">
                                                    <!-- titre de niveau m (notice de l'IRHT) -->
                                                    <xsl:text>, </xsl:text>
                                                    <xsl:value-of select=".//title[@level='m']"/>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:text>, </xsl:text>
                                            <xsl:value-of select=".//date"/>
                                            <xsl:text>, pp. </xsl:text>
                                            <xsl:value-of select=".//biblScope[@unit='page']/@from"/>
                                            <xsl:text>-</xsl:text>
                                            <xsl:value-of select=".//biblScope[@unit='page']/@to"/>
                                            <xsl:text>.</xsl:text>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
        <!-- PAGE DU TEXTE ORIGINAL -->
        <xsl:result-document href="{$pathorig}" method="html" indent="yes">
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="fr">
                <xsl:copy-of select="$doc_head"/>
                <body>
                    <xsl:copy-of select="$navheader"/>
                    <div class="arriere_plan">
                        <div class="page-global">
                            <h1>Transcription fac-similaire</h1>
                            <div>
                                <xsl:apply-templates select="descendant::body//p" mode="orig"/>
                            </div>
                            <div>
                                <xsl:call-template name="notes"/>
                            </div>
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
        <!-- PAGE DU TEXTE NORMALISÉ ET DES NOTES -->
        <xsl:result-document href="{$pathnorm}" method="html" indent="yes">
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="fr">
                <xsl:copy-of select="$doc_head"/>
                <body>
                    <xsl:copy-of select="$navheader"/>
                    <div class="arriere_plan">
                        <div class="page-global">
                            <h1>Transcription normalisée</h1>
                            <div>
                                <xsl:apply-templates select="descendant::body//p" mode="normal"/>
                            </div>
                            <div>
                                <xsl:call-template name="notes"/>
                            </div>
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
        <!-- PAGE DES INDEX -->
        <xsl:result-document href="{$pathIndex}" method="html" indent="yes">
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="fr">
                <xsl:copy-of select="$doc_head"/>
                <body>
                    <xsl:copy-of select="$navheader"/>
                    <div class="arriere_plan">
                        <div class="index-global">
                            <h1>Index</h1>
                            <div>
                                <p><i>Les numéros renvoient aux paragraphes.</i></p>
                            </div>
                            <div class="index">
                                <div>
                                    <xsl:call-template name="noms"/>
                                </div>
                                <div>
                                    <xsl:call-template name="lieux"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    <!-- RÈGLES POUR LE TEXTE -->
    <xsl:template match="//body//p" mode="#all">
        <!-- match uniquement sur les <p> du <body> -->
        <xsl:element name="p">
            <xsl:attribute name="style">
                <xsl:text>line-height: 2; text-indent: 10%;</xsl:text>
            </xsl:attribute>
            <xsl:text>[</xsl:text>
            <!-- numero du paragraphe mis entre crochets -->
            <xsl:number count="div[@type='paragraph']" format="1" level="single"/>
            <xsl:text>] </xsl:text>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="choice" mode="orig">
        <!-- règle pour le texte original : uniquement la valeur de <abbr> et <orig> des <choice> -->
        <xsl:value-of select="abbr/text() | orig/text()"/>
    </xsl:template>
    <xsl:template match="choice" mode="normal">
        <!-- règle pour le texte normalisé : uniquement la valeur de <expan> et <reg> des <choice> -->
        <xsl:value-of select="expan/text() | reg/text()"/>
    </xsl:template>
    <!-- RÈGLES DES NOTES -->
    <xsl:template match="ref[@type='note']" mode="#all">
        <!-- Règle pour faire les appels de note en exposant -->
        <xsl:element name="sup">
            <xsl:attribute name="style">
                <xsl:text>font-size: 10pt;</xsl:text>
            </xsl:attribute>
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <!-- @href afin de faire le lien vers le texte de la note, son contenu est le numéro de la note (@n) -->
                    <xsl:text>#</xsl:text>
                    <xsl:value-of select="./@n"/>
                </xsl:attribute>
                <!-- texte de l'appel de note : son numéro (@n) -->
                <xsl:value-of select="./@n"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template name="notes">
        <!-- Règle pour le texte des notes sous le texte -->
        <xsl:for-each select="//notesStmt/note">
            <xsl:element name="p">
                <xsl:attribute name="id">
                    <!-- @id = ancre pour le lien de @href établi dans la règle précédente -->
                    <xsl:value-of select="./@n"/>
                </xsl:attribute>
                <xsl:attribute name="class">
                    <xsl:text>notes-p</xsl:text>
                </xsl:attribute>
                <!-- commence par le numéro de la note (@n) suivi d'un point -->
                <xsl:value-of select="./@n"/>
                <xsl:text>. </xsl:text>
                <!-- texte de la note défini par un apply-templates -->
                <xsl:apply-templates/>
                <xsl:if test="./@source">
                    <!-- s'il y a un attribut source (qui pointe forcément vers le Dictionnaire de moyen français), un lien est fait vers un nouvel onglet -->
                    <xsl:text> </xsl:text>
                    <xsl:text>(</xsl:text>
                    <xsl:element name="a">
                        <xsl:attribute name="href">
                            <xsl:value-of select="./@source"/>
                        </xsl:attribute>
                        <xsl:attribute name="target">
                            <xsl:text>_blank</xsl:text>
                        </xsl:attribute>
                        <xsl:text>DMF</xsl:text>
                    </xsl:element>
                    <xsl:text>)</xsl:text>
                </xsl:if>
                <xsl:text>.</xsl:text>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="hi[@rend='italic']">
        <!-- règle pour mettre en italique les passages signalées par <hi rend='italic'> -->
        <xsl:element name="i">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <!-- RÈGLES DE L'INDEX DES NOMS DE PERSONNES -->
    <xsl:template name="noms">
        <xsl:element name="div">
            <h2>Personnes</h2>
            <xsl:element name="div">
                <xsl:for-each select="//listPerson//persName">
                    <!-- tri de A à Z des entrées d'index -->
                    <xsl:sort select="/forename[@xml:lang='fr']" order="ascending"/>
                    <xsl:element name="p">
                        <xsl:element name="b">
                            <!-- intitulé de l'entrée d'index en bold : prénom suivi du nom ; -->
                            <xsl:value-of select="forename[@xml:lang='fr']"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="surname[@full='yes']"/>
                            <xsl:text> </xsl:text>
                            <xsl:text>(</xsl:text>
                            <xsl:if test="addName[@full='yes']">
                                <!-- entre pranthèses : s'il existe, le surnom développé, -->
                                <xsl:value-of select="addName[@full='yes']"/>
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                            <xsl:choose>
                                <!-- puis deux cas : il y a une date de naissance et une date de mort OU il y a uniquement une date de mort -->
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
                            <!-- variable $idPerson contenant la valeur de l'@xml:id de <person> dans le <particDesc>  -->
                            <xsl:value-of select="parent::person/@xml:id"/>
                        </xsl:variable>
                        <xsl:text> : </xsl:text>
                        <xsl:for-each-group select="ancestor::TEI//body//persName[translate(@ref, '#','')=$idPerson]" group-by="ancestor::div/@n">
                            <!-- occurence du nom (<persName> dans le <body> dont @ref sans le '#' est équivalent à $idPerson) groupé par paragraphe (<div>) -->
                            <!-- est affichée le numéro du paragraphe cocnerné (@n de <div>) -->
                            <xsl:value-of select="ancestor::div/@n"/>
                            <!-- occurence suivie par une virgule si elle n'est pas la dernière, par un point si elle l'est -->
                            <xsl:if test="position()!= last()">, </xsl:if>
                            <xsl:if test="position() = last()">.</xsl:if>
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <!-- RÈGLES DE L'INDEX DES NOMS DE LIEUX -->
    <xsl:template name="lieux">
        <xsl:element name="div">
            <h2>Lieux</h2>
            <xsl:element name="div">
                <xsl:for-each select="//place//name[@xml:lang='fr']">
                    <xsl:sort select="." order="ascending"/>
                    <xsl:element name="p">
                        <xsl:element name="b">
                            <!-- intitulé de l'entrée d'index en bold : le nom du lien en français (name[@xml:lang='fr']) avec le pays (<country>) -->
                            <xsl:value-of select="."/>
                            <xsl:text> (</xsl:text>
                            <xsl:value-of select="preceding-sibling::country"/>
                            <xsl:text>)</xsl:text>
                        </xsl:element>
                        <xsl:variable name="Placeid">
                            <!-- variable $Placeid contenant la valeur de l'@xml:id de <place> dans le <settingDesc>  -->
                            <xsl:value-of select="ancestor::place/@xml:id"/>
                        </xsl:variable>
                        <xsl:text> : </xsl:text>
                        <xsl:for-each-group select="ancestor::TEI//body//placeName[translate(@ref, '#','')=$Placeid]" group-by="ancestor::div/@n">
                            <!-- occurence du nom (<placeName> dans le <body> dont @ref sans le '#' est équivalent à $Placeid) groupé par paragraphe (<div> -->
                            <!-- est affichée le numéro du paragraphe cocnerné (@n de <div>) -->
                            <xsl:value-of select="ancestor::div/@n"/>
                            <!-- occurence suivie par une virgule si elle n'est pas la dernière, par un point si elle l'est -->
                            <xsl:if test="position()!= last()">, </xsl:if>
                            <xsl:if test="position() = last()">.</xsl:if>
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
