# This is script will output information about the current machine.
# Authors: Ryan Pinkney, Tanner Davis, Tyler Steele, Kevin Gutierrez

# Parameters
param(
     [Parameter()]
     [string]$inputip
 )

# Functions


# Function to return the bios information
function Return-Bios([string]$ip, [switch]$remote){

    if($remote) {
        Get-WmiObject win32_bios -ComputerName $ip
    } else {
        Get-WmiObject win32_bios -ComputerName .
    }
    
}

# Function to return the running programs
function Return-Process([string]$ip, [switch]$remote){

    if($remote) {
        Get-WmiObject win32_process -ComputerName $ip
    } else {
        Get-WmiObject win32_process -ComputerName . |  Select -First 5 | Format-Table
    }
    
}

# Function to return the installed software
function Return-Product([string]$ip, [switch]$remote){

    if($remote) {
        Get-WmiObject win32_product -ComputerName $ip
    } else {
        Get-WmiObject win32_product -ComputerName . |  Select -First 5 | Format-Table
    }
    
}

# Function to return account information
function Return-Accounts([string]$ip, [switch]$remote){

    if($remote) {
        Get-WmiObject win32_UserAccount -ComputerName $ip
    } else {
        Get-WmiObject win32_UserAccount -ComputerName . | Format-Table
    }
    
}


# Main
Write-Host "--------------------------------------------------------"
Write-Host "BIOS INFORMATION"
Return-Bios 
Write-Host "--------------------------------------------------------"
Write-Host "PROCESS INFORMATION"
Return-Process 
Write-Host "--------------------------------------------------------"
Write-Host "SOFTWARE INFORMATION"
Return-Poduct
Write-Host "--------------------------------------------------------"
Write-Host "ACCOUNTS"
Return-Accounts
Write-Host "--------------------------------------------------------"









