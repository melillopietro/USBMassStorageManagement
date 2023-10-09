Set-ExecutionPolicy Unrestricted
# Abilita il rilevamento delle unità USB
Write-Host "Abilitazione del rilevamento delle unità USB..."
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR" -Name "Start" -Value 3

# Riavvia il servizio Plug and Play per applicare le modifiche
Write-Host "Riavvio del servizio Plug and Play..."
Restart-Service -Name "Plug and Play"

# Verifica lo stato attuale delle unità USB
Write-Host "Stato attuale delle unità USB:"
Get-WmiObject -Query "SELECT * FROM Win32_PnPEntity WHERE Name LIKE 'USB%'" | Select-Object Name, Status

Write-Host "Le unità USB sono state Abilitate."
