import-csv -path "C:\Users.csv" | 
ForEach-Object -Process {
New-ADUser -Name $_.Name -Surname $_.Surname -GivenName $_.GivenName -AccountPassword (ConvertTo-SecureString -AsPlainText $_.Password -Force) -Description $_.Description -EmailAddress $_.EmailAddress -OfficePhone $_.OfficePhone -UserPrincipalName $_.UserPrincipalName -SamAccountName $_.SamAccountName -Department $_.Department -Division $_.Division -Title $_.Description -DisplayName $_.Name -Path $_.OU.Replace("|",",") -CannotChangePassword $false -ChangePasswordAtLogon $true -Enabled $true
}