import subprocess
import os, sys

"""
version 1.0.1
"""


class shellUtil:

    def cmd_shell(self, cmd):
        _result = {"statusCode": 200,"data":"", "message": "", "messages": []}
        result = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        out, err = result.communicate()
        # out = out.decode("utf-8")
        _result["data"] = out
        if (err):
            # raise Exception(err)
            _result["statusCode"] = 500
            _result["message"] = err
        return _result

    #
    def cmd_shell_out(self, cmd):
        """Esta  funcion mostrara en  salida lo que se  va  ejecutando y la  respuesta retornara 0 si esta ok y 1  si succedio un errro."""

        # process = subprocess.Popen(['ping', '-c 4', 'python.org'],
        #                            stdout=subprocess.PIPE,
        #                            universal_newlines=True)
        process = subprocess.Popen(cmd,
                                   stdout=subprocess.PIPE,
                                   stderr=subprocess.PIPE,
                                   universal_newlines=True)

        # limite de lienaeas en blanco
        lines_blank_limit = 2
        # conteno de lineas en blnaco
        lines_count = 0
        # salida output
        _output = 0
        while True:
            output = process.stdout.readline()
            if output.strip() is not None:
                linea = output.strip()
                if linea == '':
                    lines_count += 1
                    if lines_count <= lines_blank_limit:
                        print('')
                else:
                    print(output.strip())
                    lines_count = 0

            # cuando ya termino y nos da la  salidao
            return_code = process.poll()
            if return_code is not None:
                _output = return_code
                # print('RETURN CODE', return_code)
                # Process has finished, read rest of the output
                for output in process.stdout.readlines():
                    linea = output.strip()
                    if linea != '':
                        print("!!!!!!!", output.strip())
                break
        return _output

    def run_command(self, cmd):
        # run command (can be an array (for parameters))
        p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        # capture output and error
        (output, err) = p.communicate()
        # wait for command to end
        # TODO: really long running?
        status = p.wait()

        # decode output from byte string
        if output is not None:
            output = output.decode('utf-8')
        if err is not None:
            err = err.decode('utf-8')
        return output
        # return (output, err, status)

    @staticmethod
    # OBTENER TAMAÑO DE CARPETA
    def get_directory_size(path):
        processArgs = ["rclone", "lsl", path]


def main():
    try:
        lib_shell = shellUtil()
        # res = lib_shell.cmd_shell('ping www.google.com')
        # ----- ejeuta linea por line y da  salida 1 si hay error
        res = lib_shell.cmd_shell_out('ping www.google.com')
        print(res)
        # print('----end-----------')

        # print(FileClass.get_size_format(space_disk))
        # import subprocess
        #
        # command = (['rclone', 'ls', 'cloudMaster:/'])
        #
        # result = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        # output, error = result.communicate()
        # output = output.decode("utf-8")
        # print(type(output))
        # print(output)
        return 0
    except Exception as e:  # work on python 3.x
        print('------------------ERROR------------------')
        print('No se recibio un parametro : ' + str(e))


if __name__ == '__main__':
    main()
