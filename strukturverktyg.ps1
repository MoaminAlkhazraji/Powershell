# Funktion som skapar hela mappstrukturen och loggfilen baserat på användarens input.
function Skapa-Struktur {
    # Startar ett try-block för att fånga eventuella fel som uppstår under körningen.
    try {
        # Visar en text i terminalen och väntar på att användaren ska skriva in ett namn.
        $envName = Read-Host -Prompt "Ange ett namn"

        # Kontrollerar om användaren tryckte på enter utan att skriva något namn alls.
        if ($envName -eq "") {
            # Kastar ett felmeddelande manuellt om namnet är helt tomt.
            throw "Du ska skriva ett namn."
        }

        # Sparar den aktuella mappen som skriptet körs ifrån i en variabel.
        $currentPath = Get-Location
        # Kombinerar den aktuella mappen med användarens input för att skapa en sökväg till huvudmappen.
        $mainFolder = Join-Path -Path $currentPath -ChildPath $envName

        # Kontrollerar med Test-Path om huvudmappen redan existerar på datorn.
        if (Test-Path -Path $mainFolder) {
            # Kastar ett felmeddelande om mappen redan finns så att vi inte skriver över något.
            throw "Mappen finns redan."
        }

        # Skapar huvudmappen i filsystemet med hjälp av New-Item.
        New-Item -Path $mainFolder -ItemType Directory
        # Skriver ut en vanlig bekräftelse i terminalen att huvudmappen har skapats.
        Write-Host "Huvudmappen har skapats."

        # Skapar en lista med namnen på de tre undermappar som krävs enligt instruktionen.
        $subFolders = @("logs", "scripts", "temp")

        # Startar en foreach-loop som körs en gång för varje undermapp i listan.
        foreach ($folder in $subFolders) {
            # Kombinerar sökvägen från huvudmappen med namnet på den aktuella undermappen.
            $subFolderPath = Join-Path -Path $mainFolder -ChildPath $folder
            # Skapar undermappen i filsystemet.
            New-Item -Path $subFolderPath -ItemType Directory
            # Skriver ut en text i terminalen för att visa att undermappen har skapats.
            Write-Host "Undermapp skapad: $folder"
        }

        # Hämtar dagens datum i formatet ÅÅÅÅ-MM-DD med hjälp av tipset i instruktionen.
        $currentDate = Get-Date -Format "yyyy-MM-dd"
        # Hämtar både dagens datum och det aktuella klockslaget för loggfilens innehåll.
        $timestamp = Get-Date

        # Skapar det fullständiga filnamnet för loggfilen med det formaterade datumet.
        $logFileName = "log-$currentDate.txt"
        # Kombinerar sökvägen till den nyss skapade loggmappen med det nya filnamnet.
        $logFolder = Join-Path -Path $mainFolder -ChildPath "logs"
        # Skapar den slutgiltiga fullständiga sökvägen till själva loggfilen.
        $logFilePath = Join-Path -Path $logFolder -ChildPath $logFileName

        # Skapar textsträngen som ska skrivas inuti loggfilen enligt instruktionen.
        $logContent = "Struktur skapad: $timestamp"
        # Skapar själva loggfilen och skriver in textsträngen i den på samma gång.
        New-Item -Path $logFilePath -ItemType File -Value $logContent
        # Skriver ut en sista bekräftelse i terminalen att loggfilen är klar.
        Write-Host "Loggfilen har skapats."
    }
    # Catch-blocket fångar upp alla fel som har kastats (throw) eller uppstått i try-blocket.
    catch {
        # Skriver ut felmeddelandet i terminalen. $_ betyder "det fel som just hände".
        Write-Host "Ett fel uppstod: $_"
    }
}

# Anropar (kör) funktionen som vi just har skapat här ovanför.
Skapa-Struktur

