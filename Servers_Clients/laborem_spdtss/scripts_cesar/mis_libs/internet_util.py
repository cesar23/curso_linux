import socket


class internet_util:

    def __conexion_web(self, url):
        _result = {"statusCode": 200, "data": "", "message": "", "messages": []}
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(5)  # esperamos  5  segundo par a conectarnos
        ok = False
        try:
            s.connect((url, 80))
            # s.connect(("www.google.com", 80))
        except (socket.gaierror, socket.timeout):
            _result = {"statusCode": 500, "message": "Sin conexión a internet",
                       "messages": []}
        else:
            ok = True
            _result = {"statusCode": 200, "message": "Con conexión a internet",
                       "messages": []}
            s.close()
        return _result

    #  start functions Conversiones
    def conexion_internet(self):
        _result = {"statusCode": 200, "data": "", "message": "", "messages": []}
        res = self.__conexion_web("www.google.com")
        if res['statusCode'] == 200:
            _result['statusCode'] = 200
        else:
            _result['statusCode'] = 500
            _result['message'] = res['message']
        return _result


# if __name__ == '__main__':
#     # mails = input("Enter emails: ").split()
#     obinternet = internet_util()
#     res = obinternet.conexion_internet();
#     print(res)
