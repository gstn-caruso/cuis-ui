# Setup

## 1. Qué asumir

- La imagen Cuis ya está levantada.
- El acceso se hace con los tools MCP de `cuis-mcp`.
- Este directorio funciona como base documental, no como fuente principal del código.

## 2. Verificación mínima

Usar estas comprobaciones al empezar una sesión:

```smalltalk
1 + 2
```

```smalltalk
Morph allSubclasses size
```

```smalltalk
Sample01Cross new openInWorld
```

## 3. Flujo de trabajo recomendado

1. Buscar una clase cercana a lo que querés construir.
2. Leer su comportamiento con `browse-class` y `read-method-source`.
3. Prototipar una instancia con `eval`.
4. Crear una subclase si el comportamiento ya dejó de ser ad hoc.
5. Compilar métodos en protocolos claros.
6. Si el cambio importa, persistirlo como paquete.

## 4. Plantillas útiles

### Crear una clase

```smalltalk
Morph subclass: #CuisUISampleMorph
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'CuisUI-Playground'.
```

### Dibujar algo simple

```smalltalk
CuisUISampleMorph >> drawOn: aCanvas [
    aCanvas fillRectangle: (0@0 extent: 140@60) color: Color orange.
]
```

### Abrirlo en pantalla

```smalltalk
m := CuisUISampleMorph new.
m morphExtent: 140@60.
m openInWorld.
```

## 5. Notas operativas

- `Morph` no maneja posición propia; para geometría conviene revisar `PlacedMorph` y sus subclases.
- Para layouts, empezar por `LinearLayoutMorph`.
- Para ventanas, usar `SystemWindow`.
- Para interacción rápida sin subclase, se pueden usar properties con bloques.

## 6. Fuente base

La referencia original que dejó el trabajo previo está en [CLAUDE.md](/Users/gaston/Code/cuis-ui/CLAUDE.md).

