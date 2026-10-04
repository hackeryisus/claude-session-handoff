# Documento de memoria: para quien usa la IA solo en el chat

Si usas Claude en claude.ai o en la app, o ChatGPT en modo chat, no necesitas instalar nada. Este prompt convierte una conversación larga, por larga que sea, en un **Documento de memoria**: un resumen ordenado que pegas en otra conversación para seguir donde ibas.

Sirve porque las conversaciones muy largas se degradan. La herramienta resume o recorta lo viejo para hacer espacio, y la IA empieza a olvidar decisiones. El Documento de memoria guarda lo importante fuera de la conversación, y tú lo llevas a donde quieras: a un chat nuevo, a otro proyecto o a otra herramienta.

## Cómo se usa

1. **Al final de una conversación larga**, pega el contenido completo de [`documento-de-memoria.md`](documento-de-memoria.md). La IA lee toda la conversación y te entrega el documento en un bloque para copiar.
2. **Guarda ese documento** donde quieras (una nota, un archivo de texto, tu gestor de notas).
3. **En la conversación nueva**, pega el documento como primer mensaje y sigue trabajando.
4. **Cuando esa conversación también crezca**, vuelve a pegar el prompt. La IA detecta el documento del inicio y entrega la versión siguiente del mismo documento, con lo nuevo integrado y lo viejo marcado como superado. No te deja dos resúmenes sueltos.

Cada vez que lo invocas, el documento mejora. Es una memoria que viaja contigo.

## Para no tener que pegar el prompt cada vez

- **Proyectos de Claude (claude.ai):** pega el prompt en las instrucciones del proyecto. Después basta con escribir "actualiza la memoria".
- **Proyectos o GPT personalizado de ChatGPT:** pégalo en las instrucciones del proyecto o del GPT. Igual: "actualiza la memoria".
- **Skill en claude.ai (planes Pro, Max, Team y Enterprise):** sube el mismo `.zip` que descargaste (`claude-session-handoff-main.zip`), sin descomprimirlo, en Configuración, sección de Skills. Necesitas tener activada la ejecución de código. La skill incluye este mismo modo y se activa sola cuando dices "documento de memoria" o "actualiza la memoria".

## Consejos

- Si la herramienta ya recortó el principio de la conversación, la IA te lo dirá en la línea de cobertura. Lo que no ve, no lo inventa.
- Si actualizas y la IA no encuentra completo el documento anterior, te pedirá que lo pegues otra vez. Pégalo y repite.
- Revisa la sección "Decisiones tomadas" cada vez. Es lo más valioso y lo que más conviene corregir a mano si algo quedó mal.
