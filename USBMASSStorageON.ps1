Set-ExecutionPolicy Unrestricted
# Abilita il rilevamento delle unit� USB
Write-Host "Abilitazione del rilevamento delle unit� USB..."
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR" -Name "Start" -Value 3

# Riavvia il servizio Plug and Play per applicare le modifiche
Write-Host "Riavvio del servizio Plug and Play..."
Restart-Service -Name "Plug and Play"

# Verifica lo stato attuale delle unit� USB
Write-Host "Stato attuale delle unit� USB:"
Get-WmiObject -Query "SELECT * FROM Win32_PnPEntity WHERE Name LIKE 'USB%'" | Select-Object Name, Status

Write-Host "Le unit� USB sono state Abilitate."
