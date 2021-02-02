# Channels DVR Docker

## Intel QuickSync Video Hardware Transcoding

    docker run
      --detach \
      --name=channels-dvr \
      --net=host \
      --restart=unless-stopped \
      --device /dev/dri:/dev/dri \
      --volume /mnt/disk/dvr/config:/channels-dvr \
      --volume /mnt/disk/dvr/recordings:/shares/DVR \
      ajvolin/channels-dvr:tve
  
## Raspberry Pi 4 Hardware Transcoding

    docker run
      --detach \
      --name=channels-dvr \
      --net=host \
      --restart=unless-stopped \
      --device /dev/video10:/dev/video10 \
      --device /dev/video11:/dev/video11 \
      --device /dev/video12:/dev/video12 \
      --device /dev/video13:/dev/video13 \
      --device /dev/video14:/dev/video14 \
      --device /dev/video15:/dev/video15 \
      --device /dev/video16:/dev/video16 \
      --volume /mnt/disk/dvr/config:/channels-dvr \
      --volume /mnt/disk/dvr/recordings:/shares/DVR \
      ajvolin/channels-dvr:tve-arm64

### Notes
Add `-e STARTUP_DELAY=10s` to delay the startup of the Channels DVR service by 10 seconds.
