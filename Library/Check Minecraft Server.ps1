Clear-Host


function checkserver{
    # variables declaradas
    $minecraftip = read-host "Introduce la direccion del servidor de minecraft"


    #motor de API
    $result = Invoke-RestMethod "https://api.mcsrvstat.us/2/$minecraftip"



    #construccion visual de API
    if($result.debug.ping){
        Write-host ""
        if($result.hostname){Write-host "Dominio:" $result.hostname
        write-host ""}
        if($result.online){Write-host "Servidor Online" -ForegroundColor Green}
        else{Write-host "Servidor Offline" -ForegroundColor Yellow}
        Write-host ""
        if($result.software){Write-host "Servidor con Plugins detectado:" $result.software -ForegroundColor Cyan}
        elseif($result.mods){Write-host "Servidor con Mods detectado" -ForegroundColor Cyan}
        else{write-host "Servidor funcionando en Vanilla" -ForegroundColor Green}
        Write-host ""
        Write-host "IP del servidor:" $result.ip
        Write-host "Puerto para Minecraft:" $result.port 
        Write-host "Jugadores conectados:" $result.players.online "/" $result.players.max 
        Write-host "Version:" $result.version 
        if($result.map){Write-host "Mapa:" $result.map}
        if($result.gamemode){Write-host "Gamemode:" $result.gamemode}
    }
    else{
        Write-Warning "No hay conexion de un servicio de minecraft en la direccion especificada"
    }

}


# Call the function
checkserver

