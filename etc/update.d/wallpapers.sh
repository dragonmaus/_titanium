echo '>> Updating wallpapers'
rsync -av --delete-during home:$(ssh home xdg-user-dir BACKGROUNDS)/8:5/ $(xdg-user-dir BACKGROUNDS)/8:5
