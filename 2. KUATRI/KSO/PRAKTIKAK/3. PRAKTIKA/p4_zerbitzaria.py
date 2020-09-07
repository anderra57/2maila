# -*- coding: utf-8 -*-

from socket import AF_INET, socket, SOCK_STREAM
from threading import Thread


# Metodoak hasieran jartzen dira gero erabiliak izateko ##########################
def handle_client(client):
    msg = "Kaixo! Now type your name and press enter!"
    msg_encoded = bytes(msg, "utf8")
    client.send(msg_encoded)

    name = client.recv(buffer_size)
    name = name.decode("utf8")
    if name == "{quit}":
        print("\t%s:%s has disconnected before log in" % addresses[client])
        return

    msg = 'Welcome %s! If you want to quit, type {quit} to exit.' % name
    msg_encoded = bytes(msg, "utf8")
    client.send(msg_encoded)

    msg = "%s has joined the chat!" % name
    broadcast(msg)
    usernames[client] = name

    while True:
        msg = client.recv(buffer_size)
        msg = msg.decode("utf8")
        if msg != "{quit}":
            msg_aux = name + ": " + msg
            broadcast(msg_aux)
        else:
            client.close()
            print("%s:%s has disconnected." % addresses[client])
            del addresses[client]
            del usernames[client]
            msg = "%s has left the chat." % name
            broadcast(msg)
            break



def broadcast(msg):
    msg_encoded = bytes(msg, "utf8")
    print(msg_encoded.decode("utf8"))
    for sock in usernames:
        sock.send(msg_encoded)
    ##################################################################################

usernames = {}
addresses = {}

host = "localhost" #127.0.0.1 helbidean
port = 8899 #erabiltzen ez den portua
addr = (host, port) #tupla:array modukoa, ezin da aldatu
buffer_size = 1024

# AF_INET -> sareko socketa
# SOCK_STREAM -> TCP
server_socket = socket(AF_INET, SOCK_STREAM)

# Programa nagusia ###############################################################
if __name__ == "__main__":
    server_socket.bind(addr)
    server_socket.listen(5)
    print("Waiting for connections...")
    while True:
        client, client_address = server_socket.accept()
        print("%s:%s has connected." % client_address)
        addresses[client] = client_address
        client_thread = Thread(target=handle_client, args=(client,))
        client_thread.start()
        if len(addresses.keys()) == 0:
            break
    server_socket.close()

##################################################################################