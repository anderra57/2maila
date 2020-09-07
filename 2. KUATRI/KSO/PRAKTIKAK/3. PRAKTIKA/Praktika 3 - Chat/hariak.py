import time
import threading


def my_thread(i, delay):
    print("Thread-" + str(i) + " lotan " + str(delay) + " s")
    time.sleep(delay)
    print("Thread-" + str(i) + " finished")


for i in range(1, 11):
    haria = threading.Thread(target=my_thread, args=(i, 11 - i))
    haria.start()
