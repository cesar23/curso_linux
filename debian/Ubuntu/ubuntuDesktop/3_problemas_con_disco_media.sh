3_problemas_con_disco_media.sheeeee



cuando no quiere  abrir una  unidad
------------------
umount /dev/sdb2

sudo ntfsfix /dev/sdb2



segundo metodos
-------
sudo ntfsfix -d /dev/sdb2

#creamso una   carpeta  y a hi lo  momtamos
sudo ntfs-3g -o remove_hiberfile /dev/sdb2 /home/cesar/media_local
