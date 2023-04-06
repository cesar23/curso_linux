
def helper_console_clear():
    """version 1.0.1 sirve para limpiar la consola del terminal del windows o linux

          Returns:
                void

             Examples
                     --------
                     >>> helper_console_clear()
                     void
            """
    print("\033[H\033[J", end="")
    # os.system('cls' if os.name=='nt' else 'clear')



if __name__ == '__main__':
    # mails = input("Enter emails: ").split()
    print("uno")
    print("uno")
    print("uno")
    helper_console_clear()
    print("dos")
    print("uno")
