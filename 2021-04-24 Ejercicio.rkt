#lang scheme
; Implementar TDA de articulo de compra sabiendo que un articulo se compone de su nombre y de su precio hecho
; Implementar funcino que mantenga una lista de compras (add-item)
; Implementar funcino que remueva un item de la lista
; Implementar una funcion que filtre una lista

; Un articulo tendra un string y un numero

; Constructor
(define articulo
  (lambda (nombre precio)
    (if (string? nombre)
        (if (number? precio)
            (cons nombre precio)
            null)
        null)))

(define lenovo (articulo "notebook lenovo" 350000))
;(articulo "notebook dell" "6 kilos de palta")

; Pertenencia
(define articulo?
  (lambda (x)
    (if (pair? x)
        (and (string? (car x)) (number? (cdr x)))
        false)))
(articulo? lenovo)
;(articulo? (cons "perro" "gato"))

; Selector
(define getNombre
  (lambda (x)
    (if (articulo? x)
        (car x)
        null)))
(define getPrecio
  (lambda (x)
    (if (articulo? x)
        (cdr x)
        null)))
(getNombre lenovo)
(getPrecio lenovo)
;(getNombre (cons "perro" "gato"))

; Modificador
(define setNombre
  (lambda (x nombre)
    (if (articulo? x)
        (cons nombre (getPrecio x))
        null)))
(define setPrecio
  (lambda (x precio)
    (if (articulo? x)
        (cons (getNombre x) precio)
        null)))
(setNombre lenovo "dell")
(setPrecio lenovo 450000)

; Varios
(define listaDeArticulos?
  (lambda (x)
    (andmap articulo? x)))
(listaDeArticulos? (cons (articulo "dell" 450000) (cons (articulo "lenovo" 350000) null)))

; Implementar funcino que mantenga una lista de compras (add-item)
(define appendPropio
  (lambda (parActual nuevoElemento)
    (if (empty? parActual)
        (cons nuevoElemento null)
        (if (eqv? (car parActual) null)
            (cons nuevoElemento null)
            (cons (car parActual) (appendPropio (cdr parActual) nuevoElemento))))))
; (a (b (c (d (e null)))))

(define add-item
  (lambda (lista nuevoArticulo)
    (if (and (listaDeArticulos? lista) (articulo? nuevoArticulo))
        (appendPropio lista nuevoArticulo)
        null)))
(add-item (cons (articulo "dell" 450000) null) lenovo)
(listaDeArticulos? (add-item (cons (articulo "dell" 450000) null) lenovo))
; Implementar funcion que remueva un item de la lista
; Pista: yo lo implemente usando una funcion find que retorna el indice del objeto que cumpla con la conficion dada por una funcion f
;        una funcion que dado un indice y una lista, elimine el elemento de la lista indicado por el indice.
(define remove-item
  (lambda (lista nombreArticulo)
    true));Tarea

; Implementar una funcion que filtre una lista de articulos
(define listaDeCompra (add-item (add-item (add-item null (articulo "palta" 1500)) (articulo "ajo" 150)) (articulo "pimenton" 500)))
listaDeCompra
(define filtroDeArticulos
  (lambda (f lista)
    (if (and (listaDeArticulos? lista) (procedure? f))
        (filter f listaDeCompra)
        false)))
(filtroDeArticulos (lambda (x) (< (getPrecio x) 750)) listaDeCompra)
(filtroDeArticulos "perro" listaDeCompra)


