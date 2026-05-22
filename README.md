# Evidencia Demonstración de un Paradigma de Programación
Joel Guadalupe García Guzmán - A01713785
## Descripción del problema escogido
Para esta entrega nos piden escoger algún problema para demostrar diferentes paradigmas de programación que hemos visto a lo largo del curso, por lo que voy a resolver un problema de Leetcode, específicamente el problema <a href="https://leetcode.com/problems/house-robber-iii"/> 337. House Robber III</a>, el cual nos dice lo siguiente:

> The thief has found himself a new place for his thievery again. There is only one entrance to this area, called root.
>
> Besides the root, each house has one and only one parent house. After a tour, the smart thief realized that all houses in this place form a binary tree. It will automatically contact the police if two directly-linked houses were broken into on the same night.
>
> Given the root of the binary tree, return the maximum amount of money the thief can rob without alerting the police.

(LeetCode, s.f.)

Entonces, lo que tenemos que hacer para este problema es, primeramente, recorrer la estructura del árbol y tomar una decisión para robar la mayor cantidad de casas posibles. Para cada casa (nodo), existen dos posibles escenarios:  

- Robar la casa actual: Esto hace que obtengamos el valor total de la casa, con la desventaja que nos impide robar a sus vecinos inmediatos (sus hijos).

- No robar la casa actual: Esto hace que no robemos nada de la casa, pero que sí tengamos la posibilidad de robar a sus vecinos inmediatos (sus hijos).

Esta aproximación demuestra que el problema no puede resolverse utilizando un enfoque completamente greedy, ya que tomar la decisión aparentemente óptima en el presente (robar la casa actual siempre que tenga mucho dinero) puede bloquear opciones que al final del recorrido nos otorgarían más dinero. Por lo tanto, el problema exhibe una propiedad de subestructura óptima, donde la solución global requiere evaluar todos los estados futuros para poder seleccionar una estrategia desde el inicio.

## Paradigmas a usar en las soluciones
Las 2 posibles soluciones que voy a implementar y describir las voy a llamar solución A y solución B, la solución **A** va a ser la que sí implemente, esta la voy a hacer usando el paradigma de **programación funcional**, y voy a usar el lenguaje de Racket, basado en Scheme.
Mientras que para la solución **B**, solamente voy a describir el cómo se podría implementar en el paradigma **concurrente**. Por lo que, al no implementarlo, solamente voy a describirlo sin usar ningún lenguaje de programación.

### Programación funcional
La programación funcional viene muy estrechamente desde las matemáticas, pues se basa en las funciones, en que le damos una entrada 'input' y al final obtenemos una salida 'output', no nos importa lo que pase dentro, el autor Kenneth Louden lo describe como una "Black box for obtaining output from the input".

Algo igualmente interesante es que en el paradigma de programación funcional eliminamos el concepto de variables, solamente nos quedamos con constantes, parámetros y valores.
En este paradigma tomamos las funciones como objetos, que funcionen tanto como funciones como parámetros, por lo que va a ser común el pasar como parámetro una función, algo bastante inusual si lo vemos desde la perspectiva de la programación orientada a objetos.

Las principales ventajas de este paradigma de programación es que nos evitamos el manejo de memoria, pues ocurre automáticamente, semántica máss simple, y el evitarnos efectos secundarios que puedan ocurrir al momento de correr los programas.

### Programación concurrente
Este paradigma se aleja de la ejecución secuencial tradicional, donde una instrucción debe terminar para que la siguiente comience, y en su lugar se basa en ejecutar varias tareas el mismo tiempo. El autor David Watt describe la programación concurrente como un paradigma que se enfoca en sistemas formados por múltiples procesos independientes que se ejecutan al mismo tiempo y que, ocasionalmente, necesitan interactuar entre sí.

Algo fundamental en este paradigma es el concepto de dividir el trabajo. En lugar de tener un solo flujo de control (un solo hilo) resolviendo todo el problema de inicio a fin, el programa se divide en sub-tareas que pueden progresar al mismo tiempo. Sin embargo, a diferencia de la programación funcional que evita los estados mutables, la concurrencia introduce el reto de los recursos compartidos. Al tener múltiples procesos ejecutándose a la vez, tenemos que considerar lo siguiente, si queremos hacer varias tareas al mismo tiempo, tenemos que tener una estructura bastante clara de el cómo queremos dividir las tareas.

Las principales ventajas de este paradigma son una utilización mucho más eficiente del hardware moderno (aprovechando los procesadores multinúcleo), la capacidad de modelar sistemas del mundo real donde los eventos ocurren simultáneamente, y una reducción drástica en el tiempo de ejecución (Speed Up) para problemas que pueden fragmentarse utilizando el principio de "divide y vencerás".

La principal desventaja es la sobrecarga (overhead) de comunicación y organización. Existe un costo agregado en preparar los hilos, transferir los datos entre distintas unidades de procesamiento (del CPU al GPU) y volver a ensamblar los resultados. Si el problema no es lo suficientemente grande o complejo, este tiempo invertido en organizar y comunicar las tareas puede llegar a ser mayor que el tiempo que se ahorra al ejecutarlas paralelamente.

## Ahora si la programación

## Bibliografía
LeetCode. (s.f.). House robber III. Recuperado el 21 de mayo de 2026, de https://leetcode.com/problems/house-robber-iii/description/

Louden K. (2003) *Functional Programming (p. 471)* en *Programming Languajes Principles and Practice* (2da edición) editorial Thomson

Watt D. (1990) *The Functional Programming Paradigm(p. 230)* & *Concurrent Programming Paradigm (p. 205)* en *Programming Languaje Concepts and Paradigms* (1ra edición) editorial Prentice Hall International