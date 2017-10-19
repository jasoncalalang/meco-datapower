<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
  exclude-result-prefixes="dp dpconfig"
  extension-element-prefixes="dp"
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:dp="http://www.datapower.com/extensions"
  xmlns:dpconfig="http://www.datapower.com/param/config">
  <dp:summary>
    <operation>xform</operation>
    <description>This XSL routes the output to a queue</description>
  </dp:summary>

  <xsl:template match="/">

    <xsl:copy-of select="."/>

    <xsl:variable name="uri" select="dp:variable('var://service/URL-in')"/>

    <xsl:variable name="path" select="substring-after($uri, '9080')"/>

    <xsl:variable name="path-before" select="substring-before($path, '?')"/>

    <xsl:variable name="http-config" select="document('http-endpoint.xml')/endpoint" />

    <xsl:choose>

      <!-- if there is a query parameter -->
      <xsl:when test="string-length($path-before) != 0">
        <dp:set-local-variable name="'lookup-value'" value="document('http-lookup.xml')/paths/path[@key=$path-before]"/>
        <dp:set-variable name="'var://service/routing-url'" value="concat('http://localhost:9080', concat(dp:local-variable('lookup-value'), $query-string))"/>
      </xsl:when>

      <!-- if there is no query parameter -->
      <xsl:otherwise>
        <dp:set-local-variable name="'lookup-value'" value="document('http-lookup.xml')/paths/path[@key=$path]"/>
        <dp:set-variable name="'var://service/routing-url'" value="concat('http://localhost:9080', dp:local-variable('lookup-value'))"/>
      </xsl:otherwise>
    </xsl:choose>

    <xsl:variable name="query-string" select="concat('?', substring-after($uri, '?'))"/>

    <xsl:message dp:priority="error">
      <xsl:value-of select="dp:variable('var://service/routing-url')"/>
    </xsl:message>

    <xsl:message dp:priority="error">
      <xsl:value-of select="concat('lookup-value = ', dp:local-variable('lookup-value'))"/>
    </xsl:message>

    <xsl:message dp:priority="error">
      <xsl:value-of select="concat('path = ', $path)"/>
    </xsl:message>

    <xsl:message dp:priority="error">
      <xsl:value-of select="concat('path-before = ', $path-before)"/>
    </xsl:message>

    <xsl:message dp:priority="error">
      <xsl:value-of select="concat('query-string = ', $query-string)"/>
    </xsl:message>

  </xsl:template>

</xsl:stylesheet>
