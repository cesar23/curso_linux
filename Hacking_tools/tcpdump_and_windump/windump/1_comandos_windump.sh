#fuente: https://www.winpcap.org/windump/

#comandos : https://searchenterprisedesktop.techtarget.com/tip/WinDump-The-tcpdump-tool-for-Windows
#comandos : https://www.youtube.com/watch?v=uxmd8H9mbLI
windump

# 1. listad redes
windump -D
    #1.\Device\NPF_{1D037431-C54A-4CF1-98F2-02B6AA471939} (Windscribe VPN)
    #2.\Device\NPF_{1BB52A7B-D9DA-4799-A69D-5776991E3F21} (Microsoft)
    #3.\Device\NPF_{2D3A8556-968F-456E-9E0A-4A18D7298578} (Intel(R) Ethernet Connection (7) I219-V)
    #4.\Device\NPF_{3B425122-9E33-4486-9429-3CEA492C71EA} (VMware Virtual Ethernet Adapter)
    #5.\Device\NPF_{E112FD12-D667-4FA7-B3E5-24FB0081A3E6} (ZeroTier Virtual Port)
    #6.\Device\NPF_{8003F77B-4C8E-42E8-AD6D-0B5D25DE5177} (VMware Virtual Ethernet Adapter)
    #7.\Device\NPF_{01019490-9A10-45DF-9F49-F33834D35D5E} (Microsoft)


# 2. filtrar paquetes por red
windump -i 3 # es el (Intel(R) Ethernet Connection (7) I219-V)

#-------------------------------------------------------------------------------
#demo salida
#-----------------------------------------------------

#  09:34:32.666891 IP ubuntu.36705 > cj-in-f93.1e100.net.443: UDP, length 43
      # 09:34:32.666891 =>  hora de peticion
      # IP => tipo de peticion
      # ubuntu.36705 => (origen de la peticion)host y puerto de peticion desde donde se hizo
      # > => indica que esta saliendo desde
      # cj-in-f93.1e100.net.443: UDP => hacia donde salio es su destino


# 2. filtro de manera  agil
windump -nn
