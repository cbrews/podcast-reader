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

  <xsl:template match="/">
    <main>
      <xsl:for-each select="rss/channel">
        <section>
          <header>
            <h1><xsl:value-of select="title" /></h1>
            <figure>
              <img width="100" src="{image/url}" alt="{image/title}" />
            </figure>
            <p><xsl:value-of select="description" /></p>
            <p><xsl:value-of select="itunes:author" />. <xsl:value-of select="copyright" /></p>
          </header>
          <xsl:for-each select="item">
            <article id="{guid}">
              <h2>Episode <xsl:value-of select="itunes:episode" />: <xsl:value-of select="title" /></h2>
              <p><a href="episode/{guid}">Link</a></p>
              <p><xsl:value-of select="pubDate" /> | <a href="{enclosure/@url}">Download</a></p>
              <p><audio controls="" src="{enclosure/@url}" preload="none"></audio></p>
              <details>
                <summary>Details</summary>
                <p><xsl:value-of select="itunes:summary" /></p>
              </details>
            </article>
          </xsl:for-each>
        </section>
      </xsl:for-each>
    </main>
  </xsl:template>
</xsl:stylesheet>