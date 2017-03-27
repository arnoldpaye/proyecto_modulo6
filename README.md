# proyecto_modulo6

## Create backup
```console
mysqldump -u root -p -B concesionario > concesionario.sql
```

## Restore from backup
```console
mysql -u root -p < concesionario.sql
```

