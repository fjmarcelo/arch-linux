FECHA=`date "+%Y.%m."01`
DIR=/home/otros/ISOs
SERVIDOR=https://ftp.tu-chemnitz.de/pub/linux/archlinux/iso
ISO="archlinux-$FECHA-x86_64.iso"
ISOTEX="archlinux-$FECHA-x86\_64.iso"
LOCAL="$DIR/$ISO"
URL="$SERVIDOR/$ISOTEX"
RES="Ya tenemos la ISO en \small{\verb+$LOCAL+}" 
ls -1 $LOCAL || RES="Hay que descargarla de \small{\verb+$URL+}"
echo $RES | tee ISO.tex
