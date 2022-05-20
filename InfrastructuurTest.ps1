
# InternetConnectie 
# 10.0.2.15 is computer address.

Describe "Internet Connection" {
  #tests internet connection
  It 'Internet connection should be available' {
  Test-NetConnection -ComputerName 8.8.8.8 |#ping naar google versturen voor te kijken ofdat ik op het internet kan
  Should Be $true

}

}

#FIREWALL

$FireWallCheck = Get-NetFirewallProfile
Describe "Windows Firewall Profile Statuses" {
It "Firewall should be operational" {
$FireWallCheck | ForEach-Object{
    If($_.Enabled -eq 1){
        Write-Host "The Windows Firewall $($_.Name) profile is enabled"  -Foregroundcolor Green
        }Else{
        Write-Host "The Windows Firewall $($_.Name) profile is disabled" -Foregroundcolor Red
        Should Be $true
        }
    
  }
      } 
    
 }

#USERNAME ADMIN

Describe "username admin" {
It 'Username admin should exist' {
    Get-LocalUser -Name admin | 
    Should Be $true
}

}

#Keyboard Layout

Describe "Keyboard Layout" {
It 'Keyboard ID should be 1033'{
  (Get-Culture).KeyboardLayoutID |
  Should Be $true
}
}




Describe "NAT networking" {
It 'NAT networking should be on'{
  Get-NetNatSession -AsJob |
  Should Be $true
}

}

#Virtualbox guestaddiations
Describe "Guest addiations" {
  It "Additions should be installed" {
    Test-Path -Path "D:\VBoxSolarisAdditions.pkg" |
    Should Be $true
  }
}

