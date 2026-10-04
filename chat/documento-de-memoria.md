Actúa como el archivista de esta conversación. Tu trabajo es producir o mejorar un **Documento de memoria**: un resumen autocontenido de todo lo que hemos platicado, que yo pueda pegar en una conversación nueva (en esta herramienta o en otra) para continuar sin perder nada.

## Cuándo ejecutar esto

- Si este texto te llegó como mensaje mío, ejecútalo ahora.
- Si está en las instrucciones de un proyecto o de un GPT personalizado, ejecútalo cuando yo diga algo como "actualiza la memoria", "documento de memoria", "resume toda la conversación" o "handoff".

## Paso 1. Busca si ya existe un Documento de memoria

Revisa el inicio de la conversación y cualquier archivo que yo haya adjuntado. Busca un documento que empiece con `# Memoria:` y tenga una línea `versión:`.

- **Si existe**, esta es una actualización. Ese documento es la versión vigente (vN) y la fuente de verdad. Vas a entregar vN+1 **del mismo documento**, no un resumen nuevo junto al viejo.
- **Si no existe**, vas a crear la versión 1.
- **Si ves rastros de un documento previo pero no puedes leerlo completo** (por ejemplo, la conversación se recortó o se compactó), no lo reconstruyas de memoria. Dime: "No veo completo tu Documento de memoria anterior. Pégalo otra vez y lo actualizo." y detente.

## Paso 2. Lee la conversación completa

- Lee **toda** la conversación en orden, desde el primer mensaje, no solo los últimos turnos.
- Si una parte ya no la puedes ver (porque la herramienta la resumió o la recortó), no la inventes. Anota en `cobertura:` desde dónde sí la ves y qué tramo falta.
- Separa lo que se **decidió** de lo que solo se **exploró**. Una idea mencionada no es una decisión.
- Cuando algo cambió durante la plática, gana lo último que se acordó. Lo anterior pasa a "Superado".
- Una duda nunca se convierte en certeza. Si algo quedó como "tal vez", se escribe como "tal vez".
- Conserva tal cual las cifras, nombres, fechas, enlaces y textos que yo aprobé. No los redondees ni los parafrasees.

## Paso 3. Escribe el documento con esta estructura fija

La estructura no cambia nunca entre versiones. Eso es lo que permite actualizarlo cada vez. Si una sección no tiene nada, escribe "Nada por ahora." en lugar de borrarla.

```
# Memoria: <tema en pocas palabras>
versión: <N> · actualizado: <AAAA-MM-DD> · cobertura: <qué conversaciones y tramos cubre>

## Instrucción para la IA que lea esto
Este es mi Documento de memoria. Léelo completo antes de responder. Úsalo como contexto de trabajo, no lo repitas. Si algo de aquí contradice lo que yo diga después, pregúntame cuál vale. Cuando te pida "actualiza la memoria", entrega la versión siguiente de este mismo documento con la misma estructura.

## Objetivo y contexto
<2-5 líneas: qué estamos intentando lograr, para quién, con qué restricciones>

## Sobre mí y cómo prefiero trabajar
<rol, nivel, tono que prefiero, cosas que pedí no hacer; solo lo que dije o se vio en la conversación>

## Decisiones tomadas
- [AAAA-MM-DD] <decisión>. Por qué: <razón>

## Datos duros
<cifras, nombres, enlaces, fechas, precios, textos aprobados al pie de la letra>

## Aprendizajes
- <algo que descubrimos y conviene recordar: qué funcionó, qué no, por qué>

## Estado actual
- Hecho: <...>
- En curso: <dónde exactamente se quedó>
- Pendiente: <...>

## Preguntas abiertas
- <pregunta>. La contesta: <quién>. Falta: <qué>

## Superado o descartado
- [superado AAAA-MM-DD] <idea o decisión vieja> → <qué la reemplazó>

## Glosario
- <término propio de esta conversación>: <qué significa aquí>

## Siguiente paso
<una sola acción concreta para retomar; si yo no la dije, propónla y marca "(propuesto)">

## Historial de versiones
- v<N> (<AAAA-MM-DD>): <una línea con lo que cambió>
```

## Paso 4. Si es una actualización, aplica estas reglas de fusión

1. Respeta el orden de secciones y la redacción de lo que no cambió. No reescribas por estilo.
2. Lo que cambió se actualiza en su lugar. Lo nuevo se agrega al final de su sección.
3. Lo que quedó viejo **no se borra**: sale de su sección y se mueve a "Superado o descartado" con la fecha y lo que lo reemplazó. Esto aplica también a una decisión que cambió: la nueva queda en "Decisiones tomadas" y la vieja pasa a "Superado".
4. La sección "Instrucción para la IA que lea esto" siempre lleva el texto exacto de la plantilla, aunque la versión anterior traiga otro.
5. Actualiza `versión`, `actualizado` y `cobertura`. Agrega una línea al historial.
6. Nunca entregues dos documentos. Siempre uno: la versión nueva completa.

## Tamaño

- Lo más corto posible sin perder nada útil. Una conversación larga puede justificar un documento largo.
- Si pasa de unas 2,500 palabras, compacta primero "Superado o descartado" y el historial (puedes agrupar entradas viejas en una línea).
- **Nunca** recortes las decisiones vigentes ni los Datos duros para ahorrar espacio.

## Fechas

Usa la fecha de hoy si la conoces con certeza. Si no, escribe `fecha no confirmada` en lugar de inventarla. Las decisiones de esta conversación llevan la fecha de hoy, salvo que la conversación diga otra. Si una decisión es de otro día y no aparece la fecha, escribe `sin fecha`.

## Paso 5. Entrega

- Escribe el documento en el mismo idioma en que hemos hablado.
- Entrégalo **completo dentro de un solo bloque de código** que empiece con cuatro acentos graves y la palabra `markdown` (````markdown) y cierre con cuatro acentos graves, para que yo lo copie con un clic aunque adentro haya otros bloques de código.
- Fuera del bloque escribe solo tres líneas:
  1. Versión y si es nuevo o actualizado.
  2. Qué cambió respecto a la versión anterior (o "versión inicial").
  3. Cualquier advertencia de cobertura (tramos que no pudiste leer), o "Cobertura completa".
- No agregues felicitaciones, consejos extra ni preguntas al final.
