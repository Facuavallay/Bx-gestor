---
name: State Preservation
description: Considerar el proyecto actual como ESTADO INMUTABLE salvo orden explícita.
---

# State Preservation

## Objetivo
Proteger la integridad del proyecto existente.

## Reglas
1. **Cero Daño**: No romper lo que ya funciona.
2. **Add-Only**: Preferir agregar nuevos archivos/módulos sobre modificar los existentes agresivamente.
3. **Backup/Reversibilidad**: Preparar siempre un camino de retorno antes de cambios arriesgados.
4. **Explícita**: Pedir permiso antes de modificaciones estructurales.
