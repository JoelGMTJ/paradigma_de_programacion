; Definition for a binary tree node.
#|

; val : integer?
; left : (or/c tree-node? #f)
; right : (or/c tree-node? #f)
(struct tree-node
  (val left right) #:mutable #:transparent)

; constructor
(define (make-tree-node [val 0])
  (tree-node val #f #f))

|#

(define/contract (rob root)
  (-> (or/c tree-node? #f) exact-integer?)
  
  (define (dfs node)
    (if (not node)
        '(0 0)
        (match-let ([(list left-rob left-not-rob) (dfs (tree-node-left node))]
                    [(list right-rob right-not-rob) (dfs (tree-node-right node))])
          
          (let ([rob-this (+ (tree-node-val node) left-not-rob right-not-rob)]
                [not-rob-this (+ (max left-rob left-not-rob) 
                                 (max right-rob right-not-rob))])
            (list rob-this not-rob-this)))))
            
  (match-let ([(list final-rob final-not-rob) (dfs root)])
    (max final-rob final-not-rob))
    )