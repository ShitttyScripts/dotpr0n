#!/usr/local/bin/zsh
mountpoints=(Archive External Seag)

for volume in $mountpoints
do
  if [ -d "/Volumes/$volume" ]; then
    umount /Volumes/$volume
    osascript -e "try" -e "mount volume \"smb://mbischoff:mbischoff@10.10.10.200/$volume\"" -e "end try"
  else
    osascript -e "try" -e "mount volume \"smb://mbischoff:mbischoff@10.10.10.200/$volume\"" -e "end try"
  fi
done
