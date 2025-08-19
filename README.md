# AWS Secure Foundation – VPC + IAM + Audit

## Why This Matters
- Provides a production-style **secure AWS baseline** to reuse for future projects.  
- Reduces risks from **public exposure, weak IAM practices, and lack of monitoring**.  
- Mirrors real **cloud security job tasks**: IAM least privilege, audit trails, threat detection.  

## Architecture Summary
This project provisions a secure AWS foundation using **Terraform**:  
- VPC with public + private subnets, Internet Gateway (IGW), NAT Gateway.  
- EC2 instance in private subnet with **SSM Session Manager access** (no SSH).  
- IAM roles/policies for EC2 + SSM.  
- CloudTrail (org trail), GuardDuty, Config, Security Hub.  
- Root account hardening (block root access keys).  

**Data/Log Flow:**  
- EC2 system logs → CloudWatch.  
- AWS API calls → CloudTrail → S3/CloudWatch.  
- Threat findings → GuardDuty → Security Hub.  

## Prereqs
- AWS Account with IAM admin user (not root).  
- Tools installed: Terraform, AWS CLI v2, Git.  

## Repo Structure
```text
aws-secure-foundation/
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── README.md
├── diagrams/
└── evidence/
```

## Implementation (Step by Step)
We will document each phase with code, commands, and explanations.  

1. **Phase 1 – Prereqs:** IAM user, CLI config, Terraform setup ✅  
2. **Phase 2 – VPC:** Public/private subnets, NAT, routing.  
3. **Phase 3 – EC2 + SSM:** Private subnet EC2 with Session Manager.  
4. **Phase 4 – Audit Services:** CloudTrail, GuardDuty, Config, Security Hub.  
5. **Phase 5 – IAM Hardening:** Least privilege, block root keys.  
6. **Phase 6 – Security Hardening:** NACLs, SGs, KMS CMKs, SCPs.  

Each step will include:  
- **Terraform code**  
- **Explanation (line by line)**  
- **Validation commands**  
- **Evidence (screenshots/logs)**  

## Validation & Evidence
- AWS CLI queries, Console screenshots.  
- CloudTrail logs proving API events.  
- GuardDuty findings screenshots.  
- Session Manager proof of EC2 access (no SSH).  

## Security Hardening
- Use **KMS CMK** for S3 encryption.  
- Enforce **SSM Session Manager** (disable SSH).  
- **SCPs** to restrict risky actions.  
- Block root access keys.  
- Centralize logging.  

## Cleanup
- `terraform destroy` to tear everything down.  
- Validate no stray resources left (check VPC, IAM roles, CloudTrail).  

## Extensions (Next Runs)
- Add AWS Config rules.  
- Add OPA/Policy-as-Code.  
- Extend detection rules in GuardDuty.  
- Add multi-account SCP governance.  

## Reflection
(To be filled after completion)  
- Key lessons, tradeoffs, how this maps to SOC/IAM/Cloud Security roles.  
