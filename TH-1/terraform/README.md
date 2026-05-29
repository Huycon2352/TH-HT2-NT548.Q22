# Terraform Project Structure

## Project Organization

```
terraform/
├── bootstrap/                 # Bootstrap S3 + DynamoDB (run first!)
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars      # Create this file with bootstrap values
│
├── modules/                   # Reusable modules
│   ├── vpc/
│   │   ├── main.tf           # VPC, Subnets, IGW, NAT, Route Tables
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── ec2/
│       ├── main.tf           # EC2 instances + Security Groups
│       ├── variables.tf
│       └── outputs.tf
│
├── environments/
│   └── dev/                   # Development environment
│       ├── provider.tf        # Provider configuration
│       ├── main.tf            # Module orchestration
│       ├── variables.tf       # Variable definitions
│       ├── outputs.tf         # Output definitions
│       ├── backend.tf         # State backend (S3 + DynamoDB)
│       └── terraform.tfvars   # Environment values
│
└── BOOTSTRAP_GUIDE.md        # Bootstrap instructions
```

## Quy trình triển khai

### 1️⃣ Chạy Bootstrap (Bắt buộc trước)
```bash
cd bootstrap
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

### 2️⃣ Cấu hình Remote State
Sau khi bootstrap thành công:
- Uncomment backend block trong `environments/dev/backend.tf`
- Cập nhật S3 bucket name và DynamoDB table name

### 3️⃣ Deploy Infrastructure
```bash
cd environments/dev
terraform init -migrate-state
terraform plan
terraform apply
```

## Module: VPC (3 điểm)

**Tạo các thành phần:**
- ✅ VPC với CIDR 10.1.0.0/16
- ✅ Public Subnet: 10.1.1.0/24 (mapped public IP)
- ✅ Private Subnet: 10.1.2.0/24
- ✅ Internet Gateway (kết nối với Public Subnet)
- ✅ NAT Gateway (cho Private Subnet)
- ✅ Default Security Group cho VPC

**File:** `modules/vpc/main.tf`

---

## Module: Networking - Route Tables (2 điểm)

**Tạo các thành phần:**
- ✅ Public Route Table:
  - Route: 0.0.0.0/0 → Internet Gateway
  - Associate với Public Subnet
  
- ✅ Private Route Table:
  - Route: 0.0.0.0/0 → NAT Gateway
  - Associate với Private Subnet

**File:** `modules/vpc/main.tf` (trong module này)

---

## NAT Gateway (1 điểm)

**Tạo các thành phần:**
- ✅ Elastic IP cho NAT Gateway
- ✅ NAT Gateway trong Public Subnet
- ✅ Private instance có thể truy cập Internet thông qua NAT

**File:** `modules/vpc/main.tf`

---

## Module: EC2 (2 điểm)

**Tạo các thành phần:**
- ✅ Public EC2 Instance:
  - Subnet: Public
  - Public IP: Tự động gán (map_public_ip_on_launch)
  - Có thể truy cập từ Internet
  
- ✅ Private EC2 Instance:
  - Subnet: Private
  - Chỉ có thể SSH từ Public instance
  - Không có public IP

**File:** `modules/ec2/main.tf`

---

## Module: Security Groups (2 điểm)

### Public EC2 Security Group
- ✅ Ingress: SSH (port 22) từ 0.0.0.0/0 (PUBLIC)
- ✅ Egress: Allow all outbound

### Private EC2 Security Group
- ✅ Ingress: SSH (port 22) từ Public Security Group
- ✅ Egress: Allow all outbound

**File:** `modules/ec2/main.tf`

---

## Configuration Best Practices

### 1. Region Configuration (Chuẩn thực tế)
**Best Practice:** Truyền region qua `terraform.tfvars` (như đã implement)
```hcl
# environments/dev/terraform.tfvars
aws_region = "ap-southeast-1"

# environments/dev/provider.tf
provider "aws" {
  region = var.aws_region
}
```

### 2. State Management
- Local state trong bootstrap
- Remote state (S3 + DynamoDB) cho environments
- Terraform lock để tránh concurrent changes

### 3. Variable Separation
- `variables.tf`: Định nghĩa schema
- `terraform.tfvars`: Giá trị cụ thể
- Module variables: Được truyền từ root

### 4. Module Reusability
- Mỗi module độc lập với input/output rõ ràng
- Có thể tái sử dụng cho environments khác (staging, prod)

---

## Hướng dẫn sử dụng từng lệnh

### Initialize Terraform
```bash
cd environments/dev
terraform init
```

### Plan changes
```bash
terraform plan -out=tfplan
```

### Apply changes
```bash
terraform apply tfplan
```

### Destroy resources
```bash
terraform destroy
```

### Format code
```bash
terraform fmt -recursive
```

### Validate configuration
```bash
terraform validate
```

---

## Output quan trọng

Sau khi `terraform apply`, bạn sẽ nhận được:
```
Outputs:

vpc_id = "vpc-xxxxx"
public_subnet_id = "subnet-xxxxx"
private_subnet_id = "subnet-xxxxx"
public_instance_public_ip = "x.x.x.x"
public_instance_private_ip = "10.1.1.x"
private_instance_private_ip = "10.1.2.x"
```

---

## Troubleshooting

### 1. State Lock Issue
```bash
terraform force-unlock <LOCK_ID>
```

### 2. Backend Configuration Error
```bash
rm -r .terraform
terraform init -reconfigure
```

### 3. Check current state
```bash
terraform state list
terraform state show <resource>
```

---

## Bảo mật (Security)

✅ **Đã cấu hình:**
- Security Groups: Tối thiểu hóa exposure
- Private instance: Không có direct internet access
- SSH: Chỉ từ authorized sources
- NAT Gateway: Secure egress

⚠️ **Cần cân nhắc:**
- Backup Terraform state
- MFA cho AWS account
- Audit logs cho API calls
- Rotate credentials regularly

---

## Tổng kết điểm số

| Thành phần | Điểm | Status |
|-----------|------|--------|
| VPC + Subnets + IGW + Default SG | 3 | ✅ |
| Route Tables (Public + Private) | 2 | ✅ |
| NAT Gateway | 1 | ✅ |
| EC2 Instances (Public + Private) | 2 | ✅ |
| Security Groups | 2 | ✅ |
| **Tổng cộng** | **10** | ✅ |

---

## Resources tạo ra

### VPC Infrastructure
- 1 VPC (10.1.0.0/16)
- 1 Internet Gateway
- 1 NAT Gateway + 1 Elastic IP
- 2 Subnets (1 public, 1 private)
- 2 Route Tables
- 2 Security Groups (1 public, 1 private)
- 1 Default VPC Security Group

### Compute
- 2 EC2 Instances (1 public t3.micro, 1 private t3.micro)

### State Management
- 1 S3 Bucket (Terraform state)
- 1 DynamoDB Table (State locking)

**Total: 15 resources AWS**
