#lang racket
(require rackunit) ; librería de pruebas automatizadas

;; Estructura de los arboles dada por Leetcode
(define-struct tree-node
  (val left right) #:mutable #:transparent)
 
 ;; Funcion de Depth First Search
(define (dfs node)
  (if (not node)
      '(0 0)
      (match-let ([(list left-rob left-not-rob) (dfs (tree-node-left node))]
                  [(list right-rob right-not-rob) (dfs (tree-node-right node))])
        
        (let ([rob-this (+ (tree-node-val node) left-not-rob right-not-rob)]
              [not-rob-this (+ (max left-rob left-not-rob) 
                               (max right-rob right-not-rob))])
          (list rob-this not-rob-this)))))

;; Funcion principal
(define (rob root)
   
  (match-let ([(list final-rob final-not-rob) (dfs root)])
    (max final-rob final-not-rob)))


;; Pruebas automatizadas con impresiones visuales
(displayln "<< Iniciando ejecución de pruebas automatizadas >>")

(test-begin
  ;; Caso 1: Árbol vacío
  (check-equal? (rob #f) 0 "<<Fallo en Caso 1: Árbol vacío debe retornar 0>>")
  (displayln "Caso 1 superado: Árbol vacío manejado correctamente.")

  ;; Caso 2: Árbol con un solo nodo
  (check-equal? (rob (make-tree-node 5 #f #f)) 5 "<<Fallo en Caso 2: Nodo único debe retornar su valor>>")
  (displayln "Caso 2 superado: Árbol de un solo nodo verificado.")

  ;; Caso 3: Ejemplo 1 de LeetCode 
  ;; Árbol: [3, 2, 3, null, 3, null, 1] -> Respuesta esperada: 3 + 3 + 1 = 7
  (define tree1
    (make-tree-node 3
                    (make-tree-node 2 #f (make-tree-node 3 #f #f))
                    (make-tree-node 3 #f (make-tree-node 1 #f #f))))
  (check-equal? (rob tree1) 7 "<<Fallo en Caso 3: Ejemplo 1 de la literatura>>")
  (displayln "Caso 3 superado: Ejemplo 1 de la literatura resuelto (Ganancia: 7).")

  ;; Caso 4: Ejemplo 2 de LeetCode
  ;; Árbol: [3, 4, 5, 1, 3, null, 1] -> Respuesta esperada: 4 + 5 = 9
  (define tree2
    (make-tree-node 3
                    (make-tree-node 4 (make-tree-node 1 #f #f) (make-tree-node 3 #f #f))
                    (make-tree-node 5 #f (make-tree-node 1 #f #f))))
  (check-equal? (rob tree2) 9 "<<Fallo en Caso 4: Ejemplo 2 de la literatura>>")
  (displayln "Caso 4 superado: Ejemplo 2 de la literatura resuelto (Ganancia: 9).")

  ;; Caso 5: Árbol degenerado
  ;; Árbol: 1 -> left: 2 -> left: 3 -> Respuesta esperada: 1 + 3 = 4
  (define degenerate-tree
    (make-tree-node 1 (make-tree-node 2 (make-tree-node 3 #f #f) #f) #f))
  (check-equal? (rob degenerate-tree) 4 "<<Fallo en Caso 5: Árbol degenerado izquierdo>>")
  (displayln "Caso 5 superado: Árbol degenerado procesado con éxito.")
)

(displayln "<<Todas las pruebas pasaron correctamente!>>")