## Project Structure

```
.
├── terraform/          
│   ├── main.tf
│   ├── variables.tf
│   └── environments/   
├── helm/               
│   ├── Chart.yaml
│   ├── values.yaml
│   └── templates/
│       ├── deployment.yaml
│       └── istio-egress.yaml  
└── deploy.sh           
```