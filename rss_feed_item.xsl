<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  version="3.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd"
  xmlns:googleplay="http://www.google.com/schemas/play-podcasts/1.0"
  xmlns:atom="http://www.w3.org/2005/Atom"
  xmlns:media="http://search.yahoo.com/mrss/"
  xmlns:content="http://purl.org/rss/1.0/modules/content/"
>
  <xsl:output method="html" />
  <xsl:strip-space elements="*"/>

  <xsl:variable name="guid" select="'{{ episode_id }}'" />

  <xsl:template match="rss">
    <xsl:apply-templates select="channel/item" />
  </xsl:template>

  <xsl:template match="item">
    <xsl:if test="guid[text() = $guid]">
      <section>
        <h2>Episode <xsl:value-of select="itunes:episode" />: <xsl:value-of select="title" /></h2>
        <p><xsl:value-of select="pubDate" /> | <a href="{enclosure/@url}">Download</a></p>
        <p><audio controls="" src="{enclosure/@url}" preload="none"></audio></p>
        <xsl:value-of select="content:encoded" disable-output-escaping="yes" />
      </section>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>