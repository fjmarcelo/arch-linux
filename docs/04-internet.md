# 4. ¿Tenemos conexión a Internet?

```bash
ping -c 4 google.es
```

Salida esperada:

```
PING google.es (172.217.17.3) 56(84) bytes de datos.
64 bytes desde mad07s09-in-f3.1e100.net (172.217.17.3): icmp_seq=1 ttl=119 tiempo=63.4 ms
64 bytes desde mad07s09-in-f3.1e100.net (172.217.17.3): icmp_seq=2 ttl=119 tiempo=77.9 ms
64 bytes desde mad07s09-in-f3.1e100.net (172.217.17.3): icmp_seq=3 ttl=119 tiempo=34.3 ms
64 bytes desde mad07s09-in-f3.1e100.net (172.217.17.3): icmp_seq=4 ttl=119 tiempo=33.3 ms

--- google.es estadísticas ping ---
4 paquetes transmitidos, 4 recibidos, 0% packet loss, time 3004ms
```

## Conexión WiFi con `iwctl`

En portátiles o equipos con conexión inalámbrica hay que usar la aplicación `iwctl`.

Primero identificamos el nombre de nuestra interfaz de red:

```bash
ip link
```

A continuación nos conectamos. En el ejemplo usamos `wlan0` como nombre de interfaz, la SSID `redCasa` y la clave `1234567890`:

```bash
iwctl --passphrase 1234567890 station wlan0 connect redCasa
```

Tras conectar, verificamos con `ping`.
