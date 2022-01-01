#!/bin/sh
MONITORDIR="/home/vxphong/test-webp"
inotifywait -m -r -e move -e create --format '%w%f' "${MONITORDIR}" | while read NEWFILE;do
  echo  "File has ${NEWFILE} been created"
  if [ ! -f "${NEWFILE%.*}.webp" ]; then
    sleep 10
    cwebp -q 80 "${NEWFILE}" -o "${NEWFILE%.*}.webp"
  fi
done
