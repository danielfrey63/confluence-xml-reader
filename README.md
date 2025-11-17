# 📄 Confluence XML Reader

Ein einfacher, browserbasierter XSLT-XML-Reader zur Transformation von Confluence-XML-Exporten in ein lesbares HTML-Format.

## 🚀 Features

- **Browser-basiert**: Keine Installation erforderlich - läuft direkt im Browser
- **XSLT-Transformation**: Verwendet XSLT 1.0 für die XML-zu-HTML-Konvertierung
- **Drag & Drop**: Einfaches Hochladen von XML-Dateien
- **Modernes UI**: Responsives Design mit modernem Look
- **Confluence-Elemente**: Unterstützt gängige Confluence-Strukturen:
  - Überschriften (h1-h6)
  - Absätze und Textformatierung
  - Listen (geordnet und ungeordnet)
  - Tabellen
  - Code-Blöcke mit Syntax-Highlighting-Vorbereitung
  - Makros (Info, Warning, Note, Tip)
  - Links und Bilder
  - Panels und strukturierte Inhalte

## 📋 Voraussetzungen

Ein moderner Webbrowser mit XSLT-Unterstützung:
- Chrome/Edge (empfohlen)
- Firefox
- Safari

## 🔧 Installation

1. **Repository klonen**:
   ```bash
   git clone https://github.com/IHR-USERNAME/confluence-xml-reader.git
   cd confluence-xml-reader
   ```

2. **Dateien bereitstellen**:
   - Öffnen Sie `index.html` direkt im Browser, oder
   - Verwenden Sie einen lokalen Webserver

### Lokaler Webserver (optional)

Mit Python:
```bash
python -m http.server 8000
```

Mit Node.js (http-server):
```bash
npx http-server -p 8000
```

Dann öffnen Sie `http://localhost:8000` im Browser.

## 📖 Verwendung

1. **Öffnen Sie** `index.html` in Ihrem Browser
2. **Klicken Sie** auf "XML-Datei auswählen" oder ziehen Sie eine XML-Datei in den Upload-Bereich
3. **Klicken Sie** auf "Transformieren", um die XML-Datei in HTML zu konvertieren
4. **Betrachten Sie** das transformierte Ergebnis im unteren Bereich

### XML-Export aus Confluence

So erhalten Sie eine XML-Datei aus Confluence:

1. Navigieren Sie zur gewünschten Seite
2. Klicken Sie auf **"..."** → **"Exportieren"**
3. Wählen Sie **"XML"** als Exportformat
4. Speichern Sie die heruntergeladene XML-Datei
5. Laden Sie die Datei in den XML Reader

## 📁 Projektstruktur

```
confluence-xml-reader/
├── index.html                  # Haupt-HTML-Datei mit UI
├── styles.css                  # CSS-Styling
├── confluence-transform.xslt   # XSLT-Transformations-Stylesheet
├── .gitignore                  # Git-Ignore-Datei
└── README.md                   # Diese Datei
```

## 🎨 Anpassung

### XSLT-Transformation erweitern

Die Datei `confluence-transform.xslt` enthält alle Transformationsregeln. Um neue Confluence-Elemente zu unterstützen:

1. Öffnen Sie `confluence-transform.xslt`
2. Fügen Sie ein neues Template hinzu:
   ```xml
   <xsl:template match="ac:ELEMENT-NAME">
       <!-- Ihre Transformation hier -->
   </xsl:template>
   ```

### Styling anpassen

Das Styling kann in `styles.css` angepasst werden. Nutzen Sie die CSS-Variablen am Anfang der Datei für konsistente Farbänderungen:

```css
:root {
    --primary-color: #0052CC;
    --primary-hover: #0747A6;
    /* weitere Variablen... */
}
```

## 🛠️ Unterstützte Confluence-Elemente

| Element | Status | Beschreibung |
|---------|--------|--------------|
| Überschriften | ✅ | h1-h6 vollständig unterstützt |
| Absätze | ✅ | Standard-Textabsätze |
| Listen | ✅ | Geordnete und ungeordnete Listen |
| Tabellen | ✅ | Mit Header und Body |
| Textformatierung | ✅ | Fett, Kursiv, Unterstrichen, Durchgestrichen |
| Code-Inline | ✅ | `code` Elemente |
| Code-Blöcke | ✅ | Mit Sprach-Indikator |
| Links | ✅ | Externe und interne Links |
| Bilder | ⚠️ | Struktur vorhanden, Pfade müssen angepasst werden |
| Makros | ✅ | Info, Warning, Note, Tip |
| Panels | ✅ | Farbcodierte Panel-Darstellung |

## ⚠️ Bekannte Einschränkungen

- **Bilder**: Attachment-Pfade werden nicht automatisch aufgelöst
- **Externe Links**: Confluence-interne Links zeigen nur den Titel an
- **XSLT 1.0**: Limitierungen durch XSLT 1.0 im Browser
- **Große Dateien**: Sehr große XML-Dateien können die Browser-Performance beeinträchtigen

## 🔒 Datenschutz & Sicherheit

- **Keine Server-Kommunikation**: Alle Verarbeitungen erfolgen lokal im Browser
- **Keine Datenspeicherung**: XML-Dateien werden nicht gespeichert oder übertragen
- **Client-seitig**: 100% client-seitige Verarbeitung

## 🤝 Beiträge

Beiträge sind willkommen! So können Sie helfen:

1. Forken Sie das Repository
2. Erstellen Sie einen Feature-Branch (`git checkout -b feature/AmazingFeature`)
3. Committen Sie Ihre Änderungen (`git commit -m 'feat: add AmazingFeature'`)
4. Pushen Sie zum Branch (`git push origin feature/AmazingFeature`)
5. Öffnen Sie einen Pull Request

## 📝 Lizenz

Dieses Projekt steht unter der MIT-Lizenz. Siehe [LICENSE](LICENSE) für Details.

## 🙏 Danksagungen

- Atlassian Confluence für die XML-Export-Funktion
- W3C für XSLT-Standards

## 📞 Kontakt

Bei Fragen oder Problemen öffnen Sie bitte ein Issue im Repository.

---

**Hinweis**: Dieses Tool ist nicht offiziell von Atlassian unterstützt oder gepflegt.
