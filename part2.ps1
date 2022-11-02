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

# Function to return network information
function Return-Network([string]$ip, [switch]$remote){

    if($remote) {
        Get-WmiObject win32_networkadapter -ComputerName $ip
    } else {
        Get-WmiObject win32_networkadapter -ComputerName . | Format-Table
    }
    
}

# Function to return disk storage
function Return-Storage([string]$ip, [switch]$remote){

    if($remote) {
        Get-WmiObject Win32_logicaldisk -ComputerName $ip
    } else {
        Get-WmiObject Win32_logicaldisk -ComputerName . | Format-Table
    }
    
}

# Function to return volume
function Return-Volume([string]$ip, [switch]$remote){

    if($remote) {
        Get-WmiObject Win32_Volume -ComputerName $ip
    } else {
        Get-WmiObject Win32_Volume -ComputerName . | Format-Table
    }
    
}

# Function to return processor information
function Return-Processor([string]$ip, [switch]$remote){

    if($remote) {
        Get-WmiObject Win32_Processor -ComputerName $ip
    } else {
        Get-WmiObject Win32_Processor -ComputerName . | Format-Table
    }
    
}


# Main
Return-Bios > output.txt
Return-Process >> output.txt
Return-Product >> output.txt
Return-Accounts >> output.txt
Return-Network >> output.txt
Return-Storage >> output.txt
Return-Volume >> output.txt
Return-Processor >> output.txt
Get-Content .\output.txt