echo '>> Updating wallpapers'
openrsync -av --del home:$(ssh home xdg-user-dir BACKGROUNDS)/8:5/ $(xdg-user-dir BACKGROUNDS)/8:5
