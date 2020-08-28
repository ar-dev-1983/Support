### Архивирование папки в 7z с паролем

Создаем пустой файл скрипта:
>sudo touch /home/**username**/ArchiveFolderIn7z.sh

Делаем файл скрипта исполняемым (chmod +x):
>sudo chmod +x /home/**username**/ArchiveFolderIn7z.sh

Открываем файл скрипта в редакторе nano:
>sudo nano -Y sh /home/**username**/ArchiveFolderIn7z.sh

В файле пишем следующее:
```sh
#!/bin/bash
7z a "/path_to_folder/folder_to_archive_$(date +"%d-%m-%Y").7z" "/path_to_folder/folder_to_archive" -pPassWordOnArchive >> "/path_to_folder/folder_to_archive_$(date +"%d-%m-%Y").log" 2>&1
```

Рассмотрим что делает данный скрипт

Запуск 7z с командой "архивирование":
>7z a

Путь к файлу архива, отдельно к имени архива добавляется дата создания архива:
>"/path_to_folder/folder_to_archive_$(date +"%d-%m-%Y").7z"

Путь к папке, которую мы хотим заархивировать:
>"/path_to_folder/folder_to_archive"

Устанавливаем пароль ***"PassWordOnArchive"*** на архив, это опционально:
>-pPassWordOnArchive

Логируем процесс создания архива в файл. **2>&1** перенаправляет STDERR в STDOUT,  ну а STDERR мы перенаправляем в файл log:
> >> "/path_to_folder/folder_to_archive_$(date +"%d-%m-%Y").log" 2>&1

Пример содержимого log файла в процессе создания архива:

>7-Zip [64] 16.02 : Copyright (c) 1999-2016 Igor Pavlov : 2016-05-21
>p7zip Version 16.02 (locale=en_US.UTF-8,Utf16=on,HugeFiles=on,64 bits,2 CPUs Pentium(R) Dual-Core  CPU      E5500  @ 2.80GHz (1067A),ASM)
>
>Scanning the drive:
>1 folder, 9 files, 12244365 bytes (12 MiB)
>
>Creating archive: /path_to_folder/folder_to_archive_08-28-2019.7z
>
>Items to compress: 10
>
>
>Files read from disk: 9
>Archive size: 9713467 bytes (9486 KiB)
>Everything is Ok
