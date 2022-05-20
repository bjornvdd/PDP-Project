param([int]$PasswordLength = 12, [int]$Rows = 3) #lengte van het wachtwoord + de rijen

$MinCharCode = 65 #65 --> begin gewone letters (naar keuze kiezen)...
$MaxCharCode = 122 #ASCIi TABEL MAXIUM 127 


try 
{       Write-Output ""
        $Generator = New-Object System.Random #random genereren
        for ($j = 0; $j -lt $Rows; $j++) { #De rijen vermeerderen -lt = les than
            $Line = ""
                for ($i = 0; $i -lt $PasswordLength; $i++) { #hetzelfde doen voor de paswoordlengte
                    $Line += [char]$Generator.next($MinCharCode,$MaxCharCode) #karakters toevoegen 
                }
                $Line += "  "
            
            Write-Output "$Line" #neerscrhijven
        }
        Write-Output ""
        exit 0 #succes

} catch {
    "Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))" #error line kijkt waar de fout zit
    exit 1
}