---
name: Constraint-Driven Generation
description: Respetar límites y reglas explícitas antes de generar soluciones.
---

# Constraint-Driven Generation

## Objetivo
La generación de código y soluciones debe estar restringida por las reglas del proyecto y del usuario.

## Reglas
1. **Inmutabilidad**: El estado actual es sagrado. No modificar sin permiso explícito.
2. **Respeto de Reglas**: Las reglas de "No Programador", "Español", etc. tienen prioridad sobre cualquier "mejor práctica" genérica.
3. **Validación Previa**: Verificar que la solución propuesta no viole restricciones antes de implementarla.
