fuente

- https://codigoencasa.com/aws-recuperar-llave-pem-curso-aws/
- https://docs.aws.amazon.com/es_es/AWSEC2/latest/UserGuide/ebs-using-volumes.html


### Server Original Preview (template)
```shell
# id de instancia
i-0890f5c85b2e40b54

# Snapshot
snap-0f6c564b47e210334
        #Volumnen
        /dev/sda1
        vol-05e424c3df98fafd3
            # Availability Zone
              sa-east-1b

# VPC
vpc-5934283e

# subnet
subnet-d0e06f99
```


### Server test (new_preview)
```shell
# id de instancia
i-0257fa8892ce999ac

# Snapshot

        #Volumnen 
        /dev/sda1
        vol-04f7baf5642c98df6
            # Availability Zone
              sa-east-1b

# VPC
vpc-5934283e

# subnet
subnet-d0e06f99
```

### Preparaciond e snapshot
```shell
# id snapshot
snap-0830c70e373eb2078 (snap_preview)

# Volumen generado nuevo
# Volumen_rescu
vol-08acfb8a6f5cff848
```
## 1. Atachar el nuevo volumen al servidor test

![](https://i.imgur.com/wiVADaf.png) 


## 2. Ahora ingresar al servidor Test 
```shell
cd /d/cmder/aws
ssh -i cauris_sa-east-1.pem ubuntu@15.228.33.184

```


## 3. Ahora hay que montar el Disco en linux

1. ver discos en linux
```shell
# -------------------------------------
#  Ver discos (Opcion 1) lsblk
# -------------------------------------
root@ip-172-31-20-0:/home/ubuntu# lsblk
NAME         MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0          7:0    0 25.1M  1 loop /snap/amazon-ssm-agent/5656
loop1          7:1    0 55.6M  1 loop /snap/core18/2560
loop2          7:2    0 63.2M  1 loop /snap/core20/1623
loop3          7:3    0  103M  1 loop /snap/lxd/23541
loop4          7:4    0   47M  1 loop /snap/snapd/16292
loop5          7:5    0   48M  1 loop /snap/snapd/16778
loop6          7:6    0 55.6M  1 loop /snap/core18/2566
nvme0n1      259:0    0   20G  0 disk
├─nvme0n1p1  259:1    0 19.9G  0 part /
├─nvme0n1p14 259:2    0    4M  0 part
└─nvme0n1p15 259:3    0  106M  0 part /boot/efi
nvme1n1      259:4    0   30G  0 disk
└─nvme1n1p1  259:5    0   30G  0 part


# -------------------------------------
#  Ver discos (Opcion 2) fdisk -l
# -------------------------------------

root@ip-172-31-20-0:/home/ubuntu# fdisk -l
# Disk /dev/loop0: 25.11 MiB, 26324992 bytes, 51416 sectors
# Units: sectors of 1 * 512 = 512 bytes
# Sector size (logical/physical): 512 bytes / 512 bytes
# I/O size (minimum/optimal): 512 bytes / 512 bytes
# 
# 
# Disk /dev/loop1: 55.56 MiB, 58261504 bytes, 113792 sectors
# Units: sectors of 1 * 512 = 512 bytes
# Sector size (logical/physical): 512 bytes / 512 bytes
# I/O size (minimum/optimal): 512 bytes / 512 bytes
# 
# 
# Disk /dev/loop2: 63.22 MiB, 66293760 bytes, 129480 sectors
# Units: sectors of 1 * 512 = 512 bytes
# Sector size (logical/physical): 512 bytes / 512 bytes
# I/O size (minimum/optimal): 512 bytes / 512 bytes
# 
# 
# Disk /dev/loop3: 102.98 MiB, 107986944 bytes, 210912 sectors
# Units: sectors of 1 * 512 = 512 bytes
# Sector size (logical/physical): 512 bytes / 512 bytes
# I/O size (minimum/optimal): 512 bytes / 512 bytes
# 
# 
# Disk /dev/loop4: 46.96 MiB, 49242112 bytes, 96176 sectors
# Units: sectors of 1 * 512 = 512 bytes
# Sector size (logical/physical): 512 bytes / 512 bytes
# I/O size (minimum/optimal): 512 bytes / 512 bytes
# 
# 
# Disk /dev/loop5: 47.99 MiB, 50323456 bytes, 98288 sectors
# Units: sectors of 1 * 512 = 512 bytes
# Sector size (logical/physical): 512 bytes / 512 bytes
# I/O size (minimum/optimal): 512 bytes / 512 bytes
# 
# 
# Disk /dev/loop6: 55.56 MiB, 58261504 bytes, 113792 sectors
# Units: sectors of 1 * 512 = 512 bytes
# Sector size (logical/physical): 512 bytes / 512 bytes
# I/O size (minimum/optimal): 512 bytes / 512 bytes

# -------------------------------------
# ✅ Disco 001
# -------------------------------------
Disk /dev/nvme0n1: 20 GiB, 21474836480 bytes, 41943040 sectors
Disk model: Amazon Elastic Block Store
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: gpt
Disk identifier: AB2BB3CE-C07A-4946-9DF4-AA54E872DA24

Device           Start      End  Sectors  Size Type
/dev/nvme0n1p1  227328 41943006 41715679 19.9G Linux filesystem
/dev/nvme0n1p14   2048    10239     8192    4M BIOS boot
/dev/nvme0n1p15  10240   227327   217088  106M EFI System

Partition table entries are not in disk order.

# -------------------------------------
# ✅ Disco 002 este es el que es externo
# -------------------------------------
Disk /dev/nvme1n1: 30 GiB, 32212254720 bytes, 62914560 sectors
Disk model: Amazon Elastic Block Store
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: dos
Disk identifier: 0xda63a61e

Device         Boot Start      End  Sectors Size Id Type
/dev/nvme1n1p1 *     2048 62914526 62912479  30G 83 Linux
```
![](https://i.imgur.com/fjtbT2a.png)

## 4. Montar el Disco
```shell
# crearemos una carpeta para montar la unidad
sudo mkdir /mnt/tmp

# aqui montamos la unidad
sudo mount /dev/nvme1n1p1 /mnt/tmp
```
## 5. Ahora nos falta copiar el archivo authorized_keys
Ahora  copiamos las key del server `new_preview` al server `template`

```shell
# ./.ssh/authorized_keys  => autorizacion local
# /mnt/tmp/home/ubuntu/.ssh/authorized_keys  => autorizacion local
cp ./.ssh/authorized_keys /mnt/tmp/home/ubuntu/.ssh/authorized_keys

# cp ./.ssh/authorized_keys /mnt/tmp/root/.ssh/authorized_keys
# cat ./.ssh/authorized_keys >> /mnt/tmp/root/.ssh/authorized_keys.new
cat ./.ssh/authorized_keys >> /mnt/tmp/root/.ssh/authorized_keys
cat ./.ssh/authorized_keys > /mnt/tmp/root/.ssh/authorized_keys
```

