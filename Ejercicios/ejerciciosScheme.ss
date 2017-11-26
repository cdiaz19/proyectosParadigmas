(define lista(list 1 2 3 4 5 6))
(define l(list 1 2 1))

; #1 Find the last element of a list.

(define last
  (lambda (L)
    (cond[(null? L) '()]
         [else (last-aux (car L)(cdr L))]
         )
    )
  )

(define last-aux
  (lambda (first-elem L)
    (cond[(null? L) first-elem]
         [else (last-aux (car L) (cdr L))])))

; #2 Find the last but one element of a list.
(define penultimate
  (lambda (L)
    (cond[(eq? (length L) 2) (car L)]
         [else (penultimate (cdr L))]
         )
    )
  )

; #3 Find the Kth element of a list.
(define nth
  (lambda (pos L)
    (cond [(= pos 0)(car L)]
          [(> pos (length L)) "pos no existe"]
          [else (nth (- pos 1) (cdr L))] ;(list-ref l pos)
          )))

; #4 Find the number of elements of a list.
(define lth
  (lambda (L)
    (cond [(null? L) 0]
          [else (lth-aux 0 L)]
          )
    )
  )
    
(define lth-aux
  (lambda (n L)
    (cond [(null? L) n]
          [else (lth-aux (+ n 1) (cdr L))]
          )
    )
  )

; #5  Reverse a list. (reverse)
(define rever
  (lambda (L)
    (cond [(null? L) L]
          [else (append (rever (cdr L)) (list (car L)))]
          )
    )
  )

; #6 Find out whether a list is a palindrome.
(define isPalindrome?
  (lambda (L)
    (cond [(null? L) '()]
          [(equal? L (rever L)) #t]
          [else #f])))

; #7 Flatten a nested list structure.
(define flatten
  (lambda(L)
    (cond [(null? L) '()]
          [(list? (car L)) (append (flatten (car L))
                                   (flatten (cdr L)))]
          [else (cons (car L) (flatten (cdr L)))]
          )
    )
  )

; #8 Eliminate consecutive duplicates of list elements.
(define eliminate-consecutive
  (lambda (L)
    (cond [(null? L) '()]
          [(null? (cdr L)) L]
          [(eq? (car L) (car (cdr L)))
           (eliminate-consecutive (cdr L))]
          [else (cons (car L)
                      (eliminate-consecutive (cdr L)))]
          )
    )
  )

; #9 Pack consecutive duplicates of list elements into sublists.**
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


; #10 Run-length encoding of a list.
(define encode
  (lambda (L)
    (cond [(null? L) L]
          [(null? (cdr L)) (list(list L (car L)))]
          [else (encode-aux (car L) (cdr L) 1)])))

(define encode-aux
  (lambda (ant L count)
    (cond [(null? L) (list(list count ant))]
          [(eq? (car L) ant) (encode-aux ant (cdr L) (+ count 1))]
          [else (cons (list count ant) (encode L))]
          )
    )
  )

(define encodeEddy
  (lambda (L)
    (map (lambda (lista) (list (length lista) (car lista))) (pack L))))

; #11 Modified run-length encoding.
(define encode-mod
  (lambda (L)
    (cond [(null? L) L]
          [(null? (cdr L)) (list(list L (car L)))]
          [else (encode-mod-aux (car L) (cdr L) 1)]
          )
    )
  )

(define encode-mod-aux
  (lambda (ant L count)
    (cond [(null? L) (list(list count ant))]
          [(eq? (car L) ant) (encode-mod-aux ant (cdr L) (+ count 1))]
          [(= count 1) (cons ant (encode-mod L))]
          [else (cons (list count ant) (encode-mod L))]
          )
    )
  )

; #12 Decode a run-length encoded list. **

; #13 Run-length encoding of a list (direct solution). **

; #14 Duplicate the elements of a list.
(define duplicate
  (lambda (L)
    (cond [(null? L) '()]
          [else (cons (car L)
                      (cons (car L) (duplicate (cdr L))))])
    )
  )

; #15 Duplicate the elements of a list a given number of times.
(define duplicate-n
  (lambda (n L)
    (cond [(null? L) '()]
          [(= n 1) (car L)]
          [else (cons (car L)
                      (duplicate-n (- n 1) (cdr L)))]
          )))

; #16 Drop every Nth element from a list..
(define drop
  (lambda (elem L)
    (cond [(null? L) '()]
          [(> elem 0)
           (cons(car L) (drop (- elem 1)(cdr L)))]
          [else (cdr L)]
          )))

; #17 Split a list into two parts.
(define split
  (lambda (elem L)
    (cond [(null? L) '()]
          [(> elem 0)
           (cons (car L) (split (- elem 1)(cdr L)))]
          [else (list L)]
          )))

; #18 Extract a slice from a list.
(define extract-slice
    (lambda (pos-start pos-end L)
        (cond [(> pos-start 0)
               (extract-slice (- pos-start 1) pos-end (cdr L))]
              [else (extract-slice-aux pos-end L)]
              )
      )
  )

(define extract-slice-aux
    (lambda (pos-end L)
        (cond[(> pos-end 1)
              (cons (car L) (extract-slice-aux (- pos-end 1) (cdr L)))]
             [else '()]
             )
      )
  )

; #19 Rotate a list N places to the left.**



; #20 Remove the Kth element from a list.
(define remove-k
  (lambda (pos L)
    (cond [(null? L) '()]
          [(> pos 0)
           (cons (car L)(remove-k (- pos 1) (cdr L)))]
          [else (append (cdr L))]
          )
    )
  )

; #21 Insert an element at a given position into a list.
(define add-posk
  (lambda (elem pos L)
    (cond [(null? L) '()]
          [(> pos (length L)) "Pos no existe"]
          [(> pos 0)
           (cons (car L) (add-posk elem (- pos 1) (cdr L)))]
          [else (cons elem L)]
          )
    )
  )

; #22 Create a list containing all integers within a given range.
(define create-list
  (lambda(start end)
    (cond[(<= start end)
           (append (cons start (create-list (+ start 1) end)))]
         [else '()]
         )
    )
  )

; #23 Extract a given number of randomly selected elements from a list.
(define extract-random
  (lambda(number-random L)
    (cond [(null? L) '()]
          [(> number-random 0)
           (extract-random-aux (random (length L)) L number-random)]
          [else '()])
    )
  )

(define extract-random-aux
  (lambda(x-random L number-rand)
    (append(cons (nth x-random L)
                        (extract-random (- number-rand 1)
                                        (remove-k x-random L))))))

; #24 Draw N different random numbers from the set 1..M.
(define draw-ramdon
  (lambda (n Max)
    (draw-random-aux 0 n Max)
    )
  )

(define draw-random-aux
  (lambda(i n Max)
    (cond [(< i n)
           (append(cons (random Max)
                        (draw-random-aux (+ i 1) n Max)))]
          [else '()]
          )
    )
  )

; #25 Generate a random permutation of the elements of a list.**


; #26 Generate the combinations of K distinct objects chosen from the N elements of a list.
; ** Tarea #1**
(define combinations
  (lambda (n L)
  (cond[(null? L) '()]
       [(zero? n) '(())]
       [(= n 1) (map list L)]
       [else(append (map (lambda(x) (cons(car L) x) )
                         (combinations(- n 1) (cdr L)))
                         (combinations n (cdr L)))]
       )
    )
  )

; --- EJERCICIO DEL QUIZ ---
; #1
(define eliminate-elem
  (lambda (elem L)
    (cond [(null? L) '()]
          [(eq? (car L) elem)
           (eliminate-elem elem (cdr L))]
          [else (cons (car L)
                      (eliminate-elem elem (cdr L)))]
          )
    )
  )
; #2
(define eliminate-elem-f
  (lambda(L elem) (remv* (list elem) L)))

