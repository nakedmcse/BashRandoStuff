#!/bin/bash
gitpull() {
        cd /var/www
        chown -R root:root waifuvault.walker.moe
        cd waifuvault.walker.moe
        git checkout src/public
        git pull
}

npmbuild() {
        npm install
        npm run runmigration
        npm run build
}

cloneedits() {
        sed -i.bak 's/Allow/Disallow/g' src/public/robots.txt
        sed -i.bak 's/>WaifuVault</>WaifuVault Testing Clone</g' src/public/index.ejs
        sed -i.bak 's/WaifuVault</WaifuVault Testing Clone</g' src/public/snippets/head.ejs
        sed -i.bak '/property/d' src/public/snippets/head.ejs
        sed -i.bak '/keywords/d' src/public/snippets/head.ejs
        rm -f src/public/*.bak
        rm -f src/public/snippets/*.bak
}

reset() {
        cd /var/www
        chown -R www-data:www-data waifuvault.walker.moe
}

# main
systemctl stop waifuvault
gitpull
cloneedits
npmbuild
reset
systemctl start waifuvault