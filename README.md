# Coleccion de APIs en PowerShell
Coleccion de diferentes REST APIs implementadas en Microsoft PowerShell

El proposito es privado y educacional, para enseñar como implementar una gran variedad de servicios en PowerShell

## Indice
### Inicio y Licencias
- [Coleccion de APIs en PowerShell](#coleccion-de-apis-en-powershell)
  * [Indice](#Indice)
- [Usar codigo de este repositorio](#usar-codigo-de-este-repositorio)
  * [Explicación de esta licencia](#explicacion-de-esta-licencia)
  * [Linea que deberas poner en tu codigo](#linea-que-deberas-poner-en-tu-codigo)
### Colección APIs
- [URL Shortener](#url-shortener)
- [Minecraft Server Check](#Minecraft-Server-Check)
- [AbuseIPDB](#AbuseIPDB)
- [AnonFiles](#AnonFiles)


---


# Usar codigo de este repositorio
El codigo de este repositorio y algunas variantes esta sujeto a ````(CC BY-NC 4.0)````, Esta licencia solo aplica a la implementacion realizada en PowerShell, no a la API en sí

## Explicacion de esta licencia
https://creativecommons.org/licenses/by-nc/4.0/


## Linea que deberas poner en tu codigo
Puedes ponerlo en tu Header o en el inicio de la Funcion
````
write-host "Implementation of the REST API in PowerShell made by @ContratopDev" -foregroundcolor Cyan
````

---

# URL Shortener
Herramienta simple para acortar una URL

[Documentacion de la API](https://cleanuri.com/docs)
### Pruebame
````
Invoke-WebRequest -UseBasicParsing "https://github.com/contratop/powershell-apis/raw/main/Library/URL%20Shortener.ps1" | Invoke-Expression
````


# Minecraft Server Check
Comprueba el estado del servidor de minecraft y devuelve toda la informacion disponible de ese servidor

[Documentacion de la API](https://api.mcsrvstat.us/)
### Pruebame
````
Invoke-WebRequest -UseBasicParsing "https://github.com/contratop/powershell-apis/raw/main/Library/Check%20Minecraft%20Server.ps1" | Invoke-Expression
````

# AbuseIPDB
Comprueba el estado de una IP en la base de datos de AbuseIPDB

[Documentacion de la API](https://docs.abuseipdb.com/#check-endpoint)
### Pruebame
````
Invoke-WebRequest -UseBasicParsing "https://github.com/contratop/powershell-apis/raw/main/Library/AbuseIPDB.ps1" | Invoke-Expression
````

# AnonFiles
Sube un archivo a AnonFiles y devuelve la URL de descarga

[Documentacion de la API](https://anonfiles.com/docs/api)
### Pruebame
````
Invoke-WebRequest -UseBasicParsing "https://github.com/contratop/powershell-apis/raw/main/Library/AnonFiles.ps1" | Invoke-Expression
````



