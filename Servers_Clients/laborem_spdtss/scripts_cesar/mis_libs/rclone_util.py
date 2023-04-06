import subprocess
import os, sys
import time
from tqdm import tqdm
from mail_util import *
from file_util import *
import configparser
import json

class RCloneUtil:

    def __init__(self, my_remote):
        self.my_remote = my_remote

    def get_space_disk(self):
        _result = {"statusCode": 200, "message": "", "messages": []}
        # command = (['rclone', 'ls', 'cloudMaster:/'])
        # command = (['rclone', 'ls', '{remote}:/'.format(remote=self.my_remote)])
        # command = (['rclone', 'about', '{remote}:/  --json'.format(remote=self.my_remote)])
        command = "rclone about {remote}:/ --json ".format(remote=self.my_remote)
        res = self.cmd_shell(command)
        res = json.loads(res)
        return res['total'], res['free']


    def cmd_shell(self,cmd):
        result = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        out, err = result.communicate()
        out = out.decode("utf-8")
        # if (err):
        #     raise Exception(err)
        return out

    @staticmethod
    # OBTENER TAMAÑO DE CARPETA
    def get_directory_size(path):
        processArgs = ["rclone", "lsl", path]


def main():
    try:
        my_remote_drive = RCloneUtil('cloudMaster')
        my_remote_storj = RCloneUtil('cloudStorj')
        total, free = my_remote_drive.get_space_disk()
        total2, free2 = my_remote_storj.get_space_disk()
        if free <=1024:
         print("sin espacion")

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
