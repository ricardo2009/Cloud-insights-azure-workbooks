

## kustoquery abaixo coleta  lista dos cluster com o tipo de mudança, versão anterior e versão atual

```kusto
// Query para coletar lista de clusters AKS com detalhes das mudanças de versão
resourcechanges
| where properties.targetResourceType =~ "microsoft.containerservice/managedclusters"
| extend clusterName = tostring(split(properties.targetResourceId, "/")[-1])
| extend updateTime = todatetime(properties.changeAttributes.timestamp)
| extend changesJson = parse_json(properties.changes)
| extend node_image_version_previous = tostring(changesJson["properties.agentPoolProfiles[0].nodeImageVersion"]["previousValue"])
| extend node_image_version_new = tostring(changesJson["properties.agentPoolProfiles[0].nodeImageVersion"]["newValue"])
| extend kubernetes_version_new = tostring(changesJson["properties.kubernetesVersion"]["newValue"])
| extend kubernetes_version_previous = tostring(changesJson["properties.kubernetesVersion"]["previousValue"])
| extend tipoMudanca = tostring(changesJson["properties.kubernetesVersion"]["changeType"])
| project clusterName, updateTime, node_image_version_previous, node_image_version_new, kubernetes_version_new, kubernetes_version_previous, tipoMudanca
| order by updateTime desc
```