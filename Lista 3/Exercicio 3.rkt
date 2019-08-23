#lang racket

(require rackunit)
(require rackunit/text-ui)

;; Lista Número -> Lista
;; A função recebe um número x e uma lista, e retorna a lista sem os x primeiros elementos.

(define verifica-tests
  (test-suite
   "verifica-test1"
   (check-equal? (drop empty 5) empty)
   (check-equal? (drop (list 2 3 4) 5) empty)
   (check-equal? (drop (list 0 2 3 4) 1) (list 2 3 4))
   (check-equal? (drop (list 2 3 4 5 6) 2) (list 4 5 6))
   (check-equal? (drop (list 1 2 3 4 5 6) 0) (list 1 2 3 4 5 6))
   (check-equal? (drop (list 0 2 3 5 4) 5) empty)))

(define (drop lst x)
  (cond
    [(empty? lst) empty]
    [(zero? x) rest lst]
    [else (drop (rest lst) (sub1 x))]))


;; Teste ... -> void
;; Executa um conjunto de testes
(define (executa-tests . testes)
  (run-tests (test-suite "Todos os Testes" testes))
  (void))

;; Chama a função para executar os testes
(executa-tests verifica-tests)