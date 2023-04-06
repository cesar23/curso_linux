import subprocess
import re
import os, sys
import time
# pip install tqdm
from tqdm import tqdm
from pathlib import Path
import configparser
import json


class FileUtil:

    @staticmethod
    # OBTENER TAMAÑO DE CARPETA
    def get_directory_size(directory):
        total = 0
        try:
            for entry in os.scandir(directory):
                if entry.is_file():
                    total += entry.stat().st_size
                elif entry.is_dir():
                    total += FileUtil.get_directory_size(entry.path)
        except NotADirectoryError:
            return os.path.getsize(directory)
        except PermissionError:
            return 0
        return total

    @staticmethod
    # convertir path de linux a  windows
    def convert_path_linux_windows(path_linux):
        _result = {"statusCode": 200, "data": "", "message": "", "messages": []}
        try:
            regex = r"(^\/[a|b|c|d|e|f|g|h|i|j|k|l|m|n|o])+(.*)"
            # match= re.search(regex, texto,)
            match = re.search(regex, path_linux,
                              re.IGNORECASE)  # ignora mayuscula o minusculas
            if match:
                # print(match.group(1).replace("/","")+":")
                unidad = (match.group(1).replace("/", "\\") + ":").replace("\\",
                                                                           "")
                path = match.group(2).replace("/", "\\")
                path_final = unidad + path
                _result["data"] = path_final
        except Exception as e:  # work on python 3.x
            _result["statusCode"] = 500
            _result["message"] = str(e)
        return _result

    @staticmethod
    # convertir path de linux a  windows
    def convert_path_windows_linux(path_windows):
        _result = {"statusCode": 200, "data": "", "message": "", "messages": []}
        try:
            regex = r"(^[a|b|c|d|e|f|g|h|i|j|k|l|m|n|o])+(.*)"
            # match= re.search(regex, texto,)
            match = re.search(regex, path_windows,
                              re.IGNORECASE)  # ignora mayuscula o minusculas
            if match:
                # print(match.group(1).replace("/","")+":")
                unidad = "/" + match.group(1)
                path = match.group(2).replace(":", "").replace("\\", "/")
                path_final = unidad + path
                _result["data"] = path_final
        except Exception as e:  # work on python 3.x
            _result["statusCode"] = 500
            _result["message"] = str(e)
        return _result

    """Retorna el contenido de un fichero no binario

            Args:
                 file_path (str): retuirn a un  strin de cadenas.


            Returns:
                str

             Examples
                     --------
                     >>> read_file('c:\fichero.txt')
                     str
            """

    @staticmethod
    def read_file(file_path):
        mode = 'r'
        output = ""

        try:
            if not os.path.isfile(file_path):
                raise Exception("No se encontro file: [{0}]".format(file_path))

            with open(file_path, mode, encoding='utf-8') as file:
                for linea in file:
                    # puedes acceder a la linea "strip" para quitar espacios en blanco al inicio y final
                    # --------------- sin salto de linea
                    # output += linea.strip()
                    # --------------- con salto linea
                    output += linea

        except Exception as e:
            raise e

        return output

        # cerramos el archivo

    # OBTENER FORMATO
    def get_size_format(b, factor=1024, suffix="B"):
        for unit in ["", "K", "M", "G", "T", "P", "E", "Z"]:
            if b < factor:
                return f"{b:.2f}{unit}{suffix}"
            b /= factor

        return f"{b:.2f}Y{suffix}"

    @staticmethod
    # OBTENER TAMAÑO DE CARPETA
    def read_json(filepath):
        if not os.path.isfile(filepath):
            raise Exception("No se encontro file: [{0}]".format(filepath))
        f = open(filepath, "r")
        content = f.read()
        data = json.loads(content)
        f.close()
        return data

    @staticmethod
    def create_file(file_path):
        # -- modo creacion
        mode = 'w'
        try:
            # - si  el  fichero esta creado salimos
            if os.path.isfile(file_path):
                return

            with open(file_path, mode, encoding='utf-8') as f:
                return

        except Exception as e:
            raise e

    """comentario

            Args:
                 file_path (str): ruta del fichero.
                 data (str): data para fichero.
                 appended_data (boolean): si es  escritora o lectura.


            Returns:
                void

             Examples
                     --------
                     >>> write_file('c:\\file.txt','info')
                     True

                     >>> write_file('c:\\file.txt','nueva  linea',True)
                     True
            """

    @staticmethod
    def write_file(file_path, data, appended_data=False):
        # -- modo creacion
        mode = 'w'
        if appended_data is True:
            mode = 'a'  # -- modo agregacion de contenido

        # -- si no esta en modo creacion
        if not os.path.isfile(file_path):
            raise Exception("No se encontro file: [{0}]".format(file_path))

        try:

            with open(file_path, mode, encoding='utf-8') as f:
                f.write(data + '\n')

        except Exception as e:
            raise e


def main():
    try:
        FileUtil.create_file(r"D:\salida2.txt")

        FileUtil.write_file(r"D:\salida2.txt", 'ino11')
        FileUtil.write_file(r"D:\salida2.txt", 'ino22', True)
        salida = FileUtil.read_file(r"D:\salida2.txt")
        print(salida)

        # peso_dir = FileUtil.get_directory_size(r'D:\repos\cdn_webs\camicv')
        # # peso_human = FileUtil.get_size_format(peso_dir)
        # file_content = FileUtil.read_file(r"D:\repos\curso_linux\test.txt")
        # file_content = FileUtil.convert_path_windows_linux(
        #     r"D:\repos\curso_linux\test.txt")
        # print(file_content)
        # file_content = FileUtil.convert_path_linux_windows(
        #     "/d/repos/curso_linux")
        # print(file_content)
        # salida = FileUtil.read_json(r'/Utilidades/Logs/paises.json')
        # print(salida)
        #
        # print("peso bytes:" + str(peso_dir))
        # # print("peso human:" + str(peso_human))
        # print("file_content:" + str(file_content))
        # print(salida)
        return 0
    except Exception as e:  # work on python 3.x
        print('------------------ERROR------------------')
        print('No se recibio un parametro : ' + str(e))


if __name__ == '__main__':
    main()
# file_content = FileUtil.read_file(r"D:\repos\curso_linux\test.txt")
# print(file_content)
