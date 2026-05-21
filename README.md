# Evidencia Demonstración de un Paradigma de Programación
Joel Guadalupe García Guzmán - A01713785
## Descripción del problema escogido
Para esta entrega nos piden escoger algún problema para demostrar diferentes paradigmas de programación que hemos visto a lo largo del curso, por lo que voy a resolver un problema de Leetcode, específicamente el problema <a href="https://leetcode.com/problems/house-robber-iii"/> 337. House Robber III</a>, el cual nos dice lo siguiente:
> The thief has found himself a new place for his thievery again. There is only one entrance to this area, called root.
> Besides the root, each house has one and only one parent house. After a tour, the smart thief realized that all houses in this place form a binary tree. It will automatically contact the police if two directly-linked houses were broken into on the same night.
> Given the root of the binary tree, return the maximum amount of money the thief can rob without alerting the police.

(LeetCode, 2026)

Entonces, lo que tenemos que hacer para este problema es, primeramente, recorrer la estructura del árbol y tomar una decisión para robar la mayor cantidad de casas posibles. Para cada casa (nodo), existen dos posibles escenarios:  

- Robar la casa actual: Esto hace que obtengamos el valor total de la casa, con la desventaja que nos impide robar a sus vecinos inmediatos (sus hijos).

- No robar la casa actual: Esto hace que no robemos nada de la casa, pero que sí tengamos la posibilidad de robar a sus vecinos inmediatos (sus hijos).

Esa sería la aproximación que voy a tomar para resolver el problema, es una <i> variación de el problema que si haces algo, tienes que considerar las desventajas en el futuro, no se como mencionarlo pero como la madre de la moneda, que no puedes ser 100% greedy por que tienes que considerar el futuro</i>
## 