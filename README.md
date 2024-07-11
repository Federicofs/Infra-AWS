# Infra-AWS# Proyecto integrador
**Instalación:**
Debe tener *terraform* para poder ejecutar el proyecto

![](https://github.com/Federicofs/Infra-AWS/blob/Dev/Diagrama%20VPC.png)

### Explicación
#### IaaS
IaaS es un modelo de servicio en la nube que ofrece recursos de infraestructura bajo demanda, como computación, almacenamiento, redes y virtualización, en este caso se usó el servicio de AWS.
 El proyecto está compuesto con una VPC en 3 availability zones para alta disponibilidad, con 2 subnet (pública y privada) en cada una con un EC2.
El EC2 que se aloja en la subnet pública funcionará como un balanceador de carga que enlazara a la aplicación que está en la subnet privada.

#### IaaC
 La infraestructura como código (IaC) permite gestionar y preparar la infraestructura a través del código, en lugar de hacerlo mediante procesos manuales. con este método garantizar siempre preparar con el mismo entorno 
se usó Terraform como IaaS, configuramos los módulos de EC2, VPC y SG proporcionados por el mismo, cada servicio está separado en diferentes directorios, también con el archivo outputs que está dentro de cada directorio, interactúan entre sí para obtener los valores necesario para cada el script. Por último el archivo variable.tf está para configurar los nombres y el key pair.

#### Docker y Kubernetes
Docker es una tecnología de contenedores que permite empaquetar y aislar las aplicaciones junto con todo el entorno de ejecución. Esto permite mover la aplicación que se encuentra dentro del contenedor entre los entornos (de desarrollo, de prueba, de producción, etc.), sin perder ninguna de sus funciones, para complementar esta herramienta se usó kubernetes  que orquesta la infraestructura de cómputo para que las cargas de trabajo de los usuarios no tengan que hacerlo. Esto ofrece la simplicidad de las Plataformas como Servicio (PaaS) con la flexibilidad de la Infraestructura como Servicio (IaaS) y permite la portabilidad entre proveedores de infraestructura.

#### CI/CD
CI/CD es la sigla para la integración y la distribución o implementación continuas,
CI es una práctica que consiste en incorporar los cambios de código a un repositorio compartido de código fuente de forma automática y periódica. CD es un proceso de dos partes en el que se integran, prueban y distribuyen los cambios de código. Mientras que en la distribución los cambios no se llegan a implementar en la producción de forma automatizada, en la implementación sí se lanzan las actualizaciones en este entorno automáticamente.

Jenkins fue la herramienta de CI para el proyecto donde se implementó las diferentes etapas del ciclo de vida del desarrollo, como la compilación, el testeo y el despliegue.
y con ArgoCD nos permite simplifica la gestión de la infraestructura y las aplicaciones en clústeres de Kubernetes al automatizar la sincronización del estado deseado con las definiciones almacenadas en repositorios de Git.
