; #31 Determine whether a given integer number is prime.
(define prime?
  (lambda (n)
    (cond ;((= n 1) #f)
          ((= 2 n) #t)
          ((even? n) #f)
          (else (prime?-aux 3 (floor (sqrt n)) n)))))

(define prime?-aux
  (lambda (i tope n)
    (cond ((> i tope) #t)
          ((zero? (remainder n i)) #f)
          (else (prime?-aux (+ 2 i) tope n)))))

; #32 Determine the greatest common divisor of two positive integer numbers.
(define dgm
  (lambda (m n)
    (cond ((equal? n 0) m)
          (else (dgm n (remainder m n))))))

; #33 Determine whether two positive integer numbers are coprime.
(define isCoprimeTo
  (lambda (x y)
    (= (dgm x y) 1)))

; #34 Calculate Euler's totient function phi(m).
(define to-tient
  (lambda (n)
    (cond ((eq? n 0) '(1))
          (else (to-tient-aux 1 n n)))))

(define to-tient-aux
  (lambda (j temp n)
    (cond ((eq? n 0) j)
          ((and (> n 1) (eq? (dgm temp n) 1))
           (to-tient-aux (+ j 1) temp (- n 1)))
          (else (to-tient-aux j temp (- n 1))))))

; #35 Determine the prime factors of a given positive integer.
(define prime-factors
  (lambda (num)
    (cond ((prime? num) (list num))
          (else (prime-factors-aux num 2)))))

(define prime-factors-aux
  (lambda (temp prim)
    (cond ((= temp 1) '())
          ((and (eq? (remainder temp prim) 0)
                (prime? prim))
           (cons prim (prime-factors-aux (quotient temp prim)
                                         prim)))
          (else (prime-factors-aux temp (+ prim 1))))))

; # 36 Determine the prime factors of a given positive integer(2).
(define pack
  (lambda (L)
    (cond ((null? L) L)
          ((null? (cdr L)) (list (car L)))
          (else (pack-aux (car L) (cdr L) (list (car L)))))))

(define pack-aux
  (lambda (ant L acum)
    (cond ((null? L) (list acum))
          ((equal? ant (car L))
           (pack-aux ant (cdr L) (cons (car L) acum)))
          (else
           (cons acum (pack-aux (car L) (cdr L) (list (car L))))))))

(define prime-factors-list
  (lambda (n)
    (map (lambda(lista)
         (list (car lista) (length lista))) (pack (prime-factors n)))))

; #37 Calculate Euler's totient function phi(m) (improved).
(define phi
  (lambda(n)
    (phi-auxFor 2 n)))

(define phi-auxFor
  (lambda(p n)
    (cond ((<= (* p p) n)
           (phi-aux2 n p))
          (else (suprime-factor n)))))

(define phi-aux2
  (lambda (n p)
    (cond ((eq? (remainder n p) 0)
           (phi-while n p n))
          (else (phi-auxFor (+ p 1) n)))))

(define phi-while
  (lambda (n p result)
    (cond ((eq? (remainder n p) 0)
           (phi-while (quotient n p) p (* result (- 1.0
                                                  (quotient 1.0 p)))))
           (else (phi-auxFor p n)))))

(define suprime-factor
  (lambda(n)
    (cond ((> n 1)
           (* n (- 1.0 (quotient 1.0 n))))
          (else n))))


#|
int phi(int n)
{
    float result = n;   // Initialize result as n
 
    // Consider all prime factors of n and for every prime
    // factor p, multiply result with (1 - 1/p)
    for (int p=2; p*p<=n; ++p) /* aux1*/
    {
        // Check if p is a prime factor.
        if (n % p == 0)
        {
            // If yes, then update n and result
            while (n % p == 0) (aux 2)
                n /= p;
            result *= (1.0 - (1.0 / (float) p));
        }
    }
 
    // If n has a prime factor greater than sqrt(n)
    // (There can be at-most one such prime factor)
    if (n > 1)
        result *= (1.0 - (1.0 / (float) n));
 
    return (int)result;
}
|#
; No entendi

; #38 Compare the two methods of calculating Euler's totient function.

; #39 A list of prime numbers.
(define list-prime
  (lambda(start end)
    (cond ((eq? start end) '())
          ((prime? start) (cons start (list-prime (+ start 1) end)))
          (else (list-prime (+ start 1) end)))))

#| QUIZ |#
(define listquiz
  (lambda (n)
    (listquizaux (- n 1) n)))

(define listquizaux
  (lambda (s n)
    (cond ((eq? s 0) '())
          ((and (< s n) (prime? s))
           (cons s (listquizaux (- s 1) n)))
          (else (listquizaux (- s 1) n)))))

; #40 Goldbach's conjecture.

(define goldbach
  (lambda (n)
    (goldbach-aux n (list-prime 0 n))))

(define goldbach-aux
  (lambda(x L)
    (cond ((> (- x (car (reverse L))) 1)
           (list (- x (car (reverse L)))
                 (car (reverse L))))
          (else (list (cadr (reverse L))
                      (car (cdr L)))))))

; mas eficiente
(define goldbach-v2
  (lambda (x)
    (cond ((prime? x) '())
          (else (goldbachv2-aux x 2)))))

(define goldbachv2-aux
  (lambda(x p)
    (cond ((even? (- x p)) (goldbachv2-aux x (+ p 1)))
          ((prime? (- x p)) (list (- x p) (- x (- x p))))
          (else (goldbachv2-aux x (- p 2))))))





























