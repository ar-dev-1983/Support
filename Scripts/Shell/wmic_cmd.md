# Запуск процесса на удаленном ПК используя WMIC

Удалить временный ключ активации Microsoft 365 используя Widnows command shell:
>WMIC /node:"COMPUTER_NAME" process call create "cmd.exe /c cscript \"C:\Program Files\Microsoft Office\Office16\ospp.vbs\" /unpkey:VMFTK"
Остановить службу Windows Updates используя Widnows command shell:
>WMIC /node:"COMPUTER_NAME" process call create "cmd.exe /c net stop wuauserv"
Запустить службу Windows Updates используя Widnows command shell:
>WMIC /node:"COMPUTER_NAME" process call create "cmd.exe /c net start wuauserv"