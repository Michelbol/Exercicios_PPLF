#lang racket

(require rackunit)
(require rackunit/text-ui)

;; Lista Lista -> Lista
;; A função recebe duas listas, e retorna uma lista com os elementos da segunda lista após os elementos da primeira.

(define verifica-tests
  (test-suite
   "verifica-test1"
   (check-equal? (append empty empty) empty)
   (check-equal? (append (list 2 3 4) empty) (list 2 3 4))
   (check-equal? (append empty (list 5 0)) (list 5 0))
   (check-equal? (append (list 2 3 4) (list 5 1)) (list 2 3 4 5 1))
   (check-equal? (append (list 2 3 3 4 5 6 7 4) (list 5 1 1 1 1 1 1 1 1 1)) (list 2 3 3 4 5 6 7 4 5 1 1 1 1 1 1 1 1 1))
   ))

(define (append lsta lstb)
  (cond
    [(and (empty? lsta) (empty? lstb)) empty]    
    [(empty? lsta) lstb]
    [(empty? lstb) lsta]
    [(empty? (rest lsta)) (cons (first lsta) lstb)]    
    [else (cons (first lsta) (append (rest lsta) lstb))]))


;; Teste ... -> void
;; Executa um conjunto de testes
(define (executa-tests . testes)
  (run-tests (test-suite "Todos os Testes" testes))
  (void))

;; Chama a função para executar os testes
(executa-tests verifica-tests)