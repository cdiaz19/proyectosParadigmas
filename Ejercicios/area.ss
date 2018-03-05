#|
  Paradigmas de Programación - UNA
  Prof: Eddy Ramírez
  Cristian Díaz Jiménez
|#

; Principal: Área del Polígono
; Recibe la Lista de Puntos
(define area
  (lambda (ListaPuntos)
  (cond ((null? ListaPuntos) '())
        (else (fun-puntos (car ListaPuntos) (cdr ListaPuntos))))))

; Dada la lista va formando los Triangulos. Teniendo un punto Fijo
(define fun-puntos
  (lambda (H T)
  (cond ((null? (cdr T)) 0)
        (else (+ (funcion H (car T) (cadr T))
                 (fun-puntos H (cdr T)))))))

; Se encarga de obtener el área de cada uno de los triangulos
(define funcion
  (lambda (H A B)
    (heron (semiperimetro (formula H A) (formula A B) (formula H B))
           (formula H A) (formula A B) (formula H B))))

; D = √(xb - xa)2 + (yb - ya)]2
; Retorna la distancia entre puntos
(define formula
  (lambda (X Y)
    (sqrt (+ (expt (- (car X) (car Y)) 2)
              (expt (- (cadr X) (cadr Y)) 2)))))

; H = √S*(S-A)*(S-B)*(S-C)
; Formula de Heron
(define heron
  (lambda (S A B C)
    (sqrt(* S (* (- S A) (- S B) (- S C))))))

; S = A+B+C/2
; Formula de Heron
(define semiperimetro
  (lambda(A B C)
    (/ (+ A B C) 2)))
