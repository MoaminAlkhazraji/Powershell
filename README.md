# Inlämning 1: Strukturverktyg

Detta är ett enkelt PowerShell-skript som hjälper till att automatisera skapandet av mappar och loggfiler för nya projekt.

## Beskrivning av skriptet
När man kör skriptet gör det följande saker i ordning:
1. Frågar användaren efter ett namn på miljö (till exempel ett kundsystem).
2. Skapar en huvudmapp med det namnet på den plats där skriptet körs.
3. Skapar tre undermappar inuti huvudmappen: `logs`, `scripts` och `temp`.
4. Skapar en loggfil i logs-mappen som döps efter dagens datum (log-YYYY-MM-DD.txt).
5. Skriver en rad inuti loggfilen med texten "Struktur skapad:" följt av dagens datum och tid.
6. Skriptet har felhantering som säger till om användaren glömmer att skriva ett namn, eller om mappen redan finns.

## Hur man kör skriptet
1. Öppna Windows Filutforskare och leta upp filen `strukturverktyg.ps1`.
2. **Högerklicka** på filen.
3. Välj **Kör med PowerShell** i menyn.
4. Följ instruktionerna i fönstret som öppnas.

## Reflektion
* **Vad som var intressant:** Det var väldigt intressant att se hur man kan använda `Get-Date` för att automatiskt få fram dagens datum och använda det för att döpa en fil. Det gör att man slipper skriva datumet själv varje gång.
* **Vad som var svårt:** Det svåraste men också mest lärorika var att förstå hur `try/catch` fungerar. Det tog en stund att lista ut hur man använder `throw` för att stoppa skriptet om användaren råkar trycka på Enter utan att skriva ett namn, eller om mappen redan existerar.
