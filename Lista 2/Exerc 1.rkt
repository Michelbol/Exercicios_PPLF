#lang racket

(require rackunit)
(require rackunit/text-ui)

;; Número Lista -> boolean
;; verifica se o número informado está na lista informada.

(define verifica-tests
  (test-suite
   "verifica-test1"
   (check-equal? (verifica-elem-lista 0 (list 1 2 3 4)) #f)
   (check-equal? (verifica-elem-lista 1 empty) #f)
   (check-equal? (verifica-elem-lista 2 (list 2 1)) #t)
   (check-equal? (verifica-elem-lista 3 (list 3 4 5)) #t)
   (check-equal? (verifica-elem-lista 4 (list 3 4 5)) #t)
   (check-equal? (verifica-elem-lista 5 (list 3 4 5)) #t)
   (check-equal? (verifica-elem-lista 4 (list 1 2 3)) #f)
   (check-equal? (verifica-elem-lista 5 (list 1 2 3)) #f)))

(define (verifica-elem-lista n lst)
  (cond
    [(empty? lst) #f]
    [else (or (equal? (first lst) n)
              (verifica-elem-lista n (rest lst)))]))


;; Teste ... -> void
;; Executa um conjunto de testes
(define (executa-tests . testes)
  (run-tests (test-suite "Todos os Testes" testes))
  (void))

;; Chama a função para executar os testes
(executa-tests verifica-tests)
