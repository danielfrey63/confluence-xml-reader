<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ac="http://www.atlassian.com/schema/confluence/4/ac/"
    xmlns:ri="http://www.atlassian.com/schema/confluence/4/ri/"
    exclude-result-prefixes="ac ri">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <!-- Root template -->
    <xsl:template match="/">
        <div class="confluence-content">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- Page template -->
    <xsl:template match="ac:confluence-content">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- Handle root elements without wrapper -->
    <xsl:template match="/*[not(self::ac:confluence-content)]">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- Rich text body -->
    <xsl:template match="ac:rich-text-body">
        <div class="rich-text-body">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- Layout elements -->
    <xsl:template match="ac:layout">
        <div class="confluence-layout">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="ac:layout-section">
        <div class="layout-section">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="ac:layout-cell">
        <div class="layout-cell">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- Headings -->
    <xsl:template match="h1">
        <h1><xsl:apply-templates/></h1>
    </xsl:template>
    
    <xsl:template match="h2">
        <h2><xsl:apply-templates/></h2>
    </xsl:template>
    
    <xsl:template match="h3">
        <h3><xsl:apply-templates/></h3>
    </xsl:template>
    
    <xsl:template match="h4">
        <h4><xsl:apply-templates/></h4>
    </xsl:template>
    
    <xsl:template match="h5">
        <h5><xsl:apply-templates/></h5>
    </xsl:template>
    
    <xsl:template match="h6">
        <h6><xsl:apply-templates/></h6>
    </xsl:template>
    
    <!-- Paragraphs -->
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <!-- Lists -->
    <xsl:template match="ul">
        <ul><xsl:apply-templates/></ul>
    </xsl:template>
    
    <xsl:template match="ol">
        <ol><xsl:apply-templates/></ol>
    </xsl:template>
    
    <xsl:template match="li">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    
    <!-- Tables -->
    <xsl:template match="table">
        <table class="confluence-table">
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    
    <xsl:template match="tbody">
        <tbody><xsl:apply-templates/></tbody>
    </xsl:template>
    
    <xsl:template match="thead">
        <thead><xsl:apply-templates/></thead>
    </xsl:template>
    
    <xsl:template match="tr">
        <tr><xsl:apply-templates/></tr>
    </xsl:template>
    
    <xsl:template match="th">
        <th><xsl:apply-templates/></th>
    </xsl:template>
    
    <xsl:template match="td">
        <td><xsl:apply-templates/></td>
    </xsl:template>
    
    <!-- Text formatting -->
    <xsl:template match="strong">
        <strong><xsl:apply-templates/></strong>
    </xsl:template>
    
    <xsl:template match="em">
        <em><xsl:apply-templates/></em>
    </xsl:template>
    
    <xsl:template match="u">
        <u><xsl:apply-templates/></u>
    </xsl:template>
    
    <xsl:template match="s">
        <s><xsl:apply-templates/></s>
    </xsl:template>
    
    <xsl:template match="code">
        <code><xsl:apply-templates/></code>
    </xsl:template>
    
    <xsl:template match="pre">
        <pre><xsl:apply-templates/></pre>
    </xsl:template>
    
    <!-- Links -->
    <xsl:template match="a">
        <a>
            <xsl:if test="@href">
                <xsl:attribute name="href">
                    <xsl:value-of select="@href"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    <xsl:template match="ac:link">
        <a class="confluence-link">
            <xsl:if test="ri:page/@ri:content-title">
                <xsl:attribute name="data-page-title">
                    <xsl:value-of select="ri:page/@ri:content-title"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    <xsl:template match="ri:page">
        <span class="page-link" data-title="{@ri:content-title}">
            <xsl:value-of select="@ri:content-title"/>
        </span>
    </xsl:template>
    
    <xsl:template match="ri:user">
        <span class="user-mention" data-userkey="{@ri:userkey}">
            <xsl:text>@User</xsl:text>
        </span>
    </xsl:template>
    
    <!-- Images -->
    <xsl:template match="ac:image">
        <div class="confluence-image">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="ri:attachment">
        <img class="attachment-image" alt="{@ri:filename}">
            <xsl:attribute name="data-filename">
                <xsl:value-of select="@ri:filename"/>
            </xsl:attribute>
        </img>
    </xsl:template>
    
    <!-- Macros -->
    <xsl:template match="ac:structured-macro">
        <div class="confluence-macro macro-{@ac:name}">
            <div class="macro-header">
                <strong>Macro: <xsl:value-of select="@ac:name"/></strong>
            </div>
            <div class="macro-body">
                <xsl:apply-templates/>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="ac:parameter">
        <div class="macro-parameter">
            <span class="param-name"><xsl:value-of select="@ac:name"/>:</span>
            <span class="param-value"><xsl:apply-templates/></span>
        </div>
    </xsl:template>
    
    <xsl:template match="ac:plain-text-body">
        <pre class="plain-text-body"><xsl:apply-templates/></pre>
    </xsl:template>
    
    <!-- Code blocks -->
    <xsl:template match="ac:structured-macro[@ac:name='code']">
        <div class="code-block">
            <xsl:if test="ac:parameter[@ac:name='language']">
                <div class="code-language">
                    <xsl:value-of select="ac:parameter[@ac:name='language']"/>
                </div>
            </xsl:if>
            <pre><code><xsl:value-of select="ac:plain-text-body"/></code></pre>
        </div>
    </xsl:template>
    
    <!-- Info/Warning/Note panels -->
    <xsl:template match="ac:structured-macro[@ac:name='info']">
        <div class="panel panel-info">
            <div class="panel-icon">ℹ️</div>
            <div class="panel-content">
                <xsl:apply-templates select="ac:rich-text-body"/>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="ac:structured-macro[@ac:name='warning']">
        <div class="panel panel-warning">
            <div class="panel-icon">⚠️</div>
            <div class="panel-content">
                <xsl:apply-templates select="ac:rich-text-body"/>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="ac:structured-macro[@ac:name='note']">
        <div class="panel panel-note">
            <div class="panel-icon">📝</div>
            <div class="panel-content">
                <xsl:apply-templates select="ac:rich-text-body"/>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="ac:structured-macro[@ac:name='tip']">
        <div class="panel panel-tip">
            <div class="panel-icon">💡</div>
            <div class="panel-content">
                <xsl:apply-templates select="ac:rich-text-body"/>
            </div>
        </div>
    </xsl:template>
    
    <!-- Children macro -->
    <xsl:template match="ac:structured-macro[@ac:name='children']">
        <div class="panel panel-note">
            <div class="panel-icon">📑</div>
            <div class="panel-content">
                <strong>Unterseiten:</strong>
                <p>Dieses Makro zeigt Unterseiten an. In dieser Ansicht nicht verfügbar.</p>
            </div>
        </div>
    </xsl:template>
    
    <!-- TOC macro -->
    <xsl:template match="ac:structured-macro[@ac:name='toc']">
        <div class="panel panel-note">
            <div class="panel-icon">📋</div>
            <div class="panel-content">
                <strong>Inhaltsverzeichnis</strong>
                <p>Dieses Makro generiert ein Inhaltsverzeichnis. In dieser Ansicht nicht verfügbar.</p>
            </div>
        </div>
    </xsl:template>
    
    <!-- View-file macro -->
    <xsl:template match="ac:structured-macro[@ac:name='view-file']">
        <div class="view-file-macro">
            <xsl:variable name="filename" select="ac:parameter[@ac:name='name']"/>
            <img class="attachment-image" alt="{$filename}">
                <xsl:attribute name="data-filename">
                    <xsl:value-of select="$filename"/>
                </xsl:attribute>
            </img>
        </div>
    </xsl:template>
    
    <!-- Line breaks -->
    <xsl:template match="br">
        <br/>
    </xsl:template>
    
    <!-- Default: copy text nodes -->
    <xsl:template match="text()">
        <xsl:value-of select="."/>
    </xsl:template>
    
</xsl:stylesheet>
