Для выполнения команды на удаленном ПК используя Windows Shell (CMD) можно использовать WMIC

## Примеры
Удалить временный ключ активации Microsoft 365:
>WMIC /node:"COMPUTER_NAME" process call create "cmd.exe /c cscript \"C:\Program Files\Microsoft Office\Office16\ospp.vbs\" /unpkey:VMFTK"
