

Criar milestone sobre:

- Implementação do aumento de maquinas no cluster do Silce-prd e da troca da familia de maquinas para a nova familia de maquinas do Silce-prd.
 O cluster antes tinha: "4 Maquinas "Standard_D4ds_v5" (4vCore/8GB) como mínimo podendo ser escalado ate 18 maquinas (9 por Node)
- O cluster agora terá: min 3 e max 9 Nodes nos Nodepool System e Workload e Size 8vCore/16GB

Banco de Dados que estava Como General Purpose Serverless para Hyperscale Provisioned com HA e AZ. E configuramos autoscale no Service Bus que estava sem.