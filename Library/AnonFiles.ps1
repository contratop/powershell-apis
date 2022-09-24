Clear-Host
Add-Type -AssemblyName System.Windows.Forms
$url = "https://api.anonfiles.com/upload"

if(-not(get-command curl.exe)){
    Write-Host "curl.exe not found. Please install curl.exe and try again."
    pause
    exit
}

$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ InitialDirectory = [Environment]::GetFolderPath('Desktop') ; Title = 'Selecciona un archivo a subir' }
if(-not($?)){
    Write-Warning "GUI load error"
    $FileBrowser.FileName = Read-Host "Enter the file path manually"
}
else{
    $null = $FileBrowser.ShowDialog()
}
$filetarget = Get-Item -path $FileBrowser.FileName
$filepath = $FileBrowser.FileName

if(-not($FileBrowser.FileName)){
    clear-host
    Write-Warning "No file selected. Exiting."
    exit
}


write-host "-----------" -ForegroundColor Cyan
$filetarget
write-host "-----------" -ForegroundColor Cyan


write-host "---------------------"
write-host "Estas seguro que quieres subir el archivo?"
$continue = read-host "Escribe [upload] para proceder"
if(-not($continue -eq "upload")){
    write-host "Abortando..."
    break
}
write-host "Uploading $filepath..." -ForegroundColor Cyan

$resultraw = curl.exe -F "file=@$filepath" $url
$result = $resultraw | ConvertFrom-Json
write-host ""

write-host "---------------------"
if($result.status){
    write-host "Subida completada con exito" -ForegroundColor Green
    write-host "---------------------"
    write-host "Link: $($result.data.file.url.full)" -ForegroundColor Cyan
    write-host "---------------------"
    write-host "Informacion extra:"
    write-host "Nombre: $($result.data.file.metadata.name)" -ForegroundColor Cyan
    write-host "Peso: $($result.data.file.metadata.size.readable)" -ForegroundColor Cyan
}
else{
    write-warning "Error al subir el archivo" 
    write-host "---------------------"
    write-host "Informacion extra:"
    write-host "Error: $($result.error.type)" -ForegroundColor Yellow
    write-host "Mensaje: $($result.error.message)" -ForegroundColor Yellow
    write-host "Codigo de error: $($result.error.code)" -ForegroundColor Yellow
}
