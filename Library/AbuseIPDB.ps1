clear-host
# Inciando con variables ya pre-declaradas
$ApiURL = "https://api.abuseipdb.com/api/v2/check"

$apiKey = read-host "Pega tu API Key de AbuseIPDB"
if(-not($apiKey)){
    Write-Warning "No hay una API Key asignada al codigo"
}
$ipconsulta = read-host "Escriba la IP a consultar"

# Contruccion de variables en objetos
$header = @{'Key' = $apiKey}
$body = @{'ipAddress' = $ipconsulta}

# Motor de API
$result = Invoke-RestMethod -Method Get $ApiURL -Header $header -Body $body -ContentType 'application/json'
if(-not($?)){
    Write-Warning "Ha ocurrido un error al procesar la peticion al servidor IPDB"
    exit
}

# Construccion de la interfaz de resultados
write-host "Direccion IP:" $result.data.ipAddress -ForegroundColor Cyan
""
if($result.data.isWhitelisted){Write-host "IP verificada como segura" -ForegroundColor Green}
if($result.data.abuseConfidenceScore -eq "0"){Write-host "Esta IP esta limpia"}
else{
    Write-host "Esta IP es problematica" -ForegroundColor Yellow
    Write-host "Probabilidad de Abuso:" $result.data.abuseConfidenceScore"%"
}
if($result.data.totalReports -eq "0"){Write-host "Esta IP no tiene ninguna denuncia registrada" -ForegroundColor Green}
else{
    Write-host "Esta IP tiene" $result.data.totalReports "denuncias" -ForegroundColor Yellow
    Write-host "Ultima denuncia:" $result.data.lastReportedAt
}
Write-host "------------------"
""
Write-host "Detalles tecnicos:"
""
if($result.data.isPublic){Write-host "Direccion IP Publica"}
else{Write-host "Esta direccion IP no es publica" -ForegroundColor Yellow}

if($result.data.ipVersion -eq "4"){Write-host "Direccion IPv4"}
elseif($result.data.ipVersion -eq "6"){Write-host "Direccion IPv6"}
else{Write-Warning "No se reconoce la version de IP que es (Posible IPv6?)" -ForegroundColor Yellow}

if($result.data.countryCode){Write-host "Codigo de pais:" $result.data.countryCode}
else{Write-Host "No se puede leer el codigo de pais de esta direccion IP" -ForegroundColor Yellow}

if($result.data.isp){Write-host "ISP:" $result.data.isp}
else{Write-host "No se puede leer el ISP de esta IP" -ForegroundColor Yellow}

if($result.data.domain){Write-host "Dominio:" $result.data.domain}
else{Write-host "No se puede leer el dominio de esta IP" -ForegroundColor Yellow}




