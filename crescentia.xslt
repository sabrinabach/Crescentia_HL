<?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet version="3.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:tei="http://www.tei-c.org/ns/1.0"
        exclude-result-prefixes="tei">
    
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    .container {
                    column-count: 4;     
                    column-gap: 16px; 
                    }
               
                   .person {
                   color: pink;
                   }
                   .person:hover::after {
                   content: " (" attr(title) ")";
                   font-weight: bold;
                   color: pink;
                   }
                   .place {color: purple}
                   .a {margin-bottom: 1em}
                    .highlight { color: red; }
            
                    .add { color: green; }
                    .unclear { font-style: italic; }

                    .underline { text-decoration: underline; }
                    .strike { text-decoration: line-through; } 
                    
                     a { text-decoration: none; }
                                
                     a.wikidata::after { content: " ↗"; }
                   
                     a.wikidata:hover { color: darkblue; }
                    
                </style>
                
                <title>"Crescentia", 
                    Hr4, 
                    Heiligen Leben</title>
                
            </head>
            <body>
                <div class="container">
                  
                    <h2>"Crescentia", 
                        Hr4, 
                        Heiligen Leben</h2>
                        <xsl:apply-templates select="/tei:TEI/tei:text/tei:body"/>
                    </div>
                   </body>
        
        </html>
    </xsl:template>
    
    
    <xsl:template match="tei:ab">
        <div class="ab">
            <xsl:apply-templates/>
        </div>
        
    </xsl:template>
        <xsl:template match="tei:lb">
            <br/>
           
        </xsl:template>
    
    
    <xsl:template match="tei:add">
        <span class="add">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:unclear">
        <span class="unclear">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
        <xsl:template match="tei:del">
            <span class="strike">
                <xsl:apply-templates/>
            </span>
        </xsl:template>
    
    <xsl:template match="tei:hi">
        <span>
            <xsl:attribute name="class">
                <xsl:if test="contains(@rend,'highlight')">
                    <xsl:text> highlight</xsl:text>
                </xsl:if>
                <xsl:if test="contains(@rend,'underline')">
                    <xsl:text> underline</xsl:text>
                </xsl:if>
                <xsl:if test="contains(@rend,'strikethrough')">
                    <xsl:text> strike</xsl:text>
                </xsl:if>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
          
                
                <xsl:template match="tei:persName">
                    <xsl:choose>
                        <xsl:when test="@ref">
                            <a href="{@ref}">
                                <xsl:if test="contains(@ref, 'wikidata.org')">
                                    <xsl:attribute name="class">wikidata</xsl:attribute>
                                </xsl:if>
                                <xsl:if test="@key">
                                    <xsl:attribute name="title">
                                        <xsl:value-of select="@key"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:apply-templates/>
                            </a>
                        </xsl:when>
                        <xsl:otherwise>
                            <span class="person">
                                <xsl:if test="@key">
                                    <xsl:attribute name="title">
                                        <xsl:value-of select="@key"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:apply-templates/>
                            </span>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:template>
                
             
                <xsl:template match="tei:placeName">
                    <xsl:choose>
                        
                        <xsl:when test="@ref">
                            <a href="{@ref}">
                                <xsl:if test="contains(@ref, 'wikidata.org')">
                                    <xsl:attribute name="class">wikidata</xsl:attribute>
                                </xsl:if>
                                
                                <xsl:if test="@key">
                                    <xsl:attribute name="title">
                                        <xsl:value-of select="@key"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:apply-templates/>
                            </a>
                        </xsl:when>
                      
                                <xsl:otherwise>
                                    <span class="place">
                                        <xsl:if test="@key">
                                            <xsl:attribute name="title">
                                                <xsl:value-of select="@key"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:apply-templates/>
                                    </span>
                                </xsl:otherwise>
                    </xsl:choose>
                </xsl:template>
                
    
    <xsl:template match="tei:teiHeader"/>
    <xsl:template match="text()">
        <xsl:value-of select="."/>
    </xsl:template>
    
</xsl:stylesheet>