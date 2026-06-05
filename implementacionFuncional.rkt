#lang racket
(require rackunit) ; librería de pruebas automatizadas

;; Estructura de los arboles dada por Leetcode
(define-struct tree-node
  (val left right) #:mutable #:transparent)
 
 ;; Funcion de Depth First Search
(define (dfs node)
  ;; Cuando el nodo es nulo
  (if (not node)
      '(0 0)
      ;; Funcion que usa pattern-matching para desestructurar los valores
      (match-let ([(list left-rob left-not-rob) (dfs (tree-node-left node))]
                  [(list right-rob right-not-rob) (dfs (tree-node-right node))])
        ;; Si SI robamos el nodo, sumamos los not-rob de sus hijos
        (let ([rob-this (+ (tree-node-val node) left-not-rob right-not-rob)]
              ;; Si NO robamos el nodo, elegimos el valor maximo de sus hijos
              [not-rob-this (+ (max left-rob left-not-rob) 
                               (max right-rob right-not-rob))])
          (list rob-this not-rob-this)))))

;; Funcion principal
(define (rob root)
   
  (match-let ([(list final-rob final-not-rob) (dfs root)])
    ;; Elegimos el mayor valor de las 2 posibilidades
    (max final-rob final-not-rob)))


;; Pruebas automatizadas con impresiones visuales
(displayln "<< Iniciando ejecución de pruebas automatizadas >>")

(test-begin
  ;; Caso 1: Árbol de 0 nodos y 0 niveles
  ;; Ganancia esperada: 0
  (check-equal? (rob #f) 0 "<<Fallo en Caso 1: Árbol de 0 nodos y 0 niveles>>")
  (displayln "Caso 1 superado: Árbol de 0 nodos y 0 niveles (Ganancia: 0).")

  ;; Caso 2: Árbol de 1 nodo y 1 nivel
  ;; Ganancia esperada: 5
  (check-equal? (rob (make-tree-node 5 #f #f)) 5 "<<Fallo en Caso 2: Árbol de 1 nodo y 1 nivel>>")
  (displayln "Caso 2 superado: Árbol de 1 nodo y 1 nivel (Ganancia: 5).")

  ;; Caso 3: Árbol de 5 nodos y 3 niveles
  ;; Ejemplo 1 de LeetCode 
  ;; Ganancia esperada: 3 + 3 + 1 = 7
  (define tree1
    (make-tree-node 3
                    (make-tree-node 2 #f (make-tree-node 3 #f #f))
                    (make-tree-node 3 #f (make-tree-node 1 #f #f))))
  (check-equal? (rob tree1) 7 "<<Fallo en Caso 3: Árbol de 5 nodos y 3 niveles>>")
  (displayln "Caso 3 superado: Árbol de 5 nodos y 3 niveles (Ganancia: 7).")

  ;; Caso 4: Árbol de 6 nodos y 3 niveles
  ;; Ejemplo 2 de LeetCode
  ;; Ganancia esperada: 4 + 5 = 9
  (define tree2
    (make-tree-node 3
                    (make-tree-node 4 (make-tree-node 1 #f #f) (make-tree-node 3 #f #f))
                    (make-tree-node 5 #f (make-tree-node 1 #f #f))))
  (check-equal? (rob tree2) 9 "<<Fallo en Caso 4: Árbol de 6 nodos y 3 niveles>>")
  (displayln "Caso 4 superado: Árbol de 6 nodos y 3 niveles (Ganancia: 9).")

  ;; Caso 5: Árbol de 3 nodos y 3 niveles
  ;; Ganancia esperada: 1 + 3 = 4
  (define tree3
    (make-tree-node 1 (make-tree-node 2 (make-tree-node 3 #f #f) #f) #f))
  (check-equal? (rob tree3) 4 "<<Fallo en Caso 5: Árbol de 3 nodos y 3 niveles>>")
  (displayln "Caso 5 superado: Árbol de 3 nodos y 3 niveles (Ganancia: 4).")

  ;; Caso 6: Árbol de 11 nodos y 4 niveles
  ;; Ganancia esperada: 10 + 4 + 6 + 7 + 8 + 9 + 10 = 54
  (define tree4
    (make-tree-node 10
      (make-tree-node 1
        (make-tree-node 3 (make-tree-node 7 #f #f) (make-tree-node 8 #f #f))
        (make-tree-node 4 #f #f))
      (make-tree-node 2
        (make-tree-node 5 (make-tree-node 9 #f #f) (make-tree-node 10 #f #f))
        (make-tree-node 6 #f #f))))
  (check-equal? (rob tree4) 54 "<<Fallo en Caso 6: Árbol de 11 nodos y 4 niveles>>")
  (displayln "Caso 6 superado: Árbol de 11 nodos y 4 niveles (Ganancia: 54).")

  ;; Caso 7: Árbol de 5 nodos y 5 niveles
  ;; Ganancia esperada: 5 + 3 + 1 = 9
  (define tree5
    (make-tree-node 5 #f
      (make-tree-node 4
        (make-tree-node 3 #f
          (make-tree-node 2
            (make-tree-node 1 #f #f)
            #f))
        #f)))
  (check-equal? (rob tree5) 9 "<<Fallo en Caso 7: Árbol de 5 nodos y 5 niveles>>")
  (displayln "Caso 7 superado: Árbol de 5 nodos y 5 niveles (Ganancia: 9).")
)

(displayln "<<Todas las pruebas pasaron correctamente!>>")