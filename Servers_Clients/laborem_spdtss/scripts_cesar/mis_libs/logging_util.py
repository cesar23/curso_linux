import logging, json
import time,datetime

class logging_util:

    def __init__(self, __filename):
        logging.basicConfig(filename=__filename,
                            filemode='a',
                            # format='%(asctime)s,%(msecs)d %(name)s %(levelname)s %(message)s',
                            # format='%(asctime)s,%(msecs)d %(name)s %(levelname)s %(process)d %(message)s',
                            format='%(asctime)s,%(msecs)d %(levelname)s : %(message)s',
                            datefmt='%Y-%m-%d %H:%M:%S',
                            level=logging.DEBUG)
        self.__filename = __filename

    #  start functions Conversiones
    def __tuple_to_string(self, _tuple):
        delim = ','
        s = delim.join([str(_) for _ in _tuple])
        return s

    def __diccionarie_to_string(self, _dicc):
        serialized = json.dumps(_dicc)
        return serialized

    def __list_to_string(self, _list):
        delim = ','
        s = delim.join([str(_) for _ in _list])
        return s

    def __class_to_string(self, _class):
        json_str = json.dumps(_class.__dict__)
        return json_str

    #  EMD functions Conversiones

    def __var_to_string(self, _object):
        _output = ""
        if type(_object) == str:
            _output = _object
            # print("es String")
        elif type(_object) == int:
            _output = _object
            # print("es integer")
        elif type(_object) == list:
            _output = self.__list_to_string(_object)
            # print("es lista")
        elif type(_object) == tuple:
            _output = self.__tuple_to_string(_object)
            # print("es tupla")
        elif type(_object) == dict:
            _output = self.__diccionarie_to_string(_object)
            # print("es diccionario")
        elif str(type(_object)).split(".")[
            0] == "<class '__main__":  # verifica si es uan  clase
            _output = self.__class_to_string(_object)
            # print("es Clase")
        else:
            _output = _object
            # print("normal")
        return _output

    # ------ metodos publicos de logs
    def debug(self, str):
        logging.debug("{}".format(self.__var_to_string(str)))

    def info(self, str):
        logging.info("{}".format(self.__var_to_string(str)))

    def error(self, str):
        logging.error("{}".format(self.__var_to_string(str)))

    def warning(self, str):
        logging.error("{}".format(self.__var_to_string(str)))
    # -----------------Usando Log
    # CRITICAL	50
    # ERROR	40
    # WARNING	30
    # INFO	20
    # DEBUG	10
    # NOTSET	0
    def __log(self, str):
        msg =self.__var_to_string(str)
        logging.log(20,msg)




if __name__ == '__main__':
    # mails = input("Enter emails: ").split()
    ANO_MES = datetime.datetime.fromtimestamp(time.time()).strftime(
        "%Y-%m")
    logg = logging_util("logg_{}.log".format(ANO_MES))
    logg.info("salida")
    variable_diccionario = {
        "Colores": {"azul": "blue", "rojo": "red", "verde": "green"}}
    logg.info(variable_diccionario)
