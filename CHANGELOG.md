# Changelog

Tutte le novità e gli aggiornamenti di **Easy11** (creato da **Tom Ardi**).

## [4.0.0] - 2026-11-18 — Apex Edition
### Aggiunto
- **Nuova Identità & Interfaccia:** rinominato ufficialmente in **Easy11**, con tema **Chiaro / Scuro** intercambiabile, rilevamento hardware in tempo reale e barra di ricerca istantanea per filtrare i tweak.
- **5 Super-Modalità Selezionabili:** profili rapidi preconfigurati per *Ufficio / Casa*, *Max Batteria*, *Ultra-Fast*, *Bunker Privacy* e *Gaming Pro*.
- **Oltre 55 Tweak & Segreti di Sistema** organizzati in sezioni dedicate:
  - *Pulizia & Spazio (11 opzioni):* inclusi Delivery Optimization, cache shader DirectX, `TRIM` SSD/NVMe e pulizia WinSxS (`DISM`).
  - *Kernel, CPU & RAM (10 segreti):* sblocco piano *Prestazioni Eccellenti*, `Win32PrioritySeparation`, stop *Power Throttling*, ottimizzazione `SvcHostSplitThresholdInKB`, gestione *SysMain* e compressione memoria.
  - *Interfaccia & Explorer (11 trick):* menu contestuale classico Windows 10, `MenuShowDelay = 0`, apertura diretta su *Questo PC* e personalizzazione taskbar.
  - *Rete, DNS & Bassa Latenza (8 trick):* TCP Auto-Tuning, RSS, sblocco banda QoS, stop algoritmo di Nagle e **Cambio DNS 1-Clic** (*Cloudflare 1.1.1.1*, *Google 8.8.8.8*, *Quad9 9.9.9.9*, *DHCP Auto*).
  - *Privacy & Controllo AI (11 opzioni):* blocco telemetria (`DiagTrack`), suggerimenti Bing, ID pubblicitario, Widget, Windows Copilot e Windows Recall.
- **Gestore App & Avvio Rapido:** doppio pannello visivo per disinstallare app preinstallate e disattivare programmi all'avvio di Windows.
- **Modalità Gioco Separata:** sezione dedicata e completamente reversibile con *Game Mode*, *HAGS*, *MMCSS High Priority*, mouse 1:1 e disattivazione *GameDVR*.
- **Profili JSON & Centro Sicurezza:** esportazione/importazione delle configurazioni in `.json`, backup automatico del registro prima di ogni sessione e tasto **Annulla Ultima Sessione (1-Click)**.

## [1.0.0] - 2026-11-18
### Aggiunto
- Prima release (originariamente *Win11 TurboClean*) con interfaccia WPF/XAML nativa senza dipendenze esterne.
- Modalità **Pulizia Rapida 1-Click** e 24 opzioni base.
- Creazione automatica del Punto di Ripristino, strumenti `DISM` + `SFC /scannow` e compilatore standalone `BUILD_EXE.bat`.