#lang racket

(require rackunit)
(require rackunit/text-ui)

;; Número Número Número -> String
;; recebe três números e é classificado em isóceles, equilátero ou escaleno com base nos números.

(define triangulo-tests
  (test-suite
   "triangulo tests"
   (check-equal? (triangulo 1 1 1) "equilátero")
   (check-equal? (triangulo 1 2 2) "isóceles")
   (check-equal? (triangulo 1 1 2) "isóceles")
   (check-equal? (triangulo 1 2 3) "escaleno")
   (check-equal? (triangulo 3 2 1) "escaleno")
   (check-equal? (triangulo 1 3 2) "escaleno")))

(define (triangulo x y z)
  (cond
    [(and (equal? x y) (equal? y z)) "equilátero"]
    [(or  (equal? x y) (equal? y z)) "isóceles"]
    [else "escaleno"]))


;; Teste ... -> Void
;; Executa um conjunto de testes.
(define (executa-testes . testes)
  (run-tests (test-suite "Todos os testes" testes))
  (void))
;; Chama a função para executar os testes.
(executa-testes  triangulo-tests)