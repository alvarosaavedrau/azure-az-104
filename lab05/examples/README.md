# Ejemplo de aplicación con Ingress usando Application Gateway

Este directorio contiene archivos de ejemplo para desplegar una aplicación de prueba en el cluster AKS con ingress a través del Application Gateway.

## Archivos incluidos

- `app-deployment.yaml`: Deployment de una aplicación nginx de ejemplo
- `app-service.yaml`: Service para exponer la aplicación
- `app-ingress.yaml`: Ingress configurado para usar Application Gateway

## Despliegue de la aplicación de ejemplo

1. Asegúrate de estar conectado al cluster:
```bash
kubectl get nodes
```

2. Despliega la aplicación:
```bash
kubectl apply -f examples/app-deployment.yaml
kubectl apply -f examples/app-service.yaml
kubectl apply -f examples/app-ingress.yaml
```

3. Verifica el estado:
```bash
kubectl get pods
kubectl get svc
kubectl get ingress
```

4. Espera a que el Ingress obtenga una dirección (puede tardar 2-3 minutos):
```bash
kubectl get ingress -w
```

5. Una vez que tengas la IP del Application Gateway, accede a la aplicación:
```bash
curl http://<APPLICATION_GATEWAY_IP>
```

O abre en tu navegador: `http://<APPLICATION_GATEWAY_IP>`

## Verificar el Application Gateway

Puedes verificar que el Application Gateway está correctamente configurado:

```bash
# Ver los backends configurados en el Application Gateway
az network application-gateway show \
  --name <nombre-app-gateway> \
  --resource-group <nombre-rg> \
  --query "backendAddressPools[].backendAddresses"
```

## Limpieza

Para eliminar la aplicación de ejemplo:

```bash
kubectl delete -f examples/
```
