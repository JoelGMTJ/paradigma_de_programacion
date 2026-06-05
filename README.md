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
La programación funcional viene muy estrechamente desde las matemáticas, pues se basa en las funciones, en que le damos una entrada 'input' y al final obtenemos una salida 'output', no nos importa lo que pase dentro, el autor Kenneth Louden lo describe como una "Black box for obtaining output from the input". (Kenneth Louden 2003, p. 471)

Algo igualmente interesante es que en el paradigma de programación funcional eliminamos el concepto de variables, solamente nos quedamos con constantes, parámetros y valores.
En este paradigma tomamos las funciones como objetos, que funcionen tanto como funciones como parámetros, por lo que va a ser común el pasar como parámetro una función, algo bastante inusual si lo vemos desde la perspectiva de la programación orientada a objetos.

Las principales ventajas de este paradigma de programación es que nos evitamos el manejo de memoria, pues ocurre automáticamente, semántica máss simple, y el evitarnos efectos secundarios que puedan ocurrir al momento de correr los programas.

### Programación concurrente
Este paradigma se aleja de la ejecución secuencial tradicional, donde una instrucción debe terminar para que la siguiente comience, y en su lugar se basa en ejecutar varias tareas el mismo tiempo. El autor David Watt (1990) describe la programación concurrente como un paradigma que se enfoca en sistemas formados por múltiples procesos independientes que se ejecutan al mismo tiempo y que, ocasionalmente, necesitan interactuar entre sí.

Algo fundamental en este paradigma es el concepto de dividir el trabajo. En lugar de tener un solo flujo de control (un solo hilo) resolviendo todo el problema de inicio a fin, el programa se divide en sub-tareas que pueden progresar al mismo tiempo. Sin embargo, a diferencia de la programación funcional que evita los estados mutables, la concurrencia introduce el reto de los recursos compartidos. Al tener múltiples procesos ejecutándose a la vez, tenemos que considerar lo siguiente, si queremos hacer varias tareas al mismo tiempo, tenemos que tener una estructura bastante clara de el cómo queremos dividir las tareas.

Las principales ventajas de este paradigma son una utilización mucho más eficiente del hardware moderno (aprovechando los procesadores multinúcleo), la capacidad de modelar sistemas del mundo real donde los eventos ocurren simultáneamente, y una reducción drástica en el tiempo de ejecución (Speed Up) para problemas que pueden fragmentarse utilizando el principio de "divide y vencerás".

La principal desventaja es la sobrecarga (overhead) de comunicación y organización. Existe un costo agregado en preparar los hilos, transferir los datos entre distintas unidades de procesamiento (del CPU al GPU) y volver a ensamblar los resultados. Si el problema no es lo suficientemente grande o complejo, este tiempo invertido en organizar y comunicar las tareas puede llegar a ser mayor que el tiempo que se ahorra al ejecutarlas paralelamente.

## Solución A
Como he usado el lenguaje Racket, para correr el código es necesario tener instalado el compilador de Racket, con este podemos correr el código y observar los resultados.

TO-DO MENCIONAR QUE SE PUEDE CORRER DIRECTAMENTE EN LEETCODE

### Lógica de la Solución
Como implementé mi lógica es con un DFS, la cual siempre te va a devolver una lista con 2 valores, uno en el que sí robas la casa actual y otro en el que no. El caso base de esta función es que llegues al final y el nodo no exista, en cual caso vamos a agregarle 0 a ambos valores.
También usamos el **match-let** para desestructurar los valores que nos regresa el DFS. Esta función de match-let funciona usando *pattern-matching*, la cual nos ayuda a almacenarlos en identificadores (los cuales funcionan similar a variables, pero siendo inmutables  y siendo locales) y con esto las podremos usar a nuestra conveniencia.

Luego en los identificadores de rob-this y not-rob-this les vamos a sumar los valores previos, pero cada uno funciona ligeramente diferente.
Para rob-this, es imposible robar a sus hijos, por lo que nos vemos obligados a sumarle el resultado de NO robar a sus hijos.
Ahora, para not-rob-this es ligeramente diferente, en que podemos tomar la decisión de usar los valores que robamos a sus hijos o no, por lo que vamos a tomar el máximo de estas 2 opciones, así garantizando que podamos tomar patrones ligeramente inusuales para robar lo más posible.

Luego ya fuera de la función DFS, solamente vamos a regresar el valor más grande de los 2. Con esto resolvemos el problema y hacemos lo que nos pide Leetcode, regresar la mayor cantidad de dinero que podríamos robar.

Con esto logramos ver que nuestra solución aprovecha las ventajas de la programación funcional, y no tiene variables mutables, sino que toda la información la estamos pasando mediante las funciones, dejando el código más limpio y sin usar ciclos ni variables globales.

### Explicación con diagramas
![Árbol del problema ](/images/emptyTree.png)
Aquí podemos ver una representación del árbol con el que estaremos trabajando. Es el del caso de prueba 6.
A continuación explicaré paso a paso como se vería la solución de mi problema.

![Zoom en hojas de árbol](/images/leftmostCloseup.png)
Primero nos vamos a centrar en las hojas que están hasta la izquierda de nuestro árbol. Las cajas que se encuentran debajo nos dirán que valores tiene cada nodo en caso de
1) Sí robarlo
2) No robarlo

Los nodos que contienen el 2 y el 9 son hojas, entonces no tienen que considerar a nadie más, pero su padre, el nodo 3 tiene que considerar a sus 2 hijos.
La forma de verlo es la siguiente, si vamos a robarlo, es imposible robar a sus hijos, por lo que nos vamos a quedar con el **valor del nodo actual '3'** y el valor de **not-rob** de su hijo izquierdo y derecho.
En cambio si decidimos NO robarlo, vamos a quedarnos SIN el valor del nodo actual, y con el valor mayor de sus hijos, puede ser tanto el 'rob-this' o 'not-rob-this', es independiente para cada hijo.
Por lo que si decidimos robar al nodo 3, solamente nos vamos a poder quedar con su valor más los valores de not-rob-this de sus hijos $3 + 0 + 0 = 3$.
Pero si decidimos no robarlo nos quedaremos sin su valor actual, pero con el mayor de cada una de las opciones de sus hijos $max(2,0) + max(9,0)$ -> $2 + 9 = 11$.

Esto el programa lo va a realizar para cada uno de los nodos y vamos a ir del mismo orden, de abajo hacia arriba (bottom-up).

![Árbol con todos los valores de sus nodos](/images/cleanTree.png)
Al realizar este proceso para cada uno de los nodos, vamos a llegar hasta el nodo raíz, y ahí es seleccionar al valor mayor, el cual nos aseguramos que **siempre** va a ser la mayor cantidad posible a robar.

### Ejecución de pruebas
Para asegurarnos que el programa funciona, se implementó una suite de pruebas unitarias automatizadas utilizando la librería estándar rackunit de Racket. Esta herramienta nos permite hacer diversas pruebas que verifican si la salida de la función pura coincide con el comportamiento esperado.

La ejecución de las pruebas arrojó que el programa pasa exitosamente todos los escenarios probados:

- Casos Límite y Base (Pruebas 1 y 2): Se evaluó el comportamiento ante un árbol completamente nulo (retornando 0 como se espera por la ausencia de casas) y un árbol con un solo nodo (retornando el valor de dicha casa), demostrando que la condición de parada de la recursividad funciona correctamente.

- Casos de Uso Generales (Pruebas 3 y 4): Se transcribieron las estructuras jerárquicas descritas en la literatura del problema (LeetCode, s.f.). Las pruebas automatizadas construyeron los árboles equivalentes a los arreglos [3,2,3,null,3,null,1] y [3,4,5,1,3,null,1], confirmando que el algoritmo toma las decisiones óptimas correctas sin violar la restricción de adyacencia, retornando beneficios de 7 y 9 respectivamente.

- Casos de Desbalanceo (Prueba 5): Se probó la resistencia del algoritmo ante un "árbol degenerado" (una estructura donde cada nodo padre solo tiene un hijo izquierdo, asimilándose a una lista enlazada). El programa logró abstraer la estructura lineal y propagó el estado inmutable de forma correcta.

Cabe mencionar que en el código agregué algunos comentarios que muestran lo que pasa al correrlo, sin embargo como en los lenguajes funcionales no puedes externar las variables fuera de las funciones, esto para evitar los efectos secundarios, por lo que las cantidades mostradas en la línea de comandos fueron escritas manualmente.

TO-DO AGREGAR EXPLICACIÓN DE QUE MI CODIGO SI FUNCIONA EN LEETCODE



## Solución B
Para la solución B, usando el paradigma concurrente, la idea principal sería aplicar directamente el concepto de "dividir y conquistar". Como la decisión que tomemos sobre los nodos del lado izquierdo del árbol no afecta a las decisiones del lado derecho, podemos tratar ambos lados como dos tareas completamente independientes.

En lugar de que el programa recorra casa por casa de forma tradicional, al llegar a una intersección podríamos dividir el trabajo: mandamos una tarea a calcular la ganancia máxima de todo el lado izquierdo y, exactamente al mismo tiempo, mandamos otra tarea a calcular la del lado derecho. Una vez que ambas terminan de revisar sus respectivas casas, juntamos los resultados y el programa toma la decisión final de si conviene robar la casa actual o no.

Con esta aproximación aprovecharíamos la computadora para procesar múltiples caminos a la vez y terminar de revisar el árbol mucho más rápido. Sin embargo, como mencioné en la descripción del paradigma, tendríamos que lidiar con la desventaja de gastar recursos extra de la computadora para organizar estas tareas simultáneas y asegurarnos de que entreguen sus resultados correctamente antes de tomar la decisión final.

## Análisis de complejidad
Para la Solución A (Funcional), la complejidad de tiempo es de *O(N)*, donde *N* representa el total de casas. Esto es porque el programa tiene que visitar cada casa exactamente una vez para hacer sus cálculos. En cuanto a la complejidad de espacio, es de *O(H)*, donde *H* es la altura máxima del árbol; esto significa que la memoria que requiere la computadora depende de qué tan profundo sea el camino de casas que está revisando en ese momento.

Por otro lado, la Solución B (Concurrente) mantendría el mismo esfuerzo total de *O(N)* porque igual tiene que revisar todas las casas, pero al hacer las revisiones al mismo tiempo, el tiempo real que nosotros esperaríamos por el resultado podría bajar hasta *O(H)*. Sin embargo, su complejidad de espacio sería mucho mayor, ya que el sistema necesita gastar memoria extra para crear y coordinar todas esas tareas simultáneas.

Si comparamos ambas, la solución funcional es mucho más estable y segura. Al no usar variables que cambien de valor, no hay riesgo de que los procesos choquen o se roben información entre sí. La solución concurrente suena más rápida, pero en la práctica solo valdría la pena si tuviéramos un árbol de casas gigante y perfectamente equilibrado. Si el árbol es pequeño o tiene formas irregulares (como los casos de prueba de LeetCode), el tiempo que perdemos organizando las tareas paralelas sería mayor que lo que ahorramos, haciendo que la solución funcional sea la mejor opción.

## Bibliografía
LeetCode. (s.f.). House robber III. Recuperado el 21 de mayo de 2026, de https://leetcode.com/problems/house-robber-iii/description/

Louden K. (2003) *Functional Programming (p. 471)* en *Programming Languajes Principles and Practice* (2da edición) editorial Thomson

Watt D. (1990) *The Functional Programming Paradigm(p. 230)* & *Concurrent Programming Paradigm (p. 205)* en *Programming Languaje Concepts and Paradigms* (1ra edición) editorial Prentice Hall International