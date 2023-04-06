import subprocess
import os, sys
import time
from tqdm import tqdm
from colorama import Fore, Back, Style
from datetime import date, datetime
from time import sleep
import configparser


class RobocopyUtil:
    def __init__(self, list_dir, list_dirs_exclude, list_files_exclude, backup_dir):
        self.list_dir = list_dir
        self.list_dirs_exclude = list_dirs_exclude
        self.list_files_exclude = list_files_exclude
        self.backup_dir = backup_dir

    def process_backup(self):

        _result = {"statusCode": 200, "message": "", "messages": []}
        print(Fore.CYAN)
        # check if the directory exists
        if not os.path.isdir(self.backup_dir):
            _result["statusCode"] = 500
            _result["message"] = "El directorio del backup: [{0}] No existe".format(self.backup_dir)
            raise Exception(_result)

        # if there are excluded directories
        _dirs_excludes = ''
        for d in self.list_dirs_exclude:
            _dirs_excludes += ' /XD "{}" '.format(d)
        # if there are excluded files
        _files_excludes = ''
        for f in self.list_files_exclude:
            _files_excludes += ' /XF "{}" '.format(f)

        for _dir_back in tqdm(self.list_dir, desc="Cargando..."):
            # :::::: crear el directorio si no existe
            _dir_new_backup = self.backup_dir + '\\' + os.path.basename(_dir_back)
            # si no existe el directorio lo creamos
            if not os.path.isdir(_dir_new_backup):
                os.makedirs(_dir_new_backup)

            # print(os.path.basename(_dir_back))
            # cmd = 'robocopy "{list_dir}" "{backup_dir}" /E /Z /R:5 /W:5 /TBD /NP /V {list_dirs_exclude}  {list_files_exclude}'.format(
            # cmd = 'robocopy "{list_dir}" "{backup_dir}" /E /Z /R:5 /W:5 /TBD /NP /V {list_dirs_exclude}  {list_files_exclude}  >null 2>&1'.format(
            cmd = 'robocopy "{list_dir}" "{backup_dir}" /E /Z /R:5 /W:5 /TBD /NP /V {list_dirs_exclude}  {list_files_exclude}  >null 2>&1'.format(
                list_dir=_dir_back,
                list_dirs_exclude=_dirs_excludes,
                list_files_exclude=_files_excludes,
                backup_dir=_dir_new_backup
            )
            print(cmd)
            time.sleep(.1)
            result = os.system(cmd)
            # print(result)
            if result > 1:
                _result["statusCode"] = 500
                _result["message"] = "No se puede realizar el backup del directorio:{0} ".format(self.backup_dir)
                _result["messages"].append(cmd)

        if _result["statusCode"] == 500:
            raise Exception(_result)

        return _result

    def aceptar(self):

        exit()


def main():
    config = configparser.ConfigParser()
    config.sections()
    config.read('conf.ini')
    try:
        # ------ejemplo 1
        # list_dir = [r"D:\expt64\config", r"D:\expt64\pe-repo-1", r"C:\Users\Cesar\pseint"]
        # list_dir_exclude = ["aws_pems", "libs"]
        # list_files_exclude = ["*.exe", "*.back"]
        # backup_dir = r"D:\backup-d-dd1"

        # ------ ejmplo 2
        list_dir = [r"E:\virtuales\Windows 7 x64"]
        list_dir_exclude = ["backup_cesar"]
        list_files_exclude = ["*.exe", "*.back"]
        backup_dir = r"E:\virtuales\backup"

        mi_app = RobocopyUtil(list_dir, list_dir_exclude, list_files_exclude, backup_dir)
        ff = mi_app.process_backup()
        print(ff['statusCode'])
        return 0
    except Exception as e:  # work on python 3.x
        print('------------------ERROR------------------')
        print('No se recibio un parametro : ' + str(e))
        # if there are in error send email



if __name__ == '__main__':
    main()
