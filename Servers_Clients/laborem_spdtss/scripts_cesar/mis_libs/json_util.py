import os, sys
import json
from color_util import *


class json_util:

    @staticmethod
    def read_file(file_path):

        # _result = {"statusCode": 200, "data": "", "message": "", "messages": []}
        try:
            if not os.path.isfile(file_path):
                raise Exception("No se encontro file: [{0}]".format(file_path))
            with open(file_path, "r", encoding='utf-8') as file:
                data = json.load(file)
            return data

        except Exception as e:
            print(colors.fg.red + "Error: ", str(e))
            raise e
        finally:
            colors.reset_color()

    @staticmethod
    def write_file(file_path, data):

        # _result = {"statusCode": 200, "data": "", "message": "", "messages": []}
        try:
            if not os.path.isfile(file_path):
                raise Exception("No se encontro file: [{0}]".format(file_path))

            with open(file_path, 'w', encoding='utf-8') as f:
                json.dump(data, f, indent=2)

        except Exception as e:
            print(colors.fg.red + "Error: ", str(e))
            raise e
        finally:
            colors.reset_color()


def main():
    try:
        # ------------------------------------------------
        # ------------ ejemplo con Array Json ------------
        # ------------------------------------------------
        path_json = r'D:\repos\curso_python\Mis_librerias\paises.json'

        res = json_util.read_file(path_json)

        for obj in res:
            print("Pais:" + obj['pais'])
            print("Personas:" + str(obj['personas']))
            print('-----------')

        # ------------------------------
        # ------- agregar data
        # ------------------------------
        res.append({
            "pais": "chile",
            "personas": 15
        })
        # ------- agregar data
        json_util.write_file(path_json, res)
        print(res)

        # ------------------------------------------------
        # ------------ ejemplo con Object Json ------------
        # ------------------------------------------------
        path_json = r'D:\repos\curso_python\Mis_librerias\config.json'
        res = json_util.read_file(path_json)
        res['version'] = 12
        res['nombre'] = "Cesar"
        json_util.write_file(path_json, res)


    except Exception as e:  # work on python 3.x
        print('------------------ERROR------------------')
        print('No se recibio un parametro : ' + str(e))


if __name__ == '__main__':
    main()
# file_content = FileUtil.read_file(r"D:\repos\curso_linux\test.txt")
# print(file_content)
