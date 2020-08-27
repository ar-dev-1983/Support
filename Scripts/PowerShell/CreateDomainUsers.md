# Создание доменных пользователей по данным из CSV файла
***Важно:***
Все данные приведены для примера и не являются реальными!


## CSV файл с исходными данными для создания пользователей:
```
Name,Surname,GivenName,Password,Description,OfficePhone,EmailAddress,UserPrincipalName,SamAccountName,Department,Division,OU
Иванов Иван Иванович,Иванов,Иван,UserPassword!#1,Мастер-технолог,555-1234,Ivan.Ivanov@company.com,IIvanov@company.com,IIvanov,Цех по ремонту и монтажу,Группа наладки,OU=Группа наладки|OU=Цех по ремонту и монтажу|OU=ООО Рога и копыта|DC=company|DC=com
```

***Важно:***
последний столбец "OU" содержит полный путь до от пользователя до корневой OU, совпадает с distinguishedName, например:
distinguishedName для пользователя из CSV файла будет такой

>CN=Иванов Иван Иванович,OU=Группа наладки,OU=Цех по ремонту и монтажу,OU=ООО Рога и копыта,DC=company,DC=com

Если убрать `CN=Иванов Иван Иванович`, заменить `,` на `|` - получим путь для учетной записи в структуре OU

>OU=Группа наладки|OU=Цех по ремонту и монтажу|OU=ООО Рога и копыта|DC=company|DC=com

Замена символа `,` на `|` в пути OU нужна для того, чтобы при парсинге CSV файла запятые в ячейке столбца OU не воспринимались как несколько значений, а как одна строка. Вообще не принципиально **как** этого достичь, но для примера сделано именно так.

## Скрипт:
>import-csv -path "C:\Users.csv" |  ForEach-Object -Process { New-ADUser -Name $_.Name -Surname $_.Surname -GivenName $_.GivenName -AccountPassword (ConvertTo-SecureString -AsPlainText $_.Password -Force) -Description $_.Description -EmailAddress $_.EmailAddress -OfficePhone $_.OfficePhone -UserPrincipalName $_.UserPrincipalName -SamAccountName $_.SamAccountName -Department $_.Department -Division $_.Division -Title $_.Description -DisplayName $_.Name -Path $_.OU.Replace("|",",") -CannotChangePassword $false -ChangePasswordAtLogon $true -Enabled $true }

***Важно:***
В примере CSV файла указан пароль пользователя в открытом виде, который затем в скрипте переводится в SecureString
>-AccountPassword (ConvertTo-SecureString -AsPlainText $_.Password -Force)

Путь до учетной записи в структуре OU формируется путем уже обратной замены `|` на `,`
>-Path $_.OU.Replace("|",",")

В обязательном порядке устанавливаются флаги **CannotChangePassword**,**ChangePasswordAtLogon**,**Enabled**
>-CannotChangePassword $false -ChangePasswordAtLogon $true -Enabled $true
