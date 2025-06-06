$sourceFile = 'c:\Users\ricardolima\OneDrive - Microsoft\Desktop-bckpother\repositorios_github\Cloud-insights-azure-workbooks\cloud\Workbook_Futurist_Central.workbook'
$destFile = 'c:\Users\ricardolima\OneDrive - Microsoft\Desktop-bckpother\repositorios_github\Cloud-insights-azure-workbooks\cloud\Workbook_Futurist_Central.workbook.fixed3'

# Lendo o conteúdo do arquivo
Write-Host "Lendo arquivo..."
$content = Get-Content -Raw -Path $sourceFile

# Procurando linhas com quebras indevidas
Write-Host "Examinando a área problemática..."
$problemArea = $content.Substring(77300, 100)
Write-Host "Área problemática:"
Write-Host $problemArea

# Examinamos o arquivo para ver se o problema ocorre em linhas específicas
Write-Host "Verificando o caractere na posição 77329..."
$charAtPos = $content[77329]
Write-Host "Caractere na posição 77329: $charAtPos (ASCII: $([int][char]$charAtPos))"

# Verificar se há aspas simples em atributos HTML
Write-Host "Substituindo atributos HTML com aspas simples por aspas duplas escapadas..."

# Lista de padrões de atributos HTML comuns com aspas simples
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
    "onclick='([^']+)'"
    "name='([^']+)'"
    "value='([^']+)'"
    "rel='([^']+)'"
    "type='([^']+)'"
    "placeholder='([^']+)'"
    "aria-label='([^']+)'"
    "data-\w+='([^']+)'"
)

foreach ($pattern in $patterns) {
    Write-Host "Aplicando padrão: $pattern"
    $originalContent = $content
    $content = $content -replace $pattern, '$1=\"$2\"'
    $replacementCount = ($originalContent -ne $content).Count
    Write-Host "  - Substituições realizadas: $replacementCount"
}

# Salvar o conteúdo modificado
Write-Host "Salvando arquivo corrigido..."
Set-Content -Path $destFile -Value $content -NoNewline

# Verificar se o JSON é válido
Write-Host "Verificando se o JSON é válido..."
try {
    $json = Get-Content -Raw $destFile | ConvertFrom-Json
    Write-Host "O JSON foi validado com sucesso!"
} catch {
    Write-Host "Erro ao validar o JSON:"
    Write-Host $_.Exception.Message
    
    # Tentar localizar o erro exato
    if ($_.Exception.Message -match "position (\d+)") {
        $errorPos = [int]$matches[1]
        Write-Host "Erro na posição: $errorPos"
        Write-Host "Contexto do erro:"
        Write-Host $content.Substring($errorPos - 20, 40)
    }
}
