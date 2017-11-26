(define lfib
  (lambda (n)
    (lfib-aux '(1 1) (- n 2))))

(define lfib-aux
  (lambda (acum n)
    (cond ((zero? n) acum)
          (else (lfib-aux (cons (+ (car acum) (cadr acum)) acum) (- n 1))))))
                     
(define filtrar
  (lambda (fun l)
    (cond ((null? l) '())
          ((fun (car l)) (cons (car l) (filtrar fun (cdr l))))
          (else (filtrar fun (cdr l))))))

(define fact-primos
  (lambda (n)
    (fp-aux n 2 '())))

(define fp-aux
  (lambda (n i acum)
    (cond ((< n (* i i)) (cons n acum))
          ((zero? (remainder n i)) (fp-aux (simplificar n i) (+ i 1) (cons i acum)))
          (else (fp-aux n (+ i 1) acum)))))

(define simplificar
  (lambda (n i)
    (cond ((zero? (remainder n i)) (simplificar (quotient n i) i))
          (else n))))                   

(define carmichael
  (lambda (n)
    (solve (lfib n))))

(define solve
  (lambda (lfibos)
    (saux (car lfibos) (fact-primos (car lfibos)) (cdr lfibos))))

(define saux
  (lambda (fibn factores fibos)
    (cond ((equal? fibos (filtrar (lambda (x) (not (zero? (remainder x (car factores))))) fibos)) (list fibn (car factores)))
          (else (saux fibn (cdr factores) fibos)))))

(define dehuff
  (lambda (lista)
    (cond ((null? (cdr lista)) (list (caar lista) '() '()))
          (else
           (list 'nil (dehuff (fil 0 lista))  (dehuff (fil 1 lista)))))))

(define fil
  (lambda (elem lista)
    (cond ((null? lista) '())
          ((= elem (caadar lista)) (cons (list (caar lista) (cdadar lista)) (fil elem (cdr lista))))
          (else (fil elem (cdr lista))))))