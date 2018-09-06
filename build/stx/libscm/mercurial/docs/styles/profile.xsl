<?xml version="1.0" encoding="iso-8859-2"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<!-- Zkop�rov�n� cel�ho dokumentu -->
<xsl:template match="node()|@*">
  <xsl:copy>
    <xsl:apply-templates select="node()|@*"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="classname">
  <!-- Zkop�rov�n� p�vodn�ho elementu -->
  <xsl:copy-of select="."/>
  <!-- Vytvo�en� rejst��kov�ho hesla -->
  <indexterm>
    <primary>class</primary>
    <secondary><xsl:value-of select="."/></secondary>
  </indexterm>
</xsl:template>

<xsl:template match="methodname">
<!-- Zkop�rov�n� p�vodn�ho elementu -->
  <xsl:copy-of select="."/>
  <!-- Vytvo�en� rejst��kov�ho hesla -->
  <indexterm>
    <primary>method</primary>
    <secondary><xsl:value-of select="."/></secondary>
  </indexterm>
</xsl:template>

<xsl:template match="varname">
<!-- Zkop�rov�n� p�vodn�ho elementu -->
  <xsl:copy-of select="."/>
  <!-- Vytvo�en� rejst��kov�ho hesla -->
  <indexterm>
    <primary>variable</primary>
    <secondary><xsl:value-of select="."/></secondary>
  </indexterm>
</xsl:template>



<xsl:template match="filename">
<!-- Zkop�rov�n� p�vodn�ho elementu -->
  <xsl:copy-of select="."/>
  <!-- Vytvo�en� rejst��kov�ho hesla -->
  <indexterm>
    <primary>file</primary>
    <secondary><xsl:value-of select="."/></secondary>
  </indexterm>
</xsl:template>




<!-- Ka�d� jm�no souboru se tak� p�id� do rejst��ku -->
<xsl:template match="filename">
  <!-- Zkop�rov�n� p�vodn�ho elementu -->
  <xsl:copy-of select="."/>
  <!-- Vytvo�en� rejst��kov�ho hesla -->
  <indexterm>
    <primary><xsl:value-of select="."/></primary>
  </indexterm>
</xsl:template>

</xsl:stylesheet>