#!/bin/bash

set -e

rm -fr HttpDosTool dist

cp ../build/src/http_dos_cli.exe .

python setup.py py2exe

gtk_dir="/c/Program Files/Gtk+"

# py2exe misses intl.dll
cp "${gtk_dir}/bin/intl.dll" dist/

# copy themes and locale
mkdir -p "dist/share/themes/Default" "dist/share/locale"
#cp -r "${gtk_dir}/share/themes/Default" dist/share/themes
cp -r "${gtk_dir}/share/themes/MS-Windows/" dist/share/themes/Default
cp -r "${gtk_dir}/share/locale/en_GB"   dist/share/locale
cp -r "${gtk_dir}/share/locale/en_CA"   dist/share/locale

mv dist HttpDosTool
zip -r -9 HttpDosTool3.zip HttpDosTool/
