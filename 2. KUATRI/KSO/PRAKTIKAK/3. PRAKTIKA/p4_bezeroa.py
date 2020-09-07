# -*- coding: utf-8 -*-

from socket import AF_INET, socket, SOCK_STREAM
from threading import Thread
import tkinter


# Metodoak hasieran jartzen dira gero erabiliak izateko ##########################
def receive():
    while True:
        try:
            #mezu bat jaso arte itxaron
            msg = client_socket.recv(buffer_size)
            msg_decoded = msg.decode("utf8")

            #mezua listbox-aren amaieran sartu
            msg_listbox.insert(tkinter.END, msg_decoded)

            #mezua sartzen ez bada, scroll-a jeitsi
            msg_listbox.yview(tkinter.END)
        except OSError:
            break


def send(event=None):
    """Handles sending of messages."""
    msg = my_msg.get()
    msg_encoded = bytes(msg, "utf8")
    client_socket.send(msg_encoded)
    if msg == "{quit}":
        client_socket.close()
        leihoa.quit()
    else:
        my_msg.set("")


def on_closing(event=None):
    my_msg.set("{quit}")
    send()


##################################################################################


# GUI (Graphical User Interface) #################################################
leihoa = tkinter.Tk()
leihoa.title("Chatter")

messages_frame = tkinter.Frame(leihoa)
scrollbar = tkinter.Scrollbar(messages_frame)
msg_listbox = tkinter.Listbox(messages_frame, height=10, width=100)
msg_listbox.configure(yscrollcommand=scrollbar.set)
scrollbar.configure(command=msg_listbox.yview)
scrollbar.pack(side=tkinter.RIGHT, fill=tkinter.Y)
msg_listbox.pack(side=tkinter.LEFT, fill=tkinter.BOTH)
messages_frame.pack()

etiketa = tkinter.Label(leihoa, text="Type your messages here:")
etiketa.pack(side=tkinter.LEFT)
my_msg = tkinter.StringVar()
entry_field = tkinter.Entry(leihoa, width=50, textvariable=my_msg)
entry_field.bind("<Return>", send)
entry_field.pack(side=tkinter.LEFT)
send_button = tkinter.Button(leihoa, text="Send", command=send)
send_button.pack(side=tkinter.LEFT)

leihoa.protocol("WM_DELETE_WINDOW", on_closing)
##################################################################################


# Programa nagusia ###############################################################
host = "localhost"
port = 8899
addr = (host, port)  # zerbitzariaren IP helb eta TCP port
buffer_size = 1024

# AF_INET -> sareko socketa
# SOCK_STREAM -> TCP
client_socket = socket(AF_INET, SOCK_STREAM)
client_socket.connect(addr)  # zerbitzariarekin TCP konexioa ezarri

receive_thread = Thread(target=receive) #mezuak jasotzeko haria
                                        #receive metodora lotua
receive_thread.start() #jasotzeko haria hasi
tkinter.mainloop() #GUI-a programa nagusiaren harian hasi

##################################################################################
