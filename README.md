#### Descripción de la práctica

Esta práctica consiste en la implementación de una infraestructura en la nube utilizando Amazon Web Services (AWS) y Terraform. En particular, se configura un sitio web estático alojado en un bucket de S3, y se asegura su accesibilidad mediante políticas de acceso y configuraciones necesarias para su despliegue y funcionamiento automatizado.

#### Objetivos

- Crear y gestionar un bucket S3 en AWS.
- Configurar un sitio web estático en el bucket S3.
- Aplicar políticas de acceso para permitir que el sitio sea accesible públicamente.
- Utilizar Terraform para automatizar la infraestructura y la configuración del bucket S3.

#### Requisitos

Antes de comenzar con la implementación, asegúrate de tener lo siguiente:

- **AWS Account**: Una cuenta activa en [AWS](https://aws.amazon.com/es/)
- **Terraform**: Instalar [Terraform](https://developer.hashicorp.com/terraform/install)
- **AWS CLI**: Instalar y configurar el AWS CLI con las credenciales de acceso.

#### Estructura de Archivos
El proyecto está compuesto por varios archivos Terraform y recursos estáticos para configurar e implementar la infraestructura. A continuación, se describe la estructura de archivos y su propósito:

```bash
practica-aws-ramonmeza/
├── main.tf            # Archivo principal de configuración de Terraform, define la infraestructura en AWS (S3, políticas de acceso, etc.)
├── outputs.tf         # Define los outputs de Terraform, como la URL del bucket S3 donde se aloja el sitio web.
├── terraform.tf       # Configuración básica de Terraform, como la inicialización de proveedores y la versión de Terraform.
├── terraform.tfvars   # Archivo de variables donde se definen parámetros específicos como el nombre del bucket y la sensibilidad.
├── variables.tf       # Archivo donde se definen las variables utilizadas en Terraform, como 'bucket_name' y 'sensitivity'.
├── index.html         # Página principal del sitio web estático (HTML).
├── error.html         # Página de error para el sitio web estático.
└── style.css          # Estilos CSS para el sitio web estático.

```
### Procedimiento

### 1. Preparación del Proyecto

Clona este repositorio en tu máquina local o crea un directorio donde trabajarás.

  ```bash
 git clone https://github.com/KeepCodingCloudDevops11/Practica-del-modulo-AWS-Ramon-Meza.git
   ```
### 2. Configuración de Terraform
En este paso, nos aseguraremos de que todo esté configurado correctamente para utilizar Terraform con AWS, además de detallar la función de los archivos relevantes para la configuración de la infraestructura. 

### 3. Desplegar la Infraestructura

#### Inicializa el proyecto de Terraform:

Inicializa el directorio de trabajo de Terraform, lo que descargará los proveedores necesarios y preparará el entorno:

```bash
terraform init
```
#### Validar la configuración de Terraform:

Ejecuta el siguiente comando para validar que tu configuración de Terraform es correcta antes de aplicar cualquier cambio:

```bash
terraform validate
```
Este comando verifica que la sintaxis de los archivos .tf sea correcta y que no haya errores en la configuración.

#### Planificar la implementación:

Luego, crea un plan de ejecución que te mostrará qué cambios se realizarán en la infraestructura de AWS. Esto te permitirá revisar antes de aplicar cualquier cambio:

```bash
terraform plan
```
El comando plan te muestra qué recursos serán creados, modificados o eliminados.

#### Aplicar la configuración:

Una vez que hayas validado y revisado el plan de ejecución, aplica los cambios para crear la infraestructura en AWS:

```bash
terraform apply
```
Terraform te pedirá confirmación para aplicar los cambios. Escribe **yes** para continuar con la implementación.

#### Acceder al Sitio Web
Una vez que Terraform complete la implementación, podrás acceder al sitio web estático alojado en el bucket S3. La URL de acceso se generará automáticamente y se mostrará en el archivo outputs.tf
Haciendo clic en la URL generada (CMD+click en macOS o el equivalente en otros sistemas) para abrir el sitio en tu navegador.

#### Finalizar el Despliegue
Si deseas eliminar todos los recursos creados durante el proceso de despliegue y finalizar la infraestructura, puedes ejecutar el siguiente comando:

```bash
terraform destroy
```


