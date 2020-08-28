#!/bin/bash
7z a "/path_to_folder/folder_to_archive_$(date +"%d-%m-%Y").7z" "/path_to_folder/folder_to_archive" -pPassWordOnArchive >> "/path_to_folder/folder_to_archive_$(date +"%d-%m-%Y").log" 2>&1
