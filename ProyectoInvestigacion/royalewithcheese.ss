#| Proyecto Investigación Paradigmas de Programación
 | royalewithcheese.ss
 |
 | David Lobo Gúzman.
 | Cristian Díaz Jiménez.
 |
 |#

(define es-miembro?
  (lambda (elem l)
    (ormap (lambda (x) (equal? elem x)) l)))

(define get-pos
   (lambda (elem l cont)
     (cond ((null? l) '())
           ((eq? (car l) elem) cont)
           (else (get-pos elem (cdr l) (+ cont 1))))))

(define parseo
  (lambda(pos-elem)
    (cond ((>= pos-elem 20) (+ pos-elem 30))
          ((= (remainder pos-elem 10) 2) (+ pos-elem 3))
          ((= (remainder pos-elem 10) 6) (+ pos-elem 3))
          ((= (remainder pos-elem 10) 5) (- pos-elem 3))
          ((= (remainder pos-elem 10) 9) (- pos-elem 3))
          (else pos-elem))))

; Principal
(define royale
  (lambda(L)
  (cond ((null? L) '())
        ((= 1 (length L)) (list 1))
        (else (royale-aux (cdr L) (list (car L)) (list 1) 1)))))

(define royale-aux
  (lambda (RL LV LS Count)
    (cond ((null? RL) LS)
          ((es-miembro? (car RL) LV) (royale-aux (cdr RL) LV (append LS (list (parseo(get-pos (car RL) LV 1)))) Count))
          (else (royale-aux (cdr RL) (append LV (list (car RL))) (append LS (list (parseo (+ Count 1)))) (+ Count 1))))))
