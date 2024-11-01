<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Сортировка и группировка -->
    <xsl:key name="companiesByCity" match="item" use="concat(@city, '|', @org)"/>
    <xsl:key name="itemsByCompany" match="item" use="concat(@city, '|', @org, '|', @title)"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Организации и их товары</title>
            </head>
            <body>
                <xsl:for-each select="//item[generate-id() = generate-id(key('companiesByCity', concat(@city, '|', @org))[1])]">
                    <h2><xsl:value-of select="@city"/></h2>
                    <h3><xsl:value-of select="@org"/></h3>
                    <table border="1">
                        <tr>
                            <th>Название товара</th>
                            <th>Количество</th>
                        </tr>
                        <xsl:for-each select="key('companiesByCity', concat(@city, '|', @org))">
                            <xsl:for-each select="key('itemsByCompany', concat(@city, '|', @org, '|', @title))[1]">
                                <tr>
                                    <td><xsl:value-of select="@title"/></td>
                                    <td><xsl:value-of select="@value"/></td>
                                </tr>
                            </xsl:for-each>
                        </xsl:for-each>
                    </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
