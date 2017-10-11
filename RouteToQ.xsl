<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dp="http://www.datapower.com/extensions" xmlns:dpconfig="http://www.datapower.com/param/config" exclude-result-prefixes="dp dpconfig" extension-element-prefixes="dp" version="1.0">
  <!--
   <dp:summary>
      <operation>xform</operation>
      <description>This XSL routes the output to a queue</description>
   </dp:summary>
  -->
  <xsl:variable name="noun"  select="/*/*[local-name()='MessageHeader']/*[local-name()='Noun']" />
  <xsl:variable name="queue" select="document('lookup.xml')/nouns/noun[@name=$noun]/queue"/>

   <xsl:template match="/">
  
      <Message><xsl:value-of select="$noun"/>
      </Message>
      <Value>
      <xsl:value-of select="$queue"/>
      </Value>
   <!--
      <dp:set-variable name="'var://service/routing-url'" value="'mq://9.42.8.208:1414?QueueManager=QM1;Channel=SYSTEM.ADMIN.SVRCONN;RequestQueue=JASONQ'" />
   -->
   </xsl:template>
</xsl:stylesheet>
