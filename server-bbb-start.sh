#!/bin/bash
/bin/bash $PWD/mkudevrule.sh
scp -r server-bbb-deploy.sh root@192.168.7.2:/root
ssh root@192.168.7.2
#scp -r ~/tmp-server/Trolltech/QtEmbedded-4.8.6-tslib-gfx/lib root@192.168.7.2:/root/tmp-server/Trolltech/QtEmbedded-4.8.6-tslib-gfx/
scp -r ~/tmp-server/Trolltech/QtEmbedded-4.8.6-tslib-gfx/lib root@192.168.7.2:/home/ubuntu/tmp-server/Trolltech/QtEmbedded-4.8.6-tslib-gfx
scp -r ~/tmp-server/Trolltech/QtEmbedded-4.8.6-tslib-gfx/plugins root@192.168.7.2:/home/ubuntu/tmp-server/Trolltech/QtEmbedded-4.8.6-tslib-gfx
scp -r /usr/local/tslib/ root@192.168.7.2:/usr/local/
scp -r /usr/local/tslib/lib/libts.so* root@192.168.7.2:/home/ubuntu/tmp-server/Trolltech/QtEmbedded-4.8.6-tslib-gfx/lib
scp -r ~/tmp-server/appB9Creator/appB9Creator root@192.168.7.2:/root
readelf -d ~/tmp-server/appB9Creator/appB9Creator
ssh root@192.168.7.2
