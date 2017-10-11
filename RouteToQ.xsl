<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="dp dpconfig" extension-element-prefixes="dp" version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dp="http://www.datapower.com/extensions" xmlns:dpconfig="http://www.datapower.com/param/config">
	<dp:summary>
		<operation>xform</operation>
		<description>This XSL routes the output to a queue</description>
	</dp:summary>
	
	<xsl:variable name="noun" select="/*/*[local-name()='MessageHeader']/*[local-name()='Noun']"/>
	<xsl:variable name="queue" select="document('lookup.xml')/nouns/noun[@name=$noun]/queue"/>
	
	<xsl:template match="/">
		<xsl:copy-of select="."/>
		<dp:set-variable name="'var://service/routing-url'" value="concat('mq://9.42.8.208:1414?QueueManager=QM1;Channel=SYSTEM.ADMIN.SVRCONN;RequestQueue=', $queue)"/>
	</xsl:template>
	
</xsl:stylesheet>
