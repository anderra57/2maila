from socket import AF_INET, socket, SOCK_STREAM
from threading import Thread
import tkinter


def receive():
    """Mezuak jaso eta GUI-an jartzeko haria"""
    while True:
        try:
            msg = client_socket.recv(buffer_size)
            msg_decoded = msg.decode("utf8")
            msg_listbox.insert(tkinter.END, msg_decoded)
            msg_listbox.yview(tkinter.END)
        except OSError:  # Possibly client has left the chat.
            break


def send(event=None):
    """Mezuak idatzi eta <Return> tekla edo <Send> botoia sakatzerakoan bidali"""
    msg = my_msg.get()
    msg_encoded = bytes(msg, "utf8")
    client_socket.send(msg_encoded)
    if msg == "{quit}":
        client_socket.close()
        leihoa.quit()
    else:
        my_msg.set("")  # Clears input field.


def on_closing(event=None):
    """This function is called when the window is closed."""
    my_msg.set("{quit}")
    send()


# GUI (Graphical User Interface) eraiki#######################################
leihoa = tkinter.Tk()
leihoa.title("Chatter")

messages_frame = tkinter.Frame(leihoa)
scrollbar = tkinter.Scrollbar(messages_frame) 
msg_listbox = tkinter.Listbox(messages_frame, height=10, width=70)
msg_listbox.configure(yscrollcommand = scrollbar.set)
scrollbar.configure(command = msg_listbox.yview)
scrollbar.pack(side=tkinter.RIGHT, fill=tkinter.Y)
msg_listbox.pack(side=tkinter.LEFT, fill=tkinter.BOTH)
messages_frame.pack()

etiketa = tkinter.Label(leihoa, text="Type your messages here:")
etiketa.pack(side=tkinter.LEFT)
my_msg = tkinter.StringVar()
entry_field = tkinter.Entry(leihoa, width=35, textvariable=my_msg)
entry_field.bind("<Return>", send)
entry_field.pack(side=tkinter.LEFT)
send_button = tkinter.Button(leihoa, text="Send", command=send)
send_button.pack(side=tkinter.LEFT)

leihoa.protocol("WM_DELETE_WINDOW", on_closing)
##############################################################################


# sockt-a sortu, TCP konexioa ezarri eta GUI-a abiarazi ######################
host = "localhost"
port = 8899
addr = (host, port)
buffer_size = 1024

client_socket = socket(AF_INET, SOCK_STREAM)
client_socket.connect(addr)

receive_thread = Thread(target=receive)
receive_thread.start()
tkinter.mainloop()  # Starts GUI execution.
