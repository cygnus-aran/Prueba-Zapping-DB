# Base de Datos SQLite para Zapping

Configuración simple de base de datos SQLite con Docker para el proyecto Zapping.

## Instalación

1. **Crear directorio del proyecto:**
   ```bash
   mkdir zapping-database
   cd zapping-database
   ```

2. **Descargar los archivos del proyecto:**
    - Descarga o clona los archivos: `Dockerfile`, `docker-compose.yml`, `init.sql`
    - O cópialos en el directorio `zapping-database/`
   
**Warn: Pasado este punto es necesario tener instalado Docker**

## Inicio Rápido

3. **Iniciar la base de datos:**
   ```bash
   docker-compose up -d
   ```

2. **Verificar que esté funcionando:**
   ```bash
   docker-compose ps
   ```

3. **Acceder a la base de datos:**
   ```bash
   docker-compose exec database sqlite3 /data/zapping.db
   ```

## Operaciones de Base de Datos

### Ver todas las tablas:
```bash
docker-compose exec database sqlite3 /data/zapping.db ".tables"
```

### Ver tabla de usuarios:
```bash
docker-compose exec database sqlite3 /data/zapping.db "SELECT * FROM users;"
```

### Agregar un nuevo usuario:
```bash
docker-compose exec database sqlite3 /data/zapping.db "INSERT INTO users (nombre, email, password) VALUES ('Usuario Nuevo', 'nuevo@ejemplo.com', 'clave123');"
```

### Verificar esquema de la base de datos:
```bash
docker-compose exec database sqlite3 /data/zapping.db ".schema users"
```

## Estructura del Proyecto

Después de la instalación, tu directorio debería verse así:

```
zapping-database/
├── README.md
├── Dockerfile
├── docker-compose.yml
└── init.sql
```

## Archivos

- `Dockerfile` - Configuración del contenedor de base de datos
- `docker-compose.yml` - Orquestación de Docker
- `init.sql` - Esquema de base de datos y datos de prueba
- `README.md` - Este archivo

## Esquema de Base de Datos

```sql
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Comandos de Prueba

```bash
# Iniciar base de datos
docker-compose up -d

# Verificar estado del contenedor
docker-compose ps

# Ver datos de prueba
docker-compose exec database sqlite3 /data/zapping.db "SELECT * FROM users;"

# Detener base de datos
docker-compose down
```

## Persistencia de Datos

El archivo de base de datos se almacena en un volumen Docker llamado `sqlite_data`, por lo que tus datos persistirán incluso cuando los contenedores se reinicien.

## Datos de Prueba Incluidos

La base de datos se inicializa con los siguientes usuarios de ejemplo:

| ID | Nombre | Email | Contraseña |
|----|--------|-------|------------|
| 1 | Test User 1 | test1@example.com | password123 |
| 2 | Test User 2 | test2@example.com | password456 |
| 3 | John Doe | john@example.com | mypassword |

## Resolución de Problemas

### El contenedor no inicia:
```bash
# Ver logs del contenedor
docker-compose logs database
```

### Reiniciar la base de datos:
```bash
# Detener y eliminar contenedores
docker-compose down

# Reconstruir e iniciar
docker-compose up --build -d
```

### Eliminar todos los datos (¡Cuidado!):
```bash
# Esto eliminará todos los datos permanentemente
docker-compose down -v
```