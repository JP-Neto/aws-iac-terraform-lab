# 🚀 Projeto: Infraestrutura AWS com Terraform – Ambiente Isolado por Camadas

Este projeto demonstra o provisionamento completo de uma infraestrutura na **AWS utilizando Terraform**, com separação por camadas (DMZ, APP, BD), foco em **segurança**, **modularidade**, **balanceamento de carga** e **armazenamento seguro** via S3.

---

## 📁 Estrutura do Projeto

```bash
.
├── Aplicacao/                   # EC2 Linux/Windows + Load Balancer
│   ├── loadBalanced.tf
│   ├── outputs.tf
│   ├── variables.tf
│   ├── vm_linux.tf
│   └── vm_windows.tf
│
├── Armazenamento/               # S3 privado com políticas restritivas
│   ├── policy.tf
│   ├── s3.tf
│   └── variables.tf
│
├── Conectividade/              # VPC, Subnets, Route Tables, SGs
│   ├── gateway.tf
│   ├── outputs.tf
│   ├── route_table.tf
│   ├── securityGroup.tf
│   ├── subnet_private.tf
│   ├── subnet_public.tf
│   ├── variables.tf
│   └── vpc.tf
│
├── main.tf                     # Entrada principal
├── variables.tf                # Variáveis globais
├── terraform.tfvars            # Valores atribuídos às variáveis
├── terraform.tfstate           # Estado da infraestrutura
├── terraform.tfstate.backup    # Backup do estado
└── private_ip.txt              # IPs privados exportados (opcional)
```

---

## ✅ Objetivos do Projeto

### 🔹 Infraestrutura

- Criar uma **VPC personalizada** com **3 subnets** em AZs distintas:
  - `DMZ` – com acesso público
  - `APP` – camada de aplicação
  - `BD` – camada de banco de dados

- Provisionar **4 instâncias EC2**:
  - `1x Linux (DMZ)` com IP público
  - `2x na camada APP` (1x Linux + 1x Windows)
  - `1x Linux (BD)` com IP privado

- Cada EC2 com **Security Group próprio** com regras mínimas:

| Instância  | Acesso Permitido                                  |
|------------|---------------------------------------------------|
| EC2 DMZ    | Porta **22 (SSH)** acessível de **qualquer IP**   |
| EC2 APP    | **SSH (Linux)** ou **RDP (Windows)** apenas da DMZ |
| EC2 BD     | Porta **12555** apenas da **EC2 Linux da APP**    |

---

### 🔹 Balanceador de Carga

- Criar um **Application Load Balancer (ALB)**:
  - Listener na porta **80 (HTTP)**
  - Target Group com instâncias da camada APP

---

### 🔹 Armazenamento Seguro

- Criar um **bucket S3 privado**, com:
  - Política que permite acesso **exclusivo** às instâncias EC2
  - Regra `"ObjectWriter"` (apenas upload permitido)
  - **Bloqueio total de acesso público**

---

## ▶️ Como Executar

```bash
# Inicializa os módulos e plugins do Terraform
terraform init

# Visualiza os recursos que serão criados
terraform plan

# Aplica as configurações e provisiona a infraestrutura
terraform apply
```

---

## 📌 Pré-requisitos

- Terraform >= 1.3
- Conta AWS com permissões:
  - `EC2FullAccess`
  - `S3FullAccess`
  - `VPCFullAccess`
  - `IAMPassRole`
- Credenciais AWS configuradas (`~/.aws/credentials` ou variáveis de ambiente)

---

## 🧭 Topologia da Arquitetura

*(Esta seção será preenchida futuramente com um diagrama visual do ambiente provisionado.)*

---

## 📄 Licença

Projeto pessoal com fins educacionais e demonstrativos.
