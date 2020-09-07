from socket import AF_INET, socket, SOCK_STREAM
from threading import Thread


def handle_client(client): # Bezero batekiko datu trukea kudeatzeko haria
    """Log in gonbidapena bidali"""
    msg = "Type your name and press enter"
    msg_encoded = bytes(msg, "utf8")
    client.send(msg_encoded)

    """Erabiltzaile izena jaso"""
    name = client.recv(buffer_size)
    name = name.decode("utf8")
    if name == "{quit}":
        print("\t%s:%s has disconnected before log in" % addresses[client])
        return

    """Ongi etorri mezua bidali"""
    msg = 'Welcome %s! Type {quit} to exit.' % name
    msg_encoded = bytes(msg, "utf8")
    client.send(msg_encoded)

    """Chat gelan dauden erabiltzaileak bidali"""
    if len(usernames.keys()) == 0: # gela hutsik dago
        msg = "The chat room is empty!"
        msg_encoded = bytes(msg, "utf8")
        client.send(msg_encoded)
    else: # erabiltzaile gehiago daude jada
        msg = "Connected users: "
        for each in usernames.keys():
            msg = msg + " " + usernames[each]
            msg_encoded = bytes(msg, "utf8")
        client.send(msg_encoded)

    """Beste erabiltzaileak erabiltzaile berriaren sartzeaz abisatu"""
    msg = "%s has joined the chat!" % name
    broadcast(msg)
    
    """Erabiltzaileen zerrenda eguneratu"""
    usernames[client] = name

    while True: # bezero eta zerbitzariaren arteko datu trukearen kudeaketa
        msg = client.recv(buffer_size)
        msg = msg.decode("utf8")
        if msg == "{quit}":
            print("%s:%s has disconnected." % addresses[client])
            del usernames[client]
            del addresses[client]
            client.close()
            
            """Beste erabiltzaileak erabiltzaile berriaren irteeraz abisatu"""
            msg = "%s has left the chat." % name
            broadcast(msg)
            break
        else:
            msg_aux = name + ": " + msg
            broadcast(msg_aux)


def broadcast(msg): # Aktibo dauden bezero guztiei mezua bidali
    msg_encoded = bytes(msg, "utf8")
    print(msg_encoded.decode("utf8"))
    for sock in usernames:
        sock.send(msg_encoded)


# Aldagai globalak ###########################################################
usernames = {}
addresses = {}

host = "localhost"
port = 8899
addr = (host, port)
buffer_size = 1024

server_socket = socket(AF_INET, SOCK_STREAM)
##############################################################################


# Programa nagusia ###########################################################
if __name__ == "__main__":
    server_socket.bind(addr)
    server_socket.listen(5)
    print("Waiting for connection...")
    
    while True:
        client, client_address = server_socket.accept()
        
        print("%s:%s has connected." % client_address)
        addresses[client] = client_address
        
        client_thread = Thread(target=handle_client, args=(client, ))
        client_thread.start()
        
        if len(addresses.keys()) == 0:
            break
    server_socket.close()
