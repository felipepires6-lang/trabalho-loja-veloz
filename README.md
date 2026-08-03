#  Projeto Pedidos Veloz - Cloud DevOps Strategy
> Trabalho de Conclusão - Engenharia Cloud DevOps (UniFECAF)

Este repositório contém a solução fim a fim para a modernização da plataforma da **Loja Veloz**, migrando um ambiente fragmentado para uma arquitetura cloud-native escalável, resiliente e totalmente monitorada.


---

##  1. Como Executar o Ambiente Local (Docker Compose)
Para rodar toda a arquitetura de microsserviços localmente com um único comando, siga os passos:

1. Acesse a pasta do ambiente local:
   ```bash
   cd local-env
   ```
2. Execute o comando para subir os serviços em segundo plano:
   ```bash
   docker-compose up -d
   ```
3. Para validar se os contêineres estão rodando:
   ```bash
   docker ps
   ```

---

##  2. Arquitetura Kubernetes (Produção)
Os manifestos de produção estão localizados na pasta `/k8s-manifests` e cobrem:
*   **Deployments & Services:** Alta disponibilidade para os microsserviços.
*   **Segurança:** Uso de `Secrets` e `ConfigMaps` para proteção de credenciais.
*   **Escalabilidade:** Configuração de `HPA` para suportar picos de tráfego na campanha promocional.

---

##  3. Pipeline de CI/CD (Automação)
O pipeline foi construído utilizando o **GitHub Actions** (`.github/workflows/pipeline.yml`), cobrindo as seguintes etapas automatizadas:
1.  **Validation:** Execução de Lint e Testes Unitários.
2.  **Build & Push:** Construção de imagens Docker enxutas (Multi-stage) e publicação no Docker Hub.

---

## 📊 4. Observabilidade e Resiliência
*   **Métricas & Logs:** Proposta conceitual utilizando Prometheus e Grafana.
*   **Estratégia de Deploy:** Adotado o modelo **Canary Deployment** para mitigar riscos de indisponibilidade em produção.
