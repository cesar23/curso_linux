import os
import time

path_Winscp=r"C:\Program Files (x86)\WinSCP\WinSCP.com"
path_Winscp_script=r"D:\repos\wordpress_docker\scripts\script_sincronize_FTP\config_winscp.ini"

cmd=f'"{path_Winscp}" /script={path_Winscp_script}'
i=0
while True:
    i=i+1
    print('')
    print(f'------------------ejecutado {i}------------------------------------')
    print('')
    print(cmd)
    os.system(cmd)
    time.sleep(10)
    #valor3 = os.system(comando3)