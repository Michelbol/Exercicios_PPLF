#lang racket

(require rackunit)
(require rackunit/text-ui)

;; Lista Número Número -> Lista
;; A função recebe uma lista e dois números, e retorna a lista com o primeiro número na posição que o segundo número informa.

(define verifica-tests
  (test-suite
   "verifica-test1"
   (check-equal? (insert-at empty 5 2) (list 5))
   (check-equal? (insert-at (list 2 3 4) 5 5) (list 2 3 4 5))
   (check-equal? (insert-at (list 2 3 4) 5 0) (list 5 2 3 4))
   (check-equal? (insert-at (list 2 3 4) 5 1) (list 2 5 3 4))
   (check-equal? (insert-at (list 2 3 4 5 6) 5 3) (list 2 3 4 5 5 6))
   (check-equal? (insert-at (list 1 2 3 4 5 6) 5 -1) (list 5 1 2 3 4 5 6))
   (check-equal? (insert-at (list 1 0 2 3 5 4) 5 6) (list 1 0 2 3 5 4 5))
   (check-equal? (insert-at (list 1 0 2 3 5 4) 5 3) (list 1 0 2 5 3 5 4))))

(define (insert-at lst x p)
  (cond
    [(empty? lst) (cons x empty)]
    [(< p 0) (cons x lst)]
    [(zero? p) (cons x lst)]
    [else (cons (first lst) (insert-at (rest lst) x (sub1 p)))]))


;; Teste ... -> void
;; Executa um conjunto de testes
(define (executa-tests . testes)
  (run-tests (test-suite "Todos os Testes" testes))
  (void))

;; Chama a função para executar os testes
(executa-tests verifica-tests)