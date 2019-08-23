#lang racket

(require rackunit)
(require rackunit/text-ui)

;; Número Número -> Número
;; função irá receber dois números e irá retornar o maior valor entre os dois valores
(define maior-tests
  (test-suite
   "maior tests"
   (check-equal? (maior 0 0) 0)
   (check-equal? (maior 1 2) 2)
   (check-equal? (maior 1 0) 1)
   (check-equal? (maior -2 2) 2)
   (check-equal? (maior 2 -2) 2)
   (check-equal? (maior 9999999 9999998) 9999999)))

(define (maior x y)
  (cond
    [(equal? x y) x]
    [(> x y) x]
    [else y]))

;; Teste ... -> Void
;; Executa um conjunto de testes.
(define (executa-testes . testes)
  (run-tests (test-suite "Todos os testes" testes))
  (void))
;; Chama a função para executar os testes.
(executa-testes maior-tests)