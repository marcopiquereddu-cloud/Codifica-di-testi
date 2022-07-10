<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <link rel="stylesheet" href="styles.css"/>
                <title><xsl:value-of select="//tei:title[@type='main']"/></title>
            </head>
            <body>
                <header>
                    <div id="intestazione">
                        <a href="https://archives.bge-geneve.ch/ark:/17786/vtae78f994bf3242bef"><h1><xsl:value-of select="//tei:idno[@type='inventory']"/></h1></a>
                        <h1><xsl:value-of select="//tei:collection"/></h1>
                        <h1><xsl:value-of select="//tei:repository"/></h1>
                    </div>
                    <div>
                        <h2>
                            <xsl:apply-templates select="//tei:msContents/tei:msItem[@n='3']/tei:title[@type='sub']"/>, 
                            <xsl:apply-templates select="//tei:msContents/tei:msItem[@n='3']/tei:docDate"/>
                        </h2>
                    </div>
                </header>
                <div id="text">
                    <div id="p1">
                        <h3>Pagina 1</h3>
                        <xsl:for-each select="//tei:div[@xml:id='div_p1']/tei:ab">
                            <h4><xsl:value-of select="./@xml:id"/></h4>
                            <p><xsl:apply-templates select="."/></p>
                        </xsl:for-each>
                    </div>
                    <div id="p2">
                        <h3>Pagina 2</h3>
                        <xsl:for-each select="//tei:div[@xml:id='div_p2']/tei:ab">
                            <h4><xsl:value-of select="./@xml:id"/></h4>
                            <p><xsl:apply-templates select="."/></p>
                        </xsl:for-each>
                    </div>
                    <h3 id="_it">Traduzione italiana a cura di Emanuele Fadda</h3>
                    <div id="_ita">
                        <xsl:for-each select="//tei:body[@source='#Fadda2006']/tei:ab">
                            <h4><xsl:value-of select="./@xml:id"/></h4>
                            <p><xsl:value-of select="."/></p>
                        </xsl:for-each>
                    </div>
                </div>
                <div id="back">
                    <div id="bibliografia">
                        <h1>BIBLIOGRAFIA</h1>
                        <xsl:for-each select="//tei:bibl">
                            <xsl:for-each select="./tei:author">
                                <h2 id="nome"><xsl:value-of select="./tei:persName/tei:forename"/></h2>
                                <h2 id="cognome"><xsl:value-of select="./tei:persName/tei:surname"/>;</h2>
                            </xsl:for-each>
                            <h3><xsl:value-of select="./tei:title[@type='main']"/>&#160;<xsl:value-of select="./tei:title[@type='sub']"/></h3>
                        </xsl:for-each>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//tei:ab//tei:term">
        <span title="elemento terminologico" class="tag"> 
            <xsl:apply-templates/>   
        </span>
    </xsl:template>
    <xsl:template match="//tei:ab//tei:seg">
        <span title="elemento databile" class="databile"> 
            <xsl:apply-templates/>   
        </span>
    </xsl:template>
    <xsl:template match="//tei:ab//tei:seg[@xml:id]">
        <span title="glottonimo" class="glottonimo"> 
            <xsl:apply-templates/>   
        </span>
    </xsl:template>
    <xsl:template match="//tei:ab//tei:emph">
        <span title="enfasi" class="enfasi"> 
            <xsl:apply-templates/>   
        </span>
    </xsl:template>
    <xsl:template match="//tei:ab//tei:del">
        <span title="cancellatura" class="cancellatura"> 
            <xsl:apply-templates/>   
        </span>
    </xsl:template>
</xsl:stylesheet>
