import os
import time
from colorama import Fore, Back, Style

"""
version 1.0.1
"""


class clear_backup_Utility:
    """ Esta  clase es para limpiar ficheros  de backup antiguos"""

    def __init__(self, files_limit=3):
        """Con esto podremos realizar el backup

              Parameters
              ----------
              files_limit: int
                  3 indica que siempre conserbara 3 archivos y si hay mas de esos los eliminara

              Raises
              ------
              ValueError: si hay un error retorna un raise

              Returns
              -------
              void
                  undefined
              """
        self.files_limit = files_limit

    def clear_old_files(self, path_dir_backup="", extension_backup=".7z"):
        """Con esto podremos realizar el backup

        Parameters
        ----------
        path_dir_backup: string
            carpeta donde estan los archivos zipeados como backup

        Raises
        ------
        ValueError: si hay un error retorna un raise

        Returns
        -------
        int
            0=no ejecutado , 1 = corecto
        """
        ok = 0
        try:
            print(Fore.MAGENTA + "")

            files_list = []
            path_dir_backup = path_dir_backup.replace('\\', '/')
            # ------------------------------------------------
            # 1. LLenar data con archivos que  hay
            # ------------------------------------------------
            for dirpath, dirnames, filenames in os.walk(path_dir_backup, topdown=True):
                # print('\nruta       :', dirpath)
                for file in filenames:
                    # se pueden utilizar más tipos de imágenes (bmp, tiff, gif)
                    # if img_name.endswith(".gz") or img_name.endswith(".sql"):
                    if file.endswith(extension_backup):
                        # extraer el nombre de las imágenes (image_name. [jpg | png]) de la ruta completa

                        archivo_imagen = dirpath + os.sep + file
                        archivo_imagen = archivo_imagen.replace('//', '/')
                        print("Archivo encontrado: ", archivo_imagen)
                        # print("Nombre de la imagen a convertir:",archivo_imagen.split('\\')[-1])
                        files_list.append(archivo_imagen)

            # ------------------------------------------------
            # 2. LLenar data con archivos que  hay
            # ------------------------------------------------
            i = 0
            files_list.sort(reverse=True)  # Ordenar ASC poner para  poner los ultimos en al primera  lista
            for file in files_list:
                i = i + 1
                # aunque las posibilidades son muy menores, pero tenga mucho cuidado al modificar el siguiente código
                # cmd='cwebp \"'+path+'/'+img_name+'\" -q '+quality+' -o \"'+path+'/'+(img_name.split('.')[0])+'.webp\"'
                if i > self.files_limit:
                    if os.path.exists(file):
                        # ---si es archivo
                        if os.path.isfile(file):
                            os.remove(file)
                            print(':: se elimino archivo: ' + file)
                    # cmd = 'rm  \"' + file + '\"'
                    #
                    # print("Comando a Ejecutar Eliminar:", cmd)
                    # call(cmd, shell=True)
                    time.sleep(1)

            ok = 1
        except Exception as e:
            ok = 0
            print(Fore.RED + "Error: ", str(e))
        finally:
            # print(Fore.CYAN + "Comando exec:{}".format(cmd))
            print(Style.RESET_ALL)
            return ok




def main():
    try:
        # lib_shell = compressUtility('D:/windows/portables/7z-portable_v_2018-07-27/7z-portable/64bit/7z.exe')
        lib_shell = clear_backup_Utility()
        res=lib_shell.clear_old_files(r'D:\expt64\pe-repo-1\backup')


        print(res)
        return 0
    except Exception as e:  # work on python 3.x
        print('------------------ERROR------------------')
        print('No se recibio un parametro : ' + str(e))


if __name__ == '__main__':
    main()
