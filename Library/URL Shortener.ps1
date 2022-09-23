Clear-Host

function urlshortener{
    $whilestat1 = $true
    while($whilestat1){
    $geturl = read-host "Pega la URL a acortar aqui"
    if(-not($geturl -match "http")){
        Write-Warning "Esa URL no es valida (no empieza por http/https)"
        start-sleep -s 2
        clear-host
    }
    else{
        write-host "Acortando URL..." -ForegroundColor Cyan
        $whilestat1 = $false
    }
    }


    $apidata = @{url="$geturl"}
    $jsoned = $apidata | ConvertTo-Json
    $result = Invoke-RestMethod 'https://cleanuri.com/api/v1/shorten' -Method Post -Body $jsoned -ContentType 'application/json'
    if($?){
        Write-host "Url acortada:" $result.result_url
        exit
    }
    else{
        Write-Warning "ha ocurrido un error al procesar la peticion en el servidor"
        exit
    }
}


# Run the function
urlshortener