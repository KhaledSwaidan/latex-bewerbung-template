**Bestandsaufnahme aus Masterarbeit, Lebensläufen und bisherigen
Bewerbungsunterlagen**

Version 3.1 \| 11. November 2026 \| Ergänzung: deutsche Staatsangehörigkeit und uneingeschränkte Arbeitserlaubnis in Deutschland

| **Zweck** Dieses interne Dokument ist keine Bewerbung. Es bildet eine belastbare, erweiterbare Faktenbasis für maßgeschneiderte Lebensläufe, Anschreiben und technische Interviews. |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| **Arbeitsprinzip** Wir trennen dokumentierte Eigenleistungen, Angaben aus bisherigen Lebensläufen, theoretisch behandelte Themen sowie noch ungeklärte Aussagen. Nichts wird als Erfahrung ausgegeben, nur weil ein Werkzeug in einer Liste steht. |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

# 0. Quellen, Kennzeichnung und Verlässlichkeit

Hauptquelle \[T\]: Masterarbeit „A Retrieval-Augmented AI Assistant for
Supporting Model Construction and User Inquiries in SIRcraft“ (Abgabe
23.09.2026), insbesondere Kap. 3–6 und Anhänge A/D. \[T\] bedeutet: Die
Umsetzung oder Analyse wird in der Thesis beschrieben; der exakte
persönliche Anteil bei einzelnen Teilaufgaben kann im Gespräch noch
präzisiert werden.

Ergänzungsquelle \[CV\]: Verschiedene hochgeladene Lebenslaufversionen
und das LaTeX-Bundle. Die Angaben beschreiben den bisherigen
Bewerbungsstand, sind aber nicht unabhängig durch Arbeitszeugnisse, Code
oder Projektunterlagen verifiziert. \[OFFEN\] markiert offene
Rückfragen. \[THEORIE\] bedeutet: in der wissenschaftlichen Arbeit
behandelt, ohne Nachweis eigener Implementierung.

Wichtig: Anhang D der Thesis dokumentiert den Einsatz von Gemini/Gemini
Agent für Recherche, Debugging, Skriptentwürfe und Test-Scaffolding
sowie von DeepSeek für die Formatierung wissenschaftlicher Tabellen. Die
Arbeit beschreibt eigene Auswahl-, Anpassungs-, Prüf- und
Evaluationsschritte. Wir behaupten daher nicht, der gesamte Code sei
ohne Assistenz von Hand geschrieben worden (Thesis, Anhang D, S. 87–88).

# 1. Gesamtprofil – vorläufige Einordnung

• Nachgewiesene Breite durch das Masterprojekt: Full-Stack-Entwicklung
(Python/FastAPI + Flutter/Dart), lokale LLM-Integration, semantische
Suche, strukturiertes Post-Processing, parserbasierte Syntaxprüfung,
Docker-basierter Betrieb, Tests und Evaluation. \[T\]

• Praxis bei Rocket-Code: Flutter/Dart in einer plattformübergreifenden,
offline nutzbaren Solar-Vertriebsanwendung; Features und UI/UX;
Signatur-/Dokumentenworkflow mit Azure-Functions-Anbindung; BLoC/Cubit
und API-Fehlerbehandlung; Routing-Refactoring, ein wiederverwendbarer
responsiver Dialog (an ca. 50 Stellen eingeführt) sowie
kundenspezifische PDF-Vorlagen mit dynamischen Angebotsdaten. Zudem Beiträge zu einer Helpdesk-Wissensbasis sowie Anleitungen und FAQs für Endkunden und das interne Team auf Deutsch und Englisch. \[USER, CV\]

• Bewerbungsgeeignete Profile mit besonders guten Belegen:
Backend-Entwickler (Python/API), Full-Stack-Entwickler (Flutter +
Backend), AI/LLM Application Engineer und Software Engineer mit
Cloud-/DevOps-Nähe.

• Data Engineering, klassische ML-Entwicklung, C#/.NET-Schwerpunkt und
umfangreiches Cloud-Engineering sind derzeit weniger stark anhand
eigener Umsetzung belegt. Das ist keine Aussage über Lernfähigkeit,
sondern über verfügbare Nachweise.

# 2. Kernprojekt: SIRcraft AI Assistant – vollständig dokumentiertes Praxisbeispiel

Projektziel: Nutzerinnen und Nutzer der epidemiologischen
Desktop-Anwendung SIRcraft sollten eine verlässlichere Hilfestellung bei
Bedienung und Modellgleichungen erhalten. Der zusätzliche Assistent
sollte dokumentationsgestützt antworten, nicht unterstützte Funktionen
erkennen und generierte Gleichungen vor Ausgabe syntaktisch prüfen.
SIRcraft selbst wurde laut Thesis von anderen entwickelt; die eigene
Arbeit betrifft den ergänzenden KI-Assistenten. (Thesis, Kap. 1 und
6.1.4)

Systemarchitektur: Flutter Web UI → FastAPI-Gateway / RAG-Service →
ChromaDB-Vektorspeicher; Embedding- und LLM-Inferenz über Ollama auf
einem separaten GPU-Host. Anwendung und Modelle wurden auf zwei Servern
innerhalb der Universität Bremen betrieben, ohne externe Modell-API.
(Thesis, Kap. 3.1, 3.5, Abb. 3.1)

• Knowledge Base: vier Quellengruppen manuell kuratiert;
Dokumentationsfragmente zu 179 semantisch zusammenhängenden Chunks
normalisiert und indexiert. Bei eingebauten Beispielen wurden
Gleichungen und Parameter gezielt erhalten. (Kap. 3.2, 4.2)

• Retrieval: lokale Embeddings mit nomic-embed-text, Speicherung in
ChromaDB, HNSW-basierte Ähnlichkeitssuche, Top-K = 7. Unterscheidung
zwischen search_document:- und search_query:-Präfixen. (Kap.
3.2.4–3.2.5, 4.3.1)

• Generation: ein kanonischer Systemprompt, drei Few-Shot-Beispiele,
Gesprächshistorie von maximal zehn Nachrichten, strukturierter
JSON-Ausgabevertrag mit answer/equations/suggestions, vier lokal
gehostete LLMs. (Kap. 3.3)

• Robustheit: mehrstufiges Recovery bei fehlerhaftem JSON, Filterung von
Modell-Metadaten, Gleichungsextraktion aus JSON und Markdown,
Normalisierung typischer LaTeX-/Formatierungsartefakte. (Kap. 3.4, 4.3)

• Validierung: eigenständiger rekursiver Parser in Python, der sich an
der Oberflächensyntax der SIRcraft-ANTLR-Grammatik orientiert. Nicht der
originale ANTLR-Parser; keine formale Äquivalenz nachgewiesen. Ungültige
Gleichungen erhalten Warnhinweise. (Kap. 3.4.3, 4.3.3)

• Frontend: Chat mit Modellauswahl, Quellen- und Gleichungspanels,
FAQ-Chips, adaptivem Layout, Dark-/Light-Mode, Fehlerhinweisen;
Zustandsverwaltung mit Cubit/BLoC. (Kap. 3.5, 4.4)

• Betrieb und Qualität: Docker Compose, Nginx-Reverse-Proxy, persistente
ChromaDB-Daten, pytest- und Flutter-Tests. Dokumentiert sind 67
bestandene Backend- und 30 bestandene Frontend-Tests. (Kap. 4.5)

• Evaluation: 30 Fragen in fünf Kategorien (20 unterstützt, 10 bewusst
außerhalb des Funktionsumfangs); vier Modelle mit gleichem Prompt und
Retrieval verglichen. Höchster Gesamtwert 166/180 im verwendeten
Benchmark. (Kap. 5.1–5.3)

| **Belegbarer Beitrag** Konzeption, Implementierung, Bereitstellung und strukturierte Evaluation eines dokumentationsgestützten, lokal betriebenen KI-Assistenten als eigenständige Webanwendung – nicht bloß ein Chatbot-Prototyp oder ausschließlich eine theoretische Literaturarbeit. |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

# 3. Technologien und Methoden im Detail

## 3.1 Backend, Programmiersprachen und APIs

### Python 3.11

**Evidenz: \[T\] selbst entwickelter Backend-Code in der Thesis**

**Konkrete Anwendung:** Implementierung der zentralen Services für
Knowledge-Base-Aufbereitung, Retrieval, Modellkommunikation,
Antwortbereinigung und Gleichungsvalidierung.

**Technischer Nachweis:** Modulare Servicestruktur; Klassen, Funktionen,
reguläre Ausdrücke, Fehlerbehandlung, HTTP-Aufrufe, Tests;
Python-3.11-Container.

**Abgrenzung / Klärung:** Noch offen: Python-Verwendung außerhalb der
Thesis, bevorzugte Test-/Architekturmuster.

Quelle: Thesis, Kap. 4.1–4.3; Listing 4.1

### FastAPI und REST-API-Design

**Evidenz: \[T\] praktisch eingesetzt**

**Konkrete Anwendung:** Backend-Gateway mit drei beschriebenen
Endpunkten /chat, /faq und /health, Anbindung von Frontend, Retrieval
und LLM-Inferenz.

**Technischer Nachweis:** Routing, Konfiguration, CORS,
Request-/Response-Verträge und Delegation an Services; Uvicorn als
Runtime.

Quelle: Thesis, Kap. 4.2.1, 4.5

### Pydantic / Pydantic Settings

**Evidenz: \[T\] praktisch eingesetzt**

**Konkrete Anwendung:** Typisierte Ein- und Ausgabeschemas und
Konfiguration von Modellnamen, Ollama-Endpunkt, Top-K und
CORS-Herkünften.

**Technischer Nachweis:** BaseSettings, Umgebungsvariablen,
.env-Dateien, Aliase im API-Vertrag.

Quelle: Thesis, Kap. 4.1–4.2.1

### HTTPX, Requests, HTTP/JSON

**Evidenz: \[T\] Bestandteil des Backend-Stacks**

**Konkrete Anwendung:** Client-Server-Kommunikation zur Ollama-API;
strukturierter Request- und Response-Datenaustausch.

**Technischer Nachweis:** Embedding-Anfragen, Modellaufrufe, Timeouts,
Wiederholungslogik bei temporären Fehlern.

**Abgrenzung / Klärung:** Die exakte Aufteilung der eingesetzten
Python-HTTP-Bibliotheken je Codepfad ist mit Repository zu verifizieren.

Quelle: Thesis, Kap. 4.1, 4.3.1–4.3.2

### Reguläre Ausdrücke, JSON-Parsing und Textverarbeitung

**Evidenz: \[T\] konkret implementiert**

**Konkrete Anwendung:** Normalisierung von Dokumentations-Chunks und
Extraktion/Reparatur teilweise fehlerhafter LLM-Ausgaben.

**Technischer Nachweis:** Regex für Chunk-Header, Kandidatenfilter und
Salvager; vierstufige JSON-Recovery; Gleichungs-Normalisierung.

Quelle: Thesis, Kap. 3.2.3, 3.4.1–3.4.2, 4.3.2

### Recursive-Descent-Parser und AST-nahe Validierung

**Evidenz: \[T\] konkret implementiert**

**Konkrete Anwendung:** Unabhängiger Python-Syntaxvalidator für
SIRcraft-kompatible Gleichungsformen mit Operatorrangfolge,
Funktionsaufrufen und Piecewise-Ausdrücken.

**Technischer Nachweis:** Tokenizer mit Tokenklassen, rekursiver Parser,
Validierungsflag und konkrete Fehlermeldung.

**Abgrenzung / Klärung:** Nicht mit einem allgemeinen
Prompt-Injection-Detektor gleichsetzen; bekannte Funktionsabweichungen:
max/min/if und log.

Quelle: Thesis, Kap. 3.4.3, 4.3.3

### ANTLR 4 – Grammar-Verständnis

**Evidenz: \[T\] Schnittstellenanalyse; \[THEORIE\] keine eigene
ANTLR-Parsergenerierung belegt**

**Konkrete Anwendung:** Die von SIRcraft verwendete
Expression.g4-Grammatik wurde als technische Vorgabe für den
unabhängigen Python-Validator analysiert.

**Technischer Nachweis:** Abgleich von Oberflächensyntax und
Operator-Prioritäten; Diskussion bekannter Differenzen.

Quelle: Thesis, Kap. 2.3, 3.4.3

## 3.2 Frontend, Mobile und UI-Architektur

### Dart und Flutter Web

**Evidenz: \[T\] praktisch; \[CV\] zusätzlich beruflicher Einsatz**

**Konkrete Anwendung:** Interaktives Webfrontend für den AI Assistant;
laut CV Weiterentwicklung einer plattformübergreifenden
Enterprise-Anwendung bei Rocket-Code.

**Technischer Nachweis:** Chatoberfläche, Widgets, responsive
Sidebar/Drawer, Eingabe- und Ergebnisbereiche, Themes und
Modellselector.

**Abgrenzung / Klärung: UI/UX-Konzeption und konkrete Flutter-Features
bei Rocket-Code sind beschrieben; genaue Klassen-/Widget-Zuschnitte,
Testbelege und Nutzerwirkung bleiben offen. \[USER\]**

Quelle: Thesis, Kap. 3.5, 4.4; CV-Version AI Software Engineer

### flutter_bloc / Cubit / State Management

**Evidenz: \[T\] konkret implementiert**

**Konkrete Anwendung:** Trennung von Präsentation, Zustandsverwaltung
und HTTP-Service im Frontend.

**Technischer Nachweis: Masterarbeit: ChatCubit, FaqCubit, ThemeCubit
mit Zustands- und Fehlerverwaltung. Rocket-Code: BLoC/Cubit kommuniziert
mit Repository; Repository ruft REST-Service auf. Exceptions werden in
der UI abgefangen und dort als verständliche Fehlermeldungen
dargestellt. \[T, USER\]**

Quelle: Thesis, Kap. 3.5.1, Abb. 3.4

### Responsive UI, Material 3, Markdown-Rendering

**Evidenz: \[T\] praktisch eingesetzt**

**Konkrete Anwendung:** Responsive Chat-Ansichten und strukturierte
Darstellung von Antworten, validierten Gleichungen, Quellen und
Follow-up-Fragen.

**Technischer Nachweis:** Widget-Komposition, Markdown-Karten, Panels,
Chips, Notification-Overlay, responsive Breakpoints.

Quelle: Thesis, Kap. 3.5.2, 4.4; Abb. 4.1–4.5

### Flutter HTTP-Client, SharedPreferences, Serialisierung

**Evidenz: \[T\] praktisch eingesetzt**

**Konkrete Anwendung:** Service-Layer für Backend-Aufrufe und Persistenz
der UI-Einstellungen.

**Technischer Nachweis:** http, shared_preferences, dart_mappable;
URL-Bildung, JSON-Verarbeitung, Fehlerzuordnung.

**Abgrenzung / Klärung:** Nicht jede gelistete Dependency impliziert
tiefe Erfahrung; genaue Codebeispiele können nachgetragen werden.

Quelle: Thesis, Kap. 3.5.1, Anhang A

### Flutter Mobile (iOS / Android / Desktop)

**Evidenz: \[CV\] aus Rocket-Code, Details offen**

**Konkrete Anwendung:** Laut Lebenslauf Weiterentwicklung einer
plattformübergreifenden Enterprise-App mit Flutter/Dart.

**Technischer Nachweis:** Feature-Entwicklung, Integration mit
Azure-Diensten, Zusammenarbeit mit Backend-Team laut
Bewerbungsunterlagen.

**Abgrenzung / Klärung:** Welche Screens, Features, Performance- oder
Release-Aufgaben persönlich verantwortet?

Quelle: CV AI Software Engineer, Berufserfahrung Rocket-Code

### go_router / Flutter-Routing

Evidenz: \[USER\] praktisch bei Rocket-Code eingesetzt; genaue
Paketbezeichnung bei Bedarf anhand der pubspec prüfen.

Konkrete Anwendung: Bestehende Routendefinitionen aus einer zentralen
Struktur in separate Routing-Dateien aufgeteilt.

Technischer Nachweis: Reorganisation der Navigation bzw.
Routenkonfiguration zur besseren Strukturierung. Anzahl der Routen,
Tests und Auswirkungen auf Wartbarkeit nicht quantifiziert.

Quelle: eigene Rocket-Code-Schilderung, 07.11.2026; siehe Kapitel 12.

### Wiederverwendbare responsive Dialog-Komponente (Flutter)

Evidenz: \[USER\] eigener Refactoring-Beitrag bei Rocket-Code.

Konkrete Anwendung: Einen einheitlichen, schließbaren Dialog erstellt,
der auf Desktop eine begrenzte Größe und auf Mobilgeräten ein
Vollbildlayout nutzt; Buttons je nach Bildschirmkontext unterschiedlich
angeordnet.

Technischer Nachweis: Vorherige Standarddialoge an ungefähr 50 Stellen
durch die wiederverwendbare Komponente ersetzt. Exakte Widget-Namen,
Breakpoints und Tests noch offen.

Quelle: eigene Rocket-Code-Schilderung, 07.11.2026; siehe Kapitel 12.

### PDF-Erzeugung mit dem Dart/Flutter-Paket pdf

Evidenz: \[USER\] praktische Anpassung von PDF-Vorlagen bei Rocket-Code.

Konkrete Anwendung: Zahlreiche PDF-Templates auf Kundenwunsch
überarbeitet und verbessert; dynamische Platzhalter in den Vorlagen beim
Generieren mit Werten aus den Angebotsdaten befüllt.

Technischer Nachweis: Arbeit an Vorlagen und dynamischer
Dokumenterzeugung mit dem pdf-Paket. Bestätigt: teils bereits vorhandene
Angebotsdaten, teils ergänzende API- oder lokale Datenbankabfragen.
Offen: Mapping, konkrete Datenquellen, Dokumentarten und Teststrategie.

Quelle: eigene Rocket-Code-Schilderung, 07.11.2026; siehe Kapitel 12.

## 3.3 RAG, Embeddings, LLMs und Daten

### Retrieval-Augmented Generation (RAG)

**Evidenz: \[T\] System eigenständig als Thesisprojekt beschrieben**

**Konkrete Anwendung:** End-to-End-Aufbau eines domänenspezifischen
Assistenten mit Retrieval und anschließender lokaler
Sprachmodell-Generierung.

**Technischer Nachweis:** Trennung von Wissensindex, Retrieverservice,
Prompt Assembly, Generation und Validierungs-Gateway.

Quelle: Thesis, Kap. 3.1–3.4, 4.2–4.3

### Knowledge-Base-Engineering / semantisches Chunking

**Evidenz: \[T\] konkret durchgeführt**

**Konkrete Anwendung:** Manuelle Aufbereitung von SIRcraft-Thesis,
Beispielen, Tutorials und Manualeinträgen zu 179 inhaltlich
vollständigen Chunks.

**Technischer Nachweis:** Fünf-Felder-Schema, Normalisierung von Headern
und Kodierungsartefakten, strukturorientierte Chunk-Grenzen;
CLI-Reindexierung.

**Abgrenzung / Klärung:** Bewusst manuelle Kuratierung; keine pauschal
automatisierte PDF-ETL-Pipeline behaupten.

Quelle: Thesis, Kap. 3.2.1–3.2.3, 4.2.2

### Embeddings / nomic-embed-text

**Evidenz: \[T\] integriert und konfiguriert**

**Konkrete Anwendung:** Lokale Umwandlung von Chunks und Nutzerfragen in
Vektoren für semantisches Retrieval.

**Technischer Nachweis:** Dokument-/Query-Präfixe, 768-dimensionale
Embeddings, Abwicklung über Ollama-HTTP-Endpunkt.

Quelle: Thesis, Kap. 2.2.2, 3.2.4, 4.1, 4.3.1

### ChromaDB / HNSW / Vektorsuche

**Evidenz: \[T\] integriert und betrieben**

**Konkrete Anwendung:** Persistenter Vektorspeicher mit Similarity
Retrieval für den RAG-Kontext.

**Technischer Nachweis:** PersistentClient, Collection Reset/Upsert,
Chunk-Metadaten, Top-K=7, Standard-L2-Distanz, HNSW Index.

Quelle: Thesis, Kap. 3.2.5, 4.2.2, 4.3.1

### Ollama / lokale LLM-Inferenz

**Evidenz: \[T\] angebunden und betrieben**

**Konkrete Anwendung:** Separater universitärer GPU-Host für
Embedding-Modell und vier Sprachmodelle; Backend kommuniziert via HTTP.

**Technischer Nachweis:** Lokal betriebene inference services,
Modellwahl, Kontextparameter, Retry bei Timeouts und
Modellverfügbarkeit.

**Abgrenzung / Klärung:** Kein Nachweis für eigenes Training oder
Fine-Tuning dieser Modelle.

Quelle: Thesis, Kap. 3.3.4, 3.5.3, 4.1

### Gemma, DeepSeek-R1 / LLM-Benchmarking

**Evidenz: \[T\] evaluiert**

**Konkrete Anwendung:** Vergleich von gemma2:9b, gemma4:26b, gemma2:27b
und deepseek-r1:32b unter konsistenten Rahmenbedingungen.

**Technischer Nachweis:** 30-Fragen-Benchmark, identischer Prompt und
Retrieval, Bewertungsrubriken sowie Syntax- und Refusal-Metriken.

**Abgrenzung / Klärung:** Evaluation der Modelle ≠ Training der
Foundation Models.

Quelle: Thesis, Kap. 5.1–5.3

### Prompt Engineering / Structured Output

**Evidenz: \[T\] konkret durchgeführt**

**Konkrete Anwendung:** Kanonischer Systemprompt mit Begrenzung auf
belegten Funktionsumfang, Syntaxvorgaben und Few-Shot-Beispielen.

**Technischer Nachweis:** JSON-Vertrag answer/equations/suggestions,
Prompt-Kontext aus Top-7-Chunks und bis zu zehn vorherigen Nachrichten.

**Abgrenzung / Klärung:** Promptbasierte Begrenzung ist kein
mathematisch garantierter Halluzinationsschutz.

Quelle: Thesis, Kap. 3.3.1–3.3.3

### LLM-Post-Processing und Guardrails

**Evidenz: \[T\] konkret durchgeführt**

**Konkrete Anwendung:** Mehrstufiges Recovery fehlerhafter
Modellantworten, Gleichungsextraktion, Normalisierung und
Vorab-Syntaxprüfung.

**Technischer Nachweis:** Salvager, Sanitizer, deduplizierte
Gleichungslisten, is_valid-Warnungen.

**Abgrenzung / Klärung:** Der Validator garantiert keine semantische
Korrektheit; bei max/min/if/log ist die Kompatibilität nachweislich
eingeschränkt.

Quelle: Thesis, Kap. 3.4, 4.3.2–4.3.3

### SQL / relationale Datenbanken / PostgreSQL

**Evidenz: \[CV\] genannt, Umsetzung nicht in Thesis belegt**

**Konkrete Anwendung:** SQL, Datenmodellierung und PostgreSQL werden in
bisherigen Lebensläufen als Kenntnisse aufgeführt.

**Technischer Nachweis:** Konkrete SQL-Abfragen, Tabellen, Query-Pläne,
Migrationen oder Produktionsdatenbanken sind in der Masterarbeit nicht
als eigenes Projekt dokumentiert.

**Abgrenzung / Klärung:** Bitte konkrete Anwendung nennen, z. B.
Projekt, Tabellenmodell, Joins, Indizes, Transaktionen.

Quelle: CV AI Software Engineer / Data Engineer

### LangChain

**Evidenz: \[CV\] mehrfach genannt, Thesis-Beleg unklar**

**Konkrete Anwendung:** In einigen CV-Versionen der
RAG-Datenaufbereitung zugeordnet.

**Technischer Nachweis:** Die Thesis beschreibt eigene Ingestion-,
Embedding- und Retrieval-Services direkt; eine LangChain-Verwendung ist
aus den gelesenen Implementationskapiteln nicht eindeutig belegt.

**Abgrenzung / Klärung:** Nur dann als praktisch verwendet darstellen,
wenn Repository oder eigene Erklärung das belegt.

Quelle: CV Data Engineer; Thesis, Kap. 4.2–4.3

## 3.4 Cloud, DevOps, Betrieb und Qualität

### Docker / Dockerfile

**Evidenz: \[T\] praktisch eingesetzt**

**Konkrete Anwendung:** Backend und Frontend des Thesisprojekts als
separate Images gebaut.

**Technischer Nachweis:** python:3.11-slim für FastAPI;
Multi-Stage-Flutter-Build mit Nginx als schlankem Runtime-Image.

Quelle: Thesis, Kap. 4.1, 4.5.1

### Docker Compose / Container Networking / Volumes

**Evidenz: \[T\] praktisch eingesetzt**

**Konkrete Anwendung:** Zwei Services und eine gemeinsame
Bridge-Netzwerk-Topologie mit persistentem ChromaDB-Volume betrieben.

**Technischer Nachweis:** docker-compose.yml, Service-Namen,
Abhängigkeiten, Neustartstrategie, Umgebungsvariablen.

Quelle: Thesis, Kap. 3.5.3, 4.5.1

### Nginx / Reverse Proxy

**Evidenz: \[T\] praktisch konfiguriert**

**Konkrete Anwendung:** Auslieferung des kompilierten
Flutter-Webbundles; Weiterleitung der API-Routen an den FastAPI-Service.

**Technischer Nachweis:** SPA-Fallback, Proxy-Pfade /chat /faq /health,
No-Store/No-Cache-Regeln, Gzip, Same-Origin-Ansatz.

Quelle: Thesis, Kap. 4.5.2

### Linux / Serverbetrieb / On-Premise

**Evidenz: \[T\] Betrieb in universitärer Infrastruktur**

**Konkrete Anwendung:** Deployment über Anwendungsserver und separaten
lokalen GPU-Host mit Ollama.

**Technischer Nachweis:** Serverseitige Konfiguration, VPN-geschützter
Administrationszugang und rein lokaler Inferenzpfad.

**Abgrenzung / Klärung:** Die Thesis beschreibt das Deployment; konkrete
eigenständig ausgeführte Linux-Administration bitte im Gespräch sammeln.

Quelle: Thesis, Kap. 3.5.3, 4.5

### Automatisierte Tests – pytest / pytest-asyncio / pytest-mock

**Evidenz: \[T\] praktisch umgesetzt und dokumentiert**

**Konkrete Anwendung:** Tests für Knowledge-Base-Pipeline, Endpunkte,
RAG-Services, Ollama-Recovery und AST-Syntax.

**Technischer Nachweis:** 67 erfolgreiche Backend-Testfunktionen; Mocks
für externe Inferenz; ein lokaler End-to-End-HTTP-Test.

**Abgrenzung / Klärung:** Kein Beleg für spezielle Testabdeckung in
Prozent; nicht erfinden.

Quelle: Thesis, Kap. 4.5.3

### Flutter-Testing – flutter_test / bloc_test / mocktail

**Evidenz: \[T\] praktisch umgesetzt und dokumentiert**

**Konkrete Anwendung:** Cubit-, Service-, Notification- und Widgettests
des Frontends.

**Technischer Nachweis:** 30 erfolgreiche Tests; HTTP- und
Persistenz-Mocks; Smoke Test der App.

Quelle: Thesis, Kap. 4.5.3

### Git / GitHub Actions / CI

**Evidenz: \[T\] CI-Datei dokumentiert; \[CV\] berufliche Praxis
genannt**

**Konkrete Anwendung:** Repository mit getrennten Backend- und
Frontend-Ordnern; GitHub-Workflow für Flutter-Webdeployment.

**Technischer Nachweis:** GitHub Actions für Flutter Web zu Pages laut
Repository-Layout; frühere CI/CD-nahe Arbeitsprozesse laut CV.

**Abgrenzung / Klärung:** Nicht pauschal behaupten, umfassende
Produktions-CI/CD-Pipelines eingerichtet zu haben.

Quelle: Thesis, Listing 4.1; CV Rocket-Code

### Git Hooks / Code-Review-Automatisierung

**Evidenz: \[CV\] eigener Beitrag behauptet, Details offen**

**Konkrete Anwendung:** Laut Bewerbungsunterlagen Hooks zur
Qualitätskontrolle generierten Codes und Prüfung fehlender Tests.

**Technischer Nachweis:** Eigene Hooks sollen automatisierte
Checks/Review-Anstöße ausgeführt haben.

**Abgrenzung / Klärung:** Bitte konkrete Hook-Namen, Ausführung, Repo,
Tests und messbares Ergebnis nachtragen.

Quelle: CV AI Software Engineer; Anschreiben Aclue

### Azure Functions / Azure Storage

**Evidenz: \[CV\] im Berufsprojekt genannt, Details offen**

Konkrete Anwendung: Bei Rocket-Code einen vollständigen Signatur- und
Dokumentenworkflow auf Anwendungsebene umgesetzt und vorhandene Azure
Functions in den Ablauf integriert. Schnittstellen/Endpunkte für
Funktionsaufrufe festgelegt, Fehler- und Ausnahmefälle definiert und
Integrationsprobleme behoben. \[USER\]

Technischer Nachweis: Integration mit Azure Functions und Umsetzung der
Workflow-Logik rund um Signaturstatus sowie Generierung, Validierung und
gegebenenfalls Löschung oder Aktualisierung von Unterlagen. Der Nutzer
bestätigt die Anbindung des Signaturablaufs an Azure Blob Storage:
extern e-signierte Dokumente werden dort bereitgestellt und bei
Online-Synchronisierung in der App abgerufen; konkrete eigene Upload-
und Storage-Implementierung bleibt offen. \[USER, CV\]

Abgrenzung / Klärung: Azure Functions nicht selbst implementiert. Die
App-Architektur mit BLoC/Cubit, Repository und REST-Service ist
bestätigt; offen bleiben genaue API-Verträge, Authentifizierung, die
Persistenz des Signaturstatus und der Fall einer verlorenen
HTTP-200-Antwort. Keine Exactly-once-Garantie oder eigene
Azure-Functions-/C#-Implementierung behaupten.

Quelle: CV Rocket-Code

### C# / .NET

**Evidenz: \[CV\] Teamzusammenarbeit belegt, eigene Coding-Tiefe offen**

**Konkrete Anwendung:** Abstimmung mit C#/.NET-Backend-Teams bei
Rocket-Code laut CV.

**Technischer Nachweis:** Schnittstellenkoordination und
Integrationsarbeit; direkte Implementierung in C# ist derzeit nicht
dokumentiert.

**Abgrenzung / Klärung:** Konkrete C#-Features oder Bibliotheken nur
nach Bestätigung aufnehmen.

Quelle: CV AI Software Engineer

### Terraform

**Evidenz: \[CV\] als Grundlagen genannt, kein Projektbeleg**

**Konkrete Anwendung:** Im LaTeX-Bundle als Terraform (Grundlagen)
aufgeführt.

**Technischer Nachweis:** Keine Terraform-Konfiguration,
State-Verwaltung oder IaC-Deployment aus der Thesis ersichtlich.

**Abgrenzung / Klärung:** Auf tatsächlichen Übungs-/Praxisumfang prüfen.

Quelle: latex_bundle.txt, Fachliche Kenntnisse

## 3.5 Beratung, Anforderungen, Qualität und weitere Projekte

### Requirements Engineering / Stakeholder-Abstimmung

**Evidenz: \[CV\] aus IFIB und Rocket-Code, Details offen**

**Konkrete Anwendung:** Laut Lebensläufen Aufnahme fachlicher
Anforderungen, Dokumentation und Rückgabe von Verbesserungsvorschlägen.

**Technischer Nachweis:** Abstimmung mit Fachbereichen und
Entwicklungsteams; Übersetzung von Anforderungen in Testfälle oder
Spezifikationen laut CV.

**Abgrenzung / Klärung:** Konkrete Meetingbeispiele, Artefakte und
eigene Verantwortung nachtragen.

Quelle: CV AI Solutions Engineer / AI Engineer Consultant

### Testing / QA / Usability Evaluation

**Evidenz: \[CV\] Berufserfahrung; \[T\] ergänzende Thesis-Tests**

**Konkrete Anwendung:** Bei IFIB Consult laut CV Funktions- und
Usability-Tests einer Bildungsplattform, Testprotokolle und
Beta-Tester-Anleitungen.

**Technischer Nachweis:** Prüffälle, dokumentierte Ergebnisse,
Rückmeldung an Entwicklungsseite.

**Abgrenzung / Klärung:** Welche Plattform, welche Testmethoden und
Verbesserungen konkret?

Quelle: CV IFIB; Thesis Kap. 4.5 für Thesis-Tests

### Agile Methoden / Scrum / Kanban / Jira

**Evidenz: \[CV\] erwähnt, konkrete Anwendung offen**

**Konkrete Anwendung:** Laut Bewerbungsunterlagen Mitarbeit in
Scrum-Teams und Bearbeitung von User Stories/Tickets.

**Technischer Nachweis:** Agile Zusammenarbeit, Backlog-/Ticketarbeit
und Abstimmung mit Team.

**Abgrenzung / Klärung:** Rolle im Prozess und tatsächliche Tiefe noch
prüfen; Scrum nicht aus bloßer Teilnahme als Expertentum darstellen.

Quelle: CV AI Solutions Engineer und LaTeX-Bundle

### Firebase Authentication / RBAC / Multi-Tenant

**Evidenz: \[CV\] Eigenprojekt, Details offen**

**Konkrete Anwendung:** Laut CV eigenständige mandantenfähige
Business-Anwendung mit Firebase Authentication, rollenbasierter
Zugriffskontrolle und asynchroner Kommunikation.

**Technischer Nachweis:** Architektur- und Authentifizierungsansatz laut
Projektbeschreibung.

**Abgrenzung / Klärung:** Technologie-Stack, Datenisolation,
Rechteprüfung, Deployment und Screenshots/Repo noch sammeln.

Quelle: CV AI Solutions Engineer / AI Software Engineer

### Nutzung von KI-Entwicklungswerkzeugen

**Evidenz: \[T\] Anhang D; \[CV\] berufliche Nutzung**

**Konkrete Anwendung:** Gemini/Gemini Agent für Recherche, Debugging,
Skriptvorschläge und Tests-Scaffolding; DeepSeek für
Tabellenformatierung; ChatGPT/Claude/Copilot laut CV im
Entwicklungsalltag.

**Technischer Nachweis:** Die Thesis dokumentiert, dass Vorschläge
geprüft, angepasst, getestet und verifiziert wurden.

**Abgrenzung / Klärung:** Klar zwischen KI-Werkzeugnutzung und
eigenständig verifizierter technischer Entscheidung unterscheiden.

Quelle: Thesis Anhang D; CV Rocket-Code

# 4. Projekterfahrung außerhalb der Masterarbeit – Rohfassung

## 4.1 Rocket-Code \| Softwareentwicklung \| 02/2025–04/2026

Aktueller Evidenzstand: Flutter/Dart in einer umfangreichen, auch
offline nutzbaren Vertriebsanwendung für Solaranlagen (Mobile und
Desktop). Eigene Umsetzung eines dialogbasierten Vertriebsassistenten,
eines Signatur-/Dokumentenworkflows mit vorhandenen Azure Functions,
mehrschichtiger BLoC/Cubit-/Repository-/REST-Architektur und
Fehlerbehandlung auf UI-Ebene. Weitere eigene Arbeiten:
GoRouter-Routendefinitionen in separate Dateien aufgeteilt, ein
wiederverwendbares adaptives Dialogkonzept gebaut und an ungefähr 50
Stellen eingesetzt, UI verbessert, PDF-Vorlagen mit dynamischen
Angebotsdaten aktualisiert. Außerdem Helpdesk-Wissensdatenbank, Benutzeranleitungen und FAQ-Inhalte für Endkunden sowie Teamkolleginnen und -kollegen auf Deutsch und Englisch erstellt bzw. bearbeitet. Bugfixes, Tests und Reviews sind berichtet; konkrete Fälle werden noch erhoben. \[USER, CV\]

• Bereits erfasst: Vertriebsassistent, Signaturworkflow,
Routing-/Dialog-Refactoring und PDF-Vorlagen. Als Nächstes konkrete
Bugfixes, Code-Review-Funde, Testarten sowie technische Details der
PDF-Platzhalter und der Dialog-Tests sammeln. \[OFFEN\]

## 4.2 IFIB Consult \| Junior IT-Berater \| 11/2023–07/2024

Aktueller Evidenzstand: Externe Funktions- und Usability-Evaluation der
Bildungsplattform (Website und „Walter App“), Erstellung, Dokumentation
und Auswertung detaillierter Testprotokolle in Zusammenarbeit mit einer
Kollegin. Daneben Recherchen zu Digitalisierungsplänen und -strategien,
Analyse und laufende Aktualisierung von Anforderungen sowie
eigenständige Erstellung von Abbildungen und Schaubildern zur
Visualisierung von Projektergebnissen. \[USER, CV\]

• Offen: Welches System wurde getestet? Welche Kriterien und Tools?
Welche Probleme entdeckt? Mit wem abgestimmt? Welche Änderungen sind
daraus entstanden?

## 4.3 Multi-Tenant Business Application \| Eigenprojekt

Aktueller Evidenzstand: Selbstständiges Projekt mit mandantenfähiger
Architektur, Firebase Authentication, rollenbasierten Rechten und
asynchroner Service-Kommunikation; weitere Details fehlen. \[CV\]

• Offen: Zielgruppe, Backend/Frontend-Stack, Datenmodell, Isolation
zwischen Mandanten, Auth-Flow, Tests, Demo und Code-Belege.

# 5. Fachliche Grenzen – unbedingt sauber darstellen

• SIRcraft-AST-Validator prüft syntaktische Verträglichkeit bestimmter
Gleichungen, nicht allgemeine Prompt-Injection-Abwehr oder semantisch
korrekte Modellierung. Er verwendet einen eigenen Python-Parser statt
ANTLR selbst. (Thesis, Kap. 3.4.3)

• Die Thesis nennt Funktionsunterschiede (max/min/if werden im Validator
akzeptiert, in SIRcraft aber nicht unterstützt; log umgekehrt) und eine
widersprüchliche Knowledge-Base-Quelle. Das Projekt ist deshalb ein
starker Nachweis für Fehlersuche und Evaluation, aber kein fehlerfrei
garantiertes System. (Thesis, Kap. 3.4.3; 5.3.5)

• Die bestehende Anwendung ist ein separater Webassistent; ein direkt in
SIRcraft integrierter Agent mit Zugriff auf den Canvas ist ausdrücklich
als Future Work beschrieben, also nicht umgesetzt. (Thesis, Kap. 6.2)

• Dokument-Ingestion für RAG ist nicht automatisch Erfahrung mit
industriellen Data-Warehouse-, Spark-, Airflow-, dbt- oder
BigQuery-Pipelines. Diese Werkzeuge nur nach tatsächlichem Nachweis
verwenden.

• Zusammenarbeit mit C#/.NET-Teams ist nicht gleich eigenständige
C#-Produktentwicklung; Kenntnisse in Terraform/PostgreSQL können
vorhanden sein, sind aber derzeit nicht mit einem konkreten Projekt
belegt.

• Mehrere bisherige CV-Versionen widersprechen sich bei
Bachelor-/Master-Studienzeiten. Vor externer Verwendung mit
Immatrikulations-/Abschlussnachweisen abgleichen.

# 6. Formulierungsbausteine – vorläufig, ohne Stellenanzeige

Backend: „Im Rahmen meiner Masterarbeit habe ich einen
Python-/FastAPI-Service entwickelt, der Dokumentkontext aus einer
Vektordatenbank abruft, lokal gehostete Sprachmodelle anbindet und deren
strukturierte Antworten für die Oberfläche aufbereitet.“

Full-Stack: „Ich habe für einen domänenspezifischen KI-Assistenten
sowohl das Flutter-Webfrontend als auch die FastAPI-Services umgesetzt –
inklusive Zustandsverwaltung, Fehlerbehandlung und automatisierten
Tests.“

RAG/LLM: „Für den Assistenten habe ich eine Wissensbasis mit 179
kuratierten Dokumentationsabschnitten aufgebaut, über lokale Embeddings
indexiert und in eine Retrieval-Augmented-Generation-Pipeline
eingebunden.“

Softwarequalität: „Um fehlerhafte mathematische Ausgaben erkennbar zu
machen, habe ich eine eigenständige Python-Syntaxvalidierung ergänzt und
den Backend- sowie Frontend-Workflow automatisiert getestet.“

Wichtig: Diese Sätze sind Material, keine fertig optimierten
Lebenslauf-Bullets. Für konkrete Stellen sollten wir passende, belegbare
Tätigkeiten und Ergebnisse auswählen und unnötige Technologien
streichen.

# 7. Nächste Sammelrunde – priorisierte Fragen

Runde A (als Nächstes): Wir schließen zunächst die Lücken zu
Rocket-Code. Drei beantwortbare Fragen genügen für den ersten Durchlauf:

• Welche konkrete Funktion oder welches Feature hast du dort selbst
entwickelt? Beschreibe einen echten Fall.

• Wie hast du es technisch umgesetzt? Nenne Frameworks,
API-Schnittstellen, Datenflüsse und deine eigenen Codeänderungen.

• Was war das Resultat? Zum Beispiel ausgeliefertes Feature, behobener
Fehler, stabilere Abläufe, nutzbare Funktion oder Feedback. Zahlen nur,
falls du welche belegen kannst.

Runde B: IFIB-Projekt genauer erfassen; Runde C: Multi-Tenant-App und
weitere Studien-/Privatprojekte; Runde D: SQL, C#/.NET, Terraform,
Cloud, Git Hooks und optionale Wissenslücken; Runde E: formale Daten und
finale Konsistenzprüfung.

# 8. Quellenregister

T1: 3144723_khaled_swaidan.pdf – Master’s Thesis, 23.09.2026, v. a. Kap.
3–6 und Anhang A/D. Die angegebenen Seiten in diesem Dokument sind die
gedruckten Kapitel-/Anhangsseiten, nicht durchgehend die
PDF-Viewer-Seiten.

C1: bisherige hochgeladene Lebenslaufvarianten (AI Software Engineer, AI
Solutions Engineer, AI Engineer & Consultant, Data Engineer). Die
Versionen weichen in Schwerpunkten und Studienzeiten voneinander ab.

C2: latex_bundle.txt – LaTeX-Struktur früherer Bewerbungstexte,
besonders Profile und Skills der Highberg-Version.

Arbeitsstatus: Version 1.9. Angaben aus Rocket-Code stammen aus eigener
Schilderung und wurden noch nicht anhand von Code oder Tickets
überprüft. Kapitel 10 dokumentiert den Signaturprozess; Kapitel 11
BLoC/Cubit, Repository/REST und UI-Exception-Handling; Kapitel 12
dokumentiert Routing, die Dialog-Komponente und PDF-Vorlagen. Technische
Details und messbare Resultate bleiben teilweise offen.

# 9. Ergänzung: Rocket-Code – konkrete Eigenleistungen (Sammelrunde 1)

Quelle \[USER-2026-11-06\]: persönliche Schilderungen in Sammelrunde 1
und 2, noch nicht anhand von Code, Tickets oder Arbeitszeugnis
gegengeprüft. \[USER\] bezeichnet ausschließlich diese Angaben.

## 9.1 Projektkontext: plattformübergreifende Vertriebsanwendung

Unternehmensanwendung für den Vertrieb und die organisatorische
Abwicklung von Solaranlagen. Plattformübergreifende Flutter-App, auf
Mobilgeräten und PCs nutzbar, mit Offline-Nutzung und zahlreichen
Funktionen. Eigene Tätigkeiten: Feature-Implementierung, Bugfixing,
Tests, Code-Reviews, Refactoring, UI/UX-Konzeption und Optimierung
responsiver Ansichten. \[USER\]

## 9.2 Feature A: Interaktiver Vertriebsassistent für Kundenkontakt

Ausgangslage und Aufgabe: Vertriebsmitarbeitende benötigen nach
Kontaktversuchen eine geführte, situationsabhängige Unterstützung.
Besonders der Fall, dass ein Kunde nicht erreicht wurde, sollte in der
Anwendung berücksichtigt werden. \[USER\]

Eigener Beitrag: Anforderungen analysiert, Kundengespräche geführt,
UI-/UX-Konzept entwickelt, interaktive Prototypen erstellt, Mockups in
Flutter-UI überführt und den gesamten beschriebenen Assistenten
implementiert. \[USER\]

Verhalten: Beim Öffnen der App kann situationsabhängig ein interaktiver
Dialog erscheinen, beispielsweise mit der Frage, ob der Kunde erreicht
wurde. Je nach Antwort folgen unterschiedliche Optionen. Der Workflow
bietet u. a. Aktionen, um WhatsApp, E-Mail oder SMS mit
Nachrichtenvorlagen zu öffnen. \[USER\]

Bewerbungsrelevante Kompetenzen: Requirements Engineering und
Anwenderkommunikation; Prototyping; Interaction Design und bedingte
Nutzerführung; Dart/Flutter; Integration externer
Kommunikationsaktionen; Umsetzung eines vollständigen Features vom
Bedarf bis zur Oberfläche. \[USER\]

Offen: Welche Tools für Prototypen? Welche Trigger-/Persistenzlogik?
Offline-Verhalten dieses Features? Navigation/State Management? Wurden
Kommunikations-Apps nur mit vorbefüllten Entwürfen geöffnet oder
Nachrichten automatisch verschickt? Welche Tests, Release- und
Nutzerergebnisse?

## 9.3 Feature B: Signatur- und Dokumentenworkflow mit Azure Functions

Projektinhalt und Eigenleistung: Den vollständigen Signatur- und
Dokumentenworkflow in der Unternehmensanwendung selbst umgesetzt. Die
Anwendung reagiert auf unterschiedliche Signatur- und Dokumentzustände,
unter anderem bei Generierung, Validierung, ungültigen beziehungsweise
gelöschten Signaturen und bei Änderungen mit erforderlicher
Neuerstellung/Löschung von Unterlagen. Für die Integration mit bereits
vorhandenen Azure Functions wurden Schnittstellen bzw. anzusprechende
Endpunkte definiert, Azure-Aufrufe angebunden, Exception-/Fehlerfälle
festgelegt sowie Verbindungs- und Integrationsprobleme analysiert und
behoben. \[USER, Sammelrunde 2\]

Bewerbungsrelevante Kompetenzen: Umsetzung fachlicher Geschäftsprozesse
über mehrere Zustände; API- und Cloud-Service-Integration; Definition
von Schnittstellenverträgen und Fehlerfällen; Ausnahmebehandlung und
Integrationsdebugging; Dokumenten-Lifecycle; funktionsübergreifende
Abstimmung. \[USER\]

Technische Abgrenzung: Azure Functions selbst wurden NICHT
implementiert. Ihre Schnittstellen und Integration in den
Signatur-Workflow gehören zur eigenen Arbeit. Dass die Entwicklung
eigener Azure Functions vermutlich erlernbar wäre, ist noch keine
dokumentierte praktische Erfahrung. Die drei Signaturwege und zentrale
Zustandsübergänge sind in Kapitel 10 näher erfasst. Weiter offen:
Sprache/Schicht der Workflowlogik, Endpunktverträge, Exception-Typen und
Retry-Parameter, verlorene HTTP-200-Antwort trotz serverseitiger
Verarbeitung, Signaturdienst (Name vorläufig), Authentifizierung,
Rollback und Tests. \[USER, OFFEN\]

Gesicherte Einordnung der Eigenleistung: Vollständige fachliche
Umsetzung des Signatur-Workflows und seine Cloud-Anbindung; keine
eigenständige Implementierung des Servercodes der Azure Functions.
\[USER\]

## 9.4 Querschnittsarbeit: Codequalität und UI/UX

Berichtet: Bugfixes, Tests und Code-Reviews sowie Schwerpunkt UI/UX und
responsives Design. Nun konkret beschrieben sind die Aufteilung
umfangreicher GoRouter-Routendefinitionen, eine wiederverwendbare,
schließbare Dialog-Komponente für Desktop und Mobile (an ca. 50 Stellen
statt vorhandener Standarddialoge), weitere UI-Verbesserungen und
kundenspezifische PDF-Template-Anpassungen mit Angebots-Platzhaltern.
\[USER\]

Offen: Ein konkreter Bug mit Ursache und Fix; ein Code-Review-Fund; Art
der Tests (Unit/Widget/Integration/manuell); genaue Widget-, Routing-
und PDF-Implementationsdetails; messbare Ergebnisse ausschließlich nach
Nachweis. Ein konkretes Refactoring-Beispiel ist nun in Kapitel 12
erfasst. \[OFFEN\]

## 9.5 Kandidatenformulierungen (noch nicht für CV freigegeben)

„Einen dialogbasierten Vertriebsassistenten für eine
plattformübergreifende Flutter-Anwendung von der Anforderungsaufnahme
und interaktiven Prototypen bis zur Umsetzung entwickelt;
situationsabhängige Folgeaktionen für Kundenkontakte sowie Vorlagen für
WhatsApp, E-Mail und SMS integriert.“ \[USER, Details prüfen\]

„Einen Signatur- und Dokumentenworkflow für eine plattformübergreifende
Vertriebsanwendung umgesetzt; vorhandene Azure Functions über definierte
Schnittstellen angebunden, Fehler-/Ausnahmefälle berücksichtigt und
Probleme bei der Cloud-Integration behoben.“ \[USER; technische Details
noch offen\]

# 10. Rocket-Code – Signatur- und Dokumentenworkflow (Sammelrunde 3)

Quelle \[USER-2026-11-06 bis 2026-11-07, Runden 3–5\]: frei geschilderte
Projekterfahrung. Zeitgesteuerte Retries sowie Sperre nach empfangener
HTTP-200-Antwort sind beschrieben, aber nicht durch Code/Tickets
verifiziert. Parameter und Verhalten bei verlorener Antwort sind offen.
Diese Notizen dienen als Belegsammlung, nicht als fertiger CV-Text.

## 10.1 Anwendungskontext und drei Signaturwege

Kontext: Plattformübergreifende, auch offline nutzbare
Flutter-Vertriebsanwendung eines Solaranlagenanbieters. Für ein
Auftrags-/Dokumentenpaket existierten drei Signaturvarianten. \[USER\]

• In-App-Signatur: Dokumente direkt innerhalb der Anwendung
unterschreiben.

• Manuelle Signatur: Ein bereits handschriftlich unterschriebenes
Dokument scannen und in der Anwendung hochladen.

• Externe E-Signatur: Signaturanfrage an einen externen Dienst (vom
Nutzer „Signorita“ genannt; exakte Schreibweise prüfen); anschließend
liegt das elektronisch signierte Dokument in Azure Blob Storage und wird
beim Online-Synchronisieren in der App abgerufen.

Eigener Anteil: Den gesamten Signatur-/Dokumenten-Workflow auf
Anwendungsseite realisiert, dabei vorhandene Azure Functions
eingebunden, anzusprechende Schnittstellen/Endpunkte definiert,
Exceptions/Fälle ausgearbeitet und Integrationsprobleme behoben. Die
Azure Functions selbst wurden nicht von ihm programmiert. \[USER\]

## 10.2 Voraussetzungen, Validierung und Dokumenterstellung

• Bevor eine E-Signaturanfrage versendet wird, wird der zugehörige
Auftrag validiert. Fehlende oder falsch konfigurierte Pflichtangaben
blockieren den Versand. \[USER\]

• Fehlen Dokumente, obwohl der Auftrag fachlich valide ist, werden
benötigte Unterlagen generiert; anschließend fordert die App eine
Bestätigung an. \[USER\]

• Wenn bereits einige Unterlagen vorhanden sind, aber noch nicht
unterschrieben wurden, werden nur die fehlenden Dokumente nachgeneriert
und der Ablauf wird fortgesetzt. \[USER\]

Noch zu prüfen: Welche Validierung erfolgt ausschließlich im
Flutter-Client, welche über vorhandene Endpunkte? Welche Dokumente
werden in welcher Reihenfolge erzeugt und nach welchen Regeln werden
Versionen verglichen?

## 10.3 Zustand und Konsistenz: dokumentierte Geschäftsregeln

• Bereits in der App signierte Dokumente können beim Wechsel in den
externen E-Signaturprozess nicht einfach unverändert übernommen werden:
je nach Zustand werden bisherige Dokumente gelöscht und neu generiert.
\[USER\]

• Nach dem Versand einer E-Signaturanfrage werden die betreffenden
Inhalte schreibgeschützt, bis das signierte Ergebnis aus Azure Blob
Storage synchronisiert wurde. \[USER\]

• Sobald E-signierte Unterlagen vorhanden sind, kann der
Vertriebsmitarbeiter diese in der App einsehen. \[USER\]

• Wenn eine gemischte Situation mit E-signierten und In-App-signierten
Unterlagen vorliegt, werden im beschriebenen Ablauf die bisherigen
betroffenen Unterlagen gelöscht und erforderliche Dokumente neu
erstellt. Genaues Ausmaß der Löschung ist noch zu klären. \[USER\]

• Das manuelle Löschen oder Neuhochladen eines e-signierten Dokuments
kann eine kaskadierende Löschung weiterer e-signierter Dokumente
auslösen, um Abhängigkeiten beziehungsweise die Integrität des
Signaturpakets zu wahren. \[USER\]

• Eine versendete E-Signaturanfrage kann grundsätzlich zurückgezogen
werden. Die danach ausgelöste(n) E-Mail-Benachrichtigung(en) und die
Formulierung „keine E-Mail mehr möglich“ sind in der Schilderung nicht
eindeutig und werden nicht als gesicherte Geschäftsregel festgehalten.
\[USER, OFFEN\]

## 10.4 Online-Bedingungen, Azure Blob Storage und Ausfallbehandlung

• Für den Versand einer E-Signaturanfrage muss die Anwendung online
sein. \[USER\]

• Netzprüfung vor dem Versand: Wenn keine Internetverbindung besteht,
zeigt die App eine Fehlermeldung an und lässt den E-Signatur-Request
nicht zu. \[USER, Runde 4\]

• Versand mit zeitgesteuerter Wiederholung: Besteht eine
Internetverbindung, wird die Anfrage gestartet und ein Timer verwendet.
Bei einem Socket-/Internetfehler wird nach der vorgesehenen Wartezeit
ein erneuter Versuch unternommen. \[USER, Runde 4\]

• Erfolgsbestätigung und Sperre: Nach HTTP 200 von Azure Function, das
den E-Signaturversand bestätigt, verhindert die App die erneute
Auslösung derselben Anfrage. \[USER, Runde 5\]

• Abbruchpfad: Kann der Vorgang nicht erfolgreich weitergeführt werden,
wird er abgebrochen; nach der Schilderung soll dabei in der App nichts
am Dokument-/Signaturzustand verändert werden. Ob der entfernte Dienst
einen zuvor gesendeten Request bereits verarbeitet hat, ist damit noch
nicht geklärt. \[USER, OFFEN\]

• Nicht belegt sind Wartezeit, maximale Retry-Anzahl, automatischer
Retry beim späteren Wiederverbinden, persistente Offline-Warteschlange
oder serverseitiger Duplikatschutz. Die Sperre nach HTTP 200 beantwortet
nicht den Fall einer verlorenen Erfolgsantwort. \[OFFEN\]

• Das extern signierte Ergebnis wird online aus Azure Blob Storage
abgeholt und in den lokalen App-Zustand übernommen. Der genaue
Storage-Zugriffspfad (direkt oder via Backend/Azure Function) ist noch
nicht belegt. \[USER\]

Nicht daraus ableiten: automatische Hintergrundjobs,
Exactly-once-Verarbeitung, idempotente API-Calls, dauerhafte
Retry-Queues, Event-Driven Architecture oder ein eigener
Azure-Blob-Backendservice. Diese Begriffe erst nach konkretem Nachweis
verwenden.

### Ablaufskizze E-Signatur-Versand – aus der Projektschilderung (kein Code-Nachweis)

1\. Nutzer löst die E-Signatur-Aktion aus; die App prüft die
Internetverbindung.

2\. Ohne Verbindung: Fehlermeldung und kein API-Versand.

3\. Mit Verbindung: Anfrage wird versendet; ein Timer steuert die
Wartezeit.

4\. Bei HTTP 200: Versand gilt als bestätigt; weitere Auslösung
derselben E-Signaturanfrage wird blockiert.

5\. Bei Socket-/Internetfehler: erneuter Versuch nach der
Timer-Wartezeit, sofern noch keine empfangene
HTTP-200-Erfolgsbestätigung vorliegt.

6\. Bei nicht weiterführbarem Vorgang: Abbruch ohne beabsichtigte
Änderungen am lokalen Signatur-/Dokumentzustand.

Achtung: Nach empfangener HTTP-200-Bestätigung ist erneutes Senden in
der App gesperrt. Ob eine serverseitig verarbeitete Anfrage bei
verlorener Antwort dennoch erneut ausgelöst werden könnte, bleibt offen.
Keine Exactly-once-Garantie. \[USER, OFFEN\]

## 10.5 Technisches Kompetenzprofil aus diesem Feature

• Geschäftsregeln für nichttriviale Dokument-Lifecycles und voneinander
abhängige Signaturzustände in eine benutzbare Anwendung übertragen.
\[USER\]

• Schnittstellen eines bestehenden Cloud-Backends genutzt;
API-Integration, Netzwerkprüfung, zeitgesteuerte Retries bei
Socket-/Internetfehlern und Abbruchpfade umgesetzt; nach bestätigter
HTTP-200-Antwort erneute E-Signaturanfragen blockiert. \[USER\]

• Offline-fähige Gesamtanwendung und Online-Pflicht für spezielle
Cloud-Aktionen auseinandergehalten; Synchronisierung signierter
Cloud-Dokumente begleitet. \[USER\]

• Integrität und Aktualität von unterschriebenen Unterlagen beim
Neuerstellen, Löschen oder Austauschen berücksichtigt. \[USER\]

Technische Abgrenzung: BLoC/Cubit, Repository und REST-Service sind in
der Anwendung bestätigt (Kapitel 11). Ob eine explizite State Machine,
persistente Offline-Queue oder ausgefeilte Idempotenzbehandlung
verwendet wurde, ist nicht belegt; ebenso offen ist die konkrete
Speicherung des Signaturstatus.

## 10.6 Kandidatenformulierungen – Rohmaterial

Für Software Engineering: „In einer plattformübergreifenden
Vertriebsanwendung einen Signatur- und Dokumentenprozess mit drei
Signaturvarianten umgesetzt; Validierungsregeln, Dokumentneuerstellung
sowie voneinander abhängige Signatur- und Bearbeitungszustände
berücksichtigt.“ \[USER; konkrete Form je Stelle anpassen\]

Für Cloud-/Integrationsstellen: „Einen Signaturworkflow an vorhandene
Azure Functions angebunden, bei Netzwerkfehlern zeitgesteuerte Retries
integriert und nach bestätigtem HTTP-200-Erfolg erneute Signaturanfragen
in der App verhindert.“ \[USER; keine eigene Azure-Function-Entwicklung;
Retry-Details offen\]

## 10.7 Offene Fragen für die nächste Gesprächsrunde

• Wie lange war das Warteintervall des Timers, und wie viele Versuche
waren maximal vorgesehen? Wurde der Retry nur direkt nach dem
Netzwerkfehler oder auch beim späteren Wiederverbinden ausgelöst?

• Offen: Wie wurde der Sonderfall behandelt, dass Azure die Anfrage
verarbeitet hatte, die HTTP-200-Antwort aber den Client nicht erreichte?
Gab es eine Anfrage-ID oder serverseitige Statusprüfung?

• BLoC/Cubit ist bestätigt. Wo lagen die Signatur-/Dokumentstatus
(Client, lokal persistiert, Backend oder kombiniert)? Welche konkreten
State-/Cubit-Klassen waren beteiligt?

• Welche genauen HTTP-Aufrufe/Endpunkte, Request-/Response-Felder,
Statuscodes und Exceptions wurden im Client definiert?

• Wie genau verhielten sich Zurückziehen, Benachrichtigungen und die
Verknüpfung signierter Dokumente?

# 11. Rocket-Code – BLoC/Cubit, Repository und REST-Service (Sammelrunde 6)

Quelle: Eigene Projektschilderung vom 07.11.2026 \[USER\]; noch nicht
durch Code oder Tickets gegengeprüft.

## 11.1 Architektur und Datenfluss

• BLoC und Cubit wurden als State-Management-Ansatz in der
Flutter-Vertriebsanwendung genutzt. \[USER\]

• BLoC/Cubit kommunizierte mit einer Repository-Schicht, die einen
REST-Service aufrief. \[USER\]

• Der REST-Service warf bei Fehlern Exceptions. Diese wurden durch die
Schichten weitergereicht und von der UI selbst abgefangen. Die
Oberfläche zeigte daraufhin passende Fehlermeldungen. \[USER,
KORREKTUR\]

Fachliche Ablaufskizze (kein Code-Auszug): Flutter UI ↔ BLoC/Cubit →
Repository → REST-Service → API/Azure Functions. Fehlerpfad:
REST-Service wirft Exception → Weitergabe durch die Schichten → UI fängt
Exception ab → UI zeigt passende Meldung.

Technische Abgrenzung: Der Catch ist auf UI-Ebene bestätigt. Nicht
belegt ist ein Catch im Cubit/Bloc mit anschließendem Error-State oder
ein spezifischer BlocListener-Einsatz für diese Fehler. Offen sind die
konkreten UI-Klassen, Exception-Typen und die Persistenz des
Signaturstatus.

## 11.2 Nachweisbare Kenntnisse

• Praktischer Einsatz von Flutter/Dart mit BLoC/Cubit in einer
plattformübergreifenden Unternehmensanwendung. \[USER\]

• Schichtenarchitektur mit Repository- und REST-Service-Ebene. \[USER\]

• API-Anbindung mit Fehlerweitergabe, Exception-Catch auf UI-Ebene und
verständlicher Fehlerrückmeldung an Nutzende. \[USER\]

Mögliche CV-Rohformulierung: „In einer plattformübergreifenden
Flutter-Anwendung BLoC/Cubit, Repository- und REST-Service-Schicht
eingesetzt sowie API-Exceptions in der UI abgefangen und nutzergerechte
Fehlermeldungen angezeigt.“ \[USER; konkrete Implementierungsdetails
noch prüfen\]

## 11.3 Refactoring – Fortsetzung in Kapitel 12

Das Abfangen von Exceptions auf UI-Ebene ist bestätigt. Das nächste
konkrete Refactoring-Beispiel (Routing und Dialoge) sowie PDF-Vorlagen
sind in Kapitel 12 erfasst. Für die technische Vertiefung fehlen noch
ein Bugfix mit Ursache und Fix, ein Code-Review-Fund und die verwendeten
Testarten. \[OFFEN\]

# 12. Rocket-Code – Routing-Refactoring, Dialog-System und PDF-Vorlagen (Sammelrunde 7)

Quelle: persönliche Beschreibung vom 07.11.2026 \[USER\]; nicht anhand
von Repository, Tickets oder ausgelieferten Dateien geprüft.

## 12.1 Refactoring der Flutter-Navigation

Ausgangslage: Die Navigation der bestehenden Flutter-Anwendung nutzte
GoRouter-/go_router-Routendefinitionen in einer wenig aufgeteilten
Struktur. \[USER; genauer ursprünglicher Dateiaufbau offen\]

Eigener Beitrag: Routen in separate Routing-Dateien aufgeteilt, statt
sie gesammelt an einer Stelle zu belassen. Damit wurde die Navigation
strukturell reorganisiert. \[USER\]

Nachweisbare Kompetenz: Flutter-Navigation und Refactoring bestehender
Code-Strukturen. Nicht belegt: konkrete Anzahl der Routen, Anpassungen
an Deep Links, Guards oder Navigationstests; keine messbare
Performance-Steigerung behaupten.

## 12.2 Einheitliche, responsive Dialog-Komponente

Ausgangslage: Viele Aufrufstellen verwendeten zuvor normale bzw. separat
gestaltete Dialoge. Ziel war ein wiederverwendbares, auf Mobilgeräten
und PCs passendes Dialogverhalten. \[USER\]

Eigener Beitrag: Eine allgemein einsetzbare, schließbare
Dialog-Komponente umgesetzt. Auf Desktop wird sie mit
definierter/limitierter Größe gezeigt, auf Mobilgeräten vollflächig. Für
beide Darstellungsarten wurde die Anordnung der Aktionsbuttons
berücksichtigt. \[USER\]

Migration: Die vorherigen Dialoge wurden an ungefähr 50 Stellen der
Anwendung durch die neue Lösung ersetzt. „Ca. 50“ ist eine persönliche
Schätzung, keine im Repository gezählte Zahl. \[USER\]

Nachweisbare Kompetenz: Widget-Abstraktion, Wiederverwendung,
UI-Konsistenz, responsive Flutter-Layouts, Refactoring mit vielen
betroffenen Aufrufstellen. Offen: eingesetzte Widgets, Breakpoints,
Übergabeparameter, Navigation/Schließen und Testabdeckung.

## 12.3 PDF-Vorlagen und dynamische Platzhalter

Kontext: In der Solar-Vertriebsanwendung werden kunden- und
angebotsbezogene PDF-Dokumente erzeugt. \[USER\]

Eigener Beitrag: Mehrere PDF-Vorlagen entsprechend Kundenwünschen
überarbeitet, bestehende Layouts verbessert und mit dynamischen
Platzhaltern ergänzt. Bei der PDF-Generierung werden diese Platzhalter
durch passende Werte aus den zugehörigen Angebotsdaten ersetzt. Dazu
wurde laut Schilderung das Dart/Flutter-Paket pdf eingesetzt. \[USER\]

Nachweisbare Kompetenz: programmatische PDF-Erzeugung und
Template-Anpassung, dynamische Datenbindung, Umsetzung fachlicher
Anforderungen an Dokumente sowie Sorgfalt bei kundenbezogenen
Formularen. \[USER\]

Abgrenzung: Teils bereits vorliegende Angebotsdaten, teils zusätzliche
API- und lokale Datenbankabfragen bestätigt. Dokumentarten,
Mapping-Regeln, verwendete Datenbank, Seitenlayout und Tests sind noch
offen. Keine selbst entwickelte PDF-Engine oder allgemeine
Template-Plattform behaupten.

## 12.4 Geeignete Aussagen für spätere Bewerbungen (Rohfassungen)

Flutter/Refactoring: „Die Navigation einer plattformübergreifenden
Flutter-Anwendung in separate Routing-Dateien gegliedert und einen
wiederverwendbaren, responsiven Dialog entwickelt, der rund 50
bestehende Dialog-Aufrufstellen vereinheitlicht.“ \[USER; Zahl
ungefähr\]

UI/UX: „Eine einheitliche Dialog-Komponente für Desktop und Mobile
umgesetzt, mit begrenzter Dialoggröße am PC, Vollbildansicht auf mobilen
Geräten und situationsangepasstem Button-Layout.“ \[USER\]

PDF/Dokumente: „Kundenspezifische PDF-Vorlagen mit dem Dart-pdf-Paket
weiterentwickelt und dynamische Platzhalter mit Angebotsdaten bei der
Dokumentgenerierung befüllt.“ \[USER\]

## 12.5 Offene Vertiefungsfragen

• PDF: Teilweise bereits vorhandene Angebotsdaten, teilweise zusätzliche
API- oder lokale Datenbankabfragen; offen bleiben Mapping, konkrete
Datenquellen und der Umgang mit fehlenden Werten. \[OFFEN\]

• Dialoge: Was war die vorherige konkrete Schwachstelle (duplizierter
Code, unterschiedliche Größen, Button-Verhalten)? Was hat sich nach dem
Ersetzen verbessert? \[OFFEN\]

• Qualität: Wie wurden die rund 50 Dialog-Aufrufstellen nach dem
Refactoring geprüft (Widget-Tests, manuelle Gerätetests, Code-Review)?
\[OFFEN\]

## Ergänzung Version 1.9 – Datenquellen für PDF-Platzhalter

Bei der dynamischen PDF-Generierung waren manche Angebotswerte bereits
verfügbar. Weitere Werte wurden bei Bedarf über eine API oder aus der
lokalen Datenbank abgefragt. \[USER\]

Noch zu klären: konkrete Datenbanktechnologie, Datenmodelle und Mapping,
Fehlerbehandlung bei fehlenden Werten sowie die genaue Reihenfolge der
Abfragen. Eine vollständig offlinefähige PDF-Generierung ist damit nicht
belegt. \[OFFEN\]

# 13. Rocket-Code – Isar und Local-first-Datenzugriff

Quelle: eigene Projektschilderung vom 07.11.2026 \[USER\], noch nicht
durch Code oder Tickets überprüft.

## 13.1 Bestätigte Architektur und Technologie

- Isar wurde als lokale Datenbank in der plattformübergreifenden
  Flutter-/Dart-Vertriebsanwendung verwendet. \[USER\]

- Eine Schnittstelle fragte Daten zuerst lokal ab und griff bei
  fehlenden Daten auf eine Online-Abfrage zurück (Local-first mit
  Online-Fallback). \[USER\]

- Bei der PDF-Generierung kamen sowohl vorhandene Angebotswerte als auch
  ergänzende Daten aus API- beziehungsweise lokalen Datenbankabfragen
  zum Einsatz. \[USER\]

## 13.2 Was wir daraus belegen können

Praktische Tätigkeit in einer offline-fähigen Flutter-Anwendung mit
Isar, abstrahiertem Datenzugriff sowie lokalem Lesezugriff mit
Online-Fallback. Noch nicht klar ist, ob die zugrunde liegende
Schnittstelle von Khaled selbst erstellt oder in eigenen Features
verwendet wurde.

## 13.3 Technische Grenzen und offene Fragen

Nicht belegt: persistente Offline-Queue, bidirektionale Synchronisation,
Speicherung nachgeladener Online-Daten in Isar, Cache-Invalidierung,
Konfliktbehandlung oder konkrete Isar-Queries und Collections. \[OFFEN\]

Nächste Frage: Wurden online abgerufene Daten danach in Isar gespeichert
oder nur temporär verwendet? Und hast du die Local-first-Schnittstelle
selbst entwickelt oder hauptsächlich benutzt?

# 14. Rocket-Code – Testing, Usability, Pull-Request-Reviews und Git-Hooks

Quelle: persönliche Beschreibung im Gespräch vom 07.11.2026 \[USER\].
Noch nicht durch Repository, Git-Konfiguration, Pull Requests oder
Testprotokolle geprüft.

## 14.1 Praktisch beschriebene Tätigkeiten

- **Usability-Tests:** Viele Usability-Tests der Vertriebsanwendung
  durchgeführt. Konkrete Testfälle, Zielgruppen, Geräte und
  dokumentierte Ergebnisse bleiben offen. \[USER\]

- **Code-Reviews und Pull Requests:** An Pull Requests und Reviews
  mitgewirkt, eigene Reviews geschrieben und Code geprüft. Anzahl,
  Review-Tiefe und einzelne gefundene Fehler sind noch offen. \[USER\]

- **Pre-Commit-Automatisierung:** Automatischen Git-Pre-Commit-Hook
  eingerichtet, der Flutter-Tests vor einem Commit ausführt. Nach
  eigener Beschreibung wird der Commit nur freigegeben, wenn die
  Prüfungen erfolgreich sind. \[USER\]

- **KI-gestützte Test-Abdeckungsprüfung:** Ein KI-gestütztes Skript für
  neue Module eingesetzt beziehungsweise entwickelt, das Module ohne
  zugehörige Tests markiert und einen Commit bei fehlenden passenden
  Tests verhindern soll. Genaue Erkennungslogik, verwendetes Modell und
  technische Anbindung sind noch offen. \[USER\]

## 14.2 Vorsichtige technische Einordnung

Nach eigener Beschreibung Erfahrung mit Flutter-Tests, lokalen
Git-Qualitäts-Gates, Pre-Commit-Hooks, Pull-Request-Reviews und
Usability-Tests. Ob die Hook-Prüfung alle Tests oder nur einen Teil der
Suite startete, ist offen. „KI-Skript“ bedeutet noch nicht, dass ein LLM
tatsächlich den Code semantisch analysierte; das muss anhand des Skripts
geklärt werden. Keine belegbare Aussage über CI-Pipeline,
Code-Coverage-Prozent, Testanzahl, Defektreduktion oder den technischen
Mechanismus einer unüberwindbaren Commit-Sperre.

## 14.3 Vorläufige Bewerbungsbausteine

„Automatisierte Flutter-Testprüfungen über einen Git-Pre-Commit-Hook in
den lokalen Entwicklungsworkflow eingebunden und Commits bei
fehlgeschlagenen Prüfungen blockiert.“ \[USER; genaue Hook-Konfiguration
noch offen\]

„Pull Requests geprüft, Code-Reviews verfasst und Usability-Tests einer
plattformübergreifenden Vertriebsanwendung durchgeführt.“ \[USER\]

„Einen KI-gestützten Prüfmechanismus zur Kennzeichnung neuer Module ohne
passende Tests genutzt bzw. aufgebaut; technische Funktionsweise noch zu
verifizieren.“ \[USER, OFFEN\]

## 14.4 Nächste Klärung – ein konkreter Fall

Welchen konkreten Fehler oder Qualitätsmangel hast du in einem
Pull-Request-Review gefunden, und welche Änderung hast du vorgeschlagen?
(Nur ein Beispiel genügt.)

# 15. IFIB Consult – konkrete Tätigkeiten (Sammelrunde 12)

## 15.1 Externe Evaluation einer Bildungsplattform

Quelle: Persönliche Projektschilderung vom 07.11.2026 \[USER\]; die
Angaben sind noch nicht mit Testprotokollen oder Arbeitszeugnis
abgeglichen.

Prüfgegenstand: Bildungsplattform als Website und „Walter App“.
Durchführung von Funktions- und Usability-Tests, in enger Zusammenarbeit
mit einer Kollegin.

Testprotokolle: Detaillierte Protokolle eigenständig erstellt,
Testergebnisse dokumentiert und ausgewertet.

Einordnung: Nachweis für funktionales Testen, Usability-Evaluation,
Ergebnisdokumentation und Zusammenarbeit – keine Behauptung
automatisierter Tests oder Softwareimplementierung bei IFIB.

## 15.2 Prozess- und Digitalisierungsrecherche

Recherchen zu Digitalisierungsplänen und -strategien durchgeführt,
aktuelle Anforderungen analysiert und Ergebnisse kontinuierlich
aktualisiert. \[USER\]

Einordnung: Fachliche Recherche, systematische Aufbereitung und Pflege
von Informationen. Keine unbelegte Verantwortung für die Einführung
einer Digitalisierungsstrategie.

## 15.3 Dokumentation und Visualisierung

Abbildungen und Schaubilder zur verständlichen Aufbereitung der
Projektergebnisse eigenständig erstellt. \[USER\]

Offen: Verwendete Programme, konkreter Inhalt und Adressaten der
Visualisierungen.

## 15.4 Bewerbungsformulierungen (vorläufig)

„Funktions- und Usability-Tests einer Bildungsplattform und der Walter
App durchgeführt sowie detaillierte Testprotokolle erstellt und
ausgewertet.“

„Digitalisierungsstrategien und aktuelle Anforderungen recherchiert,
Ergebnisse gepflegt und Projektergebnisse mit eigenen Schaubildern
visualisiert.“

## 15.5 Noch zu klären

Ein konkreter Fund aus der Funktions- oder Usability-Evaluation, falls
erinnerlich; sonst mit dem nächsten Projekt fortfahren.

# 16. TaminyPro – laufendes Eigenprojekt (Quellcodeanalyse)

Projektstatus: In Entwicklung (Aussage des Projektinhabers). Quelle:
bereitgestelltes ai_context.txt mit pubspec.yaml und 169 gebündelten
Dart-Dateien aus lib/. Es handelt sich um einen Quellcode-Ausschnitt,
nicht um eine vollständige Ausführungs-, Test- oder Produktionsprüfung.
Die Aussage, dass es sich um ein eigenes Projekt handelt, stammt vom
Projektinhaber; der Code allein belegt keine individuelle Urheberschaft
jeder Zeile.

## 16.1 Produkt und fachlicher Umfang

- Mandantenfähige Shop-/Gastronomieverwaltung: Verwaltung mehrerer Shops
  mit zugeordneten Benutzern sowie shop-spezifischen Menüs, Kategorien
  und Produkten.

- Kiosk-/Bestelloberfläche und Live-Orders: Warenkorb, Erfassung von
  Bestellungen, Statusdarstellung und laufende Bestellübersicht;
  Hinweise im Code auf responsive Ansichten.

- Öffentliche Storefront: per URL /store/:shopId erreichbare, nicht
  authentifizierungspflichtige Speisekarten-/Bestellansicht. Zusätzlich
  existieren im Code Funktions-/Tarifabgrenzungen und eine
  WhatsApp-Formatierung.

- Benutzerverwaltung mit Rollen: manager, admin, terminal und expliziten
  Berechtigungsprüfungen für Shops, Verwaltung, Menüpflege und Kiosk.

## 16.2 Technologie- und Architekturbelege

- Flutter / Dart: modulares Projekt mit Bereichen core, auth, shops,
  menu, orders und storefront; Oberflächen, Anwendungslogik und
  Repositories sind in getrennten Verzeichnissen organisiert.

- Firebase Authentication und Cloud Firestore: implementierte
  Authentifizierungs- und Datenzugriffsrepositorien; Datenmodell-Mapping
  zwischen Dart-Entities und Firestore-Dokumenten.

- BLoC/Cubit: Zustandsverwaltung u. a. für Anmeldung, Shops, Menüs,
  Warenkorb, Live-Bestellungen und öffentliche Storefront.

- Repository Pattern: Domain-Repository-Interfaces und
  Firebase-spezifische Implementierungen, um Datenzugriff und
  Geschäfts-/Darstellungslogik zu entkoppeln.

- GetIt: zentraler Dependency-Injection-Container registriert Services,
  Cubits und Repository-Implementierungen.

- go_router: typisierte Routen, generierter Routen-Code und
  StatefulShellRoute mit separaten Navigationsbereichen; Routen- und
  Zugriffskontrolle abhängig von Benutzerrolle.

- dart_mappable / build_runner: Codegenerierung für serialisierbare
  Domain-Entities und Mapper. Generierter Code wird nicht als von Hand
  geschriebene Logik gewertet.

- Wiederverwendbare UI-Bausteine und Responsive Design: eigene Widgets
  für Karten, Eingabeformulare, Ladezustände, Dialoge und Listen;
  definierte Breakpoints für Mobile, Tablet und Desktop sowie
  Theme-Switching.

- Asynchrone Vorgänge und Realtime-Daten: Streams, StreamSubscriptions
  und abstrakte BaseRealtimeCubit-/BaseRealtimeState-Bausteine mit
  Fehler-, Lade- und Synchronisationsstatus.

- Fehlerbehandlung und Diagnose: benannte Auth-, Network-, Server- und
  Validation-Exceptions sowie Talker für Logging; Statusfeedback in der
  UI über Listener und Benachrichtigungs-Service.

- Lokale Präferenzen: SharedPreferences für Theme-Einstellungen; Hive
  ist als Abhängigkeit vorhanden, aber eine konkrete produktive
  Verwendung ist allein aus der Paketliste nicht nachgewiesen.

- Test-Infrastruktur: flutter_test, mocktail und bloc_test in
  pubspec.yaml deklariert. Anzahl, Umfang und Bestehen der Tests sind
  mit diesem Bundle nicht belegt.

## 16.3 Besonders aussagekräftige Codebeispiele

### Rollenbasierte Zugriffskontrolle

role_permissions.dart definiert Rechte pro Rolle; Router und
FirebaseAuthRepository prüfen die Zugriffsberechtigungen. Auch inaktive
Nutzer werden gesondert behandelt.

### Konsistenz bei Benutzerregistrierung

FirebaseAuthRepository erzeugt zunächst den Auth-Account und danach den
Firestore-Nutzer. Scheitert der Firestore-Schritt, versucht die
Implementierung die Auth-Registrierung zurückzurollen.

### Gemeinsamer Realtime-/Action-Unterbau

BaseRealtimeCubit kapselt wiederkehrende Zustandsübergänge für Lade-,
Erfolgs- und Fehlerfälle, prüft isClosed nach asynchronen Vorgängen und
verwaltet StreamSubscriptions.

### Optimierung von Rebuilds

Kiosk- und Live-Orders-Routen nutzen BlocBuilder.buildWhen, um Rebuilds
auf Änderungen der relevanten Nutzeridentität, Rolle oder
Shop-Zugehörigkeit einzugrenzen.

### Adaptive Benutzungsoberfläche

ResponsiveExtension unterscheidet Größenklassen; Basisformulare und
weitere Widgets passen Layout und Interaktion abhängig von der
Darstellung an.

## 16.4 Grenzen und Validierungsbedarf

- „Multi-Tenant“ beschreibt die fachlich erkennbare Shop-Zuordnung. Die
  tatsächliche Durchsetzung der Mandantentrennung auf
  Datenbank-/Security-Rules-Ebene ist durch den vorliegenden lib/-Bundle
  allein nicht vollständig geprüft.

- Nicht behaupten: produktiver Betrieb mit realen Kunden, fertiges
  SaaS-Produkt, abgesicherte Skalierbarkeit, vollständige
  Offline-Funktionalität oder nachweislich hohe Testabdeckung.

- Vorhandene Paket-Abhängigkeiten sind keine Belege dafür, dass die
  jeweilige Technologie in relevanten produktiven Abläufen eingesetzt
  wird.

- Die Ergebnisse sind eine statische Codeeinschätzung; weder
  Flutter-Tests noch ein vollständiger Build wurden hier ausgeführt.

- Für Bewerbungstexte sollten eigener Implementierungsumfang, aktueller
  Reifegrad und konkrete Herausforderungen gemeinsam bestätigt werden.

## 16.5 Vorläufige Bewerbungsbausteine

„Entwicklung einer mandantenfähigen Flutter-Anwendung für
Gastronomiebetriebe mit Firebase Authentication, Cloud Firestore,
rollenbasierter Benutzerverwaltung, Menü- und Bestellfunktionen sowie
einer öffentlichen Storefront (laufendes Eigenprojekt).“

„Aufbau einer modularen Flutter-Architektur mit BLoC/Cubit,
Repository-Interfaces und Firebase-Implementierungen, Dependency
Injection über GetIt und typisierter Navigation mit go_router.“

„Entwicklung wiederverwendbarer, responsiver UI-Komponenten und
gemeinsamer Zustands-/Fehlerbehandlungsmechanismen für asynchrone
Datenflüsse.“

## 16.6 Eigenanteil und KI-gestützter Entwicklungs- und Reviewprozess (Selbstauskunft)

TaminyPro ist ein laufendes Eigenprojekt. Nach eigener Schätzung
schreibt der Entwickler ungefähr 60 % des Codes selbst. Bei weiteren
Implementierungsteilen nutzt er KI-Codingtools: Er spezifiziert die
umzusetzenden Aufgaben in Anweisungen und prüft den erzeugten Code
anschließend selbst. Die Prozentzahl ist eine Selbsteinschätzung, keine
Messung anhand von Commits oder Codezeilen.

- KI-Unterstützung bei Implementierungen: Anforderungen bzw. konkrete
  Arbeitsaufträge an KI-Codingtools formuliert; generierte Änderungen
  werden selbst gelesen, überprüft und funktional getestet.

- Automatisierte KI-Code-Reviews im Git-Workflow: Ein Pre-Commit-Hook
  übermittelt neue Änderungen an ein KI-System, das diese anhand
  vorgegebener Prompt-Regeln auf mögliche Qualitätsprobleme prüft. Die
  konkrete technische Anbindung und die Sperrlogik des Hooks sind noch
  nicht separat verifiziert.

- KI-gestützte Testerstellung: Tests werden mit Unterstützung von KI
  automatisch geschrieben; der Entwickler überprüft und testet die
  Ergebnisse. Art, Umfang, Bestehen und Qualität der Tests sind anhand
  des vorliegenden lib/-Bundles nicht unabhängig nachgewiesen.

- Menschliche Verantwortung und iteratives Review: Der Entwickler prüft KI-Review-Hinweise selbst auf tatsächliche Fehler bzw. mögliche Halluzinationen oder unbegründete Beanstandungen. Bestätigte Probleme korrigiert er und führt das KI-Review erneut aus. Er wiederholt den Vorgang, bis aus seiner Sicht keine substantiellen Fehlerhinweise mehr vorliegen und nur noch geringfügiges „Nitpicking“ (Stil- oder Detailanmerkungen) übrig bleibt. Eigene Codeprüfung und Funktionstests gehören weiterhin dazu. Dies ist eine Selbstauskunft über den Prozess, keine Garantie für fehlerfreien Code.

## 16.7 Bewerbungsrelevante Einordnung

Belastbar: „Eigenständige Weiterentwicklung einer modularen
Flutter-Anwendung unter Einsatz von KI-Codingtools zur
Implementierungsunterstützung, automatisierten Codeprüfung und
Testerstellung; manuelle Überprüfung, iterative Validierung der KI-Review-Hinweise und Funktionstests der Änderungen.“
Der interne Eigenanteil von ca. 60 % ist keine Formulierung für den
Lebenslauf. Nicht ohne zusätzliche Belege behaupten: fehlerfreie
KI-Reviews, vollständig automatisierte Testabdeckung, durchgängig
erfolgreiche Testläufe oder umfassendes Security-Auditing.


## 18. SIRcraft-AI: öffentliche Web-Einbindung und Plattformentscheidung (07.11.2026)

**Abgrenzung:** Der Bewerber entwickelte den KI-Assistenten für die bereits existierende Simulationssoftware SIRcraft. Er war **nicht** Entwickler der gesamten SIRcraft-Software. Die Universität übernahm das iFrame-Embedding in ihre Website; dies war laut Bewerber **keine eigene Implementierungsarbeit**.

- **Projektkontext:** SIRcraft ist eine Simulationssoftware aus dem Umfeld der Universität Bremen / des Bremen Spatial Cognition Center; die SIRcraft-Projektgeschichte und früheren Mitwirkenden sind nicht mit dem KI-Assistenten gleichzusetzen.
- **Eigene Implementierung:** Lokal betriebener RAG-Assistent mit Python/FastAPI, ChromaDB, Ollama und Flutter-Weboberfläche (Details, Tests und Evaluation siehe ältere Kapitel).
- **Plattformentscheidung:** Flutter wurde zunächst im Hinblick auf eine mögliche installierbare Mobile-/Desktop-App gewählt; später fiel die Entscheidung für eine Web-App.
- **Website-Einbindung:** Die Universität band die Flutter-Web-App per iFrame in ihre SIRcraft-Website ein. Die technische Einbindung wurde **nicht** vom Bewerber vorgenommen.
- **Öffentliche Links:** [SIRcraft AI Assistant](https://sircraft.uni-bremen.de/sircraft-ai/) und [SIRcraft – About](https://sircraft.uni-bremen.de/about/). Die URLs stammen vom Bewerber; die Seiten waren in dieser Sitzung technisch nicht unabhängig abrufbar.
- **Mögliche Bewerbungsformulierung:** „Entwicklung eines lokal betriebenen RAG-Assistenten für SIRcraft (Python, FastAPI, ChromaDB, Ollama) mit Flutter-Web-Oberfläche; die Anwendung wurde von der Universität in die SIRcraft-Website eingebunden.“
- **Nicht behaupten:** Eigenhändige iFrame-/WordPress-Integration, Entwicklung der ursprünglichen SIRcraft-Software, bekannte Produktionsnutzerzahlen oder zugesicherte Verfügbarkeitswerte.

# 19. SIRcraft AI: Zwei-Server-Betrieb, Modellkonfiguration und Beta-Bereitstellung (07.11.2026)

**Quellenstatus:** Ergänzende technische Angaben des Bewerbers [USER] vom 07.11.2026. Die im Kapitel 2 dokumentierte Masterarbeit [T] beschreibt grundsätzlich die Trennung zwischen Web-/RAG-Diensten und separatem GPU-/Ollama-Host. Die genaue Aussage zur aktuellen Beta-Testphase ist eine Selbstauskunft [USER] und nicht unabhängig über Nutzungsdaten belegt.

## 19.1 Eigene technische Umsetzung

- **KI-Rechner / Modellserver:** Separater Rechner für lokale KI-Inferenz, Ollama eingerichtet und vier Open-Weight-Sprachmodelle konfiguriert. Der Begriff „Open-Weight“ ist hier bewusst gewählt; eine vollständige Open-Source-Lizenz wird für keines der Modelle pauschal behauptet. [USER]
- **Web-/Backend-Server:** Getrennter Server für die Webanwendung und die Backend-Dienste; Entwicklung und Einrichtung der Kommunikation zwischen den beiden Servern. Backend-Technologien: Python, FastAPI und Pydantic; Modellkommunikation über Ollama. [USER, T]
- **Betrieb / Deployment:** Docker Compose und Nginx; separate Ausführung der Web-/Backend-Komponenten und der LLM-Inferenz. Details zu öffentlich erreichbaren Ports, TLS-Endpunkten, konkreten Hostnamen und Sicherheitskonfiguration sind nicht belegt und werden nicht behauptet. [USER, T]
- **Daten und Qualität:** RAG auf Basis von 179 kuratierten Dokumentationsabschnitten, Embeddings mit nomic-embed-text und ChromaDB, parserbasierte Syntaxvalidierung generierter SIRcraft-Gleichungen, Vergleich von vier lokalen LLMs an 30 Fragen sowie 67 Backend- und 30 Frontend-Tests laut Thesis. [T]

## 19.2 Plattformwahl und Auslieferungsstand

- **Ursprüngliche Entscheidung für Flutter:** Die Oberfläche wurde mit Flutter entwickelt, weil anfangs auch eine installierbare Anwendung für mobile Geräte und Desktop-PCs in Betracht gezogen wurde. Im Verlauf des Projekts wurde die Web-Auslieferung gewählt. [USER]
- **Aktueller Status:** Nach Angabe des Bewerbers als Flutter-Web-App für Beta-Tests bereitgestellt. Daraus folgt keine Aussage über Produktionsreife, produktiven Mehrnutzerbetrieb oder die Anzahl tatsächlicher Nutzerinnen und Nutzer. [USER]
- **Website-Einbindung:** Die Universität Bremen band die bereits entwickelte Web-App über ein iFrame in ihre SIRcraft-Projektseite ein. Die Implementierung des iFrames bzw. die Anpassung der Universitätswebsite war keine eigene Arbeit des Bewerbers. [USER]
- **Öffentlicher Projektlink:** https://sircraft.uni-bremen.de/sircraft-ai/ . Die Website ist eine externe Referenz; ihr aktueller Betriebszustand muss vor Bewerbungen separat geprüft werden.
- **Projektgrenze:** Gegenstand der eigenen Masterarbeit war der ergänzende KI-Assistent, nicht die Entwicklung der ursprünglichen SIRcraft-Simulationssoftware. [USER, T]

## 19.3 Verwendbare Formulierungen für Bewerbungen

**Kompakter CV-Baustein:** „Entwicklung von SIRcraft AI, einem RAG-basierten Assistenten mit Python, FastAPI, ChromaDB, Ollama und Flutter Web; Aufbau einer Zwei-Server-Architektur mit separatem Ollama-Modellserver und Web-/Backend-Server inklusive Serverkommunikation.“

**Betrieb und Projektlink:** „Web-App für Beta-Tests bereitgestellt; von der Universität per iFrame auf https://sircraft.uni-bremen.de/sircraft-ai/ eingebunden.“

**Technisches Kompetenzprofil:** „Softwareentwickler (M.Sc. Informatik) mit praktischer Berufserfahrung in Full-Stack-Entwicklung, API-Integration und Qualitätssicherung. Schwerpunkt auf Python, RAG und lokal betriebenen Sprachmodellen. Konzeption und Umsetzung eines KI-Assistenten mit Zwei-Server-Architektur, eigener Syntaxvalidierung und systematischer Modellbewertung.“

**Nicht ohne zusätzliche Belege behaupten:** Selbst programmierte iFrame-Integration; Entwicklung der zugrunde liegenden SIRcraft-Simulation; optimierte und vollständig getestete native Mobile-/Desktop-Versionen; produktiver Einsatz bei externen Kunden; garantierte Systemverfügbarkeit oder dokumentierte Skalierbarkeit; eigenständige Entwicklung der vier Sprachmodelle.

# 20. Agentengestützte Softwareentwicklung, Coding-Agenten und KI-Entwicklungswerkzeuge (07.11.2026)

**Quellenstatus:** Quellenstatus: Ergänzende Selbstauskunft des Bewerbers vom 07.11.2026 [USER]. Frühere Dossierkapitel und der Anhang D der Masterarbeit belegen weitere Beispiele für KI-gestützte Entwicklungs- und Prüfprozesse [T, USER]. Die genaue eingesetzte Produktvariante von Copilot und „Gemini Code“ sowie Einsatzdauer und Häufigkeit je Werkzeug sind noch nicht unabhängig geklärt. Der Bewerber schätzt seine praktische Erfahrung als sehr gut ein; dies ist eine Selbsteinschätzung, keine extern verifizierte Kompetenzstufe.

## 20.1 Eingesetzte Tools und Rolle

- **Tools:** Claude, Copilot, Gemini Code sowie Google Antigravity als KI- bzw. agentengestützte Coding-Werkzeuge. Die genauen Produktvarianten von Copilot und Gemini Code (z. B. Gemini Code Assist oder Gemini CLI) sind auf Nachfrage zu bestätigen. [USER]
- **Arbeitsweise:** KI-Agenten und Coding-Assistenten werden als unterstützende Werkzeuge im Softwareentwicklungsprozess genutzt. Der Bewerber definiert Anforderungen, steuert die Arbeitsaufträge durch Prompts, bewertet Ergebnisse und übernimmt die Verantwortung für Prüfung, Anpassung und Tests. [USER]
- **Niveau:** Nach eigener Einschätzung sehr gute praktische Erfahrung mit agentengestützter Entwicklung. Konkrete Nutzungsdauer, produktive Agent-Orchestrierung oder Teamverantwortung sind damit noch nicht belegt. [USER, OFFEN]

## 20.2 Praktische Anwendungsfelder

- **Planung und Lösungsentwurf:** Aufgaben und Features strukturieren, Arbeitsschritte planen, technische Lösungsoptionen erarbeiten sowie Implementierungsaufträge für Coding-Agenten präzise formulieren. [USER]
- **Code und Skripte:** Unterstützung bei der Erstellung und Überarbeitung von Programmcode, Hilfsskripten, Automatisierungen und Entwicklungswerkzeugen; erzeugte Änderungen eigenständig prüfen und bei Bedarf anpassen. [USER]
- **Debugging und Fehlersuche:** Fehlermeldungen und beobachtetes Verhalten analysieren, mögliche Ursachen systematisch eingrenzen, Lösungsvorschläge vergleichen und Fixes nachprüfen. [USER]
- **UI-Prototyping und UX:** Unterstützung bei UI-Ideen, Prototypen, Layoutalternativen und der iterativen Ausgestaltung von Benutzeroberflächen; technische und fachliche Entscheidungen bleiben beim Entwickler. [USER]
- **Tests und Reviews:** KI-gestützte Testgenerierung und Code-Reviews, inklusive regelbasiertem Review vor Commits, manueller Bewertung der Hinweise und erneuter Prüfung nach Korrekturen. [USER]

## 20.3 Konkrete Projektreferenzen

- **Masterarbeit / SIRcraft AI:** Anhang D dokumentiert den Einsatz von Gemini/Gemini Agent insbesondere für Recherche, Debugging, Skriptentwürfe und Test-Scaffolding. Die Entwicklungsentscheidung und Validierung der Resultate werden nicht vollständig an das Tool delegiert. [T]
- **TaminyPro:** Nutzung von KI-Codingtools für Teile der Implementierung, KI-unterstützte Testerstellung und iteratives KI-Code-Review im Git-Pre-Commit-Workflow; eigenständige Prüfung des Codes und Einordnung möglicher Fehlalarme/Halluzinationen. [USER]
- **Rocket-Code:** Anforderungsabstimmung und UI-Prototyping sind unabhängig davon als berufliche Eigenleistungen beschrieben. Nicht ohne weitere Angaben behaupten, dass alle genannten KI-Tools bei Rocket-Code in allen Aufgaben eingesetzt wurden. [USER, OFFEN]

## 20.4 Qualität, Eigenleistung und Grenzen

- **Menschliche Validierung:** Generierten Code und Vorschläge lesen, an eigene Architektur und Anforderungen anpassen, Tests ausführen und substantielle Fehlerhinweise von unbegründeten KI-Vermutungen unterscheiden. [USER]
- **Terminologische Abgrenzung:** „Agentengestützte Softwareentwicklung“ und „Agentic Coding“ beschreiben hier die Nutzung und Steuerung von Coding-Agenten. Eine eigenständige Entwicklung produktiv eingesetzter autonomer Agentensysteme mit Tool-Calling, Orchestrierungsframeworks oder Multi-Agent-Infrastruktur ist dadurch nicht automatisch belegt. [OFFEN]
- **Nicht behaupten:** Belegte Produktivitätssteigerungen, vollständige Testabdeckung, fehlerfreie Agentenergebnisse, selbst entwickeltes Agentenframework, alle Features vollständig autonom entwickelt oder spezifische praktische Erfahrung mit LangGraph/AutoGen ohne Nachweis. [OFFEN]

## 20.5 Geeignete Bewerbungsformulierungen

- **CV, technische Kenntnisse:** KI-gestützte Entwicklung und Agentic Coding mit Claude, Copilot, Gemini Code und Google Antigravity; praktische Nutzung für Planung, Debugging, Code-/Skripterstellung, UI-Prototyping, Tests und Code-Reviews. [USER]
- **CV, Projektbeschreibung:** KI-gestützte Entwicklungs- und Reviewprozesse mit selbst formulierten Aufgaben/Prompts, eigenständiger Prüfung generierter Änderungen und iterativer Testvalidierung eingesetzt. [USER]
- **Anschreiben:** In der Softwareentwicklung nutze ich Coding-Assistenten und agentengestützte Workflows für die Planung und Umsetzung von Features, Fehlersuche sowie die Vorbereitung von Tests und UI-Prototypen. Die erzeugten Ergebnisse überprüfe, überarbeite und teste ich eigenständig. [USER]
- **Einsatz je Stellenprofil:** Für AI-Engineering- und Full-Stack-Stellen deutlich nennen; für klassische Junior-Softwareentwicklung, technische Produktrollen oder QA nur dann aufnehmen, wenn dies zu den Aufgaben passt. Die Tools dürfen konkrete Software- und Projekterfahrung nicht verdrängen.

# 21. Rocket-Code – zweisprachige Helpdesk-Wissensbasis und Nutzerdokumentation (09.11.2026)

**Quellenstatus:** Ergänzende persönliche Angabe des Bewerbers vom 09.11.2026 [USER]. Die genauen Inhalte, die eingesetzte Helpdesk-Plattform und die Autorenschaft einzelner Beiträge sind noch nicht anhand von Artikeln oder Tickets geprüft.

## 21.1 Tätigkeiten, Zielgruppen und Sprachen

- **Wissensbasis und Helpdesk:** Bei Rocket-Code an einer Helpdesk-Wissensbasis sowie Anleitungen und FAQ-Inhalten gearbeitet. [USER]
- **Zielgruppen:** Dokumentation für Endkundinnen und Endkunden sowie Kolleginnen und Kollegen innerhalb des Teams. [USER]
- **Sprachen:** Inhalte auf Deutsch und Englisch. [USER]
- **Kompetenzbezug:** Technische und funktionale Informationen zielgruppengerecht erklären; Wissen dokumentieren und für Nutzer sowie interne Mitarbeitende zugänglich machen. Diese Einordnung folgt aus den geschilderten Tätigkeiten; konkrete Nutzungs- oder Supportkennzahlen liegen nicht vor.

## 21.2 Einsatz für Bewerbungen

**Lebenslauf, kompakt:** „Deutsch- und englischsprachige Helpdesk- und FAQ-Inhalte sowie Anleitungen für Endkunden und interne Teams erstellt und aufbereitet.“

**Lebenslauf, für produktnahe Rollen:** „An einer zweisprachigen Helpdesk-Wissensbasis mitgewirkt und Anleitungen sowie FAQs für Kunden und Teamkollegen zur verständlichen Nutzung der Anwendung aufbereitet.“

**Anschreiben:** „Neben der Entwicklung von Funktionen habe ich auch deutsch- und englischsprachige Anleitungen und FAQ-Inhalte für Endkunden und Kolleginnen und Kollegen erstellt. Dadurch bin ich es gewohnt, technische Abläufe für unterschiedliche Zielgruppen verständlich zu dokumentieren.“

**Relevante Rollen:** Technical Product Owner, Full-Stack-/Softwareentwicklung mit Kundenkontakt, Technical Support Engineering, Developer Experience, Technical Writing, Customer Success Engineering sowie KI-/RAG-Projekte mit Wissensaufbereitung.

## 21.3 Abgrenzungen und offene Punkte

- Keine Behauptung, die Helpdesk-Plattform oder deren Such-/Wissensdatenbanktechnik selbst entwickelt zu haben.
- Nicht ohne Beleg behaupten: Support-Ticketverantwortung, spezifisches Helpdesk-Produkt, umfangreiche Lokalisierungsprozesse, konkrete Artikelzahlen, Nutzerstatistiken oder messbare Reduktion von Supportanfragen.
- Bei Gelegenheit präzisieren: Welche Themen der Anleitungen/FAQs? Selber neu geschrieben oder bestehende Beiträge überarbeitet? Mit welchem Tool gearbeitet? Wie erfolgte die Abstimmung und Freigabe?

# 22. SIRcraft AI – Eigenständige RAG-Pipeline ohne LangChain (10.11.2026)

**Quellenstatus:** Direkt vom Bewerber bereitgestellter Python-Code der Klassen `OllamaEmbeddingFunction` und `PromptBuilderService` [CODE, USER]; ergänzende technische Beschreibung der RAG-Orchestrierung aus der vorangegangenen Codebesprechung [CODE-BESPRECHUNG]. Diese Angaben beziehen sich auf die gezeigten Implementierungsteile; ein vollständiger Repository-Audit liegt nicht vor.

## 22.1 Architektur und Abgrenzung zu LangChain

- **Eigene Implementierung statt Framework-Pipeline:** Die gezeigten Funktionen implementieren Embedding-Anbindung und Prompt-Konstruktion selbst, ohne LangChain-Imports oder LangChain-Abstraktionen. Das ist eine eigenständige, modulare RAG-Integration mit Python und direkten Schnittstellen. [CODE]
- **Kein absoluter Ausschluss:** Aus diesen Ausschnitten allein folgt nicht, dass im gesamten Repository nirgendwo LangChain verwendet wird. Für diese Aussage wären alle Backend-Imports und Abhängigkeiten (`requirements.txt`, `pyproject.toml` etc.) zu prüfen. [ABGRENZUNG]
- **Architekturkompetenz:** Praktische Erfahrung mit den Bausteinen einer RAG-Anwendung und ihrer direkten Integration, unabhängig davon, ob ein Orchestrierungsframework eingesetzt wird. [CODE, USER]

## 22.2 Eigene Embedding-Anbindung an Ollama

- **ChromaDB-Schnittstelle:** Eigene Klasse `OllamaEmbeddingFunction`, die `chromadb.api.types.EmbeddingFunction` implementiert und ChromaDB-kompatible Embeddings liefert. [CODE]
- **Direkter HTTP-Zugriff:** `httpx.Client` ruft Ollamas `/api/embeddings` mit Modellname und Text auf und liest den Vektor aus dem JSON-Feld `embedding`. [CODE]
- **Retrieval-spezifische Präfixe:** Für `nomic`-Modelle wird bei Dokumenten `search_document: ` und bei Suchanfragen `search_query: ` vorangestellt; die Methode `embed_texts` unterscheidet `RETRIEVAL_DOCUMENT` und `RETRIEVAL_QUERY`. [CODE]
- **Robustheitsmaßnahmen:** HTTP-Statusprüfung (`raise_for_status`), Timeout von 300 Sekunden, bis zu drei Versuche pro Text und Wartezeiten zwischen den Versuchen. Diese Mechanismen belegen Fehlerbehandlung, jedoch keine gemessene Verfügbarkeit oder Performance. [CODE]

## 22.3 Eigene Prompt-Konstruktion und Context Engineering

- **Service:** `PromptBuilderService` erzeugt einen vollständigen Prompt aus Systemregeln, optionalem Gesprächsverlauf, abgerufenem Kontext und aktueller Nutzerfrage. [CODE]
- **Domänenspezifische Regeln:** Ausführliche SIRcraft-Grammatik mit Operatoren, Funktionen, Piecewise-Syntax und Verbot von LaTeX- bzw. `if/else`-Ausdrücken; Ziel ist die Ausgabe verwendbarer mathematischer Formeln. [CODE]
- **Kontextbindung:** Explizite Anweisung, SIRcraft-spezifische Antworten auf bereitgestellten Kontext und Gesprächshistorie zu stützen und bei fehlender Information eine definierte Unsicherheitsantwort zu geben. Dies ist Prompt-Design, keine Garantie gegen Halluzinationen. [CODE]
- **Strukturiertes Ausgabeformat:** Vorgabe eines einzelnen JSON-Objekts mit `answer`, `equations` und `suggestions`, drei Folgefragen und konkreten Few-Shot-Beispielen für Infektionsübergänge, zeitabhängige Interventionen und nicht belegte Funktionen. [CODE]
- **Gesprächskontext:** Optionale Integration früherer Nachrichten mit Rollenbezeichnung und expliziter Trennung von History, Kontext und Frage. [CODE]
- **Kleine technische Auffälligkeit:** Der Docstring erwähnt eine „Gemini API“, während die gezeigte Embedding-Integration Ollama verwendet. Für Bewerbungen wird daraus keine Gemini-Laufzeitintegration abgeleitet; der Kommentar kann ein Überbleibsel früherer Entwicklung sein. [CODE, OFFEN]

## 22.4 Einordnung gegenüber LangChain

- **Vergleichbare Funktionen:** Eigene Embedding-Klasse statt vorgefertigter Embedding-Integration; eigener PromptBuilder statt Prompt-Template-Abstraktion; direkte API-Aufrufe und eigene Services statt standardisierter Modell- und Pipeline-Wrapper. [CODE, EINORDNUNG]
- **Vorteile im Projektkontext:** Transparente Kontrolle über API-Payloads, Präfixe, Fehlerbehandlung, Prompt-Regeln und projektspezifische SIRcraft-Syntax. [EINORDNUNG]
- **Trade-offs:** Höherer Eigenaufwand für Wartung, Integrationen und Fehlerbehandlung; LangChain kann standardisierte Provider-Wechsel und wiederverwendbare Bausteine erleichtern. Es liegen keine Benchmarks vor, die Überlegenheit bei Latenz, Qualität, Sicherheit oder Stabilität belegen. [EINORDNUNG]
- **Nicht behaupten:** Praktische LangChain-Erfahrung, LangGraph, MCP, produktive autonome Agenten oder gemessene Performance-Vorteile allein auf Grundlage dieser Implementierung. [ABGRENZUNG]

## 22.5 Bewerbungsformulierungen

**Lebenslauf – technisch kompakt:** „Eigenständige Implementierung zentraler RAG-Komponenten ohne LangChain: ChromaDB-kompatible Ollama-Embedding-Funktion mit HTTPX, dokument-/query-spezifische Embeddings sowie domänenspezifischer PromptBuilder mit Kontext- und Gesprächshistorienintegration.“

**Lebenslauf – KI-Engineering:** „Modulare RAG-Anwendung mit direkter Integration von Ollama und ChromaDB, eigenen Python-Services für Embeddings und Prompt-Orchestrierung, strukturierten JSON-Ausgaben und projektspezifischer Syntaxvalidierung.“

**Vorstellungsgespräch:** „Ich habe bewusst keine LangChain-Pipeline verwendet, sondern Embeddings, Retrieval, Prompt-Aufbau und Modellanbindung über eigene Python-Services integriert. Dadurch konnte ich insbesondere die Nomic-Präfixe und die SIRcraft-spezifischen Ausgabe- und Syntaxregeln direkt kontrollieren. Die Abwägung ist mehr Flexibilität bei gleichzeitig höherem Wartungsaufwand.“

**Prüfpunkt:** Die Aussage „vollständig ohne LangChain“ erst nach Prüfung aller Backend-Abhängigkeiten und Imports verwenden.


# 23. Staatsangehörigkeit und Arbeitsberechtigung (11.11.2026)

- **Staatsangehörigkeit:** deutsch; der Bewerber bestätigt ausdrücklich, die deutsche Staatsangehörigkeit zu besitzen. [USER, 11.11.2026]
- **Arbeitsberechtigung:** Als deutscher Staatsangehöriger besteht ein uneingeschränktes Recht, in Deutschland zu arbeiten. Ein Aufenthaltstitel, eine Blaue Karte EU oder ein arbeitgebergebundenes Visum ist dafür nicht erforderlich. [RECHTLICHE EINORDNUNG]
- **Bewerbungsformulare:** Bei der Frage nach Staatsangehörigkeit „Deutsch“ angeben. Bei „Benötigen Sie ein Visum oder Arbeitssponsoring für Deutschland?“: „Nein“. [BEWERBUNGSHINWEIS]
- **Lebenslauf:** Die Angabe „Staatsangehörigkeit: deutsch“ ist optional und nur dort sinnvoll, wo sie für die Position oder die Klärung der Arbeitsberechtigung relevant ist. Nicht automatisch in jede Bewerbung aufnehmen. [BEWERBUNGSHINWEIS]
- **Keine unbelegten Zusatzangaben:** Keine Aussagen über zweite Staatsangehörigkeiten, Geburtsort oder das Datum der Einbürgerung ableiten. [ABGRENZUNG]
