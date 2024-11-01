<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Определение ключей -->
    <!-- Ключ для курсов, которые читает Борисов И.О. -->
    <xsl:key name="coursesByTeacher" match="course" use="teachers/teacher[. = 'Борисов И.О.']" />
    
    <!-- Ключ для курсов, которые используют XML -->
    <xsl:key name="coursesByKeyword" match="course" use="keywords/keyword[. = 'XML']" />

    <!-- Начало преобразования -->
    <xsl:template match="/">
        <html>
            <body>
                <h1>Наши курсы</h1>
                
                <!-- Курсы, которые читает Борисов И.О. -->
                <h3>Курсы, которые читает Борисов И.О.</h3>
                <ul>
                    <xsl:apply-templates select="//course[key('coursesByTeacher', .)]" mode="list"/>
                </ul>
                
                <!-- Курсы, которые используют XML -->
                <h3>Курсы, которые используют XML</h3>
                <ul>
                    <xsl:apply-templates select="//course[key('coursesByKeyword', .)]" mode="list"/>
                </ul>

                <!-- Курсы, которые читает Борисов И.О. и используют XSLT -->
                <h3>Курсы, которые читает Борисов И.О. и используют XSLT</h3>
                <ul>
                    <xsl:apply-templates select="//course[key('coursesByTeacher', .)][keywords/keyword = 'XSLT']" mode="list"/>
                </ul>
            </body>
        </html>
    </xsl:template>

    <!-- Шаблон для вывода названия курса в виде элемента списка -->
    <xsl:template match="course" mode="list">
        <li>
            <xsl:value-of select="title" />
        </li>
    </xsl:template>
</xsl:stylesheet>
