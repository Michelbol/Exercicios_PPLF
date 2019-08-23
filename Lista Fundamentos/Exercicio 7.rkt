#lang racket

(require rackunit)
(require rackunit/text-ui)

;; Número Número Número -> Número
;; recebe três números e soma o quadrado dos dois maiores
(define soma-quadrado-tests
  (test-suite
   "soma quadrado tests"
   (check-equal? (quadrado-maiores 1 1 1) 2)
   (check-equal? (quadrado-maiores 3 2 1) 13)
   (check-equal? (quadrado-maiores 3 1 2) 13)
   (check-equal? (quadrado-maiores 1 3 2) 13)
   (check-equal? (quadrado-maiores 2 3 1) 13)
   (check-equal? (quadrado-maiores 1 2 3) 13)
   (check-equal? (quadrado-maiores 2 1 3) 13)))

(define (quadrado-maiores x y z)
  (cond
    [(and (equal? x z) (equal? x y))  (+ (* x x) (* y y))]
    [(and (> x y) (> y z)) (+ (* x x) (* y y))]
    [(and (> x z) (> z y)) (+ (* x x) (* z z))]
    [(and (> y x) (> x z)) (+ (* y y) (* x x))]
    [(and (> y z) (> z x)) (+ (* y y) (* z z))]
    [(and (> z x) (> x y)) (+ (* z z) (* x x))]
    [else (+ (* z z) (* y y))]))

;; Teste ... -> Void
;; Executa um conjunto de testes.
(define (executa-testes . testes)
  (run-tests (test-suite "Todos os testes" testes))
  (void))
;; Chama a função para executar os testes.
(executa-testes  soma-quadrado-tests)