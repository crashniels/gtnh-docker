# gtnh-docker
 gtnh server via docker / podman 
 
 uses java 17+

 `podman build -t gtnh .`

 `podman run -it -dp 127.0.0.1:25565:25565 -v /world/on/host:/gtnh/World -v /backups/folder/host:/gtnh/backups gtnh`

 inspired by https://github.com/gehoernchen/gtnh-server