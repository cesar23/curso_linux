import os
from colorama import Fore, Back, Style
from datetime import date, datetime
from time import sleep
import tarfile

"""
version 1.0.1
"""


class compressUtility:
    """ Esta  clase servira para comprimir ficheros y carpetas"""

    def __init__(self, path_exe_7z="7z"):
        self.path_exe_7z = path_exe_7z.replace('\\', '/')

    def compress_dir(self, hide_cmd=True, filename_backup="", filename_backup_output=""):
        """Con esto podremos realizar el backup

        Parameters
        ----------
        hide_cmd: boolean
            true para  ocultar la salida cmd
        filename_backup : string
            ingresar aqui la ruta de la carpeta a sacar el backup
        filename_backup_output : string
            ingresra la ruta de la salida

        Raises
        ------
        ValueError: si hay un error retorna un raise

        Returns
        -------
        int
            0=no hubo error , 1 = hubo error
        """
        cmd = ""
        _result = {"statusCode": 200, "message": "", "messages": []}
        print(Fore.CYAN)

        try:

            filename_backup = filename_backup.replace('\\', '/')
            filename_backup_output = filename_backup_output.replace('\\', '/')

            # para ocultar la salida de la ejecucion
            hide = ""
            if hide_cmd is True:
                hide = " >null 2>&1"

            cmd = "{path_exe} a -r {file_output} {dir_input} {hide}".format(path_exe=self.path_exe_7z,
                                                                            file_output=filename_backup_output,
                                                                            dir_input=filename_backup,
                                                                            hide=hide)  # dd =

            res = os.system(cmd)

            if (res == 1):
                _result["statusCode"] = 500
                _result["message"] = "Ocurrio un error al ejecutar el comando:{0} ".format(cmd)
                _result["messages"].append(cmd)
                print(Fore.RED + "Error al ejecutar comando ")


        except Exception as e:
            print(Fore.RED + "Error: ", str(e))
            _result["statusCode"] = 500
            _result["message"] = "Ocurrio un error al ejecutar el comando:{0} ".format(cmd)
            _result["messages"].append(str(e))
        finally:
            print(Style.RESET_ALL)
            return _result

    def compress_dir_filter(self, hide_cmd=True, files_backup=[], filename_backup_output="", path_excludes=[]):
        """Con esto podremos realizar el backup

        Parameters
        ----------
        filename_backup : string
            ingresar aqui la ruta de la carpeta a sacar el backup
        filename_backup_output : string
            ingresra la ruta de la salida
        filename_backup_output : list
            ingresar una list a o tubpla

        Raises
        ------
        ValueError: si hay un error retorna un raise

        Returns
        -------
        int
            0=no hubo error , 1 = hubo error
        """
        cmd = ""
        res = 1
        _result = {"statusCode": 200, "message": "", "messages": []}
        print(Fore.CYAN)

        sleep(1.1)

        # Aqui seteamos todos los ficheros  carpetas
        files_back = ""
        for path in files_backup:
            path = path.replace('\\', '/')
            files_back += " \"{path}\" ".format(path=path)

        # Aqui seteamos todos los ficheros  carpetas
        files_excludes = ""
        for path in path_excludes:
            files_excludes += " -x!{path}".format(path=path)

        try:

            filename_backup_output = filename_backup_output.replace('\\', '/')
            # verificamos si la carpeta existe

            # para ocultar la salida de la ejecucion
            hide = ""
            if hide_cmd is True:
                hide = " >null 2>&1"

            cmd = "{path_exe} a -r \"{file_output}\" {dirs_input} {files_excludes} {hide}".format(
                path_exe=self.path_exe_7z,
                file_output=filename_backup_output,
                dirs_input=files_back,
                files_excludes=files_excludes,
                hide=hide)  # si requiere permisnos

            # if os.path.isdir(filename_backup.replace('*', '')) is False:
            #     print(Fore.RED + ':: No se encontro Directorio: ' + filename_backup)
            #     return 1

            print(Fore.CYAN + "Comando exec:{}".format(cmd))
            res = os.system(cmd)


            if (res == 1):
                _result["statusCode"] = 500
                _result["message"] = "Ocurrio un error al ejecutar el comando:{0} ".format(cmd)
                _result["messages"].append(cmd)
                print(Fore.RED + "Error al ejecutar comando ")

        except Exception as e:
            print(Fore.RED + "Error: ", str(e))
            _result["statusCode"] = 500
            _result["message"] = "Ocurrio un error al ejecutar el comando:{0} ".format(cmd)
            _result["messages"].append(str(e))
        finally:
            print(Style.RESET_ALL)
            return _result

    def gzip_local(self,file_input, file_output):

        with tarfile.open(file_output, "w:gz") as tar:
            tar.add(file_input, os.path.basename(file_input))

        # aqui eliminamos el fichero
        if os.path.isfile(file_input):
            os.remove(file_input)

def main():
    try:
        # lib_shell = compressUtility('D:/windows/portables/7z-portable_v_2018-07-27/7z-portable/64bit/7z.exe')
        lib_shell = compressUtility('7z')

        # ------------- para  comprimir normal
        # filename_backup = "D:/expt64/pe-repo-1/*"
        # filename_backup_outpout = 'D:\expt64\pe-repo-1\pe-repo-1.7z'
        # res = lib_shell.compress_dir(True,filename_backup, filename_backup_outpout)

        # ----------- para  comprimir excluyendo ficheros
        fecha_format = datetime.now().strftime("%Y-%m-%d__%H-%M")
        # --- ejemplo 1
        # filename_backup = "D:/expt64/pe-repo-1/*"
        # filename_backup_outpout = 'D:/expt64/pe-repo-1/backup/{fecha}__pe-repo.7z'.format(fecha=fecha_format)
        # path_excluidos = ["D:/expt64/pe-repo-1/11", "D:/expt64/pe-repo-1/node_modules", "backup",'salida']

        # ------ejemplo 2
        files_backup = [r"E:\virtuales\Windows 10 x64 v2\*.log",
                        r"E:\virtuales\Windows 10 x64 v2\*.nvram",
                        r"E:\virtuales\Windows 10 x64 v2\*.vm*"]
        filename_backup_outpout = 'E:/virtuales/backup/Windows 10 x64 v2/{fecha}__win.7z'.format(fecha=fecha_format)
        path_excluidos = ["backup_cesar", "errores"]
        res = lib_shell.compress_dir_filter(False, files_backup, filename_backup_outpout, path_excluidos)

        # --- ejemplo 3 gzip
        # fd_path_n_fl_name = "D:/repos/curso_linux/Servers_Clients/laborem_spdtss/backup_cesar/daily/2023-04-05__18-49-02_spdtsso2.sql"
        # targz_fd_path_n_fl_name = "D:/repos/curso_linux/Servers_Clients/laborem_spdtss/backup_cesar/daily/2023-04-05__18-51-38_spdtsso2.sql.tar.gz"
        # lib_shell.gzip_local(fd_path_n_fl_name, targz_fd_path_n_fl_name)

        print(res)
        return 0
    except Exception as e:  # work on python 3.x
        print('------------------ERROR------------------')
        print('No se recibio un parametro : ' + str(e))


if __name__ == '__main__':
    main()
