class colors:
    """Clase de colores para la consola de python

                Note:
                    Version 1.0.0.0

                """


    reset = '\033[0m'
    bold = '\033[01m'
    disable = '\033[02m'
    underline = '\033[04m'
    reverse = '\033[07m'
    strikethrough = '\033[09m'
    invisible = '\033[08m'

    @staticmethod
    def reset_color():
        """Reseteal el color fore y background


                Returns:


                 Examples
                         --------
                         >>> print(colors.reset_color())
                         void


                """
        print(colors.reset,end='')


    @staticmethod
    def print_format_table():
        """imprime tabald e colores

                Returns:


                 Examples
                         --------
                         >>> colors.print_format_table()
                         void
                """

        for style in range(8):
            for fg in range(30, 38):
                s1 = ''
                for bg in range(40, 48):
                    format = ';'.join([str(style), str(fg), str(bg)])
                    s1 += '\x1b[%sm %s \x1b[0m' % (format, format)
                print(s1)
            print('\n')

    class fg:
        black = '\033[30m'
        write = '\033[37m'
        red = '\033[31m'
        green = '\033[32m'
        orange = '\033[33m'
        blue = '\033[34m'
        purple = '\033[35m'
        cyan = '\033[36m' # azul clielo
        lightgrey = '\033[37m'
        darkgrey = '\033[90m'
        lightred = '\033[91m'
        lightgreen = '\033[92m'
        yellow = '\033[93m'
        lightblue = '\033[94m'
        pink = '\033[95m'
        lightcyan = '\033[96m'

    class fgblack:
        black = '\033[1;30m'
        write = '\033[1;37m'
        red = '\033[1;31m'
        green = '\033[1;32m'
        orange = '\033[1;33m'
        blue = '\033[1;34m'
        purple = '\033[1;35m'
        cyan = '\033[1;36m'
        lightgrey = '\033[1;37m'
        darkgrey = '\033[1;90m'
        lightred = '\033[1;91m'
        lightgreen = '\033[1;92m'
        yellow = '\033[1;93m'
        lightblue = '\033[1;94m'
        pink = '\033[1;95m'
        lightcyan = '\033[1;96m'

    class bg:
        black = '\033[40m'
        red = '\033[41m'
        green = '\033[42m'
        orange = '\033[43m'
        blue = '\033[44m'
        purple = '\033[45m'
        cyan = '\033[46m'
        lightgrey = '\033[47m'



if __name__ == '__main__':
    # mails = input("Enter emails: ").split()
    print("---------------------------------------")
    print("------ Colores Foregraund -------")
    print("---------------------------------------")
    print("Color: write - "+colors.fg.write+" write"+colors.reset)
    print("Color: black - "+colors.fg.black+" black"+colors.reset)
    print("Color: red - "+colors.fg.red+" red"+colors.reset)
    print("Color: green - "+colors.fg.green+" green"+colors.reset)
    print("Color: orange - "+colors.fg.orange+" orange"+colors.reset)
    print("Color: blue - "+colors.fg.blue+" blue"+colors.reset)
    print("Color: purple - "+colors.fg.purple+" purple"+colors.reset)
    print("Color: cyan - "+colors.fg.cyan+" cyan"+colors.reset)
    print("Color: lightgrey - "+colors.fg.lightgrey+" lightgrey"+colors.reset)
    print("Color: darkgrey - "+colors.fg.darkgrey+" darkgrey"+colors.reset)
    print("Color: lightred - "+colors.fg.lightred+" lightred"+colors.reset)
    print("Color: lightgree - "+colors.fg.lightgreen+" lightgree"+colors.reset)
    print("Color: yellow - "+colors.fg.yellow+" yellow"+colors.reset)
    print("Color: lightblue - "+colors.fg.lightblue+" lightblue"+colors.reset)
    print("Color: pink - "+colors.fg.pink+" pink"+colors.reset)
    print("Color: lightcyan - "+colors.fg.lightcyan+" lightcyan"+colors.reset)

    print("---------------------------------------")
    print("------ Colores Foregraund Black-------")
    print("---------------------------------------")
    print(colors.fgblack.write + "Color: write")
    print(colors.fgblack.black + "Color: black")
    print(colors.fgblack.red + "Color: red")
    print(colors.fgblack.green + "Color: green")
    print(colors.fgblack.orange + "Color: orange")
    print(colors.fgblack.blue + "Color: blue")
    print(colors.fgblack.purple + "Color: purple")
    print(colors.fgblack.cyan + "Color: cyan")
    print(colors.fgblack.lightgrey + "Color: lightgrey")
    print(colors.fgblack.darkgrey + "Color: darkgrey")
    print(colors.fgblack.lightred + "Color: lightred")
    print(colors.fgblack.lightgreen + "Color: lightgree")
    print(colors.fgblack.yellow + "Color: yellow")
    print(colors.fgblack.lightblue + "Color: lightblue")
    print(colors.fgblack.pink + "Color: pink")
    print(colors.fgblack.lightcyan + "Color: lightcyan")

    colors.reset_color()

    colors.reset_color()
    print("---------------------------------------")
    print("------ Colores Backgraund -------")
    print("---------------------------------------")

    print(colors.bg.black+"Fondo: black")
    print(colors.bg.red+"Fondo: red")
    print(colors.bg.green+"Fondo: green")
    print(colors.bg.orange+"Fondo: orange")
    print(colors.bg.blue+"Fondo: blue")
    print(colors.bg.purple+"Fondo: purple")
    print(colors.bg.cyan+"Fondo: cyan")
    print(colors.bg.lightgrey+"Fondo: lightgrey")
    colors.reset_color()

    print("---------------------------------------")
    print("------ Colores Forecolor y Backgraund -------")
    print("---------------------------------------")

    print(colors.fg.red + "color: red - "+colors.bg.cyan+"fondo cyan"+colors.reset)
    print("NORMAL")
    print(colors.bg.red + "Fondo: red - "+colors.fg.orange+"color orange"+colors.reset)
    colors.reset_color()


    # imprime tabla de colores
    #colors.print_format_table()

