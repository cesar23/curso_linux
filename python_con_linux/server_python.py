# Server simple en python
import sys, os

import io
import html
import urllib.parse
from http import HTTPStatus
from http.server import HTTPServer, SimpleHTTPRequestHandler
HOST_NAME = "localhost"
PORT = 8080
DIRECTORY_PATH = "./"

try:
    PORT = int(sys.argv[1])
except Exception as e:  # work on python 3.x
    print('------------------ERROR------------------')
    print('No se recibio un parametro : ' + str(e))

try:
    DIRECTORY_PATH = sys.argv[2]
except Exception as e:  # work on python 3.x
    print('------------------ERROR------------------')
    print('No se recibio un parametro : ' + str(e))


class PythonServer(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=DIRECTORY_PATH, **kwargs)


    def list_directory(self, path):
        """Helper to produce a directory listing (absent index.html).

        Return value is either a file object, or None (indicating an
        error).  In either case, the headers are sent, making the
        interface the same as for send_head().

        """
        try:
            list = os.listdir(path)

            CURRENT_PATH = os.path.abspath(path)
        except OSError:
            self.send_error(
                HTTPStatus.NOT_FOUND,
                "No permission to list directory")
            return None
        list.sort(key=lambda a: a.lower())
        r = []
        try:
            displaypath = urllib.parse.unquote(self.path,
                                               errors='surrogatepass')
        except UnicodeDecodeError:
            displaypath = urllib.parse.unquote(path)
        displaypath = html.escape(displaypath, quote=False)
        enc = sys.getfilesystemencoding()
        title = 'Directory listing -  <a class="button button-small" href="#">created by   [Cesar Auris]</a>  <br> <h5><strong>Current path: </strong>%s<h5>' % displaypath
        r.append('<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" '
                 '"http://www.w3.org/TR/html4/strict.dtd">')
        r.append('<html>\n<head>')
        r.append("""
        <style>
        .button-black {
  background-color: black !important;
  border-color: black !important;
}
.button-black.button-clear,
.button-black.button-outline {
  background-color: transparent !important;
  color: black !important;
}
.button-black.button-clear {
  border-color: transparent !important;
}

/* Custom size */
.button-small {
  font-size: .8rem !important;
  height: 2.8rem !important;
  line-height: 2.8rem !important;
  padding: 0 1.5rem !important;
}

.button-large {
  font-size: 1.4rem !important;
  height: 4.5rem !important;
  line-height: 4.5rem !important;
  padding: 0 2rem !important;
}
</style>
        """)
        r.append('<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/milligram/1.4.1/milligram.min.css" >')
        r.append('<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" crossorigin="anonymous"/>')
        r.append('<meta http-equiv="Content-Type" '
                 'content="text/html; charset=%s">' % enc)
        r.append('<title>%s</title>\n</head>' % title)
        r.append('<body>')
        r.append('<h6><strong><code>Dir path Server:  %s </code></strong></h6>' % CURRENT_PATH)
        r.append('\n<h4>%s</h4>' % title)


        if displaypath != "/":
            r.append('<a href="javascript:history.back();"><img src="https://img.icons8.com/external-kmg-design-outline-color-kmg-design/32/000000/external-backwards-arrows-kmg-design-outline-color-kmg-design.png"/> [Back]</a>')
            r.append(' - <a class="button button-small" href="/"><i class="fas fa-home"></i> Home</a>')

        r.append('<hr>\n<ul>')
        for name in list:
            fullname = os.path.join(path, name)
            displayname = linkname = name
            is_file=1
            # Append / for directories or @ for symbolic links
            if os.path.isdir(fullname):
                displayname = name + ""
                # linkname = name + "/"
                linkname = name + "/"
                is_file=0
            if os.path.islink(fullname):
                displayname = name + "@"
                # Note: a link to a directory displays with @ and links with /
            if is_file==1:
                r.append('<li><a href="%s"><img src="https://img.icons8.com/external-kmg-design-outline-color-kmg-design/16/000000/external-coding-folder-and-document-kmg-design-outline-color-kmg-design.png"/> %s</a></li>'
                         % (urllib.parse.quote(linkname,
                                               errors='surrogatepass'),
                            html.escape(displayname, quote=False)))
            else:
                r.append('<li>'
                         '<a href="%s"><img src="https://img.icons8.com/external-kmg-design-outline-color-kmg-design/16/000000/external-folder-folder-and-document-kmg-design-outline-color-kmg-design.png"/> %s</a></li>'
                         % (urllib.parse.quote(linkname,
                                               errors='surrogatepass'),
                            html.escape(displayname, quote=False)))
        r.append('</ul>\n<hr>\n</body>\n</html>\n')
        encoded = '\n'.join(r).encode(enc, 'surrogateescape')
        f = io.BytesIO()
        f.write(encoded)
        f.seek(0)
        self.send_response(HTTPStatus.OK)
        self.send_header("Content-type", "text/html; charset=%s" % enc)
        self.send_header("Content-Length", str(len(encoded)))
        self.end_headers()
        return f


    # def do_GET(self):
    #     if self.path == '/':
    #         self.send_response(200)
    #         self.send_header("Content-type", "text/html")

            # self.path = './templates/form.html'
            #
            # self.send_response(200, "OK")
            # self.end_headers()
            # html="""<html><head></head><body><ul>
            #     <li><a href="/show_records">Listado</a></li>
            #     <li><a href="/">Creacion</a></li>
            # </ul><h1>Form data successfully recorded!!!</h1></body></html>"""
            #
            # html = f"{html}"
            #
            # self.wfile.write(bytes(html, "utf-8"))

        if self.path == '/show_records':
            self.path = './templates/show_records.html'
#
# class init_Cesar (PythonServer):
#     def __init__(self, *args, **kwargs):
#         super().__init__(*args, directory="./", **kwargs)



if __name__ == "__main__":

    server = HTTPServer((HOST_NAME, PORT), PythonServer)
    print(f"Server started http://{HOST_NAME}:{PORT}")

    try:
        server.serve_forever()
    except KeyboardInterrupt:
        server.server_close()
        print("Server stopped successfully")
        sys.exit(0)
