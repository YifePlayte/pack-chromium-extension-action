#!/bin/bash

echo "$EXTENSION_KEY" > /key.pem

mkdir /extension
cp -r /github/workspace/$1/* /extension/

chromium --no-sandbox --pack-extension=/extension --pack-extension-key=/key.pem

rm /key.pem

chmod 644 /extension.crx
# chown runner /extension.crx
# chgrp docker /extension.crx

mv /extension.crx /github/workspace/$2
