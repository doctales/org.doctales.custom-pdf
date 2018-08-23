<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    
    
    <!-- ====================================================================== -->
    <!--                               VARIABLES                                -->
    <!-- ====================================================================== -->
    
    <xsl:variable name="page-height-landscape">8.5in</xsl:variable>
    <xsl:variable name="page-width-landscape">11in</xsl:variable>
    <xsl:variable name="page-margin-landscape">1in</xsl:variable>
    
    
    <!-- ====================================================================== -->
    <!--                             ATTRIBUTE SETS                             -->
    <!-- ====================================================================== -->
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Page master for landscape topics</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:attribute-set name="landscape-page-master">
        <xsl:attribute name="page-width">
            <xsl:value-of select="$page-width-landscape"/>
        </xsl:attribute>
        <xsl:attribute name="page-height">
            <xsl:value-of select="$page-height-landscape"/>
        </xsl:attribute>
    </xsl:attribute-set>
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Page master for two column topics</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:attribute-set name="two-columns-page-master">
        <xsl:attribute name="page-width">
            <xsl:value-of select="$page-width"/>
        </xsl:attribute>
        <xsl:attribute name="page-height">
            <xsl:value-of select="$page-height"/>
        </xsl:attribute>
    </xsl:attribute-set>
    
    
    <!-- ====================================================================== -->
    <!--                              REGION BODYS                              -->
    <!-- ====================================================================== -->
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Page master for landscape body region</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:attribute-set name="region-body.landscape">
        <xsl:attribute name="margin-top">
            <xsl:value-of select="$page-margin-top"/>
        </xsl:attribute>
        <xsl:attribute name="margin-bottom">
            <xsl:value-of select="$page-margin-bottom"/>
        </xsl:attribute>
        <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">
            <xsl:value-of select="$page-margin-landscape"/>
        </xsl:attribute>
        <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">
            <xsl:value-of select="$page-margin-landscape"/>
        </xsl:attribute>
    </xsl:attribute-set>
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p>Page master for landscape body region</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:attribute-set name="region-body.two-columns">
        <xsl:attribute name="margin-top">
            <xsl:value-of select="$page-margin-top"/>
        </xsl:attribute>
        <xsl:attribute name="margin-bottom">
            <xsl:value-of select="$page-margin-bottom"/>
        </xsl:attribute>
        <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">
            <xsl:value-of select="$page-margin-landscape"/>
        </xsl:attribute>
        <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">
            <xsl:value-of select="$page-margin-landscape"/>
        </xsl:attribute>
        <xsl:attribute name="column-count">2</xsl:attribute>
    </xsl:attribute-set>
    
    
    <!-- ====================================================================== -->
    <!--                              PAGE MASTERS                              -->
    <!-- ====================================================================== -->
    <xsl:template match="/" mode="create-page-masters">
        <xsl:next-match/>
        
        <!-- landscape -->
        <!-- Added landscape page masters DITA for Print v1 pg 121 -->
        <fo:simple-page-master master-name="landscape-first" xsl:use-attribute-sets="landscape-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body.landscape"/>
            <fo:region-before region-name="first-body-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="first-body-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>
        <xsl:if test="$mirror-page-margins">
            <fo:simple-page-master master-name="landscape-even" xsl:use-attribute-sets="landscape-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body.landscape"/>
                <fo:region-before region-name="even-body-header" xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="even-body-footer" xsl:use-attribute-sets="region-after"/>
            </fo:simple-page-master>
        </xsl:if>
        <fo:simple-page-master master-name="landscape-odd" xsl:use-attribute-sets="landscape-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body.landscape"/>
            <fo:region-before region-name="odd-body-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="odd-body-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>
        <fo:simple-page-master master-name="landscape-last" xsl:use-attribute-sets="landscape-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body.landscape"/>
            <fo:region-before region-name="last-body-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="last-body-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>
        
        <!-- two-columns -->
        <fo:simple-page-master master-name="two-columns-first" xsl:use-attribute-sets="two-columns-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body.two-columns"/>
            <fo:region-before region-name="first-body-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="first-body-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>
        <xsl:if test="$mirror-page-margins">
            <fo:simple-page-master master-name="two-columns-even" xsl:use-attribute-sets="two-columns-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body.two-columns"/>
                <fo:region-before region-name="even-body-header" xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="even-body-footer" xsl:use-attribute-sets="region-after"/>
            </fo:simple-page-master>
        </xsl:if>
        <fo:simple-page-master master-name="two-columns-odd" xsl:use-attribute-sets="two-columns-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body.two-columns"/>
            <fo:region-before region-name="odd-body-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="odd-body-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>
        <fo:simple-page-master master-name="two-columns-last" xsl:use-attribute-sets="two-columns-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body.two-columns"/>
            <fo:region-before region-name="last-body-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="last-body-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>
    </xsl:template>
    
    
    <!-- ====================================================================== -->
    <!--                             PAGE SEQUENCES                             -->
    <!-- ====================================================================== -->
    <xsl:template match="/" mode="create-page-sequences">
        <!--<xsl:next-match/>-->
        <xsl:call-template name="generate-page-sequence-master">
            <xsl:with-param name="master-name" select="'landscape-sequence'"/>
            <xsl:with-param name="master-reference" select="'landscape'"/>
            <xsl:with-param name="first" select="false()"/>
            <xsl:with-param name="last" select="false()"/>
        </xsl:call-template>
        <xsl:next-match/>
        <xsl:call-template name="generate-page-sequence-master">
            <xsl:with-param name="master-name" select="'two-columns-sequence'"/>
            <xsl:with-param name="master-reference" select="'two-columns'"/>
            <xsl:with-param name="first" select="false()"/>
            <xsl:with-param name="last" select="false()"/>
        </xsl:call-template>
    </xsl:template>
    
    <!--  Bookmap Chapter processing, output either one page sequence name or the other
    depending on the @outputclass attribute set on the topic-->
    <xsl:template name="processTopicChapter">
        <fo:page-sequence
            master-reference=
            "{if (@outputclass)
            then (concat(@outputclass, '-sequence'))
            else 'body-sequence'
            }"
            xsl:use-attribute-sets="page-sequence.body">
            <xsl:call-template name="startPageNumbering"/>
            <xsl:call-template name="insertBodyStaticContents"/>
            <fo:flow flow-name="xsl-region-body">
                <fo:block xsl:use-attribute-sets="topic">
                    <xsl:call-template name="commonattributes"/>
                    <xsl:variable name="level" as="xs:integer">
                        <xsl:apply-templates select="." mode="get-topic-level"/>
                    </xsl:variable>
                    <xsl:if test="$level eq 1">
                        <fo:marker marker-class-name="current-topic-number">
                            <xsl:variable name="topicref" select="key('map-id', ancestor-or-self::*[contains(@class, ' topic/topic ')][1]/@id)"/>
                            <xsl:for-each select="$topicref">
                                <xsl:apply-templates select="." mode="topicTitleNumber"/>
                            </xsl:for-each>
                        </fo:marker>
                        <xsl:apply-templates select="." mode="insertTopicHeaderMarker"/>
                    </xsl:if>
                    
                    <xsl:apply-templates select="*[contains(@class,' topic/prolog ')]"/>
                    
                    <xsl:apply-templates select="." mode="insertChapterFirstpageStaticContent">
                        <xsl:with-param name="type" select="'chapter'"/>
                    </xsl:apply-templates>
                    
                    <fo:block xsl:use-attribute-sets="topic.title">
                        <xsl:call-template name="pullPrologIndexTerms"/>
                        <xsl:for-each select="*[contains(@class,' topic/title ')]">
                            <xsl:apply-templates select="." mode="getTitle"/>
                        </xsl:for-each>
                    </fo:block>
                    
                    <xsl:choose>
                        <xsl:when test="$chapterLayout='BASIC'">
                            <xsl:apply-templates select="*[not(contains(@class, ' topic/topic ') or contains(@class, ' topic/title ') or
                                contains(@class, ' topic/prolog '))]"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="." mode="createMiniToc"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                    <xsl:apply-templates select="*[contains(@class,' topic/topic ')]"/>
                    <xsl:call-template name="pullPrologIndexTerms.end-range"/>
                </fo:block>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>
</xsl:stylesheet>