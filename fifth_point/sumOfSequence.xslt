<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!-- Template to match the root element -->
    <xsl:template match="/">
        <!-- Variable to hold the starting number -->
        <xsl:variable name="from" select="sum-of-sequence/from"/>
        
        <!-- Variable to hold the ending number -->
        <xsl:variable name="to" select="sum-of-sequence/to"/>
        
        <!-- Calculate the sum using a recursive template -->
        <xsl:call-template name="sumSequence">
            <xsl:with-param name="current" select="$from"/>
            <xsl:with-param name="end" select="$to"/>
            <xsl:with-param name="sum" select="0"/>
        </xsl:call-template>
    </xsl:template>

    <!-- Template to calculate the sum recursively -->
    <xsl:template name="sumSequence">
        <xsl:param name="current"/>
        <xsl:param name="end"/>
        <xsl:param name="sum"/>
        
        <!-- Check if the current value is greater than the end value -->
        <xsl:choose>
            <xsl:when test="$current &gt; $end">
                <!-- Output the final sum -->
                <xsl:value-of select="$sum"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- Call the template recursively, incrementing the current number and updating the sum -->
                <xsl:call-template name="sumSequence">
                    <xsl:with-param name="current" select="$current + 1"/>
                    <xsl:with-param name="end" select="$end"/>
                    <xsl:with-param name="sum" select="$sum + $current"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
