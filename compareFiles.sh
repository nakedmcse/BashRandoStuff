#!/bin/bash
sqlite3 main.sqlite "SELECT fileName || '.' || fileExtension FROM file_upload_model;" > db_files.txt
ls files > real_files.txt
diff db_files.txt real_files.txt