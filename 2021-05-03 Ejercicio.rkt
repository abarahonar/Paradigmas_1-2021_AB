#lang scheme
;Constructor (promedio nombre curso colegio)
(define alumno (lambda (promedio nombre curso colegio)
                 (if (and (number? promedio) (string? nombre) (string? curso) (string? colegio))
                     (cons promedio (cons nombre (cons curso (cons colegio null))))
                     null   )))
;Pertenencia
(define alumno? (lambda (x)
                  (and (list? x)
                       (number? (car x))
                       (string? (cadr x))
                       (string? (caddr x))
                       (string? (cadddr x))
                       (null?   (cddddr x))  )))
;Selector
(define getPromedio (lambda (x) (if (alumno? x) (car x) null)))
(define getNombre (lambda (x) (if (alumno? x) (cadr x) null)))
(define getCurso (lambda (x) (if (alumno? x) (caddr x) null)))
(define getColegio (lambda (x) (if (alumno? x) (cadddr x) null)))

;Modificador
(define setPromedio (lambda (x y) (if (and (alumno? x) (number? y)) (alumno y (getNombre x) (getCurso x) (getColegio x)) null)))
(define setNombre (lambda (x y) (if (and (alumno? x) (string? y)) (alumno (getPromedio x) y (getCurso x) (getColegio x)) null)))
(define setCurso (lambda (x y) (if (and (alumno? x) (string? y)) (alumno (getPromedio x) (getNombre x) y (getColegio x)) null)))
(define setColegio (lambda (x y) (if (and (alumno? x) (string? y)) (alumno (getPromedio x) (getNombre x) (getCurso x) y) null)))

;Verificar lista de alumnos
(define alumnos? (lambda (x) (andmap alumno? x)))

;Agregar general, funciona con cantidad de elementos a agregar variable
(define add (lambda (x . args)
              (define myAppend (lambda (x y) (if (empty? x) (cons y null) (cons (car x) (myAppend (cdr x) y)))))
              (define addImpl (lambda (lista)
                                (if (empty? (cdr lista))
                                    (myAppend x (car lista))
                                    (myAppend (addImpl (cdr lista)) (car lista)))))
              (addImpl args)))

(define alan    (alumno 3.4 "Alan" "3 medio A" "Novo horizonte"))
(define vicente (alumno 6.4 "Vicente" "3 medio A" "Novo horizonte"))
(define juan    (alumno 5.4 "Juan" "4 medio A" "Novo horizonte"))
(define cata    (alumno 5.6 "Catalina" "4 medio A" "Novo horizonte"))
(define paola   (alumno 2.4 "Paola" "3 medio A" "Pedro de Valdivia"))
(define maxi    (alumno 5.4 "Maximiliano" "3 medio A" "Pedro de Valdivia"))
(define benja   (alumno 6.8 "Benjamin" "4 medio A" "Pedro de Valdivia"))
(define nico    (alumno 7.0 "Nicolas" "4 medio A" "Pedro de Valdivia"))
(define datos (add null alan vicente juan cata paola maxi benja nico))

; Map Reduce
; Mapencargado de hacer algo con cada elemento de la lista
; Reduce encargado de reducir la entrada a algo mas util
(define mapReduce 
  (lambda (f g)
    (lambda (x) (f (map g x))  )))

(define promedio
  (lambda (x)
    (/ ((mapReduce (lambda (lista) (apply + lista)) getPromedio) x) (length x))))

(define minimo
  (lambda (x)
    ((mapReduce (lambda (lista) (apply min lista)) getPromedio) x)))

(define maximo
  (lambda (x)
    ((mapReduce (lambda (lista) (apply max lista)) getPromedio) x)))

(define porColegio
  (lambda (lista colegio)
    (filter (lambda (x) (eqv? (getColegio x) colegio)) lista)))

(define porCurso
  (lambda (lista curso)
    (filter (lambda (x) (eqv? (getCurso x) curso)) lista)))

; Se puede resumir aun mas
(define operacionPorTermino (lambda (f getT lista t) (f (getT lista t))))
(define promedioPorColegio (lambda (lista colegio) (operacionPorTermino promedio porColegio lista colegio)))
(define minimoPorColegio (lambda (lista colegio) (operacionPorTermino minimo porColegio lista colegio)))
(define maximoPorColegio (lambda (lista colegio) (operacionPorTermino maximo porColegio lista colegio)))
(define promedioPorCurso (lambda (lista curso) (operacionPorTermino promedio porCurso lista curso)))
(define minimoPorCurso (lambda (lista curso) (operacionPorTermino minimo porCurso lista curso)))
(define maximoPorCurso (lambda (lista curso) (operacionPorTermino maximo porCurso lista curso)))
