#!/bin/bash
apt install python3 python3-pip git curl wget youtube-dl chromium-browser
git clone https://github.com/pirate/ArchiveBox.git && cd ArchiveBox
echo 'https://example.com' | ./archive
