$sourceFile = 'c:\Users\ricardolima\OneDrive - Microsoft\Desktop-bckpother\repositorios_github\Cloud-insights-azure-workbooks\cloud\Workbook_Futurist_Central.workbook'
$destFile = 'c:\Users\ricardolima\OneDrive - Microsoft\Desktop-bckpother\repositorios_github\Cloud-insights-azure-workbooks\cloud\Workbook_Futurist_Central.workbook.fixed2'

# Lendo o conteúdo do arquivo
$content = Get-Content -Raw $sourceFile
Write-Host 'Arquivo lido com sucesso. Iniciando substituições...'

# Substituir atributos HTML com aspas simples por aspas duplas escapadas
$patterns = @(
    "href='([^']+)'"
    "target='([^']+)'"
    "style='([^']+)'"
    "class='([^']+)'"
    "id='([^']+)'"
    "alt='([^']+)'"
    "title='([^']+)'"
    "src='([^']+)'"
    "width='([^']+)'"
    "height='([^']+)'"
)

foreach ($pattern in $patterns) {
    Write-Host "Processando padrão: $pattern"
    if ($pattern -match "([^=]+)='([^']+)'") {
        $attr = $matches[1]
        $content = $content -replace $pattern, ($attr + '=\"$1\"')
    }
}

# Salvar o conteúdo modificado
Set-Content -Path $destFile -Value $content -NoNewline
Write-Host 'Substituições de atributos HTML concluídas'

# Verificar se o JSON é válido
try {
    $json = Get-Content -Raw $destFile | ConvertFrom-Json
    Write-Host 'O JSON foi validado com sucesso!'
} catch {
    Write-Host 'Erro ao validar o JSON:'
    Write-Host $_.Exception.Message
}
