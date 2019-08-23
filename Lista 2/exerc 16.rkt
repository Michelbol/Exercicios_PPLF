#lang racket

(require rackunit)
(require rackunit/text-ui)

;;;;;;;;;;;;;;;;;;;;
;; Definição de Árvore binária

(struct arvore-bin (v esq dir) #:transparent)
;; Uma Árvore binária é
;;   - empty; ou
;;   - (arvore-bin v esq dir)onde v e o valor armazenado no nó e esq e dir são
;;     Árvores binárias

;; Estas árvores são usadas nos testes a seguir
;;
;;     t4  7
;;        / \
;;       /   \
;;  t3  4     9  t2
;;     /     / \
;;    3     8   10  t1
;;             /
;;        t0  11

(define t0 (arvore-bin 11 empty empty))

(define t1 (arvore-bin 10
                       t0
                       empty))

(define t2 (arvore-bin 9
                       (arvore-bin 8 empty empty)
                       t1))

(define t3 (arvore-bin 4
                       (arvore-bin 3 empty empty)
                       empty))

(define t4 (arvore-bin 7
                       t3
                       t2))

;; Arvore -> Boolean
;; Função receberá uma arvore e irá retornar true se for uma arvore de busca, ou false se não for.
(define verifica-tests
  (test-suite
   "verifica-test"
   (check-equal? (verif-arv-busca empty) #t)
   (check-equal? (verif-arv-busca t0) #t)
   (check-equal? (verif-arv-busca t1) #t)
   (check-equal? (verif-arv-busca t2) #t)
   (check-equal? (verif-arv-busca t3) #t)
   (check-equal? (verif-arv-busca t4) #t)))

(define (verif-arv-busca arvore)
  (cond
    [(empty? arvore) #t]
    [(empty? (arvore-bin-esq arvore)) #t]
    [(empty? (arvore-bin-dir arvore)) #t]
    [(< (arvore-bin-v (arvore-bin-dir arvore)) (arvore-bin-v arvore)) #f]
    [(> (arvore-bin-v (arvore-bin-esq arvore)) (arvore-bin-v arvore)) #f]
    [(equal? (verif-arv-busca (arvore-bin-dir arvore)) #f)]
    [else (verif-arv-busca (arvore-bin-esq arvore))]))

;;;;;;;;;;;;;;;;;;;;
;; Funções para auxiliar nos testes

;; Teste ... -> Void
;; Executa um conjunto de testes.
(define (executa-testes . testes)
  (run-tests (test-suite "Todos os testes" testes))
  (void))

;; Chama a função para executar os testes.
(executa-testes verifica-tests)