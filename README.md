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

Esa sería la aproximación que voy a tomar para resolver el problema, es una <i> variación de el problema que si haces algo, tienes que considerar las desventajas en el futuro, no se como mencionarlo pero como la madre de la moneda, que no puedes ser 100% greedy por que tienes que considerar el futuro</i>
## Paradigmas a usar en las soluciones
Las 2 posibles soluciones que voy a implementar y describir las voy a llamar solución A y solución B, la solución **A** va a ser la que sí implemente, esta la voy a hacer usando el paradigma de **programación funcional**, y voy a usar el lenguaje de Racket, basado en Scheme.
Mientras que para la solución **B**, solamente voy a describir el cómo se podría implementar en el paradigma **concurrente**. Por lo que, al no implementarlo, solamente voy a describirlo sin usar ningún lenguaje de programación.

### Programación funcional
La programación funcional viene muy estrechamente desde las matemáticas, pues se basa en las funciones, en que le damos una entrada 'input' y al final obtenemos una salida 'output', no nos importa lo que pase dentro, el autor Kenneth Louden lo describe como una "Black box for obtaining output from the input".

Algo igualmente interesante es que en el paradigma de programación funcional eliminamos el concepto de variables, solamente nos quedamos con constantes, parámetros y valores.
En este paradigma tomamos las funciones como objetos, que funcionen tanto como funciones como parámetros, por lo que va a ser común el pasar como parámetro una función, algo bastante inusual si lo vemos desde la perspectiva de la programación orientada a objetos.

Las principales ventajas de este paradigma de programación es que nos evitamos el manejo de memoria, pues ocurre automáticamente, semántica máss simple, y el evitarnos efectos secundarios que puedan ocurrir al momento de correr los programas.

### Programación concurrente
La programación concurrente 

## Bibliografía
LeetCode. (s.f.). House robber III. Recuperado el 21 de mayo de 2026, de https://leetcode.com/problems/house-robber-iii/description/

Louden K. (2003) *Functional Programming (p. 471)* en *Programming Languajes Principles and Practice* (2da edición) editorial Thomson

Watt D. (1990) *The Functional Programming Paradigm(p. 230)* & *Concurrent Programming Paradigm (p. 205)* en *Programming Languaje Concepts and Paradigms* (1ra edición) editorial Prentice Hall International