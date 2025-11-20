#!/bin/bash

for dir in ./archive/*/; do
        cd "$dir"
        if [ -e .htaccess ]
        then
            read -r FIRSTLINE < .htaccess
            if [ "$FIRSTLINE" != "AuthType openid-connect" ]
            then
                { echo "AuthType openid-connect"; cat .htaccess; } > tmp && mv tmp .htaccess
            fi
            echo "✅ .htaccess dans $dir"
            sed -i '' -e 's/TequilaAllowIf/Require claim/' -e 's/=/:/g' .htaccess
        else
            echo "❌ .htaccess dans $dir"
        fi
    cd ../..
done