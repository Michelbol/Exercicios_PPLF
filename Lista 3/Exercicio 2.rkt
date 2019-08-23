#lang racket

(require rackunit)
(require rackunit/text-ui)

;; Número -> Número
;; A função recebe dois números e soma eles.

(define verifica-tests-soma
  (test-suite
   "verifica-test1"
   (check-equal? (soma 0 1) 1)
   (check-equal? (soma 1 1) 2)
   (check-equal? (soma 9999 5000000) 5009999)))

(define (soma n m)
  (cond
    [(zero? m) n]
    [else (soma (add1 n) (sub1 m))]))

;; Número -> Número
;; A função recebe dois números e subtrai eles.

(define verifica-tests-sub
  (test-suite
   "verifica-test1"
   (check-equal? (sub 0 1) -1)
   (check-equal? (sub 1 1) 0)
   (check-equal? (sub 100 50) 50)
   (check-equal? (sub 110 30) 80)))

(define (sub n m)
  (cond
    [(zero? m) n]
    [else (sub (sub1 n) (sub1 m))]))

;; Número -> Número
;; A função recebe dois números e multiplica eles.

(define verifica-tests-mul
  (test-suite
   "verifica-test1"
   (check-equal? (mul 0 1) 0)
   (check-equal? (mul 1 1) 1)
   (check-equal? (mul 5 4) 20)
   (check-equal? (mul 4 5) 20)
   (check-equal? (mul 6 3) 18)
   (check-equal? (mul 25 4) 100)))

(define (mul n m)
  (cond
    [(zero? m) 0]
    [(zero? n) 0]
    [(equal? m 1) n]
    [else (soma (mul n (sub1 m)) n)]))


;; Teste ... -> void
;; Executa um conjunto de testes
(define (executa-tests . testes)
  (run-tests (test-suite "Todos os Testes" testes))
  (void))

;; Chama a função para executar os testes
(executa-tests verifica-tests-soma verifica-tests-sub verifica-tests-mul)