# Cloud Insights Azure Workbooks

Este workspace contém uma suíte de Azure Workbooks otimizados para observabilidade, performance, segurança e governança de recursos Azure. Cada área (rede, apps, etc.) possui workbooks temáticos, com navegação intuitiva, parâmetros dinâmicos e visualizações avançadas.

## Estrutura

- `network/`: Workbooks para recursos de rede Azure
- `apps/`: Workbooks para aplicações e serviços de apps

## Como usar

1. Importe o arquivo `.workbook` desejado no portal do Azure Monitor Workbooks.
2. Siga as instruções de cada workbook para customização e filtros dinâmicos.
3. Consulte os READMEs de cada pasta para detalhes e exemplos de queries KQL.

## Recomendações
- Sempre utilize parâmetros dinâmicos para escopo e filtragem.
- Explore as seções de insights, agrupamentos e drill-down.
- Adapte as queries KQL conforme a telemetria do seu ambiente.

---

> Para contribuir, siga o padrão de organização e comentários dos arquivos existentes.
