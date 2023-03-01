$ProxyAddress = Get-Content C:\Users\user\Desktop\powershell\Enable-Disable_proxy\proxy_address.txt
$ProxyStatus = Get-ItemPropertyValue -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyEnable
$SetOfAddress = $ProxyAddress[0] + ":" + $ProxyAddress[1]
if ($ProxyStatus -eq "1")
    {
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyEnable -Value 0
    }
else
    {
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyEnable -Value 1
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxyServer -Value $SetOfAddress
    }