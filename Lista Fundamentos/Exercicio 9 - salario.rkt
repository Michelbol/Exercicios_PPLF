#lang racket

(require rackunit)
(require rackunit/text-ui)

;; Número -> Número
;; Função que irá receber o salário atual da pessoa e calculará o novo salário
(define dobro-tests
  (test-suite
   "dobro tests"
   (check-equal? (calc-salario-novo 500) 550.0)
   (check-equal? (calc-salario-novo 1200) 1320.0)
   (check-equal? (calc-salario-novo 2000) 2140.0)
   (check-equal? (calc-salario-novo 3000) 3210.0)
   (check-equal? (calc-salario-novo 4000) 4120.0)
   (check-equal? (calc-salario-novo 8000) 8240.0)
   (check-equal? (calc-salario-novo 9000) 9000)))

(define (calc-salario-novo s)
  (cond
    [(<= s 1200) (+(* s 0.10) s)]
    [(<= s 3000) (+(* s  0.07) s)]
    [(<= s 8000) (+(* s  0.03) s)]
    [else s]))
    

;; Teste ... -> Void
;; Executa um conjunto de testes.
(define (executa-testes . testes)
(run-tests (test-suite "Todos os testes" testes))
(void))
;; Chama a função para executar os testes.
(executa-testes dobro-tests)