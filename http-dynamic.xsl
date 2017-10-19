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

  <xsl:variable name="uri" select="dp:variable('var://service/URL-in')"/>

  <xsl:variable name="path" select="substring-after($uri, '9080')"/>

  <xsl:variable name="lookup-value" select="document('http-lookup.xml')/paths/path[@key=$path]"/>

  <xsl:template match="/">

    <xsl:copy-of select="."/>

    <dp:set-variable name="'var://service/routing-url'" value="concat('http://localhost:1', $lookup-value)"/>

    <xsl:message dp:priority="error">
      <xsl:value-of select="dp:variable('var://service/routing-url')"/>
    </xsl:message>

  </xsl:template>

</xsl:stylesheet>
