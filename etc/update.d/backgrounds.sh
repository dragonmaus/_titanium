echo '>> Updating backgrounds'
openrsync -av --del "home:'$(ssh home xdg-user-dir BACKGROUNDS)/1.6 (8:5)/'" "$(xdg-user-dir BACKGROUNDS)/1.6 (8:5)"