(vl-load-com)
(prompt "\n>>> CARGADO V13 <<<")


; =========================================================
; NOTAS DE COSAS PENDIENTES
; Un muro en la parte exterior con largo por ejmeplo 80 cm si en el que hay dos lados con compensaciones de 50
;por ser muro de 30, como lo resolvemos, no se pueden enfrentar las chapas hay que poner 40 en exterior en vez de 50



; =========================================================






; =========================================================
; MAPA DE BLOQUES POR PIEZA
; =========================================================


(setq *MUROS* nil)
(setq *DEBUG-TORNILLERIA* nil)
(setq *DEBUG-COMPENSACION* nil)
(setq *def-espesor* 30.0)
(setq *def-zinf1* 0.0)
(setq *def-zinf2* 0.0)
(setq *def-zsup1* 300.0)
(setq *def-zsup2* 300.0)
(setq *def-caras* 2)
(setq *def-ref* "IZQUIERDA")(setq *def-espesor-chapa* 10.0)
(setq *def-ala-angulo-interior* 20.0)

; =========================================================
; CATALOGO DE PIEZAS DE ENCOFRADO
; Estructura de cada pieza:
; (ID CODIGO TIPO ANCHO ALTO VERTICAL HORIZONTAL MODULA PREF_H PREF_V ORIENTABLE ACTIVA PRECIO)
; =========================================================
(setq *CATALOGO*
  '(
    ("001" "CHAPA DE ENCOFRAR DE 3X1M"                 "PANEL"      100 300 "SI" "SI" "SI"  1  1 "SI" "SI" 1.73)
    ("002" "CHAPA DE ENCOFRAR DE 3X0,8M"               "PANEL"       80 300 "SI" "SI" "SI"  2  2 "SI" "SI" 1.73)
    ("003" "CHAPA DE ENCOFRAR DE 3X0,6M"               "PANEL"       60 300 "SI" "SI" "SI"  3  3 "SI" "SI" 1.73)
    ("004" "CHAPA DE ENCOFRAR DE 3X0,5M"               "PANEL"       50 300 "SI" "SI" "SI"  4  4 "SI" "SI" 1.73)
    ("005" "CHAPA DE ENCOFRAR DE 3X0,4M"               "PANEL"       40 300 "SI" "SI" "SI"  5  5 "SI" "SI" 1.73)
    ("006" "CHAPA DE ENCOFRAR DE 3X0,3M"               "PANEL"       30 300 "SI" "SI" "SI"  6  6 "SI" "SI" 1.73)
    ("007" "CHAPA DE ENCOFRAR DE 3X0,2M"               "PANEL"       20 300 "SI" "SI" "SI"  7  7 "SI" "SI" 1.73)

    ("008" "CHAPA DE ENCOFRAR DE 1,5X1M"               "PANEL"      100 150 "SI" "SI" "SI"  8  8 "SI" "SI" 1.73)
    ("009" "CHAPA DE ENCOFRAR DE 1,5X0,8M"             "PANEL"       80 150 "SI" "SI" "SI"  9  9 "SI" "SI" 1.73)
    ("010" "CHAPA DE ENCOFRAR DE 1,5X0,6M"             "PANEL"       60 150 "SI" "SI" "SI" 10 10 "SI" "SI" 1.73)
    ("011" "CHAPA DE ENCOFRAR DE 1,5X0,5M"             "PANEL"       50 150 "SI" "SI" "SI" 11 11 "SI" "SI" 1.73)
    ("012" "CHAPA DE ENCOFRAR DE 1,5X0,4M"             "PANEL"       40 150 "SI" "SI" "SI" 12 12 "SI" "SI" 1.73)
    ("013" "CHAPA DE ENCOFRAR DE 1,5X0,3M"             "PANEL"       30 150 "SI" "SI" "SI" 13 13 "SI" "SI" 1.73)
    ("014" "CHAPA DE ENCOFRAR DE 1,5X0,2M"             "PANEL"       20 150 "SI" "SI" "SI" 14 14 "SI" "SI" 1.73)

    ("015" "ANGULO INTERIOR 3"                     "ESQUINA"     20 300 "SI" "NO" "SI" 15 15 "NO" "SI" 1.73)
    ("016" "ANGULO INTERIOR DE 3M ABISAGRADO"          "ESQUINA"     20 300 "SI" "NO" "SI" 16 16 "NO" "SI" 1.73)
    ("017" "ANGULO INTERIOR 1,5"                   "ESQUINA"     20 150 "SI" "NO" "SI" 17 17 "NO" "SI" 1.73)
    ("018" "ANGULO INTERIOR DE 1,5M ABISAGRADO"        "ESQUINA"     20 150 "SI" "NO" "SI" 18 18 "NO" "SI" 1.73)

    ("019" "ANGULO EXTERIOR 3"                     "ESQUINA"      0 300 "SI" "NO" "NO" 19 19 "NO" "SI" 1.73)
    ("020" "ANGULO EXTERIOR DE 3M ABISAGRADO"          "ESQUINA"      0 300 "SI" "NO" "NO" 20 20 "NO" "SI" 1.73)
    ("021" "ANGULO EXTERIOR 1,5"                   "ESQUINA"      0 150 "SI" "NO" "NO" 21 21 "NO" "SI" 1.73)
    ("022" "ANGULO EXTERIOR DE 1,5M ABISAGRADO"        "ESQUINA"      0 150 "SI" "NO" "NO" 22 22 "NO" "SI" 1.73)

    ("023" "GRUESO DE 3M"                              "PERFIL"       5 300 "SI" "SI" "SI" 23 23 "SI" "SI" 1.73)
    ("024" "GRUESO DE 1,5M"                            "PERFIL"       5 150 "SI" "SI" "SI" 24 24 "SI" "SI" 1.73)

    ("025" "MORDAZA REGULABLE CORTA"                   "ACCESORIOS" nil nil nil nil nil nil nil "NO" "SI" 0.09)
    ("026" "MORDAZA REGULABLE LARGA"                   "ACCESORIOS" nil nil nil nil nil nil nil "NO" "SI" 0.09)
    ("027" "MORDAZA DE UNION FIJA"                     "ACCESORIOS" nil nil nil nil nil nil nil "NO" "SI" 0.09)
    ("028" "DAVIDAD DE 3M."                            "ACCESORIOS" nil nil nil nil nil nil nil "NO" "SI" 0.16)
    ("029" "DAVIDAD DE 2M."                            "ACCESORIOS" nil nil nil nil nil nil nil "NO" "SI" 0.11)
    ("030" "DAVIDAD DE 1M."                            "ACCESORIOS" nil nil nil nil nil nil nil "NO" "SI" 0.05)
    ("031" "DAVIDAD DE 0,25M."                         "ACCESORIOS" nil nil nil nil nil nil nil "NO" "SI" 0.03)
    ("032" "TORNILLO PLETINA"                          "ACCESORIOS" nil nil nil nil nil nil nil "NO" "SI" 0.03)
    ("033" "TORNILLO PLETINA VELA"                     "ACCESORIOS" nil nil nil nil nil nil nil "NO" "SI" 0.03)
    ("034" "TUERCA GRANDE"                             "ACCESORIOS" nil nil nil nil nil nil nil "NO" "SI" 0.03)
    ("035" "TUERCA PEQUEA"                            "ACCESORIOS" nil nil nil nil nil nil nil "NO" "SI" 0.03)
    ("036" "ESCUADRA VELA"                             "ACCESORIOS" nil nil nil nil nil nil nil "NO" "SI" 4.72)
    ("037" "MENSULA DE TRABAJO"                        "ACCESORIOS" nil nil nil nil nil nil nil "NO" "SI" 1.68)
    ("038" "BARANDILLA DE MENSULA O ANTEPECHO"         "ACCESORIOS" nil nil nil nil nil nil nil "NO" "SI" 0.32)
    ("039" "GANCHO PARA COLOCAR CHAPAS"                "ACCESORIOS" nil nil nil nil nil nil nil "NO" "SI" 1.68)
    ("040" "RIGIDIZADOR"                               "ACCESORIOS" nil nil nil nil nil nil nil "NO" "SI" 1.79)
    ("041" "CAJON PARA TORNILLERIA"                    "ACCESORIOS" nil nil nil nil nil nil nil "NO" "SI" 2.23)
    ("101" "CONO DE PVC"       				"VENTA" nil nil nil nil nil nil nil "NO" "SI" 0.12)
    ("102" "TAPON DE PVC"      				"VENTA" nil nil nil nil nil nil nil "NO" "SI" 0.12)
    ("103" "TUBO DE PVC ML"    				"VENTA" nil nil nil nil nil nil nil "NO" "SI" 0.71)
  )
)
(setq *MAPA-BLOQUES-PIEZAS*
  '(
    ("001" . "CM 3X1 PH")
    ("002" . "CM 3X0.8 PH")
    ("003" . "CM 3X0.6 PH")
    ("004" . "CM 3X0.5 PH")
    ("005" . "CM 3X0.4 PH")
    ("006" . "CM 3X0.3 PH")
    ("007" . "CM 3X0.2 PH")
    
    ("008" . "CM 1.5X1 PH")
    ("009" . "CM 1.5X0.8 PH")
    ("010" . "CM 1.5X0.6 PH")
    ("011" . "CM 1.5X0.5 PH")
    ("012" . "CM 1.5X0.4 PH")
    ("013" . "CM 1.5X0.3 PH")
    ("014" . "CM 1.5X0.2 PH")

    ("015" . "ANGULO INTERIOR 3-1")
    ("016" . "ANGULO INTERIOR DE 3M ABISAGRADO")
    ("017" . "ANGULO INTERIOR 1.5-1")
    ("018" . "ANGULO INTERIOR DE 1.5M ABISAGRADO")
    ("019" . "ANGULO EXTERIOR DE 3M")
    ("020" . "ANGULO EXTERIOR DE 3M ABISAGRADO")
    ("021" . "ANGULO EXTERIOR 1.5-1")
    ("022" . "ANGULO EXTERIOR DE 1.5M ABISAGRADO")
    
    ("023" . "GRUESO 3 PH")
    ("024" . "GRUESO 1.5 PH")
)
)
(setq *MAPA-BLOQUES-PIEZAS-H*
  '(
    ("001" . "CM 3X1 TH")
    ("002" . "CM 3X0.8 TH")
    ("003" . "CM 3X0.6 TH")
    ("004" . "CM 3X0.5 TH")
    ("005" . "CM 3X0.4 TH")
    ("006" . "CM 3X0.3 TH")
    ("007" . "CM 3X0.2 TH")

    ("008" . "CM 1.5X1 TH")
    ("009" . "CM 1.5X0.8 TH")
    ("010" . "CM 1.5X0.6 TH")
    ("011" . "CM 1.5X0.5 TH")
    ("012" . "CM 1.5X0.4 TH")
    ("013" . "CM 1.5X0.3 TH")
    ("014" . "CM 1.5X0.2 TH")

    ("015" . "ANGULO INTERIOR 3-1")
    ("016" . "ANGULO INTERIOR DE 3M ABISAGRADO")
    ("017" . "ANGULO INTERIOR 1.5-1")
    ("018" . "ANGULO INTERIOR DE 1.5M ABISAGRADO")
    ("019" . "ANGULO EXTERIOR DE 3M")
    ("020" . "ANGULO EXTERIOR DE 3M ABISAGRADO")
    ("021" . "ANGULO EXTERIOR 1.5-1")
    ("022" . "ANGULO EXTERIOR DE 1.5M ABISAGRADO")

    ("023" . "GRUESO 3 TH")
    ("024" . "GRUESO 1.5 TH")
  )
)
(defun _bloque-de-pieza (pieza / id)
  (setq id (_cat-id pieza))
  (cdr (assoc id *MAPA-BLOQUES-PIEZAS*))
)

(defun _bloque-de-pieza-horizontal (pieza / id)
  (setq id (_cat-id pieza))
  (cdr (assoc id *MAPA-BLOQUES-PIEZAS-H*))
)

(defun _bloque-de-pieza-segun-giro (pieza giroUso / blk)
  (setq blk nil)

  (if (= giroUso "SI")
    (setq blk (_bloque-de-pieza-horizontal pieza))
    (setq blk (_bloque-de-pieza pieza))
  )

  (if blk
    blk
    (_bloque-de-pieza pieza)
  )
)
; =========================================================
; FUNCIONES DE ACCESO AL CATALOGO
; =========================================================

(defun _cat-id          (pieza) (nth 0 pieza))
(defun _cat-codigo      (pieza) (nth 1 pieza))
(defun _cat-tipo        (pieza) (nth 2 pieza))
(defun _cat-ancho       (pieza) (nth 3 pieza))
(defun _cat-alto        (pieza) (nth 4 pieza))
(defun _cat-vertical    (pieza) (nth 5 pieza))
(defun _cat-horizontal  (pieza) (nth 6 pieza))
(defun _cat-modula      (pieza) (nth 7 pieza))
(defun _cat-pref-h      (pieza) (nth 8 pieza))
(defun _cat-pref-v      (pieza) (nth 9 pieza))
(defun _cat-orientable  (pieza) (nth 10 pieza))
(defun _cat-activa      (pieza) (nth 11 pieza))
(defun _cat-precio      (pieza) (nth 12 pieza))

(defun _pieza-orientable-p (pieza)
  (_si-p (_cat-orientable pieza))
)

(defun _si-p (v)
  (= v "SI")
)

(defun _pieza-activa-p (pieza)
  (_si-p (_cat-activa pieza))
)

(defun _pieza-tipo-p (pieza tipo)
  (= (strcase (_cat-tipo pieza)) (strcase tipo))
)

(defun _pieza-modula-p (pieza)
  (_si-p (_cat-modula pieza))
)

(defun _pieza-vertical-p (pieza)
  (_si-p (_cat-vertical pieza))
)

(defun _pieza-horizontal-p (pieza)
  (_si-p (_cat-horizontal pieza))
)

(defun _catalogo-activo (/ res item)
  (setq res '())
  (foreach item *CATALOGO*
    (if (_pieza-activa-p item)
      (setq res (append res (list item)))
    )
  )
  res
)

(defun _catalogo-por-tipo (tipo / res item)
  (setq res '())
  (foreach item *CATALOGO*
    (if (and (_pieza-activa-p item) (_pieza-tipo-p item tipo))
      (setq res (append res (list item)))
    )
  )
  res
)

(defun _catalogo-paneles ()
  (_catalogo-por-tipo "PANEL")
)

(defun _catalogo-esquinas ()
  (_catalogo-por-tipo "ESQUINA")
)

(defun _catalogo-perfiles ()
  (_catalogo-por-tipo "PERFIL")
)

(defun _catalogo-accesorios ()
  (_catalogo-por-tipo "ACCESORIOS")
)

(defun _catalogo-modulables (/ res item)
  (setq res '())
  (foreach item *CATALOGO*
    (if (and (_pieza-activa-p item) (_pieza-modula-p item))
      (setq res (append res (list item)))
    )
  )
  res
)

(defun _catalogo-paneles-verticales (/ res item)
  (setq res '())
  (foreach item (_catalogo-paneles)
    (if (_pieza-vertical-p item)
      (setq res (append res (list item)))
    )
  )
  res
)

(defun _catalogo-paneles-horizontales (/ res item)
  (setq res '())
  (foreach item (_catalogo-paneles)
    (if (_pieza-horizontal-p item)
      (setq res (append res (list item)))
    )
  )
  res
)

(defun _buscar-pieza-por-id (id / res item)
  (setq res nil)
  (foreach item *CATALOGO*
    (if (= (_cat-id item) id)
      (setq res item)
    )
  )
  res
)

(defun _buscar-pieza-por-codigo (codigo / res item)
  (setq res nil)
  (foreach item *CATALOGO*
    (if (= (strcase (_cat-codigo item)) (strcase codigo))
      (setq res item)
    )
  )
  res
)


; =========================================================
; STOCK LIMITADO TEMPORAL
; No se guarda en disco: al recargar el LISP o cerrar AutoCAD se pierde.
; Formato: (("001" . 2) ("004" . 0))
; =========================================================

(if (not (boundp '*STOCK-LIMITADO*))
  (setq *STOCK-LIMITADO* nil)
)

(setq *STOCK-CONSUMO-CALCULO* nil)

(defun _stock-normalizar-id (id)
  (if id (strcase id) nil)
)

(defun _stock-limite-id (id / par)
  (setq par (assoc (_stock-normalizar-id id) *STOCK-LIMITADO*))
  (if par (cdr par) nil)
)

(defun _stock-consumo-id (id / par)
  (setq par (assoc (_stock-normalizar-id id) *STOCK-CONSUMO-CALCULO*))
  (if par (cdr par) 0)
)

(defun _stock-set-par (id cant / idn res par)
  (setq idn (_stock-normalizar-id id))
  (setq res '())
  (foreach par *STOCK-LIMITADO*
    (if (/= (car par) idn)
      (setq res (append res (list par)))
    )
  )
  (if cant
    (setq res (append res (list (cons idn cant))))
  )
  (setq *STOCK-LIMITADO* res)
)

(defun _stock-sumar-consumo-id (id cant / idn res par puesto)
  (setq idn (_stock-normalizar-id id))
  (setq res '())
  (setq puesto nil)
  (foreach par *STOCK-CONSUMO-CALCULO*
    (if (= (car par) idn)
      (progn
        (setq res (append res (list (cons idn (+ (cdr par) cant)))))
        (setq puesto T)
      )
      (setq res (append res (list par)))
    )
  )
  (if (null puesto)
    (setq res (append res (list (cons idn cant))))
  )
  (setq *STOCK-CONSUMO-CALCULO* res)
)

(defun _stock-contar-usos (usos / res u pieza id par)
  (setq res '())
  (foreach u usos
    (setq pieza (_uso-pieza-pieza u))
    (if pieza
      (progn
        (setq id (_cat-id pieza))
        (setq par (assoc id res))
        (if par
          (setq res (subst (cons id (1+ (cdr par))) par res))
          (setq res (append res (list (cons id 1))))
        )
      )
    )
  )
  res
)

(defun _stock-contar-piezas (piezas / res pieza id par)
  (setq res '())
  (foreach pieza piezas
    (if pieza
      (progn
        (setq id (_cat-id pieza))
        (setq par (assoc id res))
        (if par
          (setq res (subst (cons id (1+ (cdr par))) par res))
          (setq res (append res (list (cons id 1))))
        )
      )
    )
  )
  res
)

(defun _stock-ok-con-contadores-p (conts / ok id cant limite usado)
  (setq ok T)
  (foreach par conts
    (setq id (car par))
    (setq cant (cdr par))
    (setq limite (_stock-limite-id id))
    (if limite
      (progn
        (setq usado (_stock-consumo-id id))
        (if (> (+ usado cant) limite)
          (setq ok nil)
        )
      )
    )
  )
  ok
)

(defun _stock-ok-usos-p (usos)
  (_stock-ok-con-contadores-p (_stock-contar-usos usos))
)

(defun _stock-ok-piezas-p (piezas)
  (_stock-ok-con-contadores-p (_stock-contar-piezas piezas))
)

(defun _stock-reservar-usos (usos / conts par)
  (setq conts (_stock-contar-usos usos))
  (foreach par conts
    (_stock-sumar-consumo-id (car par) (cdr par))
  )
)

(defun _stock-reservar-piezas (piezas / conts par)
  (setq conts (_stock-contar-piezas piezas))
  (foreach par conts
    (_stock-sumar-consumo-id (car par) (cdr par))
  )
)

(defun _stock-iniciar-calculo ()
  (setq *STOCK-CONSUMO-CALCULO* nil)
)

(defun _stock-usos-solucion-panyo (sol / res bandas b)
  (setq res '())
  (if sol
    (progn
      (setq bandas (_sol-panyo-bandas sol))
      (foreach b bandas
        (setq res (append res (_banda-piezas b)))
      )
    )
  )
  res
)

(defun _stock-imprimir-limitaciones (/ par pieza)
  (if *STOCK-LIMITADO*
    (progn
      (prompt "\n===== STOCK LIMITADO ACTIVO =====")
      (foreach par *STOCK-LIMITADO*
        (setq pieza (_buscar-pieza-por-id (car par)))
        (prompt
          (strcat
            "\n  " (car par)
            " - " (if pieza (_cat-codigo pieza) "PIEZA NO ENCONTRADA")
            " -> MAX " (itoa (cdr par))
          )
        )
      )
    )
  )
)

(defun _stock-imprimir-catalogo-ids (/ item ancho alto)
  ;; Listado corto para poder elegir el ID al limitar stock.
  (prompt "\n===== CATALOGO PARA LIMITAR STOCK =====")
  (foreach item *CATALOGO*
    (if (= (_cat-activa item) "SI")
      (progn
        (setq ancho (if (_cat-ancho item) (itoa (_cat-ancho item)) "-"))
        (setq alto  (if (_cat-alto item)  (itoa (_cat-alto item))  "-"))
        (prompt
          (strcat
            "\n  " (_cat-id item)
            " | " (_cat-codigo item)
            " | " (_cat-tipo item)
            " | " ancho "x" alto
          )
        )
      )
    )
  )
  (prompt "\n=======================================")
)

(defun c:LIMITAR_STOCK (/ id pieza cant)
  (_stock-imprimir-catalogo-ids)
  (setq id (getstring T "\nID de pieza a limitar: "))
  (setq pieza (_buscar-pieza-por-id (_stock-normalizar-id id)))
  (if (null pieza)
    (prompt "\nNo existe ninguna pieza con ese ID.")
    (progn
      (setq cant (getint (strcat "\nCantidad maxima disponible para " (_cat-codigo pieza) ": ")))
      (if (or (null cant) (< cant 0))
        (prompt "\nCantidad no valida.")
        (progn
          (_stock-set-par (_cat-id pieza) cant)
          (prompt
            (strcat
              "\nStock limitado: " (_cat-id pieza) " - " (_cat-codigo pieza)
              " -> MAX " (itoa cant)
            )
          )
        )
      )
    )
  )
  (princ)
)

(defun c:QUITAR_LIMITE_STOCK (/ id pieza)
  (setq id (getstring T "\nID de pieza para quitar limite: "))
  (setq pieza (_buscar-pieza-por-id (_stock-normalizar-id id)))
  (if (null pieza)
    (prompt "\nNo existe ninguna pieza con ese ID.")
    (progn
      (_stock-set-par (_cat-id pieza) nil)
      (prompt (strcat "\nLimite eliminado para " (_cat-id pieza) " - " (_cat-codigo pieza)))
    )
  )
  (princ)
)

(defun c:LIMPIAR_STOCK ()
  (setq *STOCK-LIMITADO* nil)
  (setq *STOCK-CONSUMO-CALCULO* nil)
  (prompt "\nStock limitado limpiado.")
  (princ)
)

(defun c:LISTAR_STOCK_LIMITADO ()
  (if *STOCK-LIMITADO*
    (_stock-imprimir-limitaciones)
    (prompt "\nNo hay stock limitado activo.")
  )
  (princ)
)

(defun c:LISTAR_CATALOGO (/ item)
  (if (null *CATALOGO*)
    (prompt "\nNo hay catalogo cargado.")
    (progn
      (prompt "\n===== CATALOGO COMPLETO =====")
      (foreach item *CATALOGO*
        (prompt
          (strcat
            "\nID: " (_cat-id item)
            " | CODIGO: " (_cat-codigo item)
            " | TIPO: " (_cat-tipo item)
            " | ANCHO: " (if (_cat-ancho item) (itoa (_cat-ancho item)) "-")
            " | ALTO: "  (if (_cat-alto item)  (itoa (_cat-alto item)) "-")
            " | V: "     (if (_cat-vertical item)   (_cat-vertical item) "-")
            " | H: "     (if (_cat-horizontal item) (_cat-horizontal item) "-")
            " | MOD: "   (if (_cat-modula item)     (_cat-modula item) "-")
            " | PH: "    (if (_cat-pref-h item) (itoa (_cat-pref-h item)) "-")
            " | PV: "    (if (_cat-pref-v item) (itoa (_cat-pref-v item)) "-")
            " | ORI: "   (_cat-orientable item)
            " | ACT: "   (_cat-activa item)
            " | PVP: "   (rtos (_cat-precio item) 2 2)
          )
        )
      )
    )
  )
  (princ)
)

(defun c:LISTAR_PANELES (/ item)
  (prompt "\n===== PANELES ACTIVOS =====")
  (foreach item (_catalogo-paneles)
    (prompt
      (strcat
        "\nID: " (_cat-id item)
        " | " (_cat-codigo item)
        " | " (itoa (_cat-ancho item)) "x" (itoa (_cat-alto item))
        " | V:" (_cat-vertical item)
        " | H:" (_cat-horizontal item)
      )
    )
  )
  (princ)
)

(defun c:LISTAR_ESQUINAS (/ item)
  (prompt "\n===== ESQUINAS ACTIVAS =====")
  (foreach item (_catalogo-esquinas)
    (prompt
      (strcat
        "\nID: " (_cat-id item)
        " | " (_cat-codigo item)
      )
    )
  )
  (princ)
)

(defun c:LISTAR_PERFILES (/ item)
  (prompt "\n===== PERFILES ACTIVOS =====")
  (foreach item (_catalogo-perfiles)
    (prompt
      (strcat
        "\nID: " (_cat-id item)
        " | " (_cat-codigo item)
        " | " (itoa (_cat-ancho item)) "x" (itoa (_cat-alto item))
      )
    )
  )
  (princ)
)

; =========================================================
; UTILIDADES BASICAS
; =========================================================

(defun _pmid (p1 p2)
  (mapcar '(lambda (a b) (/ (+ a b) 2.0)) p1 p2)
)

(defun _txt (pt h s / p)
  (setq p (list (car pt) (cadr pt) 0.0))
  (entmakex
    (list
      (cons 0 "TEXT")
      (cons 10 p)
      (cons 11 p)
      (cons 40 h)
      (cons 1 s)
      (cons 7 (getvar "TEXTSTYLE"))
      (cons 50 0.0)
      (cons 72 1)
      (cons 73 2)
    )
  )
)

(defun _get-length (obj)
  (vlax-curve-getDistAtParam obj (vlax-curve-getEndParam obj))
)

(defun _get-handle (ent)
  (cdr (assoc 5 (entget ent)))
)
(defun _medida-acaba-en-5-p (x / n)
  (setq n (fix (+ x 0.5)))
  (= (rem n 10) 5)
)
(defun _longitud-modular-encofrado (x / n)
  ;; Las piezas industriales modulan cada 5 cm. El sobrante se resuelve
  ;; con madera y no forma parte del despiece ni del stock.
  (if (and x (> x 0.0))
    (progn
      (setq n (fix (/ (+ x 1e-6) 5.0)))
      (* 5.0 n)
    )
    0.0
  )
)

(defun _longitud-madera-encofrado (x / modular resto)
  (setq modular (_longitud-modular-encofrado x))
  (setq resto (- x modular))
  (if (> resto 1e-6) resto 0.0)
)

(defun _extremo-madera-pano (res)
  ;; La madera se coloca junto a la esquina, nunca en el extremo libre.
  ;; Si el muro tiene esquinas en ambos extremos, se prioriza INICIO.
  (cond
    ((cdr (assoc "INICIO" res)) "INICIO")
    ((cdr (assoc "FINAL" res))  "FINAL")
    (T "INICIO")
  )
)
(defun _fmt-real (v)
  (if v (rtos v 2 2) "-")
)

(defun _fmt-int (v)
  (if v (itoa v) "-")
)

(defun _fmt-str (v)
  (if v v "-")
)

; =========================================================
; COLOCACIONES DE PIEZAS
; =========================================================
(defun _hacer-colocacion-pieza (pieza muro cara banda-idx s0 s1 z0 z1 p0 p1 ang giro-uso bloque)
  (list
    (cons "PIEZA" pieza)
    (cons "MURO" (_muro-id muro))
    (cons "CARA" cara)
    (cons "BANDA" banda-idx)
    (cons "S0" s0)
    (cons "S1" s1)
    (cons "Z0" z0)
    (cons "Z1" z1)
    (cons "P0" p0)
    (cons "P1" p1)
    (cons "ANG" ang)
    (cons "GIRO_USO" giro-uso)
    (cons "BLOQUE" bloque)
  )
)

(defun _col-pieza     (c) (cdr (assoc "PIEZA" c)))
(defun _col-muro      (c) (cdr (assoc "MURO" c)))
(defun _col-cara      (c) (cdr (assoc "CARA" c)))
(defun _col-banda     (c) (cdr (assoc "BANDA" c)))
(defun _col-s0        (c) (cdr (assoc "S0" c)))
(defun _col-s1        (c) (cdr (assoc "S1" c)))
(defun _col-z0        (c) (cdr (assoc "Z0" c)))
(defun _col-z1        (c) (cdr (assoc "Z1" c)))
(defun _col-p0        (c) (cdr (assoc "P0" c)))
(defun _col-p1        (c) (cdr (assoc "P1" c)))
(defun _col-ang       (c) (cdr (assoc "ANG" c)))
(defun _col-giro-uso  (c) (cdr (assoc "GIRO_USO" c)))
(defun _col-bloque    (c) (cdr (assoc "BLOQUE" c)))
(defun _col-extremo   (c) (cdr (assoc "EXTREMO" c)))
(defun _col-origen    (c) (cdr (assoc "ORIGEN" c)))
(defun _col-oblicua   (c) (cdr (assoc "OBLICUA" c)))
(defun _col-origen-banda (c)
  (cdr (assoc "ORIGEN_BANDA" c))
)

(defun _altura-uso-colocacion (c)
  (- (_col-z1 c) (_col-z0 c))
)
(defun _altura-fisica-colocacion (c / pieza)
  (setq pieza (_col-pieza c))
  (if pieza
    (_cat-alto pieza)
    (_altura-uso-colocacion c)
  )
)

(defun _longitud-uso-colocacion (c)
  (- (_col-s1 c) (_col-s0 c))
)
(defun _punto-insercion-colocacion-3d (c / pt corr)
  (setq pt (_pt+z (_col-p0 c) (_col-z0 c)))
  (setq corr (_correccion-espesor-colocacion c))
  (_vec-add pt corr)
)

(defun _direccion-tramo-colocacion (c / p0 p1)
  (setq p0 (_col-p0 c))
  (setq p1 (_col-p1 c))
  (_vec-unit (_vec-sub p1 p0))
)

(defun _normal-tramo-colocacion (c / u)
  (setq u (_direccion-tramo-colocacion c))
  (list (- (cadr u)) (car u) 0.0)
)


; =========================================================
; PERSISTENCIA EN ENTIDAD (XRECORD)
; =========================================================

(setq *DICT-MURO* "MURO_ENCOFRADO")

(defun _xr-str-int (v)
  (if v (itoa v) "")
)

(defun _xr-str-real (v)
  (if v (rtos v 2 8) "")
)

(defun _xr-str-txt (v)
  (if v v "")
)

(defun _xr-val-int (s)
  (if (and s (/= s ""))
    (atoi s)
    nil
  )
)

(defun _xr-val-real (s)
  (if (and s (/= s ""))
    (atof s)
    nil
  )
)

(defun _xr-val-txt (s)
  (if (and s (/= s ""))
    s
    nil
  )
)

(defun _muro-a-pares-xrecord (muro / id esp caras ref zinf1 zinf2 zsup1 zsup2)
  (setq id    (nth 0 muro))
  (setq esp   (nth 7 muro))
  (setq caras (nth 8 muro))
  (setq ref   (nth 9 muro))
  (setq zinf1 (nth 10 muro))
  (setq zinf2 (nth 11 muro))
  (setq zsup1 (nth 12 muro))
  (setq zsup2 (nth 13 muro))

  (list
    (cons "ID"    (_xr-str-int  id))
    (cons "ESP"   (_xr-str-real esp))
    (cons "CARAS" (_xr-str-int  caras))
    (cons "REF"   (_xr-str-txt  ref))
    (cons "ZI1"   (_xr-str-real zinf1))
    (cons "ZI2"   (_xr-str-real zinf2))
    (cons "ZS1"   (_xr-str-real zsup1))
    (cons "ZS2"   (_xr-str-real zsup2))
  )
)

(defun _entidad-extdict-existe-p (ent)
  (if (assoc 360 (entget ent)) T nil)
)

(defun _obtener-extdict-entidad (ent)
  (cdr (assoc 360 (entget ent)))
)

(defun _asegurar-extdict-entidad (ent / obj dict)
  (setq obj  (vlax-ename->vla-object ent))
  (setq dict (vla-GetExtensionDictionary obj))
  (vlax-vla-object->ename dict)
)

(defun _dict-buscar-entrada-ename (dict clave / ds)
  (setq ds (dictsearch dict clave))
  (cond
    ((cdr (assoc 350 ds)))
    ((cdr (assoc 360 ds)))
    ((cdr (assoc -1 ds)))
    (T nil)
  )
)

(defun _str-pos (s ch / i n res)
  (setq i 1)
  (setq n (strlen s))
  (setq res nil)

  (while (and (<= i n) (null res))
    (if (= (substr s i 1) ch)
      (setq res i)
    )
    (setq i (1+ i))
  )

  res
)

(defun _split-clave-valor (s / p)
  (setq p (_str-pos s "="))
  (if p
    (list
      (substr s 1 (1- p))
      (substr s (1+ p))
    )
    nil
  )
)

(defun _crear-xrecord-desde-pares (pares / datos par xr)
  (setq datos
    (list
      (cons 0 "XRECORD")
      (cons 100 "AcDbXrecord")
      (cons 280 1)
    )
  )

  (foreach par pares
    (setq datos
      (append datos
        (list
          (cons 1 (strcat (car par) "=" (cdr par)))
        )
      )
    )
  )

  (setq xr (entmakex datos))
  xr
)

(defun _borrar-xrecord-muro (ent / dict xr)
  (setq dict (_obtener-extdict-entidad ent))
  (if dict
    (progn
      (setq xr (_dict-buscar-entrada-ename dict *DICT-MURO*))
      (if xr
        (progn
          (dictremove dict *DICT-MURO*)
          (if (entget xr) (entdel xr))
          T
        )
        nil
      )
    )
    nil
  )
)

(defun _guardar-muro-en-entidad (muro / ent dict pares xr)
  (setq ent (nth 2 muro))

  (if (and ent (entget ent))
    (progn
      (setq dict (_asegurar-extdict-entidad ent))
      (_borrar-xrecord-muro ent)
      (setq pares (_muro-a-pares-xrecord muro))
      (setq xr (_crear-xrecord-desde-pares pares))

      (if (and dict xr)
        (progn
          (dictadd dict *DICT-MURO* xr)
          T
        )
        nil
      )
    )
    nil
  )
)

(defun _leer-xdata-muro (ent / dict xr ed res par kv clave valor)
  (setq res
    (list
      (cons "ID" nil)
      (cons "ESP" nil)
      (cons "CARAS" nil)
      (cons "REF" nil)
      (cons "ZI1" nil)
      (cons "ZI2" nil)
      (cons "ZS1" nil)
      (cons "ZS2" nil)
    )
  )

  (setq dict (_obtener-extdict-entidad ent))

  (if dict
    (progn
      (setq xr (_dict-buscar-entrada-ename dict *DICT-MURO*))
      (if xr
        (progn
          (setq ed (entget xr))
          (foreach par ed
            (if (= (car par) 1)
              (progn
                (setq kv (_split-clave-valor (cdr par)))
                (if kv
                  (progn
                    (setq clave (car kv))
                    (setq valor (cadr kv))
                    (if (assoc clave res)
                      (setq res
                        (subst
                          (cons clave valor)
                          (assoc clave res)
                          res
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )

  res
)

(defun _entidad-con-xdata-muro-p (ent / datos)
  (setq datos (_leer-xdata-muro ent))
  (if (cdr (assoc "ID" datos)) T nil)
)

(defun _muro-desde-entidad-y-xdata (ent / obj p1 p2 len ang h datos id esp caras ref zinf1 zinf2 zsup1 zsup2)
  (setq obj (vlax-ename->vla-object ent))
  (setq p1 (vlax-curve-getStartPoint obj))
  (setq p2 (vlax-curve-getEndPoint obj))
  (setq len (_get-length obj))
  (setq ang (angle p1 p2))
  (setq h (_get-handle ent))

  (setq datos (_leer-xdata-muro ent))

  (setq id    (_xr-val-int  (cdr (assoc "ID" datos))))
  (setq esp   (_xr-val-real (cdr (assoc "ESP" datos))))
  (setq caras (_xr-val-int  (cdr (assoc "CARAS" datos))))
  (setq ref   (_xr-val-txt  (cdr (assoc "REF" datos))))
  (setq zinf1 (_xr-val-real (cdr (assoc "ZI1" datos))))
  (setq zinf2 (_xr-val-real (cdr (assoc "ZI2" datos))))
  (setq zsup1 (_xr-val-real (cdr (assoc "ZS1" datos))))
  (setq zsup2 (_xr-val-real (cdr (assoc "ZS2" datos))))

  (list id h ent p1 p2 len ang esp caras ref zinf1 zinf2 zsup1 zsup2)
)

(defun _siguiente-id-entidades (ss / i ent datos id maxid)
  (setq maxid 0)
  (if ss
    (progn
      (setq i 0)
      (while (< i (sslength ss))
        (setq ent (ssname ss i))
        (if (_entidad-con-xdata-muro-p ent)
          (progn
            (setq datos (_leer-xdata-muro ent))
            (setq id (_xr-val-int (cdr (assoc "ID" datos))))
            (if (and id (> id maxid))
              (setq maxid id)
            )
          )
        )
        (setq i (1+ i))
      )
    )
  )
  (1+ maxid)
)

(defun c:VER_DATOS_MURO (/ sel ent datos)
  (setq sel (entsel "\nSelecciona linea de muro: "))

  (if sel
    (progn
      (setq ent (car sel))
      (setq datos (_leer-xdata-muro ent))

      (if (cdr (assoc "ID" datos))
        (prompt
          (strcat
            "\nID: "    (_fmt-str (cdr (assoc "ID" datos)))
            " | ESP: "  (_fmt-str (cdr (assoc "ESP" datos)))
            " | CARAS: "(_fmt-str (cdr (assoc "CARAS" datos)))
            " | REF: "  (_fmt-str (cdr (assoc "REF" datos)))
            " | ZI1: "  (_fmt-str (cdr (assoc "ZI1" datos)))
            " | ZI2: "  (_fmt-str (cdr (assoc "ZI2" datos)))
            " | ZS1: "  (_fmt-str (cdr (assoc "ZS1" datos)))
            " | ZS2: "  (_fmt-str (cdr (assoc "ZS2" datos)))
          )
        )
        (prompt "\nLa entidad no tiene datos persistentes de muro.")
      )
    )
  )

  (princ)
)

; =========================================================
; BUSQUEDA / GESTION DE MUROS
; =========================================================

(defun _buscar-muro-por-handle (h lista / item res)
  (setq res nil)
  (foreach item lista
    (if (= (nth 1 item) h)
      (setq res item)
    )
  )
  res
)

(defun _buscar-muro-por-id (id lista / item res)
  (setq res nil)
  (foreach item lista
    (if (= (nth 0 item) id)
      (setq res item)
    )
  )
  res
)

(defun _reemplazar-muro (nuevo lista / item res id)
  (setq res '())
  (setq id (nth 0 nuevo))
  (foreach item lista
    (if (= (nth 0 item) id)
      (setq res (append res (list nuevo)))
      (setq res (append res (list item)))
    )
  )
  res
)

(defun _siguiente-id (lista / maxid item)
  (setq maxid 0)
  (foreach item lista
    (if (> (nth 0 item) maxid)
      (setq maxid (nth 0 item))
    )
  )
  (1+ maxid)
)

(defun c:CARGAR_MUROS_DWG (/ ss i ent muro)
  (prompt "\nSelecciona lineas con datos de muro guardados: ")
  (setq ss (ssget '((0 . "LINE"))))

  (if ss
    (progn
      (setq *MUROS* '())
      (setq i 0)
      (while (< i (sslength ss))
        (setq ent (ssname ss i))
        (if (_entidad-con-xdata-muro-p ent)
          (progn
            (setq muro (_muro-desde-entidad-y-xdata ent))
            (setq *MUROS* (append *MUROS* (list muro)))
          )
        )
        (setq i (1+ i))
      )
      (prompt (strcat "\nMuros cargados desde DWG: " (itoa (length *MUROS*))))
    )
    (prompt "\nNo se seleccionaron lineas.")
  )
  (princ)
)

; =========================================================
; PETICION DE DATOS
; =========================================================

(defun _pedir-real-default (msg def / val txt)
  (setq txt (strcat "\n" msg " <" (rtos def 2 2) ">: "))
  (setq val (getreal txt))
  (if (null val) def val)
)

(defun _pedir-int-default (msg def / val txt)
  (setq txt (strcat "\n" msg " <" (itoa def) ">: "))
  (setq val (getint txt))
  (if (null val) def val)
)

(defun _pedir-ref-default (def / val)
  (initget "IZQUIERDA DERECHA")
  (setq val
    (getkword
      (strcat
        "\nLa otra cara del muro se genera a [IZQUIERDA/DERECHA] segun el avance de la linea <"
        def
        ">: "
      )
    )
  )
  (if (null val) def val)
)

; =========================================================
; ESTRUCTURA DEL MURO
; =========================================================

(defun _muro-desde-entidad (id ent / obj p1 p2 len ang h)
  (setq obj (vlax-ename->vla-object ent))
  (setq p1 (vlax-curve-getStartPoint obj))
  (setq p2 (vlax-curve-getEndPoint obj))
  (setq len (_get-length obj))
  (setq ang (angle p1 p2))
  (setq h (_get-handle ent))

  (list id h ent p1 p2 len ang nil nil nil nil nil nil nil)
)

(defun _actualizar-geometria-muro (muro / ent obj p1 p2 len ang)
  (setq ent (nth 2 muro))
  (if (and ent (entget ent))
    (progn
      (setq obj (vlax-ename->vla-object ent))
      (setq p1 (vlax-curve-getStartPoint obj))
      (setq p2 (vlax-curve-getEndPoint obj))
      (setq len (_get-length obj))
      (setq ang (angle p1 p2))
      (list
        (nth 0 muro)
        (nth 1 muro)
        ent
        p1
        p2
        len
        ang
        (nth 7 muro)
        (nth 8 muro)
        (nth 9 muro)
        (nth 10 muro)
        (nth 11 muro)
        (nth 12 muro)
        (nth 13 muro)
      )
    )
    muro
  )
)

; =========================================================
; COMANDOS DE GESTION
; =========================================================

(defun c:BORRAR_MUROS_MEM ()
  (setq *MUROS* nil)
  (prompt "\nMemoria de muros borrada.")
  (princ)
)


(defun c:DEFINIR_MUROS (/ sel ent h muro id esp caras ref zinf1 zinf2 zsup1 zsup2 nuevo pm)
  (if (null *MUROS*)
    (setq *MUROS* '())
  )

  (prompt "\nSelecciona muros uno a uno. ENTER para terminar.")

  (setq sel (entsel "\nSelecciona muro: "))

  (while sel
    (setq ent (car sel))

    (if (= (cdr (assoc 0 (entget ent))) "LINE")
      (progn
        (setq h (_get-handle ent))

        ;; Si ya existe en memoria, lo usamos.
        (setq muro (_buscar-muro-por-handle h *MUROS*))

        ;; Si no existe pero tiene datos guardados en DWG, lo recuperamos.
        (if (null muro)
          (if (_entidad-con-xdata-muro-p ent)
            (progn
              (setq muro (_muro-desde-entidad-y-xdata ent))
              (setq *MUROS* (append *MUROS* (list muro)))
            )
          )
        )

        ;; Si no existe ni en memoria ni en DWG, lo creamos nuevo.
        (if (null muro)
          (progn
            (setq id (_siguiente-id *MUROS*))
            (setq muro (_muro-desde-entidad id ent))
            (setq *MUROS* (append *MUROS* (list muro)))

            ;; Etiqueta visual del muro
            (setq pm (_pmid (nth 3 muro) (nth 4 muro)))
            (_txt pm 0.25 (strcat "Muro " (itoa id)))
          )
        )

        ;; Actualizamos geometria siempre
        (setq muro (_actualizar-geometria-muro muro))
        (setq *MUROS* (_reemplazar-muro muro *MUROS*))

        (setq id (nth 0 muro))
        (prompt (strcat "\n--- Definiendo Muro " (itoa id) " ---"))

        ;; Pedimos datos
        (setq esp   (_pedir-real-default "Espesor del muro" *def-espesor*))
        (setq caras (_pedir-int-default "Numero de caras [1/2]" *def-caras*))

        (if (not (member caras '(1 2)))
          (setq caras *def-caras*)
        )

        (setq ref   (_pedir-ref-default *def-ref*))
        (setq zinf1 (_pedir-real-default "Cota inferior inicial" *def-zinf1*))
        (setq zinf2 (_pedir-real-default "Cota inferior final" *def-zinf2*))
        (setq zsup1 (_pedir-real-default "Cota superior inicial" *def-zsup1*))
        (setq zsup2 (_pedir-real-default "Cota superior final" *def-zsup2*))

        ;; Guardamos defaults para el siguiente muro
        (setq *def-espesor* esp)
        (setq *def-caras* caras)
        (setq *def-ref* ref)
        (setq *def-zinf1* zinf1)
        (setq *def-zinf2* zinf2)
        (setq *def-zsup1* zsup1)
        (setq *def-zsup2* zsup2)

        ;; Creamos muro definitivo
        (setq nuevo
          (list
            (nth 0 muro)
            (nth 1 muro)
            (nth 2 muro)
            (nth 3 muro)
            (nth 4 muro)
            (nth 5 muro)
            (nth 6 muro)
            esp
            caras
            ref
            zinf1
            zinf2
            zsup1
            zsup2
          )
        )

        ;; Sustituimos en memoria y guardamos en DWG
        (setq *MUROS* (_reemplazar-muro nuevo *MUROS*))
        (_guardar-muro-en-entidad nuevo)

        (prompt (strcat "\nMuro " (itoa id) " definido/actualizado."))
      )

      (prompt "\nEl objeto seleccionado no es una LINEA.")
    )

    (setq sel (entsel "\nSelecciona siguiente muro o ENTER para terminar: "))
  )

  (prompt (strcat "\nTotal muros en memoria: " (itoa (length *MUROS*))))
  (princ)
)

(defun c:LISTAR_MUROS (/ item)
  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (prompt "\n\n===== LISTADO DE MUROS =====")
      (foreach item *MUROS*
        (setq item (_actualizar-geometria-muro item))
        (prompt
          (strcat
            "\nID: "     (itoa (nth 0 item))
            " | HND: "   (_fmt-str  (nth 1 item))
            " | Long: "  (_fmt-real (nth 5 item))
            " | Ang: "   (_fmt-ang-grados (nth 6 item))
            " | Esp: "   (_fmt-real (nth 7 item))
            " | Caras: " (_fmt-int  (nth 8 item))
            " | Ref: "   (_fmt-str  (nth 9 item))
            " | Zi1: "   (_fmt-real (nth 10 item))
            " | Zi2: "   (_fmt-real (nth 11 item))
            " | Zs1: "   (_fmt-real (nth 12 item))
            " | Zs2: "   (_fmt-real (nth 13 item))
          )
        )
      )
    )
  )
  (princ)
)

(defun c:LISTAR_COLOCACIONES_COMPENSACION (/ lista cols c pieza)
  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (setq cols (_generar-colocaciones-compensaciones lista))

      (prompt "\n===== COLOCACIONES COMPENSACION =====")

      (foreach c cols
        (setq pieza (_col-pieza c))
        (prompt
          (strcat
            "\nMURO: " (itoa (_col-muro c))
            " | CARA: " (_col-cara c)
            " | EXTREMO: " (_fmt-str (_col-extremo c))
            " | OBLICUA: " (_fmt-str (_col-oblicua c))
            " | BANDA: " (itoa (_col-banda c))
            " | PIEZA: " (_cat-id pieza) " - " (_cat-codigo pieza)
            " | S0: " (rtos (_col-s0 c) 2 2)
            " | S1: " (rtos (_col-s1 c) 2 2)
            " | Z0: " (rtos (_col-z0 c) 2 2)
            " | Z1: " (rtos (_col-z1 c) 2 2)
            " | P0: " (_fmt-pt2d (_col-p0 c))
            " | P1: " (_fmt-pt2d (_col-p1 c))
            " | ANG(grados): " (_fmt-ang-grados (_col-ang c))
            " | BLOQUE: " (_fmt-str (_col-bloque c))
          )
        )
      )
    )
  )
  (princ)
)
(defun c:INSERTAR_BLOQUES_COMPENSACION_PLANTA (/ lista cols c pt ang blk ok nok)
  (setq ok 0)
  (setq nok 0)

  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (setq cols (_generar-colocaciones-compensaciones lista))

      (foreach c cols
        (setq blk (_col-bloque c))
        (setq pt  (_punto-insercion-colocacion-3d c))
	(setq ang (_angulo-insercion-colocacion c))

        (if (_insertar-bloque-simple blk pt ang)
          (setq ok (1+ ok))
          (setq nok (1+ nok))
        )
      )

      (prompt
        (strcat
          "\nBloques de compensacion insertados: " (itoa ok)
          " | Fallidos: " (itoa nok)
        )
      )
    )
  )
  (princ)
)

; =========================================================
; VECTORES / GEOMETRIA
; =========================================================

(defun _vec-sub (a b)
  (mapcar '- a b)
)

(defun _vec-add (a b)
  (mapcar '+ a b)
)

(defun _vec-scale (v s)
  (mapcar '(lambda (x) (* x s)) v)
)

(defun _vec-len (v)
  (distance '(0 0 0) v)
)

(defun _vec-unit (v / l)
  (setq l (_vec-len v))
  (if (> l 0.0)
    (_vec-scale v (/ 1.0 l))
    '(0 0 0)
  )
)

(defun _perp-2d-left (p1 p2 / v u)
  (setq v (_vec-sub p2 p1))
  (setq u (_vec-unit (list (car v) (cadr v) 0.0)))
  (list (- (cadr u)) (car u) 0.0)
)
(defun _direccion-cara-en-extremo (muro lista extremo cara / res linea a b)
  (setq res (_ajustar-muro-por-extremos-v2 muro lista))
  (setq linea (_linea-cara-ajustada muro res lista cara))

  (if linea
    (progn
      (setq a (nth 0 linea))
      (setq b (nth 1 linea))

      (cond
        ((= extremo "INICIO")
          (_vec-unit (_vec-sub b a))
        )
        ((= extremo "FINAL")
          (_vec-unit (_vec-sub a b))
        )
        (T nil)
      )
    )
    nil
  )
)
(defun _angulo-de-vector (v)
  (angle '(0.0 0.0 0.0) v)
)
(defun _correccion-base-bloque-esquina (pieza cara / codigo)
  (setq codigo (strcase (_cat-codigo pieza)))

  (cond
    ((wcmatch codigo "*ANGULO INTERIOR*")
      (cond
        ((= cara "BASE")    0.0)
        ((= cara "OPUESTA") 0.0)
        (T 0.0)
      )
    )

    ((wcmatch codigo "*ANGULO EXTERIOR*")
      (cond
        ((= cara "BASE")    0.0)
        ((= cara "OPUESTA") 0.0)
        (T 0.0)
      )
    )

    (T 0.0)
  )
)
(defun _pt+z (p z)
  (list (car p) (cadr p) z)
)

(defun _3dface (p1 p2 p3 p4)
  (entmakex
    (list
      (cons 0 "3DFACE")
      (cons 8 (getvar "CLAYER"))
      (cons 10 p1)
      (cons 11 p2)
      (cons 12 p3)
      (cons 13 p4)
    )
  )
)
(defun _punto-en-linea-por-distancia (p0 p1 dist / u)
  (setq u (_vec-unit (_vec-sub p1 p0)))
  (_vec-add p0 (_vec-scale u dist))
)
(defun _res-tiene-ajuste-oblicuo-p (res lista / ini fin)
  (setq ini (cdr (assoc "INICIO" res)))
  (setq fin (cdr (assoc "FINAL"  res)))
  (or
    (_ajuste-oblicuo-p ini lista)
    (_ajuste-oblicuo-p fin lista)
  )
)

(defun _linea-cara-ajustada (muro res lista cara / d a b descIni descFin u)
  ;; En esquinas oblicuas la compensacion se genera aparte.
  ;; El tramo recto debe medirse desde la linea original del muro, no desde
  ;; la prolongacion/interseccion de caras, porque eso mete la compensacion
  ;; dentro del pano recto.
  (setq d
    (if (_res-tiene-ajuste-oblicuo-p res lista)
      (_muro-offset-linea muro)
      (cdr (assoc "GEOM" res))
    )
  )

  (if d
    (progn
      (if (= cara "BASE")
        (progn
          (setq a (nth 0 d))
          (setq b (nth 1 d))
        )
        (progn
          (setq a (nth 2 d))
          (setq b (nth 3 d))
        )
      )

      (setq descIni (_descuento-extremo-por-cara (cdr (assoc "INICIO" res)) lista cara))
      (setq descFin (_descuento-extremo-por-cara (cdr (assoc "FINAL"  res)) lista cara))

      (setq u (_vec-unit (_vec-sub b a)))

      (setq a (_vec-add a (_vec-scale u descIni)))
      (setq b (_vec-add b (_vec-scale u (- descFin))))

      (list a b)
    )
    nil
  )
)

(defun _linea-cara-sin-ajustar (muro cara / d)
  (setq d (_muro-offset-linea muro))

  (if d
    (cond
      ((= cara "BASE")    (list (nth 0 d) (nth 1 d)))
      ((= cara "OPUESTA") (list (nth 2 d) (nth 3 d)))
      (T nil)
    )
    nil
  )
)

(defun _ajuste-oblicuo-p (aj lista / idOtro muroOtro cruce espOtro)
  (if aj
    (progn
      (setq idOtro (_ajuste-extremo-muro-id aj))
      (setq muroOtro (_buscar-muro-por-id idOtro lista))
      (setq cruce (_ajuste-extremo-cruce-otro aj))
      (setq espOtro (if muroOtro (nth 7 muroOtro) nil))
      (and cruce espOtro (not (equal cruce espOtro 1e-6)))
    )
    nil
  )
)

(defun _linea-referencia-compensacion (muro res lista caraComp aj)
  (if (_ajuste-oblicuo-p aj lista)
    (_linea-cara-sin-ajustar muro caraComp)
    (_linea-cara-ajustada muro res lista caraComp)
  )
)

(defun _proyectar-punto-en-linea-2d (p a b / ab ap den k)
  (setq ab (_vec-sub b a))
  (setq ap (_vec-sub p a))
  (setq den (_2d-dot ab ab))

  (if (> den 1e-8)
    (progn
      (setq k (/ (_2d-dot ap ab) den))
      (_vec-add a (_vec-scale ab k))
    )
    a
  )
)

(defun _esquina-por-muro-extremo-cualquiera (lista muroId extremo / res item)
  (setq res nil)
  (foreach item (_recolectar-esquinas-unicas lista)
    (if (or
          (and (= (cdr (assoc "MURO1" item)) muroId)
               (= (cdr (assoc "EXT1" item)) extremo))
          (and (= (cdr (assoc "MURO2" item)) muroId)
               (= (cdr (assoc "EXT2" item)) extremo))
        )
      (setq res item)
    )
  )
  res
)

(defun _ajuste-de-muro-extremo (muro lista extremo / res)
  (setq res (_ajustar-muro-por-extremos-v2 muro lista))
  (if res
    (cdr (assoc extremo res))
    nil
  )
)

(defun _vertice-exterior-compensacion-oblicua (e lista / m1 m2 ext1 ext2 aj1 aj2 cara1 cara2 l1 l2)
  (setq m1 (_buscar-muro-por-id (cdr (assoc "MURO1" e)) lista))
  (setq m2 (_buscar-muro-por-id (cdr (assoc "MURO2" e)) lista))
  (setq ext1 (cdr (assoc "EXT1" e)))
  (setq ext2 (cdr (assoc "EXT2" e)))

  (if (and m1 m2 ext1 ext2)
    (progn
      (setq aj1 (_ajuste-de-muro-extremo m1 lista ext1))
      (setq aj2 (_ajuste-de-muro-extremo m2 lista ext2))
      (setq cara1 (if aj1 (_cara-compensacion-en-extremo m1 aj1) nil))
      (setq cara2 (if aj2 (_cara-compensacion-en-extremo m2 aj2) nil))
      (setq l1 (if cara1 (_linea-cara-sin-ajustar m1 cara1) nil))
      (setq l2 (if cara2 (_linea-cara-sin-ajustar m2 cara2) nil))

      (if (and l1 l2)
        (_line-intersection-2d (nth 0 l1) (nth 1 l1) (nth 0 l2) (nth 1 l2))
        nil
      )
    )
    nil
  )
)

(defun _datos-arranque-compensacion-oblicua (muro lista extremo caraComp aj / e vExt vInt linea arrBase ang angLinea vecObj dotLinea dotOpuesto)
  (setq e (_esquina-por-muro-extremo-cualquiera lista (_muro-id muro) extremo))

  (if (null e)
    nil
    (progn
      (setq vExt (_vertice-exterior-compensacion-oblicua e lista))
      (setq vInt (_punto-interior-esquina muro lista extremo e))
      (setq linea (_linea-cara-sin-ajustar muro caraComp))

      (if (and vExt linea)
        (progn
          (setq arrBase (_datos-arranque-compensacion linea extremo))
          (setq angLinea (angle (nth 0 linea) (nth 1 linea)))
          (setq ang
            (if vInt
              (progn
                (setq vecObj (_vec-sub vInt vExt))
                (setq dotLinea
                  (_2d-dot
                    (list (cos angLinea) (sin angLinea) 0.0)
                    vecObj
                  )
                )
                (setq dotOpuesto
                  (_2d-dot
                    (list (cos (+ angLinea pi)) (sin (+ angLinea pi)) 0.0)
                    vecObj
                  )
                )
                (if (>= dotLinea dotOpuesto)
                  angLinea
                  (_norm-ang (+ angLinea pi))
                )
              )
              (cdr (assoc "ANG" arrBase))
            )
          )
          (list
            (cons "PT" vExt)
            (cons "ANG" ang)
          )
        )
        nil
      )
    )
  )
)

(defun _arranque-valido-p (arr)
  (and
    (listp arr)
    (assoc "PT" arr)
    (assoc "ANG" arr)
  )
)

(defun _datos-arranque-compensacion-segun-ajuste (muro lista extremo caraComp aj linea / arr)
  (setq arr
    (if (_ajuste-oblicuo-p aj lista)
      (_datos-arranque-compensacion-oblicua muro lista extremo caraComp aj)
      nil
    )
  )

  (if (_arranque-valido-p arr)
    arr
    (_datos-arranque-compensacion linea extremo)
  )
)
(defun _normal-exterior-cara (muro cara / p1 p2 n ref)
  (setq p1  (nth 3 muro))
  (setq p2  (nth 4 muro))
  (setq ref (nth 9 muro))
  (setq n (_perp-2d-left p1 p2))

  (cond
    ((= ref "IZQUIERDA")
      (cond
        ((= cara "BASE")    (_vec-scale n -1.0))
        ((= cara "OPUESTA") n)
        (T '(0 0 0))
      )
    )
    ((= ref "DERECHA")
      (cond
        ((= cara "BASE")    n)
        ((= cara "OPUESTA") (_vec-scale n -1.0))
        (T '(0 0 0))
      )
    )
    (T '(0 0 0))
  )
)

(defun _punto-extremo-muro (muro extremo)
  (cond
    ((= extremo "INICIO") (_muro-p1 muro))
    ((= extremo "FINAL")  (_muro-p2 muro))
    (T nil)
  )
)

(defun _angulo-salida-muro-desde-extremo (muro extremo)
  (cond
    ((= extremo "INICIO")
      (angle (_muro-p1 muro) (_muro-p2 muro))
    )
    ((= extremo "FINAL")
      (angle (_muro-p2 muro) (_muro-p1 muro))
    )
    (T 0.0)
  )
)

; =========================================================
; GENERACION 3D DIRECTA
; =========================================================

(defun _generar-geometria-muro (muro / p1 p2 esp ref n off q1 q2 r1 r2
                                     a1 a2 b1 b2 c1 c2 d1 d2)
  (setq p1  (nth 3 muro))
  (setq p2  (nth 4 muro))
  (setq esp (nth 7 muro))
  (setq ref (nth 9 muro))

  (if (or (null p1) (null p2) (null esp) (null ref)
          (null (nth 10 muro)) (null (nth 11 muro))
          (null (nth 12 muro)) (null (nth 13 muro)))
    nil
    (progn
      (setq n (_perp-2d-left p1 p2))
      (if (= ref "IZQUIERDA")
        (setq off (_vec-scale n esp))
        (setq off (_vec-scale n (- esp)))
      )

      (setq q1 (list (car p1) (cadr p1) 0.0))
      (setq q2 (list (car p2) (cadr p2) 0.0))
      (setq r1 (_vec-add q1 off))
      (setq r2 (_vec-add q2 off))

      (setq a1 (_pt+z q1 (nth 10 muro)))
      (setq a2 (_pt+z q2 (nth 11 muro)))
      (setq b1 (_pt+z r1 (nth 10 muro)))
      (setq b2 (_pt+z r2 (nth 11 muro)))

      (setq c1 (_pt+z q1 (nth 12 muro)))
      (setq c2 (_pt+z q2 (nth 13 muro)))
      (setq d1 (_pt+z r1 (nth 12 muro)))
      (setq d2 (_pt+z r2 (nth 13 muro)))

      (list a1 a2 b1 b2 c1 c2 d1 d2)
    )
  )
)

(defun _dibujar-muro-3d-desde-geom (g / a1 a2 b1 b2 c1 c2 d1 d2)
  (setq a1 (nth 0 g))
  (setq a2 (nth 1 g))
  (setq b1 (nth 2 g))
  (setq b2 (nth 3 g))
  (setq c1 (nth 4 g))
  (setq c2 (nth 5 g))
  (setq d1 (nth 6 g))
  (setq d2 (nth 7 g))

  (_3dface a1 a2 b2 b1)
  (_3dface c1 c2 d2 d1)
  (_3dface a1 a2 c2 c1)
  (_3dface b1 b2 d2 d1)
  (_3dface a1 b1 d1 c1)
  (_3dface a2 b2 d2 c2)
)



; =========================================================
; AJUSTE DE ESQUINAS
; =========================================================

(defun _2d-cross (a b)
  (- (* (car a) (cadr b)) (* (cadr a) (car b)))
)

(defun _2d-dot (a b)
  (+ (* (car a) (car b)) (* (cadr a) (cadr b)))
)

(defun _clamp (x minv maxv)
  (cond
    ((< x minv) minv)
    ((> x maxv) maxv)
    (T x)
  )
)

(defun _angulo-entre-vectores-2d (v1 v2 / u1 u2 d c)
  (setq u1 (_vec-unit v1))
  (setq u2 (_vec-unit v2))
  (setq d (_clamp (_2d-dot u1 u2) -1.0 1.0))
  (setq c (abs (_2d-cross u1 u2)))
  (atan c d)
)

(defun _seno-angulo-entre-muros (m1 m2 / v1 v2 s)
  (setq v1 (_vec-unit (_vector-muro m1)))
  (setq v2 (_vec-unit (_vector-muro m2)))
  (setq s (abs (_2d-cross v1 v2)))
  (if (< s 1e-8) nil s)
)

(defun _angulo-esquina-desde-extremos (m1 ext1 m2 ext2)
  (_angulo-entre-vectores-2d
    (_dir-extremo-muro m1 ext1)
    (_dir-extremo-muro m2 ext2)
  )
)

(defun _extremos-conexion-entre (m1 m2 / tipo)
  (setq tipo (_tipo-conexion m1 m2))
  (cond
    ((= tipo "FIN-INICIO")    (list "FINAL"  "INICIO"))
    ((= tipo "INICIO-FIN")    (list "INICIO" "FINAL"))
    ((= tipo "INICIO-INICIO") (list "INICIO" "INICIO"))
    ((= tipo "FIN-FIN")       (list "FINAL"  "FINAL"))
    (T nil)
  )
)

(defun _angulo-real-entre-muros-conectados (m1 m2 / exts)
  (setq exts (_extremos-conexion-entre m1 m2))
  (if exts
    (_angulo-esquina-desde-extremos m1 (nth 0 exts) m2 (nth 1 exts))
    (_angulo-entre-vectores-2d (_vector-muro m1) (_vector-muro m2))
  )
)

(defun _cruce-espesor-interseccion-caras (muroPropio muroOtro / s espOtro)
  (setq s (_seno-angulo-entre-muros muroPropio muroOtro))
  (setq espOtro (nth 7 muroOtro))

  (if (and s espOtro)
    (/ espOtro s)
    nil
  )
)

(defun _cruce-espesor-compensacion-esquina (muroPropio muroOtro / ang mitad tanMitad espOtro)
  (setq ang (_angulo-real-entre-muros-conectados muroPropio muroOtro))
  (setq mitad (/ ang 2.0))
  (if (not (equal (cos mitad) 0.0 1e-8))
    (setq tanMitad (/ (sin mitad) (cos mitad)))
    (setq tanMitad nil)
  )
  (setq espOtro (nth 7 muroOtro))

  (if (and tanMitad espOtro (not (equal tanMitad 0.0 1e-8)))
    (/ espOtro tanMitad)
    nil
  )
)

(defun _compensacion-esquina-teorica (muroPropio muroOtro / cruce)
  (setq cruce (_cruce-espesor-compensacion-esquina muroPropio muroOtro))
  (if cruce (+ 20.0 cruce) nil)
)

(defun _esquina-oblicua-p (e lista / m1 m2 s)
  (setq m1 (_buscar-muro-por-id (cdr (assoc "MURO1" e)) lista))
  (setq m2 (_buscar-muro-por-id (cdr (assoc "MURO2" e)) lista))
  (setq s (if (and m1 m2) (_seno-angulo-entre-muros m1 m2) nil))
  (and s (not (equal s 1.0 1e-6)))
)

(defun _line-intersection-2d (p1 p2 p3 p4 / r s qp den tt)
  (setq r  (list (- (car p2) (car p1)) (- (cadr p2) (cadr p1)) 0.0))
  (setq s  (list (- (car p4) (car p3)) (- (cadr p4) (cadr p3)) 0.0))
  (setq qp (list (- (car p3) (car p1)) (- (cadr p3) (cadr p1)) 0.0))
  (setq den (_2d-cross r s))

  (if (equal den 0.0 1e-8)
    nil
    (progn
      (setq tt (/ (_2d-cross qp s) den))
      (list
        (+ (car p1) (* tt (car r)))
        (+ (cadr p1) (* tt (cadr r)))
        0.0
      )
    )
  )
)

(defun _muro-offset-linea (muro / p1 p2 esp ref n off q1 q2 r1 r2)
  (setq p1  (nth 3 muro))
  (setq p2  (nth 4 muro))
  (setq esp (nth 7 muro))
  (setq ref (nth 9 muro))

  (if (or (null p1) (null p2) (null esp) (null ref))
    nil
    (progn
      (setq n (_perp-2d-left p1 p2))
      (if (= ref "IZQUIERDA")
        (setq off (_vec-scale n esp))
        (setq off (_vec-scale n (- esp)))
      )

      (setq q1 (list (car p1) (cadr p1) 0.0))
      (setq q2 (list (car p2) (cadr p2) 0.0))
      (setq r1 (_vec-add q1 off))
      (setq r2 (_vec-add q2 off))

      (list q1 q2 r1 r2)
    )
  )
)

; =========================================================
; SOLIDOS POR EXTRUSION
; =========================================================

(defun _crear-lwpoly-cerrada-2d (pts / e datos)
  (setq datos
    (list
      (cons 0 "LWPOLYLINE")
      (cons 100 "AcDbEntity")
      (cons 100 "AcDbPolyline")
      (cons 90 (length pts))
      (cons 70 1)
    )
  )

  (foreach p pts
    (setq datos
      (append datos
        (list
          (cons 10 (list (car p) (cadr p)))
        )
      )
    )
  )

  (setq e (entmakex datos))
  e
)

(defun _ent-last-nuevo (antes / despues)
  (setq despues (entlast))
  (if (and despues (not (eq despues antes)))
    despues
    nil
  )
)

(defun _crear-region-desde-entidad (ent / antes reg)
  (if (and ent (entget ent))
    (progn
      (setq antes (entlast))
      (vl-cmdf "_.REGION" ent "")
      (_ent-last-nuevo antes)
    )
    nil
  )
)

(defun _extruir-region (reg altura / antes sol)
  (if (and reg (entget reg))
    (progn
      (setq antes (entlast))
      (vl-cmdf "_.EXTRUDE" reg "" altura)
      (_ent-last-nuevo antes)
    )
    nil
  )
)

(defun _mover-entidad-z (ent z / p1 p2)
  (if (and ent (entget ent))
    (progn
      (setq p1 (list 0.0 0.0 0.0))
      (setq p2 (list 0.0 0.0 z))
      (vl-cmdf "_.MOVE" ent "" p1 p2)
    )
  )
)



; =========================================================
; ANALISIS DE ENCUENTROS Y EXTREMOS
; =========================================================

(defun _muro-id (m) (nth 0 m))
(defun _muro-p1 (m) (nth 3 m))
(defun _muro-p2 (m) (nth 4 m))

(defun _vector-muro (m)
  (_vec-sub (_muro-p2 m) (_muro-p1 m))
)

(defun _pt-igual-2d (p1 p2 tol)
  (and
    (<= (abs (- (car p1) (car p2))) tol)
    (<= (abs (- (cadr p1) (cadr p2))) tol)
  )
)

(defun _tipo-conexion (m1 m2 / p1a p2a p1b p2b tol)
  (setq tol 0.1)
  (setq p1a (_muro-p1 m1))
  (setq p2a (_muro-p2 m1))
  (setq p1b (_muro-p1 m2))
  (setq p2b (_muro-p2 m2))

  (cond
    ((_pt-igual-2d p2a p1b tol) "FIN-INICIO")
    ((_pt-igual-2d p1a p2b tol) "INICIO-FIN")
    ((_pt-igual-2d p1a p1b tol) "INICIO-INICIO")
    ((_pt-igual-2d p2a p2b tol) "FIN-FIN")
    (T nil)
  )
)

(defun _normalizar-conexion (m1 m2 tipo)
  (cond
    ((= tipo "FIN-INICIO")
      (list
        (_vector-muro m1)
        (_vector-muro m2)
      )
    )
    ((= tipo "INICIO-FIN")
      (list
        (_vec-scale (_vector-muro m2) -1)
        (_vec-scale (_vector-muro m1) -1)
      )
    )
    ((= tipo "INICIO-INICIO")
      (list
        (_vec-scale (_vector-muro m2) -1)
        (_vector-muro m1)
      )
    )
    ((= tipo "FIN-FIN")
      (list
        (_vector-muro m1)
        (_vec-scale (_vector-muro m2) -1)
      )
    )
    (T nil)
  )
)

(defun _clasificar-giro (v1 v2 / cross)
  (setq cross (_2d-cross v1 v2))
  (cond
    ((equal cross 0.0 1e-8) "RECTO")
    ((> cross 0.0) "GIRO IZQUIERDA")
    ((< cross 0.0) "GIRO DERECHA")
    (T "RECTO")
  )
)

(defun _giro-canonico-entre (m1 m2 / a b tipo vecs v1 v2 g)
  (if (< (_muro-id m1) (_muro-id m2))
    (progn
      (setq a m1)
      (setq b m2)
    )
    (progn
      (setq a m2)
      (setq b m1)
    )
  )

  (setq tipo (_tipo-conexion a b))

  (if tipo
    (progn
      (setq vecs (_normalizar-conexion a b tipo))
      (setq v1 (nth 0 vecs))
      (setq v2 (nth 1 vecs))
      (setq g (_clasificar-giro v1 v2))
      g
    )
    nil
  )
)

(defun _conexion-en-extremo-muro (muro extremo lista / i otro tipo giro res)
  (setq i 0)
  (setq res nil)

  (while (and (< i (length lista)) (null res))
    (setq otro (nth i lista))

    (if (/= (_muro-id muro) (_muro-id otro))
      (progn
        (setq tipo (_tipo-conexion muro otro))
        (if tipo
          (if (or
                (and (= extremo "INICIO") (member tipo '("INICIO-INICIO" "INICIO-FIN")))
                (and (= extremo "FINAL")  (member tipo '("FIN-INICIO" "FIN-FIN")))
              )
            (progn
              (setq giro (_giro-canonico-entre muro otro))
              (setq res
                (list
                  (cons "MURO" (_muro-id otro))
                  (cons "TIPO" tipo)
                  (cons "GIRO" giro)
                )
              )
            )
          )
        )
      )
    )

    (setq i (1+ i))
  )

  res
)

(defun _fmt-conexion-extremo (res / id tipo giro)
  (if res
    (progn
      (setq id   (cdr (assoc "MURO" res)))
      (setq tipo (cdr (assoc "TIPO" res)))
      (setq giro (cdr (assoc "GIRO" res)))

      (strcat
        "con Muro " (itoa id)
        " | Tipo: " tipo
        " | Giro: " giro
      )
    )
    "LIBRE"
  )
)

(defun c:ANALIZAR_ESQUINAS (/ lista i j m1 m2 tipo giro)
  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (prompt "\n===== ANALISIS DE ENCUENTROS =====")

      (setq i 0)
      (while (< i (length lista))
        (setq m1 (nth i lista))
        (setq j (1+ i))

        (while (< j (length lista))
          (setq m2 (nth j lista))
          (setq tipo (_tipo-conexion m1 m2))

          (if tipo
            (progn
              (setq giro (_giro-canonico-entre m1 m2))
              (prompt
                (strcat
                  "\nMuro " (itoa (_muro-id m1))
                  " conecta con Muro " (itoa (_muro-id m2))
                  " | Tipo: " tipo
                  " | Giro: " giro
                )
              )
            )
          )

          (setq j (1+ j))
        )

        (setq i (1+ i))
      )
    )
  )
  (princ)
)

(defun c:ANALIZAR_EXTREMOS_MUROS (/ lista item ini fin)
  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (prompt "\n===== ANALISIS POR EXTREMOS =====")

      (foreach item lista
        (setq ini (_conexion-en-extremo-muro item "INICIO" lista))
        (setq fin (_conexion-en-extremo-muro item "FINAL"  lista))

        (prompt
          (strcat
            "\nMuro " (itoa (_muro-id item))
            " | Inicio: " (_fmt-conexion-extremo ini)
            " | Final: "  (_fmt-conexion-extremo fin)
          )
        )
      )
    )
  )
  (princ)
)

; =========================================================
; CLASIFICACION DE ESQUINAS POR CARA
; =========================================================

(defun _tipo-esquina-por-caras (muro giro / ref)
  (setq ref (nth 9 muro))

  (cond
    ((= giro "RECTO")
      (list
        (cons "BASE" "RECTO")
        (cons "OPUESTA" "RECTO")
      )
    )

    ((= ref "IZQUIERDA")
      (cond
        ((= giro "GIRO IZQUIERDA")
          (list
            (cons "BASE" "EXTERIOR")
            (cons "OPUESTA" "INTERIOR")
          )
        )
        ((= giro "GIRO DERECHA")
          (list
            (cons "BASE" "INTERIOR")
            (cons "OPUESTA" "EXTERIOR")
          )
        )
        (T
          (list
            (cons "BASE" "-")
            (cons "OPUESTA" "-")
          )
        )
      )
    )

    ((= ref "DERECHA")
      (cond
        ((= giro "GIRO IZQUIERDA")
          (list
            (cons "BASE" "INTERIOR")
            (cons "OPUESTA" "EXTERIOR")
          )
        )
        ((= giro "GIRO DERECHA")
          (list
            (cons "BASE" "EXTERIOR")
            (cons "OPUESTA" "INTERIOR")
          )
        )
        (T
          (list
            (cons "BASE" "-")
            (cons "OPUESTA" "-")
          )
        )
      )
    )

    (T
      (list
        (cons "BASE" "-")
        (cons "OPUESTA" "-")
      )
    )
  )
)

(defun _fmt-esquina-por-cara (muro res / id tipo giro caras base opuesta)
  (if res
    (progn
      (setq id      (cdr (assoc "MURO" res)))
      (setq tipo    (cdr (assoc "TIPO" res)))
      (setq giro    (cdr (assoc "GIRO" res)))
      (setq caras   (_tipo-esquina-por-caras muro giro))
      (setq base    (cdr (assoc "BASE" caras)))
      (setq opuesta (cdr (assoc "OPUESTA" caras)))

      (strcat
        "con Muro " (itoa id)
        " | Tipo: " tipo
        " | Giro: " giro
        " | Cara base: " base
        " | Cara opuesta: " opuesta
      )
    )
    "LIBRE"
  )
)

(defun c:ANALIZAR_CARAS_ESQUINA (/ lista item ini fin)
  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (prompt "\n===== ANALISIS DE ESQUINAS POR CARA =====")

      (foreach item lista
        (setq ini (_conexion-en-extremo-muro item "INICIO" lista))
        (setq fin (_conexion-en-extremo-muro item "FINAL"  lista))

        (prompt
          (strcat
            "\nMuro " (itoa (_muro-id item))
            " | Inicio: " (_fmt-esquina-por-cara item ini)
            " | Final: "  (_fmt-esquina-por-cara item fin)
          )
        )
      )
    )
  )
  (princ)
)

(defun _ajuste-extremo-geom      (aj) (cdr (assoc "GEOM" aj)))
(defun _ajuste-extremo-muro-id   (aj) (cdr (assoc "MURO" aj)))
(defun _ajuste-extremo-tipo      (aj) (cdr (assoc "TIPO" aj)))
(defun _ajuste-extremo-giro      (aj) (cdr (assoc "GIRO" aj)))
(defun _ajuste-extremo-base      (aj) (cdr (assoc "BASE" aj)))
(defun _ajuste-extremo-opuesta   (aj) (cdr (assoc "OPUESTA" aj)))
(defun _ajuste-extremo-cruce-otro (aj) (cdr (assoc "CRUCE_OTRO" aj)))

(defun _hacer-ajuste-extremo (geom m2 tipo giro caras cruceOtro)
  (list
    (cons "GEOM" geom)
    (cons "MURO" (_muro-id m2))
    (cons "TIPO" tipo)
    (cons "GIRO" giro)
    (cons "BASE" (cdr (assoc "BASE" caras)))
    (cons "OPUESTA" (cdr (assoc "OPUESTA" caras)))
    (cons "CRUCE_OTRO" cruceOtro)
  )
)

(defun _ajustar-extremo-muro-v2 (m1 m2 extremo /
                                   d1 d2
                                   tipo giro caras
                                   q1 q2 r1 r2
                                   q1b q2b r1b r2b
                                   pIntBase pIntOpuesta cruceOtro
                                   geom)

  (setq d1 (_muro-offset-linea m1))
  (setq d2 (_muro-offset-linea m2))

  (if (or (null d1) (null d2))
    nil
    (progn
      (setq tipo (_tipo-conexion m1 m2))
      (setq giro (_giro-canonico-entre m1 m2))
      (setq caras (_tipo-esquina-por-caras m1 giro))

      (if (or (null tipo) (null giro))
        nil
        (progn
          (setq q1  (nth 0 d1))
          (setq q2  (nth 1 d1))
          (setq r1  (nth 2 d1))
          (setq r2  (nth 3 d1))

          (setq q1b (nth 0 d2))
          (setq q2b (nth 1 d2))
          (setq r1b (nth 2 d2))
          (setq r2b (nth 3 d2))

          (setq pIntBase (_line-intersection-2d q1 q2 q1b q2b))
          (setq pIntOpuesta (_line-intersection-2d r1 r2 r1b r2b))

          (if pIntBase
            (if (= extremo "FINAL")
              (setq q2 pIntBase)
              (setq q1 pIntBase)
            )
          )

          (if pIntOpuesta
            (if (= extremo "FINAL")
              (setq r2 pIntOpuesta)
              (setq r1 pIntOpuesta)
            )
          )

          (setq cruceOtro (_cruce-espesor-interseccion-caras m1 m2))
          (setq geom (list q1 q2 r1 r2))
          (_hacer-ajuste-extremo geom m2 tipo giro caras cruceOtro)
        )
      )
    )
  )
)
(defun _ajustar-extremo-geom-v2 (geomBase m1 m2 extremo /
                                  d2
                                  tipo giro caras
                                  q1 q2 r1 r2
                                  q1b q2b r1b r2b
                                  pIntBase pIntOpuesta cruceOtro
                                  geom)

  ; geomBase YA es la geometria actual del muro: (q1 q2 r1 r2)
  (setq d2 (_muro-offset-linea m2))

  (if (or (null geomBase) (null d2))
    nil
    (progn
      (setq tipo (_tipo-conexion m1 m2))
      (setq giro (_giro-canonico-entre m1 m2))
      (setq caras (_tipo-esquina-por-caras m1 giro))

      (if (or (null tipo) (null giro))
        nil
        (progn
          ; GEOMETRIA ACTUAL DEL MURO 1 (ya puede venir corregida)
          (setq q1 (nth 0 geomBase))
          (setq q2 (nth 1 geomBase))
          (setq r1 (nth 2 geomBase))
          (setq r2 (nth 3 geomBase))

          ; GEOMETRIA DEL MURO 2
          (setq q1b (nth 0 d2))
          (setq q2b (nth 1 d2))
          (setq r1b (nth 2 d2))
          (setq r2b (nth 3 d2))

          ; BASE contra BASE
          (setq pIntBase (_line-intersection-2d q1 q2 q1b q2b))

          ; OPUESTA contra OPUESTA
          (setq pIntOpuesta (_line-intersection-2d r1 r2 r1b r2b))

          (if pIntBase
            (if (= extremo "FINAL")
              (setq q2 pIntBase)
              (setq q1 pIntBase)
            )
          )

          (if pIntOpuesta
            (if (= extremo "FINAL")
              (setq r2 pIntOpuesta)
              (setq r1 pIntOpuesta)
            )
          )

          (setq cruceOtro (_cruce-espesor-interseccion-caras m1 m2))
          (setq geom (list q1 q2 r1 r2))
          (_hacer-ajuste-extremo geom m2 tipo giro caras cruceOtro)
        )
      )
    )
  )
)
(defun _ajustar-muro-por-extremos-v2 (muro lista /
                                        d
                                        ini fin
                                        ajIni ajFin
                                        m2i m2f)

  ; geometria inicial del muro
  (setq d (_muro-offset-linea muro))

  (if (null d)
    nil
    (progn
      (setq ini (_conexion-en-extremo-muro muro "INICIO" lista))
      (setq fin (_conexion-en-extremo-muro muro "FINAL"  lista))

      (setq ajIni nil)
      (setq ajFin nil)

      ; ajustar inicio sobre la geometria actual
      (if ini
        (progn
          (setq m2i (_buscar-muro-por-id (cdr (assoc "MURO" ini)) lista))
          (if m2i
            (progn
              (setq ajIni (_ajustar-extremo-geom-v2 d muro m2i "INICIO"))
              (if ajIni
                (setq d (_ajuste-extremo-geom ajIni))
              )
            )
          )
        )
      )

      ; ajustar final sobre ESA MISMA geometria ya corregida
      (if fin
        (progn
          (setq m2f (_buscar-muro-por-id (cdr (assoc "MURO" fin)) lista))
          (if m2f
            (progn
              (setq ajFin (_ajustar-extremo-geom-v2 d muro m2f "FINAL"))
              (if ajFin
                (setq d (_ajuste-extremo-geom ajFin))
              )
            )
          )
        )
      )

      (list
        (cons "GEOM" d)
        (cons "INICIO" ajIni)
        (cons "FINAL" ajFin)
      )
    )
  )
)

(defun _resultado-ajuste-a-8pts (muro res / d q1 q2 r1 r2 a1 a2 b1 b2 c1 c2 d1 d2)
  (setq d (cdr (assoc "GEOM" res)))

  (if d
    (progn
      (setq q1 (nth 0 d))
      (setq q2 (nth 1 d))
      (setq r1 (nth 2 d))
      (setq r2 (nth 3 d))

      (setq a1 (_pt+z q1 (nth 10 muro)))
      (setq a2 (_pt+z q2 (nth 11 muro)))
      (setq b1 (_pt+z r1 (nth 10 muro)))
      (setq b2 (_pt+z r2 (nth 11 muro)))

      (setq c1 (_pt+z q1 (nth 12 muro)))
      (setq c2 (_pt+z q2 (nth 13 muro)))
      (setq d1 (_pt+z r1 (nth 12 muro)))
      (setq d2 (_pt+z r2 (nth 13 muro)))

      (list a1 a2 b1 b2 c1 c2 d1 d2)
    )
    nil
  )
)

(defun _fmt-ajuste-extremo-v2 (aj / id tipo giro base opuesta)
  (if aj
    (progn
      (setq id      (_ajuste-extremo-muro-id aj))
      (setq tipo    (_ajuste-extremo-tipo aj))
      (setq giro    (_ajuste-extremo-giro aj))
      (setq base    (_ajuste-extremo-base aj))
      (setq opuesta (_ajuste-extremo-opuesta aj))

      (strcat
        "con Muro " (itoa id)
        " | Tipo: " tipo
        " | Giro: " giro
        " | Base: " base
        " | Opuesta: " opuesta
      )
    )
    "LIBRE"
  )
)

(defun c:ANALIZAR_AJUSTE_ESQUINAS_V2 (/ lista item res ini fin)
  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (prompt "\n===== ANALISIS AJUSTE ESQUINAS V2 =====")

      (foreach item lista
        (setq res (_ajustar-muro-por-extremos-v2 item lista))
        (setq ini (cdr (assoc "INICIO" res)))
        (setq fin (cdr (assoc "FINAL"  res)))

        (prompt
          (strcat
            "\nMuro " (itoa (_muro-id item))
            " | Inicio: " (_fmt-ajuste-extremo-v2 ini)
            " | Final: "  (_fmt-ajuste-extremo-v2 fin)
          )
        )
      )
    )
  )
  (princ)
)

(defun c:GENERAR_MURO_3D_ESQUINAS_V2 (/ lista item res g hechos)
  (setq hechos 0)

  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))

      (foreach item lista
        (setq res (_ajustar-muro-por-extremos-v2 item lista))

        (if res
          (progn
            (setq g (_resultado-ajuste-a-8pts item res))
            (if g
              (progn
                (_dibujar-muro-3d-desde-geom g)
                (setq hechos (1+ hechos))
              )
              (if (_generar-geometria-muro item)
                (progn
                  (_dibujar-muro-3d-desde-geom (_generar-geometria-muro item))
                  (setq hechos (1+ hechos))
                )
              )
            )
          )
          (if (_generar-geometria-muro item)
            (progn
              (_dibujar-muro-3d-desde-geom (_generar-geometria-muro item))
              (setq hechos (1+ hechos))
            )
          )
        )
      )

      (prompt
        (strcat
          "\nMuros 3D generados con ajuste V2: "
          (itoa hechos)
        )
      )
    )
  )
  (princ)
)

; =========================================================
; PIEZAS DE ESQUINA DESDE AJUSTE V2
; =========================================================

(defun _altura-media-muro (muro / h1 h2)
  (if (and (nth 10 muro) (nth 11 muro) (nth 12 muro) (nth 13 muro))
    (progn
      (setq h1 (- (nth 12 muro) (nth 10 muro)))
      (setq h2 (- (nth 13 muro) (nth 11 muro)))
      (/ (+ h1 h2) 2.0)
    )
    nil
  )
)

(defun _altura-real-muro (muro)
  (_altura-media-muro muro)
)

(defun _tipo-pieza-esquina-desde-ajuste (aj)
  (cond
    ((= (_ajuste-extremo-base aj) "INTERIOR") "INTERIOR")
    ((= (_ajuste-extremo-base aj) "EXTERIOR") "EXTERIOR")
    (T nil)
  )
)

(defun _fmt-pieza-o-sin (pieza)
  (if pieza
    (strcat
      (_cat-id pieza)
      " | "
      (_cat-codigo pieza)
    )
    "SIN PIEZA"
  )
)

(defun _tipo-pieza-esquina-desde-ajuste-cara (aj cara)
  (cond
    ((= cara "BASE")
      (cond
        ((= (_ajuste-extremo-base aj) "INTERIOR") "INTERIOR")
        ((= (_ajuste-extremo-base aj) "EXTERIOR") "EXTERIOR")
        (T nil)
      )
    )
    ((= cara "OPUESTA")
      (cond
        ((= (_ajuste-extremo-opuesta aj) "INTERIOR") "INTERIOR")
        ((= (_ajuste-extremo-opuesta aj) "EXTERIOR") "EXTERIOR")
        (T nil)
      )
    )
    (T nil)
  )
)

(defun _pieza-esquina-por-ajuste-cara (muro aj cara / tipo altura caras)
  (setq caras  (nth 8 muro))
  (setq tipo   (_tipo-pieza-esquina-desde-ajuste-cara aj cara))
  (setq altura (_altura-media-muro muro))

  (if (and (= cara "OPUESTA") (/= caras 2))
    nil
    (if (and tipo altura)
      (_buscar-pieza-esquina-por-tipo-y-altura tipo altura)
      nil
    )
  )
)
(defun _pieza-angular-esquina-por-cara-y-tramo (e cara tramo / tipo)
  (setq tipo (_tipo-esquina-unica-por-cara e cara))
  (if tipo
    (_pieza-esquina-por-tipo-y-tramo tipo tramo)
    nil
  )
)


(defun _hacer-colocacion-esquina (pieza muro extremo cara tramo z0 z1 pt ang bloque)
  (list
    (cons "TIPO"    "ESQUINA")
    (cons "PIEZA"   pieza)
    (cons "MURO"    (_muro-id muro))
    (cons "EXTREMO" extremo)
    (cons "CARA"    cara)
    (cons "TRAMO"   tramo)
    (cons "Z0"      z0)
    (cons "Z1"      z1)
    (cons "PUNTO"   pt)
    (cons "ANG"     ang)
    (cons "BLOQUE"  bloque)
  )
)
(defun _cesq-pieza   (c) (cdr (assoc "PIEZA" c)))
(defun _cesq-muro    (c) (cdr (assoc "MURO" c)))
(defun _cesq-extremo (c) (cdr (assoc "EXTREMO" c)))
(defun _cesq-cara    (c) (cdr (assoc "CARA" c)))
(defun _cesq-tramo   (c) (cdr (assoc "TRAMO" c)))
(defun _cesq-punto   (c) (cdr (assoc "PUNTO" c)))
(defun _cesq-ang     (c) (cdr (assoc "ANG" c)))
(defun _cesq-bloque  (c) (cdr (assoc "BLOQUE" c)))
(defun _cesq-z0 (c) (cdr (assoc "Z0" c)))
(defun _cesq-z1 (c) (cdr (assoc "Z1" c)))



;(defun _angulo-insercion-esquina-izquierda (pieza muro extremo cara e / ang angMuro codigo giro)
  ;(setq ang     (_angulo-salida-muro-desde-extremo muro extremo))
  ;(setq angMuro (angle (_muro-p1 muro) (_muro-p2 muro)))
  ;(setq codigo  (strcase (_cat-codigo pieza)))
  ;(setq giro    (if e (cdr (assoc "GIRO" e)) nil))

  ;(cond
   ; ; ANGULOS INTERIORES
    ;((wcmatch codigo "*INTERIOR*")
     ; (cond
      ;  ((= cara "BASE")
       ;   (+ (- angMuro (/ pi 2.0)) pi)
        ;)
        ;((and (= cara "OPUESTA") (= giro "GIRO IZQUIERDA"))
         ; (- (+ ang pi pi) (/ pi 2.0))
        ;)
        ;((and (= cara "OPUESTA") (= giro "GIRO DERECHA"))
         ; ang
        ;)
        ;(T ang)
      ;)
    ;)

    ; ANGULOS EXTERIORES
    ;((wcmatch codigo "*EXTERIOR*")
     ; (if (= cara "OPUESTA")
       ; (+ ang pi)
        ;ang
      ;)
    ;)

    ;(T ang)
  ;)
;)

;(defun _angulo-insercion-esquina-derecha (pieza muro extremo cara e / ang codigo giro angRes)
  ;(setq ang    (_angulo-salida-muro-desde-extremo muro extremo))
  ;(setq codigo (strcase (_cat-codigo pieza)))
  ;(setq giro   (if e (cdr (assoc "GIRO" e)) nil))

  
;(setq angRes
    ;(cond
      ; ANGULOS INTERIORES
      ;((wcmatch codigo "*INTERIOR*")
        ;(cond
          ;((= cara "BASE")
           ; (+ ang (/ pi 2.0))
          ;)
          ;((and (= cara "OPUESTA") (= giro "GIRO IZQUIERDA"))
           ; ang
          ;)
          ;((and (= cara "OPUESTA") (= giro "GIRO DERECHA"))
           ; (- ang (/ pi 2.0))
          ;)
          ;(T ang)
        ;)
      ;)

      ; ANGULOS EXTERIORES
      ;((wcmatch codigo "*EXTERIOR*")
       ; (if (= cara "OPUESTA")
        ;  (+ ang (/ (* 3.0 pi) 2.0))
         ; (+ ang (/ pi 2.0))
        ;)
      ;)

      ;(T ang)
    ;)
  ;)

  ;(+ angRes pi)
;)


(defun _angulo-desde-tipo-geom (tipo)
  (_norm-ang
    (cond
      ((= tipo "XY")   0.0)
      ((= tipo "-XY")  (/ pi 2.0))
      ((= tipo "-X-Y") pi)
      ((= tipo "X-Y")  (* 1.5 pi))
      (T 0.0)
    )
  )
)
(defun _norm-ang (a)
  (while (< a 0.0)
    (setq a (+ a (* 2.0 pi)))
  )
  (while (>= a (* 2.0 pi))
    (setq a (- a (* 2.0 pi)))
  )
  a
)
(defun _angulo-insercion-esquina (pieza muro extremo cara e / codigo tipoGeom)
  (setq codigo (strcase (_cat-codigo pieza)))
  (setq tipoGeom (if e (cdr (assoc "TIPO_GEOM" e)) nil))

  (cond
    ((wcmatch codigo "*INTERIOR*")
      (_angulo-desde-tipo-geom tipoGeom)
    )

    ((wcmatch codigo "*EXTERIOR*")
      (_norm-ang (+ (_angulo-desde-tipo-geom tipoGeom) pi))
    )

    (T
      (_angulo-salida-muro-desde-extremo muro extremo)
    )
  )
)

(defun _cara-interior-esquina (e / tb to)
  (setq tb (cdr (assoc "BASE_TIPO" e)))
  (setq to (cdr (assoc "OPUESTA_TIPO" e)))

  (cond
    ((= tb "INTERIOR") "BASE")
    ((= to "INTERIOR") "OPUESTA")
    (T nil)
  )
)

(defun _punto-extremo-geometria-cara (geom extremo cara / q1 q2 r1 r2)
  (setq q1 (nth 0 geom))
  (setq q2 (nth 1 geom))
  (setq r1 (nth 2 geom))
  (setq r2 (nth 3 geom))

  (cond
    ((and (= cara "BASE") (= extremo "INICIO")) q1)
    ((and (= cara "BASE") (= extremo "FINAL"))  q2)
    ((and (= cara "OPUESTA") (= extremo "INICIO")) r1)
    ((and (= cara "OPUESTA") (= extremo "FINAL"))  r2)
    (T nil)
  )
)

(defun _punto-interior-esquina (muro lista extremo e / res geom caraInterior)
  (setq res (_ajustar-muro-por-extremos-v2 muro lista))

  (if res
    (progn
      (setq geom (cdr (assoc "GEOM" res)))
      (setq caraInterior (_cara-interior-esquina e))

      (if (and geom caraInterior)
        (_punto-extremo-geometria-cara geom extremo caraInterior)
        nil
      )
    )
    nil
  )
)


(defun _fmt-ang-grados (a)
  (rtos (* 180.0 (/ a pi)) 2 2)
)

(defun _buscar-esquina-unica-por-muro-extremo (esquinas muroId extremo / res e)
  (setq res nil)
  (foreach e esquinas
    (if (and (= (cdr (assoc "MURO1" e)) muroId)
             (= (cdr (assoc "EXT1" e)) extremo))
      (setq res e)
    )
  )
  res
)
(defun _generar-colocaciones-esquinas (lista / res esquinas e
                                              m1id ext1 m1
                                              pt tramos tramo
                                              zBase z0 z1
                                              piezaBase piezaOpuesta oblicua
                                              bloqueBase bloqueOpuesta)

  (setq res '())
  (setq esquinas (_recolectar-esquinas-unicas lista))

  (foreach e esquinas
    (setq m1id (cdr (assoc "MURO1" e)))
    (setq ext1 (cdr (assoc "EXT1" e)))
    (setq m1 (_buscar-muro-por-id m1id lista))
    (setq oblicua (_esquina-oblicua-p e lista))

    (if (and m1 (null oblicua))
      (progn
        (setq pt (_punto-interior-esquina m1 lista ext1 e))

        (if pt
          (progn
            (setq tramos (_descomponer-altura-esquina (_altura-media-muro m1)))
            (setq zBase 0.0)

            (foreach tramo tramos
              (setq z0 zBase)
              (setq z1 (+ zBase tramo))

              (setq piezaBase (_pieza-angular-esquina-por-cara-y-tramo e "BASE" tramo))

              (if piezaBase
                (progn
                  (setq bloqueBase (_bloque-de-pieza piezaBase))
                  (setq res
                    (append res
                      (list
                        (_hacer-colocacion-esquina
                          piezaBase
                          m1
                          ext1
                          "BASE"
                          tramo
                          z0
                          z1
                          pt
                          (_angulo-insercion-esquina piezaBase m1 ext1 "BASE" e)
                          bloqueBase
                        )
                      )
                    )
                  )
                )
              )

              (if (= (cdr (assoc "CARAS" e)) 2)
                (progn
                  (setq piezaOpuesta (_pieza-angular-esquina-por-cara-y-tramo e "OPUESTA" tramo))

                  (if piezaOpuesta
                    (progn
                      (setq bloqueOpuesta (_bloque-de-pieza piezaOpuesta))
                      (setq res
                        (append res
                          (list
                            (_hacer-colocacion-esquina
                              piezaOpuesta
                              m1
                              ext1
                              "OPUESTA"
                              tramo
                              z0
                              z1
                              pt
                              (_angulo-insercion-esquina piezaOpuesta m1 ext1 "OPUESTA" e)
                              bloqueOpuesta
                            )
                          )
                        )
                      )
                    )
                  )
                )
              )

              (setq zBase z1)
            )
          )
        )
      )
    )
  )

  res
)
(defun c:DEPURAR_ESQUINAS_PLANTA (/ lista cols esquinas c pieza e giro tipoBase tipoOpuesta caraInterior)
  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (setq cols (_generar-colocaciones-esquinas lista))
      (setq esquinas (_recolectar-esquinas-unicas lista))

      (prompt "\n===== DEPURACION ESQUINAS PLANTA =====")

      (foreach c cols
        (setq pieza (_cesq-pieza c))
        (setq e (_buscar-esquina-unica-por-muro-extremo esquinas (_cesq-muro c) (_cesq-extremo c)))

        (setq giro
          (if e (cdr (assoc "GIRO" e)) "-")
        )

        (setq tipoBase
          (if e (cdr (assoc "BASE_TIPO" e)) "-")
        )

        (setq tipoOpuesta
          (if e (cdr (assoc "OPUESTA_TIPO" e)) "-")
        )

        (setq caraInterior
          (if e (_cara-interior-esquina e) "-")
        )

        (prompt
	  (strcat
	    "\n=============================="
	    "\nMURO: " (itoa (_cesq-muro c))
	    " | EXTREMO: " (_cesq-extremo c)
	    " | CARA: " (_cesq-cara c)
	    " | TRAMO: " (rtos (_cesq-tramo c) 2 2)
	    " | Z0=" (rtos (_cesq-z0 c) 2 2)
	    " | Z1=" (rtos (_cesq-z1 c) 2 2)

	    "\n  PIEZA: " (_cat-codigo pieza)
	    "\n  BLOQUE: " (_fmt-str (_cesq-bloque c))
	    "\n  GIRO: " giro
	    "\n  BASE_TIPO: " tipoBase
	    " | OPUESTA_TIPO: " tipoOpuesta
	    " | CARA_INTERIOR: " caraInterior
	    "\n  PUNTO: " (_fmt-pt2d (_cesq-punto c))
	    "\n  ANG(rad): " (rtos (_cesq-ang c) 2 4)
	    " | ANG(grados): " (_fmt-ang-grados (_cesq-ang c))
	  )
	)
      )
    )
  )
  (princ)
)
(defun c:INSERTAR_BLOQUES_ESQUINA_PLANTA (/ lista cols c pt ang blk ok nok)
  (setq ok 0)
  (setq nok 0)

  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (setq cols (_generar-colocaciones-esquinas lista))

      (foreach c cols
        (setq blk (_cesq-bloque c))
        (setq pt (_pt+z (_cesq-punto c) (_cesq-z0 c)))
        (setq ang (_cesq-ang c))

        (if (_insertar-bloque-simple blk pt ang)
          (setq ok (1+ ok))
          (setq nok (1+ nok))
        )
      )

      (prompt
        (strcat
          "\nBloques de esquina insertados: " (itoa ok)
          " | Fallidos: " (itoa nok)
        )
      )
    )
  )
  (princ)
)

(defun _signo-tol (v tol)
  (cond
    ((> v tol)  1)
    ((< v (- tol)) -1)
    (T 0)
  )
)
(defun _dir-extremo-muro (muro extremo / p1 p2)
  (setq p1 (_muro-p1 muro))
  (setq p2 (_muro-p2 muro))

  (cond
    ((= extremo "INICIO")
      (_vec-unit (_vec-sub p2 p1))
    )
    ((= extremo "FINAL")
      (_vec-unit (_vec-sub p1 p2))
    )
    (T '(0.0 0.0 0.0))
  )
)
(defun _tipo-esquina-geometrica (m1 ext1 m2 ext2 / v1 v2 sx1 sy1 sx2 sy2 tol)
  (setq tol 1e-8)

  ; Direccion real dibujada de cada muro (P1 -> P2)
  (setq v1 (_vec-unit (_vector-muro m1)))
  (setq v2 (_vec-unit (_vector-muro m2)))

  (setq sx1 (_signo-tol (car  v1) tol))
  (setq sy1 (_signo-tol (cadr v1) tol))
  (setq sx2 (_signo-tol (car  v2) tol))
  (setq sy2 (_signo-tol (cadr v2) tol))

  (cond
    ; --------------------------------------------------
    ; HORIZONTAL -> VERTICAL
    ; --------------------------------------------------

    ; +X -> +Y  => -XY
    ((and (= sx1  1) (= sy1  0)
          (= sx2  0) (= sy2  1))
      "-XY"
    )

    ; +X -> -Y  => -X-Y
    ((and (= sx1  1) (= sy1  0)
          (= sx2  0) (= sy2 -1))
      "-X-Y"
    )

    ; -X -> +Y  => XY
    ((and (= sx1 -1) (= sy1  0)
          (= sx2  0) (= sy2  1))
      "XY"
    )

    ; -X -> -Y  => X-Y
    ((and (= sx1 -1) (= sy1  0)
          (= sx2  0) (= sy2 -1))
      "X-Y"
    )

    ; --------------------------------------------------
    ; VERTICAL -> HORIZONTAL
    ; --------------------------------------------------

    ; -Y -> -X  => -XY
    ((and (= sx1  0) (= sy1 -1)
          (= sx2 -1) (= sy2  0))
      "-XY"
    )

    ; +Y -> -X  => -X-Y
    ((and (= sx1  0) (= sy1  1)
          (= sx2 -1) (= sy2  0))
      "-X-Y"
    )

    ; -Y -> +X  => XY
    ((and (= sx1  0) (= sy1 -1)
          (= sx2  1) (= sy2  0))
      "XY"
    )

    ; +Y -> +X  => X-Y
    ((and (= sx1  0) (= sy1  1)
          (= sx2  1) (= sy2  0))
      "X-Y"
    )

    (T nil)
  )
)

(defun _tipo-esquina-geometrica-interior (m1 ext1 m2 ext2 / v1 v2 v sx sy tol)
  (setq tol 1e-8)

  ; Direcciones desde la esquina hacia cada muro
  (setq v1 (_dir-extremo-muro m1 ext1))
  (setq v2 (_dir-extremo-muro m2 ext2))

  ; La diagonal interior del angulo es la suma de ambas direcciones
  (setq v (_vec-add v1 v2))

  (setq sx (_signo-tol (car v) tol))
  (setq sy (_signo-tol (cadr v) tol))

  (cond
    ((and (= sx  1) (= sy  1)) "XY")
    ((and (= sx -1) (= sy  1)) "-XY")
    ((and (= sx -1) (= sy -1)) "-X-Y")
    ((and (= sx  1) (= sy -1)) "X-Y")
    (T nil)
  )
)

; =========================================================
; ESQUINAS UNICAS
; =========================================================

(defun _extremo-otro-desde-tipo (tipo)
  (cond
    ((member tipo '("FIN-INICIO" "INICIO-INICIO")) "INICIO")
    ((member tipo '("INICIO-FIN" "FIN-FIN"))      "FINAL")
    (T nil)
  )
)

(defun _pieza-esquina-por-tipo-y-muro (muro tipo / altura)
  (setq altura (_altura-media-muro muro))

  (if (and (member tipo '("INTERIOR" "EXTERIOR")) altura)
    (_buscar-pieza-esquina-por-tipo-y-altura tipo altura)
    nil
  )
)
(defun _hacer-esquina-unica (m1 ext1 con / m2id m2 tipo giro ext2 caras
                                tipos tipoBase tipoOpuesta
                                piezaBase piezaOpuesta tipoGeom)
  (setq m2id (cdr (assoc "MURO" con)))
  (setq tipo (cdr (assoc "TIPO" con)))
  (setq giro (cdr (assoc "GIRO" con)))
  (setq ext2 (_extremo-otro-desde-tipo tipo))
  (setq caras (nth 8 m1))
  (setq m2 (_buscar-muro-por-id m2id *MUROS*))

  (setq tipos (_tipo-esquina-por-caras m1 giro))
  (setq tipoBase    (cdr (assoc "BASE" tipos)))
  (setq tipoOpuesta (cdr (assoc "OPUESTA" tipos)))

  (if (not (member tipoBase '("INTERIOR" "EXTERIOR")))
    (setq tipoBase nil)
  )
  (if (not (member tipoOpuesta '("INTERIOR" "EXTERIOR")))
    (setq tipoOpuesta nil)
  )

  (setq piezaBase (_pieza-esquina-por-tipo-y-muro m1 tipoBase))

  (setq piezaOpuesta
    (if (= caras 2)
      (_pieza-esquina-por-tipo-y-muro m1 tipoOpuesta)
      nil
    )
  )

  (setq tipoGeom
	  (if (and m1 m2 ext1 ext2)
	    (_tipo-esquina-geometrica-interior m1 ext1 m2 ext2)
	    nil
	  )
	)

	(if (null tipoGeom)
	  (setq tipoGeom (_tipo-esquina-geometrica m1 ext1 m2 ext2))
	)

  (list
    (cons "MURO1" (_muro-id m1))
    (cons "EXT1" ext1)
    (cons "MURO2" m2id)
    (cons "EXT2" ext2)
    (cons "TIPO" tipo)
    (cons "GIRO" giro)
    (cons "TIPO_GEOM" tipoGeom)
    (cons "CARAS" caras)
    (cons "BASE_TIPO" tipoBase)
    (cons "OPUESTA_TIPO" tipoOpuesta)
    (cons "PIEZA_BASE" piezaBase)
    (cons "PIEZA_OPUESTA" piezaOpuesta)
  )
)

(defun _recolectar-esquinas-unicas (lista / res item ini fin id1 id2)
  (setq res '())

  (foreach item lista
    (setq id1 (_muro-id item))

    (setq ini (_conexion-en-extremo-muro item "INICIO" lista))
    (if ini
      (progn
        (setq id2 (cdr (assoc "MURO" ini)))
        (if (< id1 id2)
          (setq res
            (append res
              (list (_hacer-esquina-unica item "INICIO" ini))
            )
          )
        )
      )
    )

    (setq fin (_conexion-en-extremo-muro item "FINAL" lista))
    (if fin
      (progn
        (setq id2 (cdr (assoc "MURO" fin)))
        (if (< id1 id2)
          (setq res
            (append res
              (list (_hacer-esquina-unica item "FINAL" fin))
            )
          )
        )
      )
    )
  )

  res
)

(defun _fmt-esquina-unica (e / m1 ext1 m2 ext2 giro caras piezaBase piezaOpuesta)
  (setq m1           (cdr (assoc "MURO1" e)))
  (setq ext1         (cdr (assoc "EXT1" e)))
  (setq m2           (cdr (assoc "MURO2" e)))
  (setq ext2         (cdr (assoc "EXT2" e)))
  (setq giro         (cdr (assoc "GIRO" e)))
  (setq caras        (cdr (assoc "CARAS" e)))
  (setq piezaBase    (cdr (assoc "PIEZA_BASE" e)))
  (setq piezaOpuesta (cdr (assoc "PIEZA_OPUESTA" e)))

  (strcat
    "Muro " (itoa m1) " " ext1
    " <-> Muro " (itoa m2) " " ext2
    " | Giro: " giro
    " | Pieza base: " (_fmt-pieza-o-sin piezaBase)
    " | Pieza opuesta: " (if (= caras 2) (_fmt-pieza-o-sin piezaOpuesta) "NO APLICA")
  )
)

(defun c:LISTAR_ESQUINAS_UNICAS (/ lista esquinas e)
  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (setq esquinas (_recolectar-esquinas-unicas lista))

      (prompt "\n===== ESQUINAS UNICAS =====")

      (if esquinas
        (foreach e esquinas
          (prompt (strcat "\n" (_fmt-esquina-unica e)))
        )
        (prompt "\nNo se detectaron esquinas unicas.")
      )
    )
  )
  (princ)
)

(defun c:DEPURAR_ESQUINAS_OBLICUAS (/ lista esquinas e m1 m2 ext1 ext2 ang sinAng comp1 comp2 oblicua)
  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (setq esquinas (_recolectar-esquinas-unicas lista))

      (prompt "\n===== DEPURACION ESQUINAS OBLICUAS =====")

      (if esquinas
        (foreach e esquinas
          (setq m1 (_buscar-muro-por-id (cdr (assoc "MURO1" e)) lista))
          (setq m2 (_buscar-muro-por-id (cdr (assoc "MURO2" e)) lista))
          (setq ext1 (cdr (assoc "EXT1" e)))
          (setq ext2 (cdr (assoc "EXT2" e)))

          (if (and m1 m2 ext1 ext2)
            (progn
              (setq ang (_angulo-esquina-desde-extremos m1 ext1 m2 ext2))
              (setq sinAng (_seno-angulo-entre-muros m1 m2))
              (setq comp1 (_compensacion-esquina-teorica m1 m2))
              (setq comp2 (_compensacion-esquina-teorica m2 m1))
              (setq oblicua (not (equal sinAng 1.0 1e-6)))

              (prompt
                (strcat
                  "\n\nESQUINA: Muro " (itoa (_muro-id m1)) " " ext1
                  " <-> Muro " (itoa (_muro-id m2)) " " ext2
                  "\n  Angulo: " (rtos (* 180.0 (/ ang pi)) 2 4) " grados"
                  " | sin: " (_fmt-real sinAng)
                  " | Oblicua: " (if oblicua "SI" "NO")
                  "\n  Comp Muro " (itoa (_muro-id m1)) ": " (_fmt-real comp1) " cm"
                  " | Madera: " (_fmt-real (if comp1 (_longitud-madera-encofrado comp1) nil)) " cm"
                  "\n  Comp Muro " (itoa (_muro-id m2)) ": " (_fmt-real comp2) " cm"
                  " | Madera: " (_fmt-real (if comp2 (_longitud-madera-encofrado comp2) nil)) " cm"
                )
              )
            )
          )
        )
        (prompt "\nNo se detectaron esquinas unicas.")
      )
    )
  )
  (princ)
)

(defun _dbg-linea (p1 p2 color)
  (if (and p1 p2)
    (entmakex
      (list
        (cons 0 "LINE")
        (cons 8 (getvar "CLAYER"))
        (cons 62 color)
        (cons 10 p1)
        (cons 11 p2)
      )
    )
  )
)

(defun _dbg-circulo (p radio color)
  (if p
    (entmakex
      (list
        (cons 0 "CIRCLE")
        (cons 8 (getvar "CLAYER"))
        (cons 62 color)
        (cons 10 p)
        (cons 40 radio)
      )
    )
  )
)

(defun _dbg-texto (p txt color / pt)
  (if p
    (progn
      (setq pt (_vec-add p (list 2.0 2.0 0.0)))
      (entmakex
        (list
          (cons 0 "TEXT")
          (cons 8 (getvar "CLAYER"))
          (cons 62 color)
          (cons 10 pt)
          (cons 40 4.0)
          (cons 1 txt)
          (cons 7 (getvar "TEXTSTYLE"))
          (cons 50 0.0)
        )
      )
    )
  )
)

(defun _depurar-compensacion-oblicua-muro (muro lista extremo / res aj caraComp ancho anchoMod linea arranque pt ang pFin)
  (setq res (_ajustar-muro-por-extremos-v2 muro lista))
  (setq aj (if res (cdr (assoc extremo res)) nil))

  (if aj
    (progn
      (setq caraComp (_cara-compensacion-en-extremo muro aj))
      (setq ancho (_ancho-compensacion-en-extremo aj lista muro))
      (setq anchoMod (_longitud-modular-encofrado ancho))
      (setq linea (if caraComp (_linea-referencia-compensacion muro res lista caraComp aj) nil))

      (if linea
        (progn
          (setq arranque (_datos-arranque-compensacion-segun-ajuste muro lista extremo caraComp aj linea))

          (if (_arranque-valido-p arranque)
            (progn
              (setq pt (cdr (assoc "PT" arranque)))
              (setq ang (cdr (assoc "ANG" arranque)))
              (setq pFin (_punto-por-angulo-dist pt ang anchoMod))

              (_dbg-linea (nth 0 linea) (nth 1 linea) 3)
              (_dbg-circulo pt 3.0 1)
              (_dbg-texto pt
                (strcat
                  "ARR COMP M" (itoa (_muro-id muro))
                  " " extremo
                  " " caraComp
                )
                1
              )
              (_dbg-linea pt pFin 1)
              (_dbg-circulo pFin 2.0 1)

              (prompt
                (strcat
                  "\nMuro " (itoa (_muro-id muro))
                  " " extremo
                  " | Cara comp: " caraComp
                  " | Ancho real: " (_fmt-real ancho)
                  " | Modular: " (_fmt-real anchoMod)
                  " | PT: " (_fmt-pt2d pt)
                  " | FIN: " (_fmt-pt2d pFin)
                )
              )
            )
            (prompt
              (strcat
                "\nERROR ARRANQUE COMP: Muro "
                (itoa (_muro-id muro))
                " "
                extremo
              )
            )
          )
        )
      )
    )
  )
)

(defun c:DEPURAR_OBLICUAS_PLANTA (/ lista esquinas e m1 m2 ext1 ext2 ptInt ptExt)
  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (setq esquinas (_recolectar-esquinas-unicas lista))
      (prompt "\n===== DEPURACION VISUAL OBLICUAS PLANTA =====")

      (if esquinas
        (foreach e esquinas
          (if (_esquina-oblicua-p e lista)
            (progn
              (setq m1 (_buscar-muro-por-id (cdr (assoc "MURO1" e)) lista))
              (setq m2 (_buscar-muro-por-id (cdr (assoc "MURO2" e)) lista))
              (setq ext1 (cdr (assoc "EXT1" e)))
              (setq ext2 (cdr (assoc "EXT2" e)))

              (if (and m1 m2)
                (progn
                  (setq ptInt (_punto-interior-esquina m1 lista ext1 e))
                  (setq ptExt (_vertice-exterior-compensacion-oblicua e lista))
                  (_dbg-circulo ptInt 4.0 2)
                  (_dbg-texto ptInt "VERTICE INTERIOR" 2)
                  (_dbg-circulo ptExt 4.0 4)
                  (_dbg-texto ptExt "VERTICE EXTERIOR COMP" 4)
                  (_dbg-linea ptExt ptInt 4)

                  (prompt
                    (strcat
                      "\n\nESQUINA OBLICUA M"
                      (itoa (_muro-id m1)) " " ext1
                      " <-> M" (itoa (_muro-id m2)) " " ext2
                      " | V_INT: " (_fmt-pt2d ptInt)
                      " | V_EXT_COMP: " (_fmt-pt2d ptExt)
                    )
                  )

                  (_depurar-compensacion-oblicua-muro m1 lista ext1)
                  (_depurar-compensacion-oblicua-muro m2 lista ext2)
                )
              )
            )
          )
        )
        (prompt "\nNo se detectaron esquinas unicas.")
      )
    )
  )
  (princ)
)

(defun _dbg-tipo-resultado (x)
  (cond
    ((null x) "nil")
    ((listp x) (strcat "LISTA len=" (itoa (length x))))
    ((= x T) "T")
    (T (vl-princ-to-string x))
  )
)

(defun _dbg-probar-generador (nombre expr / r)
  (prompt (strcat "\nProbando " nombre "..."))
  (setq r (vl-catch-all-apply expr '()))
  (if (vl-catch-all-error-p r)
    (prompt (strcat "\n  ERROR: " (vl-catch-all-error-message r)))
    (prompt (strcat "\n  OK: " (_dbg-tipo-resultado r)))
  )
  r
)

(defun c:DEPURAR_GENERAR_MURO_COMPLETO (/ lista)
  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (prompt "\n===== DEPURACION GENERAR_MURO_COMPLETO =====")

      (_stock-iniciar-calculo)
      (_dbg-probar-generador
        "COMPENSACIONES"
        '(lambda () (_generar-colocaciones-compensaciones lista))
      )

      (_stock-iniciar-calculo)
      (_dbg-probar-generador
        "RECTAS"
        '(lambda () (_generar-colocaciones-rectas lista))
      )

      (_stock-iniciar-calculo)
      (_dbg-probar-generador
        "ESQUINAS"
        '(lambda () (_generar-colocaciones-esquinas lista))
      )

      (_stock-iniciar-calculo)
      (_dbg-probar-generador
        "STOCK_COMP_PREFERENTE"
        '(lambda () (_generar-cols-stock-comp-preferente lista))
      )
    )
  )
  (princ)
)

; =========================================================
; USOS DE PIEZA
; =========================================================

(defun _uso-pieza (pieza long alt giro)
  (list
    (cons "PIEZA" pieza)
    (cons "LONG" long)
    (cons "ALT" alt)
    (cons "GIRO" giro)
  )
)

(defun _uso-pieza-pieza (u) (cdr (assoc "PIEZA" u)))
(defun _uso-pieza-long  (u) (cdr (assoc "LONG" u)))
(defun _uso-pieza-alt   (u) (cdr (assoc "ALT" u)))
(defun _uso-pieza-giro  (u) (cdr (assoc "GIRO" u)))

(defun _usos-pieza-rectangular (pieza / a h res)
  (setq res '())
  (setq a (_cat-ancho pieza))
  (setq h (_cat-alto pieza))

  (if (and a h)
    (progn
      (setq res
        (cons (_uso-pieza pieza a h "NO") res)
      )

      (if (and (_pieza-orientable-p pieza) (/= a h))
        (setq res
          (cons (_uso-pieza pieza h a "SI") res)
        )
      )
    )
  )

  (reverse res)
)
; =========================================================
; EXCEPCIONES DE DESCOMPOSICION PREFERENTE
; Se aplican tanto a longitud como a altura
; =========================================================

(defun _descomposicion-preferente-medida (medida)
  (cond
    ((equal medida 70.0 1e-8)  '(40 30))
    ((equal medida 75.0 1e-8)  '(40 30 5))
    ((equal medida 90.0 1e-8)  '(50 40))
    ((equal medida 95.0 1e-8)  '(50 40 5))
    ((equal medida 110.0 1e-8) '(60 50))
    ((equal medida 115.0 1e-8) '(60 50 5))
    (T nil)
  )
)

(defun _buscar-uso-por-longitud (usos long / res u)
  (setq res nil)
  (foreach u usos
    (if (and (null res) (= (_uso-pieza-long u) long))
      (setq res u)
    )
  )
  res
)

(defun _resolver-descomposicion-preferente-usos (medida usos / pref res long u)
  (setq pref (_descomposicion-preferente-medida medida))
  (setq res '())

  (if pref
    (progn
      (foreach long pref
        (setq u (_buscar-uso-por-longitud usos long))
        (if u
          (setq res (append res (list u)))
          (setq res nil)
        )
      )
      res
    )
    nil
  )
)

(defun _resolver-descomposicion-preferente-alturas (medida alturas / pref res h)
  (setq pref (_descomposicion-preferente-medida medida))
  (setq res '())

  (if pref
    (progn
      (foreach h pref
        (if (_miembro-num-p h alturas)
          (setq res (append res (list h)))
          (setq res nil)
        )
      )
      res
    )
    nil
  )
)

(defun _buscar-panel-por-ancho-en-lista (paneles ancho / res p)
  (setq res nil)
  (foreach p paneles
    (if (and (null res) (= (_cat-ancho p) ancho))
      (setq res p)
    )
  )
  res
)

(defun _resolver-descomposicion-preferente-paneles (medida paneles / pref res ancho p altura grueso ok)
  (setq pref (_descomposicion-preferente-medida medida))
  (setq res '())
  (setq altura (if paneles (_cat-alto (car paneles)) nil))
  (setq grueso
    (cond
      ((= altura 150) (_buscar-pieza-por-id "024"))
      ((= altura 300) (_buscar-pieza-por-id "023"))
      (T nil)
    )
  )

  (if pref
    (progn
      (setq ok T)
      (foreach ancho pref
        (if ok
          (progn
            (setq p
              (if (= ancho 5)
                grueso
                (_buscar-panel-por-ancho-en-lista paneles ancho)
              )
            )
            (if p
              (setq res (append res (list p)))
              (progn
                (setq res nil)
                (setq ok nil)
              )
            )
          )
        )
      )
      (if ok res nil)
    )
    nil
  )
)
; =========================================================
; RESOLVEDOR ACTUAL DE PAOS
; Logica activa usada por PROBAR_PANYO
; =========================================================

(defun _ordenar-usos-por-prioridad (lista / sin20 con20 u)
  (setq sin20 '())
  (setq con20 '())

  (foreach u lista
    (if (= (_uso-pieza-long u) 20)
      (setq con20 (cons u con20))
      (setq sin20 (cons u sin20))
    )
  )

  (setq sin20
    (vl-sort sin20
      '(lambda (a b) (> (_uso-pieza-long a) (_uso-pieza-long b)))
    )
  )

  (setq con20
    (vl-sort con20
      '(lambda (a b) (> (_uso-pieza-long a) (_uso-pieza-long b)))
    )
  )

  (append sin20 con20)
)

(defun _repetir-pieza (pieza n / res)
  (setq res '())
  (while (> n 0)
    (setq res (cons pieza res))
    (setq n (1- n))
  )
  res
)

(defun _contar-perfiles-usos (lst / n u)
  (setq n 0)
  (foreach u lst
    (if (_es-perfil-p u)
      (setq n (1+ n))
    )
  )
  n
)

(defun _resolver-descomposicion-preferente-usos-limitada
  (medida usos maxPerfiles perfilesUsados / pref res long u n ok)

  (setq pref (_descomposicion-preferente-medida medida))
  (setq res '())
  (setq ok T)
  (setq n perfilesUsados)

  (if pref
    (progn
      (foreach long pref
        (if ok
          (progn
            (setq u (_buscar-uso-por-longitud usos long))

            (if u
              (progn
                (if (_es-perfil-p u)
                  (setq n (1+ n))
                )

                (if (> n maxPerfiles)
                  (setq ok nil)
                  (setq res (append res (list u)))
                )
              )
              (setq ok nil)
            )
          )
        )
      )

      (if (and ok (_stock-ok-usos-p res)) res nil)
    )
    nil
  )
)

(defun _resolver-exacto-paneles-idx-limitado
  (resto usos idx maxPerfiles perfilesUsados / pref p ancho maxCant cant sub res piezas cantPerfiles candidato)

  (cond
    ((equal resto 0.0 1e-8)
      '()
    )

    ((or (< resto 0.0) (>= idx (length usos)))
      nil
    )
    ((and (_medida-acaba-en-5-p resto)
        (>= perfilesUsados maxPerfiles))
	nil
	)

    (T
      ;; Probar excepciones preferentes tambin sobre el RESTO.
      ;; Ejemplo: si queda 115 => 60 + 50 + 5
      (setq pref
        (_resolver-descomposicion-preferente-usos-limitada
          resto
          usos
          maxPerfiles
          perfilesUsados
        )
      )

      (if pref
        pref
        (progn
          (setq p (nth idx usos))
          (setq ancho (_uso-pieza-long p))

          (if (or (null p) (null ancho) (<= ancho 0))
            (_resolver-exacto-paneles-idx-limitado
              resto
              usos
              (1+ idx)
              maxPerfiles
              perfilesUsados
            )

            (progn
              (setq maxCant (fix (/ resto ancho)))
              (setq cant maxCant)
              (setq res nil)

              (while (and (>= cant 0) (null res))
                (setq piezas (_repetir-pieza p cant))

                (setq cantPerfiles
                  (+ perfilesUsados (_contar-perfiles-usos piezas))
                )

                (if (<= cantPerfiles maxPerfiles)
                  (progn
                    (setq sub
                      (_resolver-exacto-paneles-idx-limitado
                        (- resto (* cant ancho))
                        usos
                        (1+ idx)
                        maxPerfiles
                        cantPerfiles
                      )
                    )

                    (if (or
                          (and (= cant 0) sub)
                          (and (> cant 0)
                               (or sub
                                   (equal (- resto (* cant ancho)) 0.0 1e-8))))
                      (progn
                        (setq candidato (append piezas sub))
                        (if (_stock-ok-usos-p candidato)
                          (setq res candidato)
                        )
                      )
                    )
                  )
                )

                (setq cant (1- cant))
              )

              res
            )
          )
        )
      )
    )
  )
)

(defun _resolver-exacto-paneles-idx (resto usos idx / maxPerfiles res)
  ;; Si la medida acaba en 5, como las chapas van de 10 en 10,
  ;; hace falta al menos 1 grueso de 5.
  (if (_medida-acaba-en-5-p resto)
    (setq maxPerfiles 1)
    (setq maxPerfiles 0)
  )

  (setq res nil)

  (while (and (null res) (<= maxPerfiles 20))
    (setq res
      (_resolver-exacto-paneles-idx-limitado
        resto
        usos
        idx
        maxPerfiles
        0
      )
    )
    (setq maxPerfiles (1+ maxPerfiles))
  )

  res
)

(defun _descomponer-longitud-con-usos (longitud usos / usosPanel usosPerfil res)

  (setq usosPanel
    (vl-remove-if-not '_es-panel-p usos)
  )

  (setq usosPerfil
    (vl-remove-if-not '_es-perfil-p usos)
  )

  ; 1) primero probar excepciones preferentes con todos los usos
  (setq res (_resolver-descomposicion-preferente-usos longitud usos))
  (if (and res (null (_stock-ok-usos-p res))) (setq res nil))

  ; 2) si no aplica excepcion, intentar solo paneles
  (if (null res)
    (if usosPanel
      (progn

        ; Si acaba en 5, solo con paneles es imposible.
        ; Evitamos una busqueda larguisima inutil.
        (if (_medida-acaba-en-5-p longitud)
          (setq res nil)
          (setq res (_resolver-exacto-paneles-idx longitud usosPanel 0))
        )

        (if (null res)
          (setq res (_resolver-exacto-paneles-idx longitud usos 0))
        )
      )
      (setq res (_resolver-exacto-paneles-idx longitud usos 0))
    )
  )

  res
)
(defun _es-panel-p (uso)
  (and uso
       (_pieza-tipo-p (_uso-pieza-pieza uso) "PANEL"))
)

(defun _es-perfil-p (uso)
  (and uso
       (_pieza-tipo-p (_uso-pieza-pieza uso) "PERFIL"))
)
(defun _hacer-banda-solucion (altura piezas modo)
  (list
    (cons "ALTURA" altura)
    (cons "PIEZAS" piezas)
    (cons "MODO" modo)
  )
)

(defun _banda-altura (b)
  (cdr (assoc "ALTURA" b))
)

(defun _banda-piezas (b)
  (cdr (assoc "PIEZAS" b))
)

(defun _banda-modo (b)
  (cdr (assoc "MODO" b))
)

(defun _hacer-solucion-panyo-bandas (longitud altura-total bandas)
  (list
    (cons "LONGITUD" longitud)
    (cons "ALTURA_TOTAL" altura-total)
    (cons "BANDAS" bandas)
  )
)

(defun _sol-panyo-bandas (s)
  (cdr (assoc "BANDAS" s))
)

(defun _usos-verticales-altura-300 (/ res item usos u)
  (setq res '())

  (foreach item (_catalogo-paneles)
    (setq usos (_usos-pieza-rectangular item))
    (foreach u usos
      (if (and
            (= (_uso-pieza-giro u) "NO")
            (= (_uso-pieza-alt u) 300)
          )
        (setq res (cons u res))
      )
    )
  )

  (foreach item (_catalogo-perfiles)
    (setq usos (_usos-pieza-rectangular item))
    (foreach u usos
      (if (and
            (= (_uso-pieza-giro u) "NO")
            (= (_uso-pieza-alt u) 300)
          )
        (setq res (cons u res))
      )
    )
  )

  (_ordenar-usos-por-prioridad (reverse res))
)

(defun _usos-horizontales-para-altura (altura / res item usos u)
  (setq res '())

  (foreach item (_catalogo-paneles)
    (setq usos (_usos-pieza-rectangular item))
    (foreach u usos
      (if (and
            (= (_uso-pieza-giro u) "SI")
            (= (_uso-pieza-alt u) altura)
          )
        (setq res (cons u res))
      )
    )
  )

  (foreach item (_catalogo-perfiles)
    (setq usos (_usos-pieza-rectangular item))
    (foreach u usos
      (if (and
            (= (_uso-pieza-giro u) "SI")
            (= (_uso-pieza-alt u) altura)
          )
        (setq res (cons u res))
      )
    )
  )

  (_ordenar-usos-por-prioridad (reverse res))
)

(defun _exceso-uso-sobre-altura (uso altura)
  (- (_uso-pieza-alt uso) altura)
)

(defun _mejor-uso-vertical-que-cubre (longitud altura / mejor item usos u excMejor excU)
  (setq mejor nil)

  (foreach item (_catalogo-paneles)
    (setq usos (_usos-pieza-rectangular item))
    (foreach u usos
      (if (and
            (= (_uso-pieza-giro u) "NO")
            (= (_uso-pieza-long u) longitud)
            (>= (_uso-pieza-alt u) altura)
          )
        (progn
          (if (null mejor)
            (setq mejor u)
            (progn
              (setq excMejor (_exceso-uso-sobre-altura mejor altura))
              (setq excU     (_exceso-uso-sobre-altura u altura))

              (if (or
                    (< excU excMejor)
                    (and (= excU excMejor)
                         (< (_uso-pieza-alt u) (_uso-pieza-alt mejor)))
                    (and (= excU excMejor)
                         (= (_uso-pieza-alt u) (_uso-pieza-alt mejor))
                         (< (_cat-alto (_uso-pieza-pieza u))
                            (_cat-alto (_uso-pieza-pieza mejor))))
                  )
                (setq mejor u)
              )
            )
          )
        )
      )
    )
  )

  (foreach item (_catalogo-perfiles)
    (setq usos (_usos-pieza-rectangular item))
    (foreach u usos
      (if (and
            (= (_uso-pieza-giro u) "NO")
            (= (_uso-pieza-long u) longitud)
            (>= (_uso-pieza-alt u) altura)
          )
        (progn
          (if (null mejor)
            (setq mejor u)
            (progn
              (setq excMejor (_exceso-uso-sobre-altura mejor altura))
              (setq excU     (_exceso-uso-sobre-altura u altura))

              (if (or
                    (< excU excMejor)
                    (and (= excU excMejor)
                         (< (_uso-pieza-alt u) (_uso-pieza-alt mejor)))
                    (and (= excU excMejor)
                         (= (_uso-pieza-alt u) (_uso-pieza-alt mejor))
                         (< (_cat-alto (_uso-pieza-pieza u))
                            (_cat-alto (_uso-pieza-pieza mejor))))
                  )
                (setq mejor u)
              )
            )
          )
        )
      )
    )
  )

  mejor
)

(defun _resolver-base-300-de-pie (longitud / usos piezas)
  (setq usos (_usos-verticales-altura-300))
  (setq piezas (_descomponer-longitud-con-usos longitud usos))

  (if piezas
    (_hacer-banda-solucion 300 piezas "EXACTO")
    nil
  )
)

(defun _resolver-banda-superior-horizontal (longitud altura / usosHoriz piezasParciales)
  (setq usosHoriz (_usos-horizontales-para-altura altura))
  (setq piezasParciales (_descomponer-longitud-con-usos longitud usosHoriz))

  (if piezasParciales
    (_hacer-banda-solucion altura piezasParciales "EXACTO")
    nil
  )
)

(defun _alturas-horizontales-disponibles (/ res item usos u h)
  (setq res '())

  (foreach item (_catalogo-paneles)
    (setq usos (_usos-pieza-rectangular item))
    (foreach u usos
      (if (= (_uso-pieza-giro u) "SI")
        (progn
          (setq h (_uso-pieza-alt u))
          (if (and h (> h 0) (not (_miembro-num-p h res)))
            (setq res (cons h res))
          )
        )
      )
    )
  )

  (foreach item (_catalogo-perfiles)
    (setq usos (_usos-pieza-rectangular item))
    (foreach u usos
      (if (= (_uso-pieza-giro u) "SI")
        (progn
          (setq h (_uso-pieza-alt u))
          (if (and h (> h 0) (not (_miembro-num-p h res)))
            (setq res (cons h res))
          )
        )
      )
    )
  )

  (vl-sort res '>)
)




(defun _altura-grueso-p (h)
  ;; En el catalogo actual los GRUESOS aportan 5 cm cuando trabajan en horizontal.
  ;; Esto permite penalizarlos en la descomposicion de ALTURAS.
  (equal h 5.0 1e-8)
)

(defun _contar-gruesos-alturas (lst / n h)
  (setq n 0)
  (foreach h lst
    (if (_altura-grueso-p h)
      (setq n (1+ n))
    )
  )
  n
)

(defun _resolver-descomposicion-preferente-alturas-limitada
  (medida alturas maxGruesos gruesosUsados / pref res h n ok)

  (setq pref (_descomposicion-preferente-medida medida))
  (setq res '())
  (setq ok T)
  (setq n gruesosUsados)

  (if pref
    (progn
      (foreach h pref
        (if ok
          (progn
            (if (_miembro-num-p h alturas)
              (progn
                (if (_altura-grueso-p h)
                  (setq n (1+ n))
                )

                (if (> n maxGruesos)
                  (setq ok nil)
                  (setq res (append res (list h)))
                )
              )
              (setq ok nil)
            )
          )
        )
      )

      (if ok res nil)
    )
    nil
  )
)

(defun _resolver-alturas-exactas-idx-limitado
  (resto alturas idx maxGruesos gruesosUsados / pref h maxCant cant sub res piezas cantGruesos)

  (cond
    ((equal resto 0.0 1e-8)
      '()
    )

    ((or (< resto 0.0) (>= idx (length alturas)))
      nil
    )

    ((and (_medida-acaba-en-5-p resto)
          (>= gruesosUsados maxGruesos))
      nil
    )

    (T
      ;; Probar excepciones preferentes tambien sobre el RESTO.
      ;; Ejemplo importante: 190 => 100 + (90 preferente = 50 + 40),
      ;; evitando 100 + 80 + 5 + 5.
      (setq pref
        (_resolver-descomposicion-preferente-alturas-limitada
          resto
          alturas
          maxGruesos
          gruesosUsados
        )
      )

      (if pref
        pref
        (progn
          (setq h (nth idx alturas))

          (if (or (null h) (<= h 0))
            (_resolver-alturas-exactas-idx-limitado
              resto
              alturas
              (1+ idx)
              maxGruesos
              gruesosUsados
            )

            (progn
              (setq maxCant (fix (/ resto h)))
              (setq cant maxCant)
              (setq res nil)

              (while (and (>= cant 0) (null res))
                (setq piezas (_repetir-num h cant))

                (setq cantGruesos
                  (+ gruesosUsados (_contar-gruesos-alturas piezas))
                )

                (if (<= cantGruesos maxGruesos)
                  (progn
                    (setq sub
                      (_resolver-alturas-exactas-idx-limitado
                        (- resto (* cant h))
                        alturas
                        (1+ idx)
                        maxGruesos
                        cantGruesos
                      )
                    )

                    (if (or
                          (and (= cant 0) sub)
                          (and (> cant 0)
                               (or sub
                                   (equal (- resto (* cant h)) 0.0 1e-8))))
                      (setq res (append piezas sub))
                    )
                  )
                )

                (setq cant (1- cant))
              )

              res
            )
          )
        )
      )
    )
  )
)

(defun _resolver-alturas-exactas-idx (resto alturas idx / maxGruesos res)
  ;; Nueva norma:
  ;; 1) Primero intentar resolver la altura SIN gruesos.
  ;; 2) Solo si no hay alternativa, permitir 1 grueso, luego 2, etc.
  ;; Asi se evita 100+80+5+5 cuando existe 100+50+40.
  (if (_medida-acaba-en-5-p resto)
    (setq maxGruesos 1)
    (setq maxGruesos 0)
  )

  (setq res nil)

  (while (and (null res) (<= maxGruesos 20))
    (setq res
      (_resolver-alturas-exactas-idx-limitado
        resto
        alturas
        idx
        maxGruesos
        0
      )
    )
    (setq maxGruesos (1+ maxGruesos))
  )

  res
)

(defun _usos-verticales-para-altura-modo (altura modo / res item usos u)
  (setq res '())

  (foreach item (_catalogo-paneles)
    (setq usos (_usos-pieza-rectangular item))
    (foreach u usos
      (if (and
            (= (_uso-pieza-giro u) "NO")
            (_uso-valido-para-altura-modo-p u altura modo)
          )
        (setq res (cons u res))
      )
    )
  )

  (foreach item (_catalogo-perfiles)
    (setq usos (_usos-pieza-rectangular item))
    (foreach u usos
      (if (and
            (= (_uso-pieza-giro u) "NO")
            (_uso-valido-para-altura-modo-p u altura modo)
          )
        (setq res (cons u res))
      )
    )
  )

  (_ordenar-usos-por-prioridad (reverse res))
)

(defun _resolver-panyo-vertical-completo-modo (longitud altura modo / usos piezas)
  (setq usos (_usos-verticales-para-altura-modo altura modo))
  (setq piezas (_descomponer-longitud-con-usos longitud usos))

  (if piezas
    (_hacer-solucion-panyo-bandas
      longitud
      altura
      (list (_hacer-banda-solucion altura piezas modo))
    )
    nil
  )
)

(defun _resolver-panyo-vertical-completo (longitud altura / sol)
  (setq sol (_resolver-panyo-vertical-completo-modo longitud altura "EXACTO"))

  (if (null sol)
    (setq sol (_resolver-panyo-vertical-completo-modo longitud altura "EXCESO_ALTURA_TOTAL"))
  )

  sol
)

(defun _anchura-horizontal-comun-max (longitud capas / ancho ok h)
  (setq ancho longitud)

  (while (and (> ancho 0) (null ok))
    (setq ok T)

    (foreach h capas
      (if (null (_resolver-banda-superior-horizontal ancho h))
        (setq ok nil)
      )
    )

    (if (null ok)
      (setq ancho (- ancho 10))
    )
  )

  (if ok ancho nil)
)

(defun _resolver-panyo-horizontal-con-resto (longitud altura-total / capas anchoComun bandas h banda resto solResto)
  (setq capas
    (_resolver-alturas-exactas-idx
      altura-total
      (_alturas-horizontales-disponibles)
      0
    )
  )

  (if (null capas)
    nil
    (progn
      (setq anchoComun (_anchura-horizontal-comun-max longitud capas))

      (if (or (null anchoComun) (<= anchoComun 0))
        nil
        (progn
          (setq bandas '())

          (foreach h capas
            (setq banda (_resolver-banda-superior-horizontal anchoComun h))
            (if banda
              (setq bandas (append bandas (list banda)))
              (setq bandas nil)
            )
          )

          (if (null bandas)
            nil
            (progn
              (setq resto (- longitud anchoComun))

              (if (equal resto 0.0 1e-8)
                (_hacer-solucion-panyo-bandas longitud altura-total bandas)
                (progn
                  (setq solResto (_resolver-panyo-reglas resto altura-total))

                  (if solResto
                    (_hacer-solucion-panyo-bandas
                      longitud
                      altura-total
                      (append bandas (_sol-panyo-bandas solResto))
                    )
                    nil
                  )
                )
              )
            )
          )
        )
      )
    )
  )
)
(defun _miembro-num-p (x lista / ok)
  (setq ok nil)
  (foreach a lista
    (if (= a x)
      (setq ok T)
    )
  )
  ok
)





(defun _repetir-num (n veces / res)
  (setq res '())
  (while (> veces 0)
    (setq res (cons n res))
    (setq veces (1- veces))
  )
  res
)


(defun _resolver-bandas-menor-300 (longitud altura-total / alturas capas res h banda)
  (setq alturas (_alturas-horizontales-disponibles))
  (setq capas (_resolver-alturas-exactas-idx altura-total alturas 0))
  (setq res '())

  (if capas
    (progn
      (foreach h capas
        (setq banda (_resolver-banda-superior-horizontal longitud h))
        (if banda
          (setq res (append res (list banda)))
          (setq res nil)
        )
      )

      (if res
        (_hacer-solucion-panyo-bandas longitud altura-total res)
        nil
      )
    )
    nil
  )
)
(defun _resolver-panyo-reglas (longitud altura-total / bandas base resto solSuperior solHorizontal solVertical)
  (setq bandas '())

  (if (>= altura-total 300)
    (progn
      (setq base (_resolver-base-300-de-pie longitud))

      (if base
        (progn
          (setq bandas (append bandas (list base)))
          (setq resto (- altura-total 300))

          (if (> resto 0)
            (progn
              (setq solSuperior (_resolver-panyo-reglas longitud resto))

              (if solSuperior
                (setq bandas (append bandas (_sol-panyo-bandas solSuperior)))
                (setq bandas nil)
              )
            )
          )

          (if bandas
            (_hacer-solucion-panyo-bandas longitud altura-total bandas)
            nil
          )
        )
        nil
      )
    )

    (progn
      (setq solHorizontal (_resolver-panyo-horizontal-con-resto longitud altura-total))

      (if solHorizontal
        solHorizontal
        (progn
          (setq solVertical (_resolver-panyo-vertical-completo longitud altura-total))
          solVertical
        )
      )
    )
  )
)
; =========================================================
; MOTOR MODULAR SIMPLE
; Usado todavia por el despiece general.
; =========================================================

(defun _uso-valido-para-altura-modo-p (uso altura modo)
  (cond
    ((= modo "EXACTO")
      (= (_uso-pieza-alt uso) altura)
    )
    ((or
       (= modo "EXCESO_ALTURA")
       (= modo "EXCESO_ALTURA_TOTAL")
     )
      (>= (_uso-pieza-alt uso) altura)
    )
    (T nil)
  )
)

(defun _piezas-utilizables-para-altura-modo (altura modo / res item usos u)
  (setq res '())

  (foreach item (_catalogo-paneles)
    (setq usos (_usos-pieza-rectangular item))
    (foreach u usos
      (if (_uso-valido-para-altura-modo-p u altura modo)
        (setq res (cons u res))
      )
    )
  )

  (foreach item (_catalogo-perfiles)
    (setq usos (_usos-pieza-rectangular item))
    (foreach u usos
      (if (_uso-valido-para-altura-modo-p u altura modo)
        (setq res (cons u res))
      )
    )
  )

  (reverse res)
)

(defun _descomponer-ancho-modular-modo (ancho altura modo / piezas res)
  (setq piezas
    (_ordenar-usos-por-prioridad
      (_piezas-utilizables-para-altura-modo altura modo)
    )
  )

  (setq res (_resolver-exacto-paneles-idx ancho piezas 0))
  res
)

(defun _descomponer-ancho-modular-exacto (ancho altura)
  (_descomponer-ancho-modular-modo ancho altura "EXACTO")
)

(defun _descomponer-ancho-modular-con-exceso-altura (ancho altura)
  (_descomponer-ancho-modular-modo ancho altura "EXCESO_ALTURA")
)

(defun _descomponer-ancho-modular (ancho altura / res)
  (setq res (_descomponer-ancho-modular-exacto ancho altura))
  (if (null res)
    (setq res (_descomponer-ancho-modular-con-exceso-altura ancho altura))
  )
  res
)

(defun _descomponer-longitud-en-paneles (longitud altura)
  (_descomponer-ancho-modular longitud altura)
)

; =========================================================
; LOGICA LEGACY - NO USADA ACTUALMENTE EN PROBAR_PANYO
; Antiguos intentos por capas / columnas.
; =========================================================

(defun _resolver-capa-longitud (longitud altura-capa / piezas modo)
  (setq piezas (_descomponer-ancho-modular-exacto longitud altura-capa))
  (setq modo "EXACTO")

  (if (null piezas)
    (progn
      (setq piezas (_descomponer-ancho-modular-con-exceso-altura longitud altura-capa))
      (setq modo "EXCESO_ALTURA")
    )
  )

  (if piezas
    (_hacer-capa-solucion altura-capa piezas modo)
    nil
  )
)

(defun _hacer-capa-solucion (altura piezas modo)
  (list
    (cons "ALTURA" altura)
    (cons "PIEZAS" piezas)
    (cons "MODO" modo)
  )
)

(defun _capa-altura (c)
  (cdr (assoc "ALTURA" c))
)

(defun _capa-piezas (c)
  (cdr (assoc "PIEZAS" c))
)

(defun _capa-modo (c)
  (cdr (assoc "MODO" c))
)

(defun _hacer-solucion-panyo (longitud altura-total capas)
  (list
    (cons "LONGITUD" longitud)
    (cons "ALTURA_TOTAL" altura-total)
    (cons "CAPAS" capas)
  )
)

(defun _sol-panyo-longitud (s)
  (cdr (assoc "LONGITUD" s))
)

(defun _sol-panyo-altura (s)
  (cdr (assoc "ALTURA_TOTAL" s))
)

(defun _sol-panyo-capas (s)
  (cdr (assoc "CAPAS" s))
)

(defun _opciones-capas-por-prioridad (altura-total / resto res op)
  (cond
    ((null altura-total) nil)
    ((= altura-total 20)  '((20)))
    ((= altura-total 30)  '((30)))
    ((= altura-total 40)  '((40)))
    ((= altura-total 50)  '((50)))
    ((= altura-total 60)  '((60)))
    ((= altura-total 80)  '((80)))
    ((= altura-total 100) '((100)))
    ((= altura-total 150) '((100 50) (150)))
    ((= altura-total 200) '((100 100) (150 50)))
    ((= altura-total 250) '((100 100 50) (150 100)))
    ((>= altura-total 300)
      (setq resto (- altura-total 300))
      (if (= resto 0)
        '((300))
        (progn
          (setq res '())
          (foreach op (_opciones-capas-por-prioridad resto)
            (setq res
              (append res
                (list (cons 300 op))
              )
            )
          )
          res
        )
      )
    )
    (T nil)
  )
)

(defun _resolver-panyo-con-capas (longitud altura-total capas-altura / res ok h capa)
  (setq res '())
  (setq ok T)

  (while (and capas-altura ok)
    (setq h (car capas-altura))
    (setq capa (_resolver-capa-longitud longitud h))

    (if capa
      (setq res (append res (list capa)))
      (setq ok nil)
    )

    (setq capas-altura (cdr capas-altura))
  )

  (if ok
    (_hacer-solucion-panyo longitud altura-total res)
    nil
  )
)

(defun _resolver-capas-altura (altura-total)
  (if (_opciones-capas-por-prioridad altura-total)
    (car (_opciones-capas-por-prioridad altura-total))
    nil
  )
)

(defun _hacer-columna-solucion (longitud piezas modo)
  (list
    (cons "LONGITUD" longitud)
    (cons "PIEZAS" piezas)
    (cons "MODO" modo)
  )
)

(defun _columna-longitud (c)
  (cdr (assoc "LONGITUD" c))
)

(defun _columna-piezas (c)
  (cdr (assoc "PIEZAS" c))
)

(defun _columna-modo (c)
  (cdr (assoc "MODO" c))
)

(defun _hacer-solucion-panyo-columnas (longitud altura-total columnas)
  (list
    (cons "LONGITUD" longitud)
    (cons "ALTURA_TOTAL" altura-total)
    (cons "COLUMNAS" columnas)
  )
)

(defun _sol-panyo-columnas (s)
  (cdr (assoc "COLUMNAS" s))
)

(defun _altura-total-usos (usos / total u)
  (setq total 0)
  (foreach u usos
    (setq total (+ total (_uso-pieza-alt u)))
  )
  total
)

(defun _ordenar-usos-vertical-por-prioridad (lista)
  (vl-sort lista
    '(lambda (a b)
       (cond
         ((and (= (_uso-pieza-giro a) "NO") (= (_uso-pieza-giro b) "SI")) T)
         ((and (= (_uso-pieza-giro a) "SI") (= (_uso-pieza-giro b) "NO")) nil)
         ((/= (_uso-pieza-alt a) (_uso-pieza-alt b))
           (> (_uso-pieza-alt a) (_uso-pieza-alt b))
         )
         (T
           (> (_cat-alto (_uso-pieza-pieza a))
              (_cat-alto (_uso-pieza-pieza b)))
         )
       )
     )
  )
)

(defun _todos-los-usos-modulares (/ res item usos u)
  (setq res '())

  (foreach item (_catalogo-paneles)
    (setq usos (_usos-pieza-rectangular item))
    (foreach u usos
      (setq res (cons u res))
    )
  )

  (foreach item (_catalogo-perfiles)
    (setq usos (_usos-pieza-rectangular item))
    (foreach u usos
      (setq res (cons u res))
    )
  )

  (reverse res)
)

(defun _usos-para-longitud (longitud / res u)
  (setq res '())
  (foreach u (_todos-los-usos-modulares)
    (if (= (_uso-pieza-long u) longitud)
      (setq res (cons u res))
    )
  )
  (_ordenar-usos-vertical-por-prioridad (reverse res))
)

(defun _anchos-disponibles-prioridad (/ anchos u l sin20 con20)
  (setq anchos '())

  (foreach u (_todos-los-usos-modulares)
    (setq l (_uso-pieza-long u))
    (if (and l (not (member l anchos)))
      (setq anchos (cons l anchos))
    )
  )

  (setq sin20 '())
  (setq con20 '())

  (foreach l anchos
    (if (= l 20)
      (setq con20 (cons l con20))
      (setq sin20 (cons l sin20))
    )
  )

  (setq sin20 (vl-sort sin20 '>))
  (setq con20 (vl-sort con20 '>))

  (append sin20 con20)
)

(defun _repetir-uso (uso n / res)
  (setq res '())
  (while (> n 0)
    (setq res (cons uso res))
    (setq n (1- n))
  )
  res
)

(defun _repetir-columna (col n / res)
  (setq res '())
  (while (> n 0)
    (setq res (cons col res))
    (setq n (1- n))
  )
  res
)

; =========================================================
; REGLA GLOBAL GRUESOS
; Evitar 2 o mas gruesos si existe otra combinacion posible.
; Se aplica tanto en altura como en longitud.
; =========================================================

(defun _resolver-altura-exacta-idx-limitado
  (resto usos idx maxPerfiles perfilesUsados / pref u alt maxCant cant sub res piezas cantPerfiles)

  (cond
    ((equal resto 0.0 1e-8) '())
    ((or (< resto 0.0) (>= idx (length usos))) nil)
    ((and (_medida-acaba-en-5-p resto)
          (>= perfilesUsados maxPerfiles))
      nil
    )
    (T
      ;; Excepciones preferentes tambien en altura.
      ;; Ejemplo: 90 => 50 + 40, 95 => 50 + 40 + 5.
      (setq pref
        (_resolver-descomposicion-preferente-usos-limitada
          resto
          usos
          maxPerfiles
          perfilesUsados
        )
      )

      (if pref
        pref
        (progn
          (setq u (nth idx usos))
          (setq alt (_uso-pieza-alt u))

          (if (or (null u) (null alt) (<= alt 0))
            (_resolver-altura-exacta-idx-limitado
              resto usos (1+ idx) maxPerfiles perfilesUsados
            )
            (progn
              (setq maxCant (fix (/ resto alt)))
              (setq cant maxCant)
              (setq res nil)

              (while (and (>= cant 0) (null res))
                (setq piezas (_repetir-uso u cant))
                (setq cantPerfiles
                  (+ perfilesUsados (_contar-perfiles-usos piezas))
                )

                (if (<= cantPerfiles maxPerfiles)
                  (progn
                    (setq sub
                      (_resolver-altura-exacta-idx-limitado
                        (- resto (* cant alt))
                        usos
                        (1+ idx)
                        maxPerfiles
                        cantPerfiles
                      )
                    )

                    (if (or
                          (and (= cant 0) sub)
                          (and (> cant 0)
                               (or sub (equal (- resto (* cant alt)) 0.0 1e-8))))
                      (setq res (append piezas sub))
                    )
                  )
                )

                (setq cant (1- cant))
              )

              res
            )
          )
        )
      )
    )
  )
)

(defun _resolver-altura-exacta-idx (resto usos idx / maxPerfiles res)
  ;; Igual que en longitud: se prueba primero con 0 gruesos.
  ;; Si la medida acaba en 5, se permite 1 grueso como minimo.
  ;; Solo si no hay solucion se sube a 2, 3, etc.
  (if (_medida-acaba-en-5-p resto)
    (setq maxPerfiles 1)
    (setq maxPerfiles 0)
  )

  (setq res nil)

  (while (and (null res) (<= maxPerfiles 20))
    (setq res
      (_resolver-altura-exacta-idx-limitado
        resto
        usos
        idx
        maxPerfiles
        0
      )
    )
    (setq maxPerfiles (1+ maxPerfiles))
  )

  res
)

(defun _solucion-exceso-mejor-p (a b objetivo / excesoA excesoB perfA perfB)
  (cond
    ((null a) nil)
    ((null b) T)
    (T
      (setq excesoA (- (_altura-total-usos a) objetivo))
      (setq excesoB (- (_altura-total-usos b) objetivo))
      (setq perfA (_contar-perfiles-usos a))
      (setq perfB (_contar-perfiles-usos b))

      (cond
        ((< excesoA excesoB) T)
        ((> excesoA excesoB) nil)
        ;; A igualdad de exceso, evitar acumulacion de gruesos.
        ((< perfA perfB) T)
        ((> perfA perfB) nil)
        ((< (length a) (length b)) T)
        ((> (length a) (length b)) nil)
        (T nil)
      )
    )
  )
)

(defun _resolver-altura-exceso-idx (resto usos idx objetivo / u alt maxCant cant sub cand mejor)
  (cond
    ((<= resto 0) '())
    ((>= idx (length usos)) nil)
    (T
      (setq u (nth idx usos))
      (setq alt (_uso-pieza-alt u))
      (setq mejor nil)

      (if (or (null u) (null alt) (<= alt 0))
        (_resolver-altura-exceso-idx resto usos (1+ idx) objetivo)
        (progn
          (setq maxCant (1+ (fix (/ resto alt))))
          (setq cant maxCant)

          (while (>= cant 0)
            (setq sub
              (_resolver-altura-exceso-idx
                (- resto (* cant alt))
                usos
                (1+ idx)
                objetivo
              )
            )

            (if (or
                  (and (= cant 0) sub)
                  (and (> cant 0)
                       (or sub (<= (- resto (* cant alt)) 0))))
              (progn
                (setq cand (append (_repetir-uso u cant) sub))
                (if (_solucion-exceso-mejor-p cand mejor objetivo)
                  (setq mejor cand)
                )
              )
            )

            (setq cant (1- cant))
          )

          mejor
        )
      )
    )
  )
)

(defun _resolver-columna-exacta (altura-total longitud-columna / usos piezas)
  (setq usos (_usos-para-longitud longitud-columna))
  (setq piezas (_resolver-altura-exacta-idx altura-total usos 0))

  (if piezas
    (_hacer-columna-solucion longitud-columna piezas "EXACTO")
    nil
  )
)

(defun _resolver-columna-con-exceso (altura-total longitud-columna / usos piezas)
  (setq usos (_usos-para-longitud longitud-columna))
  (setq piezas (_resolver-altura-exceso-idx altura-total usos 0 altura-total))

  (if piezas
    (_hacer-columna-solucion longitud-columna piezas "EXCESO_ALTURA")
    nil
  )
)

(defun _columnas-candidatas-exactas (altura-total / res l col)
  (setq res '())

  (foreach l (_anchos-disponibles-prioridad)
    (setq col (_resolver-columna-exacta altura-total l))
    (if col
      (setq res (append res (list col)))
    )
  )

  (_ordenar-columnas-por-prioridad res)
)

(defun _columnas-candidatas-exacto-o-exceso (altura-total / res l col)
  (setq res '())

  (foreach l (_anchos-disponibles-prioridad)
    (setq col (_resolver-columna-exacta altura-total l))
    (if (null col)
      (setq col (_resolver-columna-con-exceso altura-total l))
    )
    (if col
      (setq res (append res (list col)))
    )
  )

  (_ordenar-columnas-por-prioridad res)
)

(defun _contar-piezas-giradas-usos (usos / n u)
  (setq n 0)
  (foreach u usos
    (if (= (_uso-pieza-giro u) "SI")
      (setq n (1+ n))
    )
  )
  n
)

(defun _contar-piezas-usos (usos)
  (length usos)
)

(defun _columna-mejor-p (a b / usosA usosB girA girB numA numB longA longB)
  (cond
    ((null a) nil)
    ((null b) T)
    (T
      (setq usosA (_columna-piezas a))
      (setq usosB (_columna-piezas b))

      (setq girA (_contar-piezas-giradas-usos usosA))
      (setq girB (_contar-piezas-giradas-usos usosB))

      (cond
        ((< girA girB) T)
        ((> girA girB) nil)
        (T
          (setq numA (_contar-piezas-usos usosA))
          (setq numB (_contar-piezas-usos usosB))

          (cond
            ((< numA numB) T)
            ((> numA numB) nil)
            (T
              (setq longA (_columna-longitud a))
              (setq longB (_columna-longitud b))
              (> longA longB)
            )
          )
        )
      )
    )
  )
)

(defun _ordenar-columnas-por-prioridad (lista)
  (vl-sort lista '_columna-mejor-p)
)

(defun _columna-contar-perfiles (col / n u)
  (setq n 0)
  (foreach u (_columna-piezas col)
    (if (_es-perfil-p u)
      (setq n (1+ n))
    )
  )
  n
)

(defun _contar-perfiles-columnas (cols / n col)
  (setq n 0)
  (foreach col cols
    (setq n (+ n (_columna-contar-perfiles col)))
  )
  n
)

(defun _resolver-longitud-con-columnas-idx-limitado
  (resto columnas idx maxPerfiles perfilesUsados / col ancho maxCant cant sub res cols cantPerfiles)

  (cond
    ((equal resto 0.0 1e-8) '())
    ((or (< resto 0.0) (>= idx (length columnas))) nil)
    ((and (_medida-acaba-en-5-p resto)
          (>= perfilesUsados maxPerfiles))
      nil
    )
    (T
      (setq col (nth idx columnas))
      (setq ancho (_columna-longitud col))

      (if (or (null col) (null ancho) (<= ancho 0))
        (_resolver-longitud-con-columnas-idx-limitado
          resto columnas (1+ idx) maxPerfiles perfilesUsados
        )
        (progn
          (setq maxCant (fix (/ resto ancho)))
          (setq cant maxCant)
          (setq res nil)

          (while (and (>= cant 0) (null res))
            (setq cols (_repetir-columna col cant))
            (setq cantPerfiles
              (+ perfilesUsados (_contar-perfiles-columnas cols))
            )

            (if (<= cantPerfiles maxPerfiles)
              (progn
                (setq sub
                  (_resolver-longitud-con-columnas-idx-limitado
                    (- resto (* cant ancho))
                    columnas
                    (1+ idx)
                    maxPerfiles
                    cantPerfiles
                  )
                )

                (if (or
                      (and (= cant 0) sub)
                      (and (> cant 0)
                           (or sub (equal (- resto (* cant ancho)) 0.0 1e-8))))
                  (setq res (append cols sub))
                )
              )
            )

            (setq cant (1- cant))
          )

          res
        )
      )
    )
  )
)

(defun _resolver-longitud-con-columnas-idx (resto columnas idx / maxPerfiles res)
  ;; Misma regla global: primero 0 gruesos, si termina en 5 se permite 1.
  ;; Solo se permite 2 o mas si no hay ninguna alternativa.
  (if (_medida-acaba-en-5-p resto)
    (setq maxPerfiles 1)
    (setq maxPerfiles 0)
  )

  (setq res nil)

  (while (and (null res) (<= maxPerfiles 20))
    (setq res
      (_resolver-longitud-con-columnas-idx-limitado
        resto
        columnas
        idx
        maxPerfiles
        0
      )
    )
    (setq maxPerfiles (1+ maxPerfiles))
  )

  res
)

(defun _resolver-panyo (longitud altura-total / base300 resto solBase solResto columnasBase columnasResto)
  (setq solBase nil)
  (setq solResto nil)

  (if (>= altura-total 300)
    (progn
      (setq columnasBase (_columnas-candidatas-exactas 300))
      (setq solBase
        (_resolver-longitud-con-columnas-idx longitud columnasBase 0)
      )

      (setq resto (- altura-total 300))

      (if (and solBase (> resto 0))
        (progn
          (setq columnasResto (_columnas-candidatas-exacto-o-exceso resto))
          (setq solResto
            (_resolver-longitud-con-columnas-idx longitud columnasResto 0)
          )

          (if solResto
            (_hacer-solucion-panyo-columnas
              longitud
              altura-total
              (append solBase solResto)
            )
            nil
          )
        )
        (if solBase
          (_hacer-solucion-panyo-columnas longitud altura-total solBase)
          nil
        )
      )
    )
    (progn
      (setq columnasResto (_columnas-candidatas-exacto-o-exceso altura-total))
      (setq solResto
        (_resolver-longitud-con-columnas-idx longitud columnasResto 0)
      )

      (if solResto
        (_hacer-solucion-panyo-columnas longitud altura-total solResto)
        nil
      )
    )
  )
)

; =========================================================
; DESPIECE GENERAL
; =========================================================

(defun _pieza-despiece (pieza cant origen muro extremo cara)
  (list
    (cons "DESC"    (_cat-codigo pieza))
    (cons "ID"      (_cat-id pieza))
    (cons "CANT"    cant)
    (cons "ORIGEN"  origen)
    (cons "MURO"    muro)
    (cons "EXTREMO" extremo)
    (cons "CARA"    cara)
  )
)

(defun _despiece-desc (item)    (cdr (assoc "DESC" item)))
(defun _despiece-id (item)      (cdr (assoc "ID" item)))
(defun _despiece-cant (item)    (cdr (assoc "CANT" item)))
(defun _despiece-origen (item)  (cdr (assoc "ORIGEN" item)))
(defun _despiece-muro (item)    (cdr (assoc "MURO" item)))
(defun _despiece-extremo (item) (cdr (assoc "EXTREMO" item)))
(defun _despiece-cara (item)    (cdr (assoc "CARA" item)))

(defun _uso-a-item-despiece (uso muro cara / pieza)
  (setq pieza (_uso-pieza-pieza uso))
  (_pieza-despiece pieza 1 "RECTO" (_muro-id muro) "-" cara)
)

; =========================================================
; CONSOLIDACION
; =========================================================

(defun _sumar-item-despiece (item resumen / clave reg nuevaCant)
  (setq clave (_despiece-id item))
  (setq reg (assoc clave resumen))

  (if reg
    (progn
      (setq nuevaCant (+ (_despiece-cant item) (cdr reg)))
      (subst (cons clave nuevaCant) reg resumen)
    )
    (append resumen (list (cons clave (_despiece-cant item))))
  )
)

(defun _consolidar-despiece (items / resumen item)
  (setq resumen '())
  (foreach item items
    (setq resumen (_sumar-item-despiece item resumen))
  )
  resumen
)

(defun _consolidar-items-por-id (items / resumen item clave reg nuevaCant)
  (setq resumen '())

  (foreach item items
    (setq clave (_despiece-id item))
    (setq reg (assoc clave resumen))

    (if reg
      (progn
        (setq nuevaCant (+ (_despiece-cant item) (cdr reg)))
        (setq resumen (subst (cons clave nuevaCant) reg resumen))
      )
      (setq resumen (append resumen (list (cons clave (_despiece-cant item)))))
    )
  )

  resumen
)

; =========================================================
; UTILIDADES DESPIECE
; =========================================================

(defun _filtrar-items-de-muro (items muro / res item)
  (setq res '())
  (foreach item items
    (if (= (_despiece-muro item) muro)
      (setq res (append res (list item)))
    )
  )
  res
)

(defun _filtrar-items-por-origen (items origen / res item)
  (setq res '())
  (foreach item items
    (if (= (_despiece-origen item) origen)
      (setq res (append res (list item)))
    )
  )
  res
)

(defun _altura-panel-muro (muro / h)
  (setq h (_altura-media-muro muro))
  (cond
    ((and h (<= h 150.0)) 150)
    ((and h (<= h 300.0)) 300)
    (T nil)
  )
)

(defun _paneles-catalogo-por-altura (altura / res item)
  (setq res '())
  (foreach item (_catalogo-paneles)
    (if (and (_cat-alto item) (= (_cat-alto item) altura))
      (setq res (append res (list item)))
    )
  )
  res
)

(defun _ancho-compensacion-esquina (muro)
  (+ (nth 7 muro) 20.0)
)

(defun _ordenar-paneles-por-prioridad (lista / p sin20 con20)
  (setq sin20 '())
  (setq con20 '())

  (foreach p lista
    (if (and p (_cat-ancho p))
      (if (= (_cat-ancho p) 20)
        (setq con20 (append con20 (list p)))
        (setq sin20 (append sin20 (list p)))
      )
    )
  )

  (setq sin20
    (vl-sort sin20 '(lambda (a b) (> (_cat-ancho a) (_cat-ancho b))))
  )

  (setq con20
    (vl-sort con20 '(lambda (a b) (> (_cat-ancho a) (_cat-ancho b))))
  )

  (append sin20 con20)
)

(defun _grueso-por-altura (altura)
  (cond
    ((= altura 300) (_buscar-pieza-por-id "023"))
    ((= altura 150) (_buscar-pieza-por-id "024"))
    (T nil)
  )
)

(defun _contar-ancho-en-lista (lista ancho / n p)
  (setq n 0)
  (foreach p lista
    (if (= (_cat-ancho p) ancho)
      (setq n (1+ n))
    )
  )
  n
)

(defun _sumar-anchos-piezas (lista / s p)
  (setq s 0)
  (foreach p lista
    (setq s (+ s (_cat-ancho p)))
  )
  s
)

(defun _solucion-mejor-p (a b / a20 b20 asum bsum)
  (cond
    ((null a) nil)
    ((null b) T)
    (T
      (setq a20 (_contar-ancho-en-lista a 20))
      (setq b20 (_contar-ancho-en-lista b 20))

      (cond
        ((< a20 b20) T)
        ((> a20 b20) nil)
        ((< (length a) (length b)) T)
        ((> (length a) (length b)) nil)
        (T
          (setq asum (_sumar-anchos-piezas a))
          (setq bsum (_sumar-anchos-piezas b))
          (> asum bsum)
        )
      )
    )
  )
)

(defun _longitud-base-cara-muro (muro res lista cara / d a b)
  (setq d
    (if (_res-tiene-ajuste-oblicuo-p res lista)
      (_muro-offset-linea muro)
      (cdr (assoc "GEOM" res))
    )
  )

  (if d
    (progn
      (if (= cara "BASE")
        (progn
          (setq a (nth 0 d))
          (setq b (nth 1 d))
        )
        (progn
          (setq a (nth 2 d))
          (setq b (nth 3 d))
        )
      )
      (distance a b)
    )
    (nth 5 muro)
  )
)

(defun _cruce-otro-muro-extremo (aj lista / cruce idOtro muroOtro)
  (setq cruce (_ajuste-extremo-cruce-otro aj))

  (if cruce
    cruce
    (progn
      (setq idOtro (_ajuste-extremo-muro-id aj))
      (setq muroOtro (_buscar-muro-por-id idOtro lista))
      (if muroOtro
        (nth 7 muroOtro)
        0.0
      )
    )
  )
)

(defun _descuento-extremo-por-cara (aj lista cara / cruceOtro tipoCara)
  (if (null aj)
    0.0
    (progn
      (setq cruceOtro (_cruce-otro-muro-extremo aj lista))

      (setq tipoCara
        (cond
          ((= cara "BASE")    (_ajuste-extremo-base aj))
          ((= cara "OPUESTA") (_ajuste-extremo-opuesta aj))
          (T nil)
        )
      )

      (cond
        ((and
           (_ajuste-oblicuo-p aj lista)
           (member tipoCara '("INTERIOR" "EXTERIOR"))
         )
          20.0
        )
        ((= tipoCara "INTERIOR") 20.0)
        ((= tipoCara "EXTERIOR") (+ cruceOtro 20.0))
        (T 0.0)
      )
    )
  )
)
(defun _pre-recorte-recto-por-cara (aj lista cara / tipoCara)
  (if (null aj)
    0.0
    (progn
      (setq tipoCara
        (cond
          ((= cara "BASE")    (_ajuste-extremo-base aj))
          ((= cara "OPUESTA") (_ajuste-extremo-opuesta aj))
          (T nil)
        )
      )

      ;; Si la cara es INTERIOR, la linea base recta se recorta por el espesor del otro muro.
      ;; Luego se descuenta solo el angulo de 20.
      ;; Si es EXTERIOR, no pre-recortamos; el descuento ya sera espesor+20.
      (cond
        ((= tipoCara "INTERIOR")
          (_cruce-otro-muro-extremo aj lista)
        )
        (T 0.0)
      )
    )
  )
)
(defun _linea-base-recta-cara (muro res lista cara / d a b ini fin preIni preFin u)
  ;; Parte de la geometria simple del muro, no de GEOM ajustado exterior.
  (setq d (_muro-offset-linea muro))

  (if d
    (progn
      (if (= cara "BASE")
        (progn
          (setq a (nth 0 d))
          (setq b (nth 1 d))
        )
        (progn
          (setq a (nth 2 d))
          (setq b (nth 3 d))
        )
      )

      (setq ini (cdr (assoc "INICIO" res)))
      (setq fin (cdr (assoc "FINAL"  res)))

      (setq preIni (_pre-recorte-recto-por-cara ini lista cara))
      (setq preFin (_pre-recorte-recto-por-cara fin lista cara))

      (setq u (_vec-unit (_vec-sub b a)))

      (setq a (_vec-add a (_vec-scale u preIni)))
      (setq b (_vec-add b (_vec-scale u (- preFin))))

      (list a b)
    )
    nil
  )
)
(defun _descuento-extremo-recto (aj)
  (if aj
    20.0
    0.0
  )
)
(defun _es-uso-pieza-p (x)
  (and
    (listp x)
    (listp (car x))
    (assoc "PIEZA" x)
  )
)

(defun _piezas-a-items-despiece (piezas origen muro extremo cara / res p pieza)
  (setq res '())

  (foreach p piezas
    (setq pieza
      (if (_es-uso-pieza-p p)
        (_uso-pieza-pieza p)
        p
      )
    )

    (if pieza
      (setq res
        (append res
          (list (_pieza-despiece pieza 1 origen muro extremo cara))
        )
      )
    )
  )

  res
)

(defun _buscar-panel-por-ancho-y-altura (ancho altura / item res)
  (setq res nil)
  (foreach item (_catalogo-paneles)
    (if (and
          (_cat-ancho item)
          (_cat-alto item)
          (= (_cat-ancho item) ancho)
          (= (_cat-alto item) altura)
        )
      (setq res item)
    )
  )
  res
)

; =========================================================
; DESPIECE DE TRAMOS RECTOS
; =========================================================

(defun _panel-a-item-despiece (pieza muro cara)
  (_pieza-despiece pieza 1 "RECTO" (_muro-id muro) "-" cara)
)
(defun _generar-items-paneles-cara (muro res lista cara / altura longitudUtil longitudModular sol bandas usosBanda items u)
  (setq items '())
  (setq altura (_altura-real-muro muro))

  (if altura
    (progn
      (setq longitudUtil (_longitud-util-cara-muro muro res lista cara))
      (setq longitudModular (_longitud-modular-encofrado longitudUtil))

      (if (> longitudModular 0.0)
        (progn
          ; usar el resolvedor bueno del pao
          (setq sol (_resolver-panyo-reglas longitudModular altura))

          (if sol
            (progn
              (_stock-reservar-usos (_stock-usos-solucion-panyo sol))
              (setq bandas (_sol-panyo-bandas sol))

              (foreach b bandas
                (setq usosBanda (_banda-piezas b))

                (foreach u usosBanda
                  (setq items
                    (append items
                      (list (_uso-a-item-despiece u muro cara))
                    )
                  )
                )
              )
            )
            (prompt
              (strcat
                "\nERROR: no se pudo resolver el tramo recto del Muro "
                (itoa (_muro-id muro))
                " | Cara: " cara
                " | Longitud modular: " (rtos longitudModular 2 2)
                " | Madera: " (rtos (_longitud-madera-encofrado longitudUtil) 2 2)
                " | Altura real: " (rtos altura 2 2)
              )
            )
          )
        )
      )
    )
  )

  items
)

(defun _generar-piezas-rectas-muro (muro lista / res aj caras)
  (setq res '())
  (setq aj (_ajustar-muro-por-extremos-v2 muro lista))
  (setq caras (nth 8 muro))

  (if (member caras '(1 2))
    (setq res
      (append res
        (_generar-items-paneles-cara muro aj lista "BASE")
      )
    )
  )

  (if (= caras 2)
    (setq res
      (append res
        (_generar-items-paneles-cara muro aj lista "OPUESTA")
      )
    )
  )

  res
)

(defun _generar-piezas-rectas (lista / res muro)
  (setq res '())

  (foreach muro lista
    (setq res
      (append res
        (_generar-piezas-rectas-muro muro lista)
      )
    )
  )

  res
)

(defun _espesor-otro-muro-extremo (aj lista / idOtro muroOtro)
  (if aj
    (progn
      (setq idOtro (_ajuste-extremo-muro-id aj))
      (setq muroOtro (_buscar-muro-por-id idOtro lista))
      (if muroOtro
        (nth 7 muroOtro)
        0.0
      )
    )
    0.0
  )
)

(defun _longitud-util-cara-muro (muro res lista cara / lenBase ini fin descIni descFin)
  (setq lenBase (_longitud-base-cara-muro muro res lista cara))

  (setq ini (cdr (assoc "INICIO" res)))
  (setq fin (cdr (assoc "FINAL"  res)))

  (setq descIni (_descuento-extremo-por-cara ini lista cara))
  (setq descFin (_descuento-extremo-por-cara fin lista cara))

  (- lenBase descIni descFin)
)

; =========================================================
; COLOCACION DE TRAMOS RECTOS
; =========================================================
(defun _generar-colocaciones-cara-recta (muro res lista cara / altura
                                              linea p0 p1 ang
                                              sol bandas longUtil longModular
                                              madera extremoMadera sOrigen
                                              zBase bIdx b usosBanda
                                              sAcum sBaseLong consumoHoriz
                                              z0 z1 uso pieza bloque
                                              longUso pIni pFin giro col resCols
                                              bandaEsHorizontal bandaAnteriorHorizontal)

  (setq resCols '())
  (setq altura (_altura-real-muro muro))

  (if altura
    (progn
      (setq linea (_linea-cara-ajustada muro res lista cara))

      (if linea
        (progn
          (setq p0 (nth 0 linea))
          (setq p1 (nth 1 linea))
          (setq ang (angle p0 p1))

          (setq longUtil (_longitud-util-cara-muro muro res lista cara))
          (setq longModular (_longitud-modular-encofrado longUtil))
          (setq madera (_longitud-madera-encofrado longUtil))
          (setq extremoMadera (_extremo-madera-pano res))
          (setq sOrigen
            (if (and (> madera 0.0) (= extremoMadera "INICIO"))
              madera
              0.0
            )
          )
          (if (> longModular 0.0)
            (setq sol (_resolver-panyo-reglas longModular altura))
            (setq sol nil)
          )

          (if sol
            (progn
              (_stock-reservar-usos (_stock-usos-solucion-panyo sol))
              (setq bandas (_sol-panyo-bandas sol))
              (setq zBase 0.0)
              (setq bIdx 0)
              (setq sBaseLong sOrigen)
              (setq consumoHoriz 0.0)
              (setq bandaAnteriorHorizontal nil)

              (foreach b bandas
                (setq usosBanda (_banda-piezas b))

                (setq bandaEsHorizontal nil)
                (if usosBanda
                  (if (= (_uso-pieza-giro (car usosBanda)) "SI")
                    (setq bandaEsHorizontal T)
                  )
                )

                ;; Si venimos de bandas horizontales y ahora entra una vertical:
                ;; esa vertical es RESTO LATERAL, no va encima.
                ;; Por eso avanzamos en longitud lo consumido por las horizontales.
                (if (and bandaAnteriorHorizontal (not bandaEsHorizontal))
                  (progn
                    (setq sBaseLong (+ sBaseLong consumoHoriz))
                    (setq consumoHoriz 0.0)

                    ;; Si el pao total es mayor de 300, este resto vertical
                    ;; pertenece a la franja superior.
                    (if (> altura 300.0)
                      (setq zBase (- altura (_banda-altura b)))
                      (setq zBase 0.0)
                    )
                  )
                )

                (setq z0 zBase)
                (setq z1 (+ zBase (_banda-altura b)))
                (setq sAcum sBaseLong)

                (foreach uso usosBanda
                  (setq pieza (_uso-pieza-pieza uso))
                  (setq longUso (_uso-pieza-long uso))
                  (setq giro (_uso-pieza-giro uso))
                  (setq bloque (_bloque-de-pieza-segun-giro pieza giro))

                  (setq pIni (_punto-en-linea-por-distancia p0 p1 sAcum))
                  (setq pFin (_punto-en-linea-por-distancia p0 p1 (+ sAcum longUso)))

                  (setq col
		  (append
		    (_hacer-colocacion-pieza
		      pieza
		      muro
		      cara
		      bIdx
		      sAcum
		      (+ sAcum longUso)
		      z0
		      z1
		      pIni
		      pFin
		      ang
		      giro
		      bloque
		    )
		    (list
		      (cons
		        "ORIGEN_BANDA"
		        (if (and bandaAnteriorHorizontal (not bandaEsHorizontal))
		          "RESTO_LATERAL"
		          "NORMAL"
		        )
		      )
		    )
		  )
		)

                  (setq resCols (append resCols (list col)))

                  ;; IMPORTANTE:
                  ;; Avanzamos SIEMPRE dentro de la banda.
                  ;; As 450 = 300 + 150 no se solapa en S=0.
                  (setq sAcum (+ sAcum longUso))
                )

                (if bandaEsHorizontal
                  (progn
                    ;; La banda horizontal consume en planta el ancho total colocado.
                    ;; Usamos sAcum - sBaseLong, no solo el mximo,
                    ;; para que 300+150 consuma 450.
                    (setq consumoHoriz (- sAcum sBaseLong))

                    ;; Las horizontales seguidas se apilan en Z.
                    (setq zBase z1)
                  )
                  (progn
                    ;; Banda vertical normal.
                    (setq zBase z1)

                    ;; Tras una banda vertical, la siguiente vuelve al inicio.
                    (setq sBaseLong sOrigen)
                  )
                )

                (setq bandaAnteriorHorizontal bandaEsHorizontal)
                (setq bIdx (1+ bIdx))
              )
            )
          )
        )
      )
    )
  )

  resCols
)
(defun _generar-colocaciones-compensacion-muro-extremo (muro lista extremo / 
                                                          res aj
                                                          caraComp
                                                          anchoComp anchoModular maderaComp
                                                          linea arranque
                                                          ptBase angDir
                                                          tramos tramo
                                                          piezas pieza bloque
                                                          zBase z0 z1
                                                          bIdx
                                                          sAcum longUso maderaInicio
                                                          sIniDibujo sFinDibujo
                                                          pIni pFin
                                                          col resCols)
  (setq resCols '())

  (setq res (_ajustar-muro-por-extremos-v2 muro lista))
  (setq aj (cdr (assoc extremo res)))

  (if aj
    (progn
      ; La compensacion va en la cara contraria a la interior
      (setq caraComp (_cara-compensacion-en-extremo muro aj))

      ; Ancho = espesor del otro muro + 20
      (setq anchoComp (_ancho-compensacion-en-extremo aj lista muro))
      (setq anchoModular (_longitud-modular-encofrado anchoComp))
      (setq maderaComp (_longitud-madera-encofrado anchoComp))

      (if (and caraComp anchoComp (> anchoModular 0.0))
        (progn
          ; En oblicuas la linea ajustada puede quedar invertida si el muro es corto.
          ; Para compensacion se arranca desde la cara original del muro.
          (setq linea (_linea-referencia-compensacion muro res lista caraComp aj))

          (if linea
            (progn
              ; En oblicuas arranca desde el vertice interior proyectado a la cara exterior.
              (setq arranque (_datos-arranque-compensacion-segun-ajuste muro lista extremo caraComp aj linea))

              (if (_arranque-valido-p arranque)
                (progn
                  (setq ptBase (cdr (assoc "PT" arranque)))
                  (setq angDir (cdr (assoc "ANG" arranque)))

                  (setq tramos (_descomponer-altura-esquina (_altura-media-muro muro)))

                  (setq zBase 0.0)
                  (setq bIdx 0)

                  (foreach tramo tramos
                    (setq piezas (_resolver-compensacion-solo-paneles anchoModular tramo))

                    (if piezas
                      (progn
                        (_stock-reservar-piezas piezas)
                        (setq z0 zBase)
                        (setq z1 (+ zBase tramo))
                        (setq sAcum 0.0)
                        (setq maderaInicio
                          (if (and (> maderaComp 1e-6) (> (length piezas) 1))
                            (_cat-ancho (car piezas))
                            0.0
                          )
                        )

                        (foreach pieza piezas
                          (setq bloque (_bloque-de-pieza pieza))
                          (setq longUso (_cat-ancho pieza))

                          (setq sIniDibujo
                            (if (and (> maderaComp 1e-6) (>= sAcum maderaInicio))
                              (+ sAcum maderaComp)
                              sAcum
                            )
                          )
                          (setq sFinDibujo
                            (if (and (> maderaComp 1e-6) (> (+ sAcum longUso) maderaInicio))
                              (+ sAcum longUso maderaComp)
                              (+ sAcum longUso)
                            )
                          )

                          (setq pIni (_punto-por-angulo-dist ptBase angDir sIniDibujo))
                          (setq pFin (_punto-por-angulo-dist ptBase angDir sFinDibujo))

                          (setq col
                            (append
                              (_hacer-colocacion-pieza
                                pieza
                                muro
                                caraComp
                                bIdx
                                sAcum
                                (+ sAcum longUso)
                                z0
                                z1
                                pIni
                                pFin
                                angDir
                                "NO"
                                bloque
                              )
			    (list
			      (cons "EXTREMO" extremo)
			      (cons "ORIGEN" "COMPENSACION")
			      (cons "OBLICUA" (if (_ajuste-oblicuo-p aj lista) "SI" "NO"))
			    )
			  )
			)

                          (setq resCols (append resCols (list col)))
                          (setq sAcum (+ sAcum longUso))
                        )
                      )
                      (prompt
                        (strcat
                          "\nERROR COMPENSACION: no se pudo resolver ancho "
                          (rtos anchoComp 2 2)
                          " | Modular "
                          (rtos anchoModular 2 2)
                          " | Madera "
                          (rtos maderaComp 2 2)
                          " para tramo "
                          (rtos tramo 2 2)
                          " en muro "
                          (itoa (_muro-id muro))
                          " extremo "
                          extremo
                        )
                      )
                    )

                    (setq zBase (+ zBase tramo))
                    (setq bIdx (1+ bIdx))
                  )
                )
                (prompt
                  (strcat
                    "\nERROR ARRANQUE COMP: Muro "
                    (itoa (_muro-id muro))
                    " "
                    extremo
                  )
                )
              )
            )
          )
        )
      )
    )
  )

  resCols
)
(defun _generar-colocaciones-compensaciones (lista / res esquinas e
                                                   m1 m2 ext1 ext2)
  (setq res '())
  (setq esquinas (_recolectar-esquinas-unicas lista))

  (foreach e esquinas
    (setq m1   (_buscar-muro-por-id (cdr (assoc "MURO1" e)) lista))
    (setq m2   (_buscar-muro-por-id (cdr (assoc "MURO2" e)) lista))
    (setq ext1 (cdr (assoc "EXT1" e)))
    (setq ext2 (cdr (assoc "EXT2" e)))

    (if m1
      (setq res
        (append res
          (_generar-colocaciones-compensacion-muro-extremo m1 lista ext1)
        )
      )
    )

    (if m2
      (setq res
        (append res
          (_generar-colocaciones-compensacion-muro-extremo m2 lista ext2)
        )
      )
    )
  )

  res
)

(defun _generar-colocaciones-madera-compensacion-muro-extremo (muro lista extremo /
                                                                 res aj caraComp
                                                                 anchoComp anchoModular maderaComp
                                                                 linea arranque ptBase angDir
                                                                 tramos tramo zBase z0 z1
                                                                 piezas maderaInicio
                                                                 pIni pFin col resCols)
  (setq resCols '())

  (setq res (_ajustar-muro-por-extremos-v2 muro lista))
  (setq aj (if res (cdr (assoc extremo res)) nil))

  (if aj
    (progn
      (setq caraComp (_cara-compensacion-en-extremo muro aj))
      (setq anchoComp (_ancho-compensacion-en-extremo aj lista muro))
      (setq anchoModular (_longitud-modular-encofrado anchoComp))
      (setq maderaComp (_longitud-madera-encofrado anchoComp))

      (if (and
            caraComp
            anchoComp
            (> maderaComp 1e-6)
          )
        (progn
          (setq linea (_linea-referencia-compensacion muro res lista caraComp aj))
          (setq arranque
            (if linea
              (_datos-arranque-compensacion-segun-ajuste muro lista extremo caraComp aj linea)
              nil
            )
          )

          (if (_arranque-valido-p arranque)
            (progn
              (setq ptBase (cdr (assoc "PT" arranque)))
              (setq angDir (cdr (assoc "ANG" arranque)))
              (setq tramos (_descomponer-altura-esquina (_altura-media-muro muro)))
              (setq zBase 0.0)

              (foreach tramo tramos
                (setq z0 zBase)
                (setq z1 (+ zBase tramo))
                (setq piezas (_resolver-compensacion-solo-paneles anchoModular tramo))
                (setq maderaInicio
                  (if (and piezas (> (length piezas) 1))
                    (_cat-ancho (car piezas))
                    0.0
                  )
                )
                (setq pIni (_punto-por-angulo-dist ptBase angDir maderaInicio))
                (setq pFin (_punto-por-angulo-dist ptBase angDir (+ maderaInicio maderaComp)))

                (setq col
                  (append
                    (_hacer-colocacion-madera-z
                      muro
                      caraComp
                      extremo
                      maderaInicio
                      (+ maderaInicio maderaComp)
                      pIni
                      pFin
                      z0
                      z1
                    )
                    (list
                      (cons "OBLICUA" (if (_ajuste-oblicuo-p aj lista) "SI" "NO"))
                      (cons "ORIGEN_COMPENSACION" "SI")
                    )
                  )
                )

                (setq resCols (append resCols (list col)))
                (setq zBase (+ zBase tramo))
              )
            )
          )
        )
      )
    )
  )

  resCols
)

(defun _generar-colocaciones-madera-compensaciones (lista / res esquinas e m1 m2 ext1 ext2)
  (setq res '())
  (setq esquinas (_recolectar-esquinas-unicas lista))

  (foreach e esquinas
    (setq m1   (_buscar-muro-por-id (cdr (assoc "MURO1" e)) lista))
    (setq m2   (_buscar-muro-por-id (cdr (assoc "MURO2" e)) lista))
    (setq ext1 (cdr (assoc "EXT1" e)))
    (setq ext2 (cdr (assoc "EXT2" e)))

    (if m1
      (setq res
        (append res
          (_generar-colocaciones-madera-compensacion-muro-extremo m1 lista ext1)
        )
      )
    )

    (if m2
      (setq res
        (append res
          (_generar-colocaciones-madera-compensacion-muro-extremo m2 lista ext2)
        )
      )
    )
  )

  res
)

(defun _generar-colocaciones-rectas-muro (muro lista / res aj caras)
  (setq res '())
  (setq aj (_ajustar-muro-por-extremos-v2 muro lista))
  (setq caras (nth 8 muro))

  (if (member caras '(1 2))
    (setq res
      (append res
        (_generar-colocaciones-cara-recta muro aj lista "BASE")
      )
    )
  )

  (if (= caras 2)
    (setq res
      (append res
        (_generar-colocaciones-cara-recta muro aj lista "OPUESTA")
      )
    )
  )

  res
)

(defun _generar-colocaciones-rectas (lista / res muro)
  (setq res '())
  (foreach muro lista
    (setq res
      (append res
        (_generar-colocaciones-rectas-muro muro lista)
      )
    )
  )
  res
)

; =========================================================
; TRAMOS DE MADERA PARA MEDIDAS NO MODULARES
; No forman parte del despiece, stock ni tornilleria.
; =========================================================

(defun _hacer-colocacion-madera-z (muro cara extremo s0 s1 p0 p1 z0 z1)
  (list
    (cons "PIEZA" nil)
    (cons "MURO" (_muro-id muro))
    (cons "CARA" cara)
    (cons "BANDA" 0)
    (cons "S0" s0)
    (cons "S1" s1)
    (cons "Z0" z0)
    (cons "Z1" z1)
    (cons "P0" p0)
    (cons "P1" p1)
    (cons "ANG" (angle p0 p1))
    (cons "GIRO_USO" "NO")
    (cons "BLOQUE" nil)
    (cons "ORIGEN" "MADERA")
    (cons "ORIGEN_BANDA" "MADERA")
    (cons "EXTREMO" extremo)
  )
)

(defun _hacer-colocacion-madera (muro cara extremo s0 s1 p0 p1 altura)
  (_hacer-colocacion-madera-z muro cara extremo s0 s1 p0 p1 0.0 altura)
)

(defun _generar-colocacion-madera-cara (muro res lista cara /
                                         linea p0 p1 longitud modular resto altura
                                         extremo s0 s1)
  (setq linea (_linea-cara-ajustada muro res lista cara))
  (setq altura (_altura-real-muro muro))

  (if (and linea altura)
    (progn
      (setq p0 (nth 0 linea))
      (setq p1 (nth 1 linea))
      (setq longitud (_longitud-util-cara-muro muro res lista cara))
      (setq modular (_longitud-modular-encofrado longitud))
      (setq resto (_longitud-madera-encofrado longitud))
      (setq extremo (_extremo-madera-pano res))

      (if (> resto 0.0)
        (progn
          (if (= extremo "INICIO")
            (progn
              (setq s0 0.0)
              (setq s1 resto)
            )
            (progn
              (setq s0 modular)
              (setq s1 longitud)
            )
          )

          (_hacer-colocacion-madera
            muro
            cara
            extremo
            s0
            s1
            (_punto-en-linea-por-distancia p0 p1 s0)
            (_punto-en-linea-por-distancia p0 p1 s1)
            altura
          )
        )
        nil
      )
    )
    nil
  )
)

(defun _generar-colocaciones-madera (lista / res muro aj caras col)
  (setq res '())

  (foreach muro lista
    (setq aj (_ajustar-muro-por-extremos-v2 muro lista))
    (setq caras (nth 8 muro))

    (if (member caras '(1 2))
      (progn
        (setq col (_generar-colocacion-madera-cara muro aj lista "BASE"))
        (if col (setq res (append res (list col))))
      )
    )

    (if (= caras 2)
      (progn
        (setq col (_generar-colocacion-madera-cara muro aj lista "OPUESTA"))
        (if col (setq res (append res (list col))))
      )
    )
  )

  res
)

(defun _imprimir-resumen-madera (lista / cols c)
  (setq cols
    (append
      (_generar-colocaciones-madera lista)
      (_generar-colocaciones-madera-compensaciones lista)
    )
  )

  (if cols
    (progn
      (prompt "\n\n--- MADERA FUERA DE DESPIECE ---")
      (foreach c cols
        (prompt
          (strcat
            "\nMuro " (itoa (_col-muro c))
            " | Cara " (_col-cara c)
            " | Madera: " (rtos (_longitud-uso-colocacion c) 2 2) " cm"
            " | Origen: "
            (if (= (cdr (assoc "ORIGEN_COMPENSACION" c)) "SI")
              "COMPENSACION"
              "PANO"
            )
            " | Posicion: " (_fmt-str (_col-extremo c)) " del pano"
          )
        )
      )
    )
  )
)

(defun c:LISTAR_MADERA (/ lista)
  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (_imprimir-resumen-madera lista)
    )
  )
  (princ)
)
; =========================================================
; PIEZAS DE ESQUINA
; =========================================================

(defun _buscar-pieza-esquina-por-tipo-y-altura (tipo altura / alturaRef)
  (setq alturaRef
    (cond
      ((equal altura 150.0 1e-8) 150)
      ((equal altura 300.0 1e-8) 300)
      (T nil)
    )
  )

  (cond
    ((and (= tipo "INTERIOR") (= alturaRef 300))
      (_buscar-pieza-por-id "015")
    )
    ((and (= tipo "INTERIOR") (= alturaRef 150))
      (_buscar-pieza-por-id "017")
    )
    ((and (= tipo "EXTERIOR") (= alturaRef 300))
      (_buscar-pieza-por-id "019")
    )
    ((and (= tipo "EXTERIOR") (= alturaRef 150))
      (_buscar-pieza-por-id "021")
    )
    (T nil)
  )
)

(defun _pieza-esquina-por-ajuste (muro aj / tipo altura)
  (setq tipo (_tipo-pieza-esquina-desde-ajuste aj))
  (setq altura (_altura-media-muro muro))

  (if (and tipo altura)
    (_buscar-pieza-esquina-por-tipo-y-altura tipo altura)
    nil
  )
)

(defun _esquina-tiene-tipo-p (e tipo / tb to)
  (setq tb (cdr (assoc "BASE_TIPO" e)))
  (setq to (cdr (assoc "OPUESTA_TIPO" e)))
  (or (= tb tipo) (= to tipo))
)

(defun _hacer-registro-esquina-despiece (e lista / m1id m2id ext1 ext2 m1 m2 alt1
                                           piezaInt piezaExt anchoComp1 anchoComp2
                                           piezasComp1 piezasComp2 items)
  (setq m1id (cdr (assoc "MURO1" e)))
  (setq m2id (cdr (assoc "MURO2" e)))
  (setq ext1 (cdr (assoc "EXT1" e)))
  (setq ext2 (cdr (assoc "EXT2" e)))

  (setq m1 (_buscar-muro-por-id m1id lista))
  (setq m2 (_buscar-muro-por-id m2id lista))

  (setq items '())

  (if m1
    (progn
      (setq alt1 (_altura-panel-muro m1))

      (if (_esquina-tiene-tipo-p e "INTERIOR")
        (progn
          (setq piezaInt (_buscar-pieza-esquina-por-tipo-y-altura "INTERIOR" alt1))
          (if piezaInt
            (setq items
              (append items
                (list (_pieza-despiece piezaInt 1 "ESQUINA" 0 "-" "-"))
              )
            )
          )
        )
      )

      (if (_esquina-tiene-tipo-p e "EXTERIOR")
        (progn
          (setq piezaExt (_buscar-pieza-esquina-por-tipo-y-altura "EXTERIOR" alt1))
          (if piezaExt
            (setq items
              (append items
                (list (_pieza-despiece piezaExt 1 "ESQUINA" 0 "-" "-"))
              )
            )
          )
        )
      )
    )
  )

  (if m1
    (progn
      (setq anchoComp1 (_ancho-compensacion-esquina m1))
      (setq piezasComp1 (_descomponer-ancho-modular anchoComp1 (_altura-panel-muro m1)))

      (if piezasComp1
        (setq items
          (append items
            (_piezas-a-items-despiece piezasComp1 "ESQUINA" m1id ext1 "COMP_M1")
          )
        )
        (prompt
          (strcat
            "\nERROR: no se pudo descomponer la compensacion de esquina del Muro "
            (itoa m1id)
          )
        )
      )
    )
  )

  (if m2
    (progn
      (setq anchoComp2 (_ancho-compensacion-esquina m2))
      (setq piezasComp2 (_descomponer-ancho-modular anchoComp2 (_altura-panel-muro m2)))

      (if piezasComp2
        (setq items
          (append items
            (_piezas-a-items-despiece piezasComp2 "ESQUINA" m2id ext2 "COMP_M2")
          )
        )
        (prompt
          (strcat
            "\nERROR: no se pudo descomponer la compensacion de esquina del Muro "
            (itoa m2id)
          )
        )
      )
    )
  )

  (list
    (cons "MURO1" m1id)
    (cons "EXT1"  ext1)
    (cons "MURO2" m2id)
    (cons "EXT2"  ext2)
    (cons "ITEMS" items)
  )
)

(defun _generar-registros-esquinas (lista)
  (_generar-registros-esquinas-v2 lista)
)

(defun _items-de-registros-esquinas (regs / res r items)
  (setq res '())

  (foreach r regs
    (setq items (cdr (assoc "ITEMS" r)))
    (setq res (append res items))
  )

  res
)

; =========================================================
; ESQUINAS V2 - RESOLUCION POR TRAMOS DE ALTURA
; =========================================================

(defun _altura-tramo-esquina-candidata (resto)
  (cond
    ((<= resto 150.0) 150)
    ((<= resto 300.0) 300)
    (T nil)
  )
)

(defun _descomponer-altura-esquina (altura / res resto)
  (setq res '())
  (setq resto altura)

  (while (> resto 300.0)
    (setq res (append res (list 300)))
    (setq resto (- resto 300.0))
  )

  (if (> resto 0.0)
    (progn
      (if (or (equal resto 150.0 1e-8)
              (< resto 150.0))
        (setq res (append res (list 150)))
        (setq res (append res (list 300)))
      )
    )
  )

  res
)


(defun _tipo-esquina-unica-por-cara (e cara / tipoCara)
  (setq tipoCara
    (cond
      ((= cara "BASE")    (cdr (assoc "BASE_TIPO" e)))
      ((= cara "OPUESTA") (cdr (assoc "OPUESTA_TIPO" e)))
      (T nil)
    )
  )

  (if (member tipoCara '("INTERIOR" "EXTERIOR"))
    tipoCara
    nil
  )
)

(defun _pieza-esquina-por-tipo-y-tramo (tipo tramo)
  (_buscar-pieza-esquina-por-tipo-y-altura tipo tramo)
)

(defun _uso-vertical-exacto-o-exceso-para-tramo (ancho tramo / sol)
  (setq sol (_descomponer-ancho-modular-exacto ancho tramo))
  (if (null sol)
    (setq sol (_descomponer-ancho-modular-con-exceso-altura ancho tramo))
  )
  sol
)

(defun _items-compensacion-esquina-tramo (muroId extremo cara ancho tramo / piezas anchoModular)
  (setq anchoModular (_longitud-modular-encofrado ancho))
  (setq piezas (_uso-vertical-exacto-o-exceso-para-tramo anchoModular tramo))

  (if piezas
    (_piezas-a-items-despiece piezas "ESQUINA" muroId extremo cara)
    nil
  )
)

(defun _hacer-items-angulos-esquina-tramo (e tramo / items caras tipoBase tipoOpuesta piezaBase piezaOpuesta)
  (setq items '())
  (setq caras (cdr (assoc "CARAS" e)))

  (setq tipoBase (_tipo-esquina-unica-por-cara e "BASE"))
  (setq piezaBase (_pieza-esquina-por-tipo-y-tramo tipoBase tramo))

  (if piezaBase
    (setq items
      (append items
        (list (_pieza-despiece piezaBase 1 "ESQUINA" 0 "-" "ANGULO_BASE"))
      )
    )
  )

  (if (= caras 2)
    (progn
      (setq tipoOpuesta (_tipo-esquina-unica-por-cara e "OPUESTA"))
      (setq piezaOpuesta (_pieza-esquina-por-tipo-y-tramo tipoOpuesta tramo))

      (if piezaOpuesta
        (setq items
          (append items
            (list (_pieza-despiece piezaOpuesta 1 "ESQUINA" 0 "-" "ANGULO_OPUESTA"))
          )
        )
      )
    )
  )

  items
)
(defun _hacer-items-compensacion-esquina-tramo (e lista tramo / items
                                                   m1id m2id ext1 ext2
                                                   m1 m2
                                                   anchoComp1 anchoComp2
                                                   anchoComp1Mod anchoComp2Mod
                                                   piezas1 piezas2)
  (setq items '())

  (setq m1id (cdr (assoc "MURO1" e)))
  (setq m2id (cdr (assoc "MURO2" e)))
  (setq ext1 (cdr (assoc "EXT1" e)))
  (setq ext2 (cdr (assoc "EXT2" e)))

  (setq m1 (_buscar-muro-por-id m1id lista))
  (setq m2 (_buscar-muro-por-id m2id lista))

  (if (and m1 m2)
    (progn
      (setq anchoComp1 (_ancho-compensacion-esquina-entre-muros m1 m2))
      (setq anchoComp1Mod (_longitud-modular-encofrado anchoComp1))
      (setq piezas1 (_resolver-compensacion-solo-paneles anchoComp1Mod tramo))

      (if *DEBUG-COMPENSACION*
        (prompt
          (strcat
            "\nDEBUG COMP | TRAMO=" (rtos tramo 2 2)
            " | M1=" (itoa m1id)
            " | ANCHO=" (rtos anchoComp1 2 2)
            " | NPIEZAS=" (itoa (length piezas1))
          )
        )
      )

      (if piezas1
        (setq items
          (append items
            (_piezas-a-items-despiece piezas1 "ESQUINA" m1id ext1 "COMP_M1")
          )
        )
      )

      (setq anchoComp2 (_ancho-compensacion-esquina-entre-muros m2 m1))
      (setq anchoComp2Mod (_longitud-modular-encofrado anchoComp2))
      (setq piezas2 (_resolver-compensacion-solo-paneles anchoComp2Mod tramo))

      (if *DEBUG-COMPENSACION*
        (prompt
          (strcat
            "\nDEBUG COMP | TRAMO=" (rtos tramo 2 2)
            " | M2=" (itoa m2id)
            " | ANCHO=" (rtos anchoComp2 2 2)
            " | NPIEZAS=" (itoa (length piezas2))
          )
        )
      )

      (if piezas2
        (setq items
          (append items
            (_piezas-a-items-despiece piezas2 "ESQUINA" m2id ext2 "COMP_M2")
          )
        )
      )
    )
  )

  (if *DEBUG-COMPENSACION*
    (prompt
      (strcat
        "\nDEBUG COMP TOTAL TRAMO "
        (rtos tramo 2 2)
        " = "
        (itoa (length items))
      )
    )
  )

  items
)
(defun _hacer-registro-esquina-despiece-v2 (e lista / m1id m2id ext1 ext2
                                              m1 altura tramos tramo
                                              itemsTramo itemsTotales oblicua)
  (setq m1id (cdr (assoc "MURO1" e)))
  (setq m2id (cdr (assoc "MURO2" e)))
  (setq ext1 (cdr (assoc "EXT1" e)))
  (setq ext2 (cdr (assoc "EXT2" e)))

  (setq m1 (_buscar-muro-por-id m1id lista))
  (setq itemsTotales '())
  (setq oblicua (_esquina-oblicua-p e lista))

  (if m1
    (progn
      (setq altura (_altura-media-muro m1))
      (setq tramos (_descomponer-altura-esquina altura))

      (foreach tramo tramos
        (setq itemsTramo '())

        (if (null oblicua)
          (setq itemsTramo
            (append itemsTramo
              (_hacer-items-angulos-esquina-tramo e tramo)
            )
          )
        )

        (setq itemsTramo
          (append itemsTramo
            (_hacer-items-compensacion-esquina-tramo e lista tramo)
          )
        )

        (setq itemsTotales (append itemsTotales itemsTramo))
      )
    )
  )

  (list
    (cons "MURO1" m1id)
    (cons "EXT1"  ext1)
    (cons "MURO2" m2id)
    (cons "EXT2"  ext2)
    (cons "ITEMS" itemsTotales)
  )
)

(defun _generar-registros-esquinas-v2 (lista / res esquinas e)
  (setq res '())
  (setq esquinas (_recolectar-esquinas-unicas lista))

  (foreach e esquinas
    (setq res
      (append res
        (list (_hacer-registro-esquina-despiece-v2 e lista))
      )
    )
  )

  res
)
(defun _ancho-compensacion-esquina-entre-muros (muroPropio muroOtro)
  (_compensacion-esquina-teorica muroPropio muroOtro)
)
(defun _paneles-por-altura-para-compensacion (altura / res item)
  (setq res '())
  (foreach item (_catalogo-paneles)
    (if (and (_cat-alto item) (= (_cat-alto item) altura))
      (setq res (append res (list item)))
    )
  )
  (_ordenar-paneles-por-prioridad res)
)

(defun _resolver-compensacion-paneles-idx (resto paneles idx / p ancho maxCant cant sub res candidato)
  (cond
    ((equal resto 0.0 1e-8)
      '()
    )
    ((or (< resto 0.0) (>= idx (length paneles)))
      nil
    )
    (T
      (setq p (nth idx paneles))
      (setq ancho (_cat-ancho p))

      (if (or (null p) (null ancho) (<= ancho 0))
        (_resolver-compensacion-paneles-idx resto paneles (1+ idx))
        (progn
          (setq maxCant (fix (/ resto ancho)))
          (setq cant maxCant)
          (setq res nil)

          (while (and (>= cant 0) (null res))
            (setq sub
              (_resolver-compensacion-paneles-idx
                (- resto (* cant ancho))
                paneles
                (1+ idx)
              )
            )

            (if (or
                  (and (= cant 0) sub)
                  (and (> cant 0)
                       (or sub (equal (- resto (* cant ancho)) 0.0 1e-8))))
              (progn
                (setq candidato (append (_repetir-pieza p cant) sub))
                (if (_stock-ok-piezas-p candidato)
                  (setq res candidato)
                )
              )
            )

            (setq cant (1- cant))
          )

          res
        )
      )
    )
  )
)

(defun _resolver-compensacion-solo-paneles (ancho altura / paneles piezaExacta piezas panelBase grueso anchoBase)
  (setq paneles (_paneles-por-altura-para-compensacion altura))

  ;; REGLA STOCK/COMPENSACION:
  ;; Si existe una chapa exacta para la compensacion, se prueba primero.
  ;; Ejemplo: ancho 50 -> usar 3x0,5 antes que 3x0,3 + 3x0,2.
  ;; Esto evita que una limitacion parcial se gaste antes en el pano recto.
  (setq piezaExacta (_buscar-panel-por-ancho-en-lista paneles ancho))
  (setq piezas nil)

  ;; =========================
  ;; 1 CHAPA EXACTA
  ;; =========================

  (if (and piezaExacta (_stock-ok-piezas-p (list piezaExacta)))
    (setq piezas (list piezaExacta))
  )

  ;; =========================
  ;; 2 CHAPA + GRUESO
  ;; Ejemplos:
  ;; 25 = 20 + 5
  ;; 35 = 30 + 5
  ;; 45 = 40 + 5
  ;; 55 = 50 + 5
  ;; 65 = 60 + 5
  ;; 85 = 80 + 5
  ;; 105 = 100 + 5
  ;; =========================

  (if (null piezas)
    (progn
      (setq anchoBase (- ancho 5.0))

      (setq panelBase
        (_buscar-panel-por-ancho-en-lista paneles anchoBase)
      )

      (setq grueso
        (cond
          ((= altura 150) (_buscar-pieza-por-id "024")) ; GRUESO DE 1,5M
          ((= altura 300) (_buscar-pieza-por-id "023")) ; GRUESO DE 3M
          (T nil)
        )
      )

      (if (and panelBase grueso (_stock-ok-piezas-p (list panelBase grueso)))
        (setq piezas (list panelBase grueso))
      )
    )
  )

  ;; Si no hay chapa exacta o el stock no la permite, probar excepciones/preferencias.
  (if (null piezas)
    (progn
      (setq piezas (_resolver-descomposicion-preferente-paneles ancho paneles))
      (if (and piezas (null (_stock-ok-piezas-p piezas)))
        (setq piezas nil)
      )
    )
  )

  ;; Ultimo recurso: descomposicion por varias chapas.
  (if (null piezas)
    (setq piezas (_resolver-compensacion-paneles-idx ancho paneles 0))
  )

  piezas
)

; =========================================================
; INFORMACION DE LONGITUDES UTILES PARA DEPURACION
; =========================================================

(defun _info-tramo-recto-muro (muro lista / aj caras longBase longOpuesta)
  (setq aj (_ajustar-muro-por-extremos-v2 muro lista))
  (setq caras (nth 8 muro))
  (setq longBase (_longitud-util-cara-muro muro aj lista "BASE"))
  (setq longOpuesta
    (if (= caras 2)
      (_longitud-util-cara-muro muro aj lista "OPUESTA")
      nil
    )
  )

  (list
    (cons "MURO" (_muro-id muro))
    (cons "LONG_GEOM" (nth 5 muro))
    (cons "CARAS" caras)
    (cons "LONG_BASE" longBase)
    (cons "LONG_OPUESTA" longOpuesta)
  )
)

(defun _recolectar-info-tramos-rectos (lista / res muro)
  (setq res '())

  (foreach muro lista
    (setq res
      (append res
        (list (_info-tramo-recto-muro muro lista))
      )
    )
  )

  res
)

(defun _buscar-info-tramo-por-muro (infos id / res item)
  (setq res nil)
  (foreach item infos
    (if (= (cdr (assoc "MURO" item)) id)
      (setq res item)
    )
  )
  res
)

; =========================================================
; IMPRESION
; =========================================================

(defun _id-menor-p (a b)
  (< (atoi a) (atoi b))
)

(defun _ordenar-resumen-por-id (resumen)
  (vl-sort resumen
    '(lambda (a b) (_id-menor-p (car a) (car b)))
  )
)

(defun _imprimir-resumen-consolidado (resumen / reg id cant pieza desc)
  (if resumen
    (foreach reg (_ordenar-resumen-por-id resumen)
      (setq id    (car reg))
      (setq cant  (cdr reg))
      (setq pieza (_buscar-pieza-por-id id))
      (setq desc  (if pieza (_cat-codigo pieza) id))

      (prompt
        (strcat
          "\n  "
          (itoa cant)
          "  "
          desc
        )
      )
    )
    (prompt "\n  SIN PIEZAS")
  )
)

(defun _imprimir-tramos-rectos-por-muro
  (lista infos itemsRectos /
   muro id info longGeom caras
   longBase longOpuesta
   modularBase modularOpuesta
   maderaBase maderaOpuesta
   itemsMuro resumen)
  (prompt "\n===== TRAMOS RECTOS =====")

  (foreach muro lista
    (setq id   (_muro-id muro))
    (setq info (_buscar-info-tramo-por-muro infos id))

    (setq longGeom    (cdr (assoc "LONG_GEOM" info)))
    (setq caras       (cdr (assoc "CARAS" info)))
    (setq longBase    (cdr (assoc "LONG_BASE" info)))
    (setq longOpuesta (cdr (assoc "LONG_OPUESTA" info)))
    (setq modularBase (_longitud-modular-encofrado longBase))
    (setq maderaBase  (_longitud-madera-encofrado longBase))
    (setq modularOpuesta
      (if longOpuesta (_longitud-modular-encofrado longOpuesta) nil)
    )
    (setq maderaOpuesta
      (if longOpuesta (_longitud-madera-encofrado longOpuesta) nil)
    )

    (setq itemsMuro (_filtrar-items-de-muro itemsRectos id))
    (setq resumen (_consolidar-items-por-id itemsMuro))

    (prompt
      (strcat
        "\n\nTRAMO RECTO MURO "
        (itoa id)
        " | LONG. GEOM: " (rtos longGeom 2 2)
        " | ALTURA: " (rtos (_altura-media-muro muro) 2 2)
        " | ESP: " (rtos (nth 7 muro) 2 2)
        " | CARAS: " (itoa caras)
        " | BASE UTIL: " (rtos longBase 2 2)
        " = SISTEMA " (rtos modularBase 2 2)
        " + MADERA " (rtos maderaBase 2 2)
        " | PROLONG. UTIL: " (if longOpuesta (rtos longOpuesta 2 2) "-")
        (if longOpuesta
          (strcat
            " = SISTEMA " (rtos modularOpuesta 2 2)
            " + MADERA " (rtos maderaOpuesta 2 2)
          )
          ""
        )
      )
    )

    (_imprimir-resumen-consolidado resumen)
  )
)

(defun _imprimir-esquinas (regs / r m1 e1 m2 e2 items resumen)
  (prompt "\n\n===== ESQUINAS =====")

  (if regs
    (foreach r regs
      (setq m1    (cdr (assoc "MURO1" r)))
      (setq e1    (cdr (assoc "EXT1" r)))
      (setq m2    (cdr (assoc "MURO2" r)))
      (setq e2    (cdr (assoc "EXT2" r)))
      (setq items (cdr (assoc "ITEMS" r)))
      (setq resumen (_consolidar-items-por-id items))

      (prompt
        (strcat
          "\n\nESQUINA: Muro "
          (itoa m1) " " e1
          " <-> Muro "
          (itoa m2) " " e2
        )
      )

      (_imprimir-resumen-consolidado resumen)
    )
    (prompt "\nNo se detectaron esquinas.")
  )
)

(defun _imprimir-despiece-consolidado-global (items / resumen)
  (prompt "\n===== DESPIECE CONSOLIDADO GLOBAL =====")
  (setq resumen (_consolidar-despiece items))
  (_imprimir-resumen-consolidado resumen)
)

(defun _sumar-uso-a-resumen (uso resumen / pieza id reg)
  (setq pieza (_uso-pieza-pieza uso))
  (setq id (_cat-id pieza))
  (setq reg (assoc id resumen))

  (if reg
    (subst (cons id (1+ (cdr reg))) reg resumen)
    (append resumen (list (cons id 1)))
  )
)

(defun _consolidar-usos (usos / resumen u)
  (setq resumen '())

  (foreach u usos
    (setq resumen (_sumar-uso-a-resumen u resumen))
  )

  resumen
)

(defun _imprimir-resumen-usos (resumen / reg id cant pieza)
  (foreach reg resumen
    (setq id (car reg))
    (setq cant (cdr reg))
    (setq pieza (_buscar-pieza-por-id id))

    (if pieza
      (prompt
        (strcat
          "\n  "
          (itoa cant)
          "  "
          (_cat-codigo pieza)
        )
      )
    )
  )
)

; =========================================================
; COMANDOS
; =========================================================



(defun c:DEPURAR_DESPIECE (/ lista infosRectos itemsRectos regsEsquinas)
  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (setq infosRectos  (_recolectar-info-tramos-rectos lista))
      (setq itemsRectos  (_generar-piezas-rectas lista))
      (setq regsEsquinas (_generar-registros-esquinas lista))
      (_imprimir-tramos-rectos-por-muro lista infosRectos itemsRectos)
      (_imprimir-esquinas regsEsquinas)
      (_imprimir-resumen-madera lista)
    )
  )
  (princ)
)

(defun _muro-ficticio-probar-panyo ()
  ;; muro ficticio para calcular entre caras con espesor por defecto
  ;; caras = 2 para que calcule union entre caras
  (list 1 "-" nil '(0 0 0) '(0 0 0) 0.0 0.0 *def-espesor* 2 "IZQUIERDA" 0 0 0 0)
)



(defun c:PROBAR_PANYO (/ long longModular madera alt sol bandas b usosBanda pieza resumenBanda usosTotales resumenTotal)

  (setq long (getint "\nLongitud: "))
  (setq alt  (getint "\nAltura total: "))

  (if (and long alt)
    (progn
      (setq longModular (_longitud-modular-encofrado long))
      (setq madera (_longitud-madera-encofrado long))
      (setq sol
        (if (> longModular 0.0)
          (_resolver-panyo-reglas longModular alt)
          nil
        )
      )

      (if sol
        (progn
          (prompt
            (strcat
              "\nSOLUCION PARA " (itoa long) " x " (itoa alt)
              " | SISTEMA: " (rtos longModular 2 2)
              " | MADERA FUERA DE DESPIECE: " (rtos madera 2 2)
            )
          )

          (setq bandas (_sol-panyo-bandas sol))
          (setq usosTotales '())

          (foreach b bandas
            (setq usosBanda (_banda-piezas b))

            (prompt
              (strcat
                "\n--- BANDA ALTURA: "
                (itoa (_banda-altura b))
                " | MODO: "
                (_banda-modo b)
              )
            )

            (foreach u usosBanda
              (setq pieza (_uso-pieza-pieza u))
              (prompt
                (strcat
                  "\nID: " (_cat-id pieza)
                  " | " (_cat-codigo pieza)
                  " | LONG: " (itoa (_uso-pieza-long u))
                  " | ALT: "  (itoa (_uso-pieza-alt u))
                  " | GIRO: " (_uso-pieza-giro u)
                )
              )
            )

            (setq resumenBanda (_consolidar-usos usosBanda))
            (prompt "\nRESUMEN BANDA:")
            (_imprimir-resumen-usos resumenBanda)

            (setq usosTotales (append usosTotales usosBanda))
          )

          (setq resumenTotal (_consolidar-usos usosTotales))
          (prompt "\n\n===== TOTAL PAO =====")
          (_imprimir-resumen-usos resumenTotal)
        )
        (prompt "\nNo se encontro solucion.")
      )
    )
  )

  (princ)
)
(defun c:LISTAR_COLOCACIONES_RECTAS (/ lista cols c pieza)
  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (setq cols (_generar-colocaciones-rectas lista))

      (prompt "\n===== COLOCACIONES RECTAS =====")

      (foreach c cols
        (setq pieza (_col-pieza c))
        (prompt
	  (strcat
	    "\nMURO: " (itoa (_col-muro c))
	    " | CARA: " (_col-cara c)
	    " | BANDA: " (itoa (_col-banda c))
	    " | PIEZA: " (_cat-id pieza) " - " (_cat-codigo pieza)
	    " | S0: " (rtos (_col-s0 c) 2 2)
	    " | S1: " (rtos (_col-s1 c) 2 2)
	    " | Z0: " (rtos (_col-z0 c) 2 2)
	    " | Z1: " (rtos (_col-z1 c) 2 2)
	    " | GIRO_USO: " (_fmt-str (_col-giro-uso c))
	    " | ANG: " (_fmt-ang-grados (_col-ang c))
	    " | BLOQUE: " (_fmt-str (_col-bloque c))
	  )
	)
      )
    )
  )
  (princ)
)




(defun _insertar-bloque-simple (nombre pt ang / e)
  (if (and nombre (tblsearch "BLOCK" nombre))
    (entmakex
      (list
        (cons 0 "INSERT")
        (cons 2 nombre)
        (cons 10 pt)
        (cons 41 1.0)
        (cons 42 1.0)
        (cons 43 1.0)
        (cons 50 ang)
      )
    )
    nil
  )
)

(defun _poner-color-entidad (ent color / datos)
  (if (and ent (entget ent))
    (progn
      (setq datos (entget ent))
      (if (assoc 62 datos)
        (setq datos (subst (cons 62 color) (assoc 62 datos) datos))
        (setq datos (append datos (list (cons 62 color))))
      )
      (entmod datos)
      (entupd ent)
    )
  )
  ent
)

(defun _dibujar-tramo-madera (c / p0 p1 corr n off q0 q1 perfil region sol)
  ;; Prisma 3D que ocupa el mismo plano y espesor que una chapa.
  ;; La madera no se convierte en pieza de catalogo.
  (setq corr (_correccion-espesor-colocacion c))
  (setq p0 (_vec-add (_col-p0 c) corr))
  (setq p1 (_vec-add (_col-p1 c) corr))
  (setq n (_normal-tramo-colocacion c))
  ;; Los bloques parten del punto de insercion y desarrollan su espesor
  ;; hacia la derecha de su eje local.
  (setq off (_vec-scale n (- *def-espesor-chapa*)))
  (setq q0 (_vec-add p0 off))
  (setq q1 (_vec-add p1 off))

  (setq perfil (_crear-lwpoly-cerrada-2d (list p0 p1 q1 q0)))
  (setq region (_crear-region-desde-entidad perfil))

  (if (and perfil (entget perfil))
    (entdel perfil)
  )

  (setq sol
    (if region
      (_extruir-region region (_altura-uso-colocacion c))
      nil
    )
  )

  (if (and region (entget region))
    (entdel region)
  )

  (if sol
    (progn
      (_mover-entidad-z sol (_col-z0 c))
      (_poner-color-entidad sol 30)
      T
    )
    nil
  )
)

(defun _dibujar-colocaciones-madera (cols / c ok nok)
  (setq ok 0)
  (setq nok 0)

  (foreach c cols
    (if (_dibujar-tramo-madera c)
      (setq ok (1+ ok))
      (setq nok (1+ nok))
    )
  )

  (list ok nok)
)

(defun _normal-hacia-vector (u objetivo / n n2)
  (setq n (list (- (cadr u)) (car u) 0.0))
  (setq n2 (_vec-scale n -1.0))
  (if (>= (_2d-dot n objetivo) (_2d-dot n2 objetivo))
    n
    n2
  )
)

(defun _crear-prisma-rectangular-eje (p0 p1 off z0 z1 color / q0 q1 perfil region sol altura)
  (setq altura (- z1 z0))

  (if (> altura 1e-8)
    (progn
      (setq q0 (_vec-add p0 off))
      (setq q1 (_vec-add p1 off))
      (setq perfil (_crear-lwpoly-cerrada-2d (list p0 p1 q1 q0)))
      (setq region (_crear-region-desde-entidad perfil))

      (if (and perfil (entget perfil))
        (entdel perfil)
      )

      (setq sol
        (if region
          (_extruir-region region altura)
          nil
        )
      )

      (if (and region (entget region))
        (entdel region)
      )

      (if sol
        (progn
          (_mover-entidad-z sol z0)
          (if color (_poner-color-entidad sol color))
          sol
        )
        nil
      )
    )
    nil
  )
)

(defun _ancho-ala-angulo-interior (e tramo / pieza)
  (setq pieza
    (cond
      ((= (cdr (assoc "BASE_TIPO" e)) "INTERIOR")
        (_pieza-angular-esquina-por-cara-y-tramo e "BASE" tramo)
      )
      ((= (cdr (assoc "OPUESTA_TIPO" e)) "INTERIOR")
        (_pieza-angular-esquina-por-cara-y-tramo e "OPUESTA" tramo)
      )
      (T nil)
    )
  )

  (if pieza
    (_cat-ancho pieza)
    *def-ala-angulo-interior*
  )
)

(defun _dibujar-angulo-interior-oblicuo-tramo (e lista z0 z1 tramo /
                                                 m1 m2 ext1 ext2 pt u1 u2 ancho esp
                                                 p1 p2 n1 n2 s1 s2 sol)
  (setq m1 (_buscar-muro-por-id (cdr (assoc "MURO1" e)) lista))
  (setq m2 (_buscar-muro-por-id (cdr (assoc "MURO2" e)) lista))
  (setq ext1 (cdr (assoc "EXT1" e)))
  (setq ext2 (cdr (assoc "EXT2" e)))

  (if (and m1 m2 ext1 ext2 (_cara-interior-esquina e))
    (progn
      (setq pt (_punto-interior-esquina m1 lista ext1 e))
      (setq u1 (_dir-extremo-muro m1 ext1))
      (setq u2 (_dir-extremo-muro m2 ext2))
      (setq ancho (_ancho-ala-angulo-interior e tramo))
      (setq esp *def-espesor-chapa*)

      (if (and pt u1 u2 ancho esp)
        (progn
          (setq p1 (_vec-add pt (_vec-scale u1 ancho)))
          (setq p2 (_vec-add pt (_vec-scale u2 ancho)))
          (setq n1 (_normal-hacia-vector u1 u2))
          (setq n2 (_normal-hacia-vector u2 u1))

          (setq s1 (_crear-prisma-rectangular-eje pt p1 (_vec-scale n1 esp) z0 z1 nil))
          (setq s2 (_crear-prisma-rectangular-eje pt p2 (_vec-scale n2 esp) z0 z1 nil))
          (setq sol (_unionar-solidos (list s1 s2)))
          (if (null sol)
            (setq sol
              (cond
                ((and s1 (entget s1)) s1)
                ((and s2 (entget s2)) s2)
                (T nil)
              )
            )
          )

          (if sol
            sol
            nil
          )
        )
        nil
      )
    )
    nil
  )
)

(defun _dibujar-angulos-interiores-oblicuos (lista / ok nok esquinas e m1 tramos tramo z0 z1 sol)
  (setq ok 0)
  (setq nok 0)
  (setq esquinas (_recolectar-esquinas-unicas lista))

  (foreach e esquinas
    (if (and (_esquina-oblicua-p e lista) (_cara-interior-esquina e))
      (progn
        (setq m1 (_buscar-muro-por-id (cdr (assoc "MURO1" e)) lista))
        (setq tramos (if m1 (_descomponer-altura-esquina (_altura-media-muro m1)) nil))
        (setq z0 0.0)

        (if tramos
          (foreach tramo tramos
            (setq z1 (+ z0 tramo))
            (setq sol (_dibujar-angulo-interior-oblicuo-tramo e lista z0 z1 tramo))
            (if sol
              (setq ok (1+ ok))
              (setq nok (1+ nok))
            )
            (setq z0 z1)
          )
          (setq nok (1+ nok))
        )
      )
    )
  )

  (list ok nok)
)

(defun c:DIBUJAR_ANGULOS_INTERIORES_OBLICUOS (/ lista r)
  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (setq r (_dibujar-angulos-interiores-oblicuos lista))
      (prompt
        (strcat
          "\nAngulos interiores oblicuos dibujados: " (itoa (car r))
          " | Fallidos: " (itoa (cadr r))
        )
      )
    )
  )
  (princ)
)

(defun _correccion-oblicua-compensacion (c / lista muro extremo e vInt n corr0 corr1 p0 centro0 centro1 espChapa)
  (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
  (setq muro (_buscar-muro-por-id (_col-muro c) lista))
  (setq extremo (_col-extremo c))
  (setq e
    (if (and muro extremo)
      (_esquina-por-muro-extremo-cualquiera lista (_muro-id muro) extremo)
      nil
    )
  )
  (setq vInt
    (if (and muro e extremo)
      (_punto-interior-esquina muro lista extremo e)
      nil
    )
  )

  (if vInt
    (progn
      (setq n (_normal-tramo-colocacion c))
      (setq p0 (_col-p0 c))
      (setq espChapa *def-espesor-chapa*)
      (setq corr0 '(0.0 0.0 0.0))
      (setq corr1 (_vec-scale n espChapa))

      ;; Los bloques desarrollan el espesor hacia la derecha de su eje local.
      ;; Probamos las dos aristas posibles y dejamos fuera la que aleja mas el centro del vertice interior.
      (setq centro0 (_vec-add p0 (_vec-scale n (- (/ espChapa 2.0)))))
      (setq centro1 (_vec-add (_vec-add p0 corr1) (_vec-scale n (- (/ espChapa 2.0)))))

      (if (>= (distance centro0 vInt) (distance centro1 vInt))
        corr0
        corr1
      )
    )
    nil
  )
)

(defun _correccion-espesor-colocacion (c / cara n origen extremo muro ref corrOblicua)
  (setq cara    (_col-cara c))
  (setq n       (_normal-tramo-colocacion c))
  (setq origen  (_col-origen c))
  (setq extremo (_col-extremo c))
  (setq muro    (_buscar-muro-por-id (_col-muro c) *MUROS*))
  (setq ref     (if muro (nth 9 muro) nil))

  (cond
    ((and
       (or (= origen "COMPENSACION") (= origen "MADERA"))
       (= (_col-oblicua c) "SI")
     )
      (setq corrOblicua (_correccion-oblicua-compensacion c))
      (if corrOblicua corrOblicua '(0.0 0.0 0.0))
    )

    ; --------------------------------------------------
    ; RECTOS
    ; --------------------------------------------------
    ((/= origen "COMPENSACION")
      (cond
        ((= ref "DERECHA")
          (cond
            ((= cara "BASE")
              (_vec-scale n *def-espesor-chapa*)
            )
            ((= cara "OPUESTA")
              '(0.0 0.0 0.0)
            )
            (T
              '(0.0 0.0 0.0)
            )
          )
        )

        ((= ref "IZQUIERDA")
          (cond
            ((= cara "BASE")
              '(0.0 0.0 0.0)
            )
            ((= cara "OPUESTA")
              (_vec-scale n *def-espesor-chapa*)
            )
            (T
              '(0.0 0.0 0.0)
            )
          )
        )

        (T
          '(0.0 0.0 0.0)
        )
      )
    )

    ; --------------------------------------------------
    ; COMPENSACIONES
    ; --------------------------------------------------
    ((= origen "COMPENSACION")
      (cond
        ((= ref "DERECHA")
          (cond
            ((or
               (and (= cara "OPUESTA") (= extremo "INICIO"))
               (and (= cara "BASE")    (= extremo "FINAL"))
             )
              (_vec-scale n *def-espesor-chapa*)
            )
            (T
              '(0.0 0.0 0.0)
            )
          )
        )

        ((= ref "IZQUIERDA")
          (cond
            ((or
               (and (= cara "BASE")    (= extremo "INICIO"))
               (and (= cara "OPUESTA") (= extremo "FINAL"))
             )
              (_vec-scale n *def-espesor-chapa*)
            )
            (T
              '(0.0 0.0 0.0)
            )
          )
        )

        (T
          '(0.0 0.0 0.0)
        )
      )
    )

    (T
      '(0.0 0.0 0.0)
    )
  )
)
(defun _angulo-insercion-colocacion (c)
  (_col-ang c)
)






(defun c:INSERTAR_BLOQUES_RECTOS_PLANTA (/ lista cols colsMadera c pt ang blk nok ok rMadera)
  (setq ok 0)
  (setq nok 0)

  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (setq cols (_generar-colocaciones-rectas lista))
      (setq colsMadera (_generar-colocaciones-madera lista))

      (foreach c cols
        (setq blk (_col-bloque c))
        (setq pt  (_punto-insercion-colocacion-3d c))
        (setq ang (_angulo-insercion-colocacion c))

        (if (_insertar-bloque-simple blk pt ang)
          (setq ok (1+ ok))
          (setq nok (1+ nok))
        )
      )

      (setq rMadera (_dibujar-colocaciones-madera colsMadera))

      (prompt
        (strcat
          "\nBloques insertados: " (itoa ok)
          " | Fallidos: " (itoa nok)
          "\nTramos de madera dibujados: " (itoa (car rMadera))
          " | Fallidos: " (itoa (cadr rMadera))
        )
      )
    )
  )
  (princ)
)
(defun _cara-interior-en-ajuste (aj)
  (cond
    ((= (_ajuste-extremo-base aj) "INTERIOR") "BASE")
    ((= (_ajuste-extremo-opuesta aj) "INTERIOR") "OPUESTA")
    (T nil)
  )
)

(defun _cara-opuesta (cara)
  (cond
    ((= cara "BASE") "OPUESTA")
    ((= cara "OPUESTA") "BASE")
    (T nil)
  )
)

(defun _cara-compensacion-en-extremo (muro aj)
  (if (= (nth 8 muro) 2)
    (_cara-opuesta (_cara-interior-en-ajuste aj))
    nil
  )
)

(defun _punto-por-angulo-dist (pt ang dist)
  (list
    (+ (car pt) (* dist (cos ang)))
    (+ (cadr pt) (* dist (sin ang)))
    (if (caddr pt) (caddr pt) 0.0)
  )
)

(defun _datos-arranque-compensacion (linea extremo / a b)
  (setq a (nth 0 linea))
  (setq b (nth 1 linea))

  (cond
    ((= extremo "FINAL")
      (list
        (cons "PT"  b)
        (cons "ANG" (angle a b))
      )
    )
    ((= extremo "INICIO")
      (list
        (cons "PT"  a)
        (cons "ANG" (angle b a))
      )
    )
    (T nil)
  )
)

(defun _ancho-compensacion-en-extremo (aj lista muro / idOtro muroOtro)
  (setq idOtro (_ajuste-extremo-muro-id aj))
  (setq muroOtro (_buscar-muro-por-id idOtro lista))

  (if muroOtro
    (_ancho-compensacion-esquina-entre-muros muro muroOtro)
    nil
  )
)



; =========================================================
; DEPURACION DE COLOCACION DE CARAS
; No modifica geometria ni insercion. Solo imprime datos.
; =========================================================

(defun _fmt-pt2d (p / pu)
  (if p
    (progn
      ; de WCS a UCS actual
      (setq pu (trans p 0 1))
      (strcat
        "("
        (rtos (car pu) 2 2)
        ", "
        (rtos (cadr pu) 2 2)
        ")"
      )
    )
    "-"
  )
)

(defun _tipo-cara-en-ajuste (aj cara)
  (if aj
    (cond
      ((= cara "BASE")    (_ajuste-extremo-base aj))
      ((= cara "OPUESTA") (_ajuste-extremo-opuesta aj))
      (T "-")
    )
    "LIBRE"
  )
)

(defun _depurar-linea-cara (muro res lista cara / d a b ini fin tipoIni tipoFin descIni descFin u a2 b2 longBase longUtil)
  (setq d (cdr (assoc "GEOM" res)))

  (if d
    (progn
      (if (= cara "BASE")
        (progn
          (setq a (nth 0 d))
          (setq b (nth 1 d))
        )
        (progn
          (setq a (nth 2 d))
          (setq b (nth 3 d))
        )
      )

      (setq ini (cdr (assoc "INICIO" res)))
      (setq fin (cdr (assoc "FINAL"  res)))

      (setq tipoIni (_tipo-cara-en-ajuste ini cara))
      (setq tipoFin (_tipo-cara-en-ajuste fin cara))

      (setq descIni (_descuento-extremo-por-cara ini lista cara))
      (setq descFin (_descuento-extremo-por-cara fin lista cara))

      (setq longBase (distance a b))

      (setq u (_vec-unit (_vec-sub b a)))
      (setq a2 (_vec-add a (_vec-scale u descIni)))
      (setq b2 (_vec-add b (_vec-scale u (- descFin))))

      (setq longUtil (distance a2 b2))

      (prompt
        (strcat
          "\n  CARA: " cara
          "\n    LINEA BASE: A=" (_fmt-pt2d a) " | B=" (_fmt-pt2d b)
          "\n    EXTREMO INICIO: " tipoIni
          " | DESC_INI=" (rtos descIni 2 2)
          "\n    EXTREMO FINAL:  " tipoFin
          " | DESC_FIN=" (rtos descFin 2 2)
          "\n    LONG_BASE=" (rtos longBase 2 2)
          " | LONG_UTIL=" (rtos longUtil 2 2)
          "\n    LINEA AJUSTADA: A'=" (_fmt-pt2d a2) " | B'=" (_fmt-pt2d b2)
        )
      )
    )
  )
)

(defun c:DEPURAR_COLOCACION_CARAS (/ lista muro res caras)
  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (prompt "\n===== DEPURACION COLOCACION CARAS =====")

      (foreach muro lista
        (setq res (_ajustar-muro-por-extremos-v2 muro lista))
        (setq caras (nth 8 muro))

        (prompt
          (strcat
            "\n\nMURO " (itoa (_muro-id muro))
            " | LONG_GEOM=" (rtos (nth 5 muro) 2 2)
            " | ESP=" (rtos (nth 7 muro) 2 2)
            " | REF=" (nth 9 muro)
            " | CARAS=" (itoa caras)
          )
        )

        (_depurar-linea-cara muro res lista "BASE")

        (if (= caras 2)
          (_depurar-linea-cara muro res lista "OPUESTA")
        )
      )
    )
  )
  (princ)
)

(defun c:COORD_PUNTO (/ p pu txt offset)

  (setq p (getpoint "\nSelecciona punto: "))

  ; Convertimos a UCS para que coincida con lo que ves
  (setq pu (trans p 0 1))

  ; Texto con coordenadas
  (setq txt
    (strcat
      (rtos (car pu) 2 2)
      ", "
      (rtos (cadr pu) 2 2)
    )
  )

  ; Desplazamiento para que no se monte encima del punto
  (setq offset (list (+ (car p) 50.0) (+ (cadr p) 50.0)))

  ; Crear punto
  (entmake
    (list
      '(0 . "POINT")
      (cons 10 p)
    )
  )

  ; Crear texto
  (entmake
    (list
      '(0 . "TEXT")
      (cons 10 offset)
      (cons 40 50.0) ; altura texto (ajstala)
      (cons 1 txt)
    )
  )

  (princ)
)
; =========================================================
; DEPURACION DE COMPENSACIONES EN PLANTA
; Imprime tambien el punto de insercion real y el angulo final
; =========================================================

(defun c:DEPURAR_COMPENSACIONES_PLANTA (/ lista esquinas e
                                          m1 m2 ext1 ext2
                                          cols1 cols2
                                          c pieza ptIns angIns)

  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (setq esquinas (_recolectar-esquinas-unicas lista))

      (prompt "\n===== DEPURACION COMPENSACIONES PLANTA =====")

      (if esquinas
        (foreach e esquinas
          (setq m1   (_buscar-muro-por-id (cdr (assoc "MURO1" e)) lista))
          (setq m2   (_buscar-muro-por-id (cdr (assoc "MURO2" e)) lista))
          (setq ext1 (cdr (assoc "EXT1" e)))
          (setq ext2 (cdr (assoc "EXT2" e)))

          (prompt
            (strcat
              "\n=============================="
              "\nESQUINA: Muro " (itoa (cdr (assoc "MURO1" e))) " " ext1
              " <-> Muro " (itoa (cdr (assoc "MURO2" e))) " " ext2
              "\n=============================="
            )
          )

          ; -------------------------------------------------
          ; COMPENSACIONES DEL MURO 1
          ; -------------------------------------------------
          (if m1
            (progn
              (setq cols1 (_generar-colocaciones-compensacion-muro-extremo m1 lista ext1))

              (if cols1
                (progn
                  (prompt
                    (strcat
                      "\n--- MURO " (itoa (_muro-id m1))
                      " | EXTREMO " ext1
                      " ---"
                    )
                  )

                  (foreach c cols1
                    (setq pieza (_col-pieza c))
                    (setq ptIns (_punto-insercion-colocacion-3d c))
                    (setq angIns (_angulo-insercion-colocacion c))

                    (prompt
			  (strcat
			    "\n  CARA: " (_col-cara c)
			    " | BANDA: " (itoa (_col-banda c))
			    " | PIEZA: " (_cat-codigo pieza)
			    " | BLOQUE: " (_fmt-str (_col-bloque c))
			    " | EXTREMO=" (_fmt-str (_col-extremo c))
			    " | ORIGEN=" (_fmt-str (_col-origen c))

			    "\n    S0=" (rtos (_col-s0 c) 2 2)
			    " | S1=" (rtos (_col-s1 c) 2 2)
			    " | Z0=" (rtos (_col-z0 c) 2 2)
			    " | Z1=" (rtos (_col-z1 c) 2 2)

			    "\n    P0=" (_fmt-pt2d (_col-p0 c))
			    " | P1=" (_fmt-pt2d (_col-p1 c))

			    "\n    PTO INSERCION=" (_fmt-pt2d ptIns)

			    "\n    ANG(rad)=" (rtos angIns 2 4)
			    " | ANG(grados)=" (_fmt-ang-grados angIns)
			  )
			)
                  )
                )
                (prompt "\n  SIN COMPENSACIONES")
              )
            )
          )

          ; -------------------------------------------------
          ; COMPENSACIONES DEL MURO 2
          ; -------------------------------------------------
          (if m2
            (progn
              (setq cols2 (_generar-colocaciones-compensacion-muro-extremo m2 lista ext2))

              (if cols2
                (progn
                  (prompt
                    (strcat
                      "\n--- MURO " (itoa (_muro-id m2))
                      " | EXTREMO " ext2
                      " ---"
                    )
                  )

                  (foreach c cols2
                    (setq pieza (_col-pieza c))
                    (setq ptIns (_punto-insercion-colocacion-3d c))
                    (setq angIns (_angulo-insercion-colocacion c))

                    (prompt
			  (strcat
			    "\n  CARA: " (_col-cara c)
			    " | BANDA: " (itoa (_col-banda c))
			    " | PIEZA: " (_cat-codigo pieza)
			    " | BLOQUE: " (_fmt-str (_col-bloque c))
			    " | EXTREMO=" (_fmt-str (_col-extremo c))
			    " | ORIGEN=" (_fmt-str (_col-origen c))

			    "\n    S0=" (rtos (_col-s0 c) 2 2)
			    " | S1=" (rtos (_col-s1 c) 2 2)
			    " | Z0=" (rtos (_col-z0 c) 2 2)
			    " | Z1=" (rtos (_col-z1 c) 2 2)

			    "\n    P0=" (_fmt-pt2d (_col-p0 c))
			    " | P1=" (_fmt-pt2d (_col-p1 c))

			    "\n    PTO INSERCION=" (_fmt-pt2d ptIns)

			    "\n    ANG(rad)=" (rtos angIns 2 4)
			    " | ANG(grados)=" (_fmt-ang-grados angIns)
			  )
			)
                  )
                )
                (prompt "\n  SIN COMPENSACIONES")
              )
            )
          )
        )
        (prompt "\nNo se detectaron esquinas unicas.")
      )
    )
  )
  (princ)
)
(defun c:DEPURAR_RECTOS_PLANTA (/ lista cols c pieza ptIns angBase angIns)
  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (setq cols (_generar-colocaciones-rectas lista))

      (prompt "\n===== DEPURACION RECTOS PLANTA =====")

      (foreach c cols
        (setq pieza   (_col-pieza c))
        (setq ptIns   (_punto-insercion-colocacion-3d c))
        (setq angBase (_col-ang c))
        (setq angIns  (_angulo-insercion-colocacion c))

        (prompt
	  (strcat
	    "\nMURO: " (itoa (_col-muro c))
	    " | CARA: " (_col-cara c)
	    " | BANDA: " (itoa (_col-banda c))
	    " | PIEZA: " (_cat-codigo pieza)
	    " | LONG_USO: " (rtos (_longitud-uso-colocacion c) 2 2)
	    " | ALT_USO: " (rtos (_altura-uso-colocacion c) 2 2)
	    " | Z0=" (rtos (_col-z0 c) 2 2)
	    " | Z1=" (rtos (_col-z1 c) 2 2)
	    " | GIRO_USO: " (_fmt-str (_col-giro-uso c))
	    "\n  BLOQUE: " (_fmt-str (_col-bloque c))
	    "\n  P0=" (_fmt-pt2d (_col-p0 c))
	    " | P1=" (_fmt-pt2d (_col-p1 c))
	    "\n  PTO INS=" (_fmt-pt2d ptIns)
	    "\n  ANG BASE(rad)=" (rtos angBase 2 4)
	    " | ANG BASE(grados)=" (_fmt-ang-grados angBase)
	    "\n  ANG INS(rad)=" (rtos angIns 2 4)
	    " | ANG INS(grados)=" (_fmt-ang-grados angIns)
	  )
	)
      )
    )
  )
  (princ)
)
(defun c:DEPURAR_TIPO_ESQUINAS_GEOM (/ lista esquinas e)
  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (setq esquinas (_recolectar-esquinas-unicas lista))

      (prompt "\n===== TIPO GEOMETRICO DE ESQUINAS =====")

      (foreach e esquinas
        (prompt
          (strcat
            "\nMuro " (itoa (cdr (assoc "MURO1" e)))
            " " (cdr (assoc "EXT1" e))
            " <-> Muro " (itoa (cdr (assoc "MURO2" e)))
            " " (cdr (assoc "EXT2" e))
            " | GIRO_CANONICO: " (cdr (assoc "GIRO" e))
            " | TIPO_GEOM: " (if (cdr (assoc "TIPO_GEOM" e)) (cdr (assoc "TIPO_GEOM" e)) "-")
          )
        )
      )
    )
  )
  (princ)
)

; =========================================================
; TORNILLERIA / UNIONES
; =========================================================

(setq *ID-MORDAZA-CORTA* "025")
(setq *ID-MORDAZA-LARGA* "026")
(setq *ID-MORDAZA-FIJA*  "027")
(setq *ID-DAVIDAD-2M*    "029")
(setq *ID-DAVIDAD-1M*    "030")
(setq *ID-TORN-PLETINA*  "032")
(setq *ID-TUERCA-GRANDE* "034")
(setq *ID-TUERCA-PEQ*    "035")

(defun _item-tornilleria (id cant origen / pieza)
  (setq pieza (_buscar-pieza-por-id id))
  (if pieza
    (_pieza-despiece pieza cant origen 0 "-" "-")
    nil
  )
)

(defun _add-torn (items id cant origen / it pieza)
  (if (> cant 0)
    (progn
      (setq pieza (_buscar-pieza-por-id id))

      (if *DEBUG-TORNILLERIA*
        (prompt
          (strcat
            "\nDEBUG TORN | "
            origen
            " | ID=" id
            " | "
            (if pieza (_cat-codigo pieza) "-")
            " | CANT="
            (itoa cant)
          )
        )
      )

      (setq it (_item-tornilleria id cant origen))
      (if it
        (append items (list it))
        items
      )
    )
    items
  )
)

(defun _panel-p (pieza)
  (= (_cat-tipo pieza) "PANEL")
)

(defun _perfil-p (pieza)
  (= (_cat-tipo pieza) "PERFIL")
)

(defun _esquina-interior-p (pieza)
  (and
    (= (_cat-tipo pieza) "ESQUINA")
    (wcmatch (strcase (_cat-codigo pieza)) "*INTERIOR*")
  )
)

(defun _esquina-exterior-p (pieza)
  (and
    (= (_cat-tipo pieza) "ESQUINA")
    (wcmatch (strcase (_cat-codigo pieza)) "*EXTERIOR*")
  )
)

(defun _id-davidad-por-muro (muro)
  (if (> (nth 7 muro) 60.0)
    *ID-DAVIDAD-2M*
    *ID-DAVIDAD-1M*
  )
)

(defun _add-davidad-tuercas-muro (items muro dav grandes pequenas origen / idDav)
  (setq idDav (_id-davidad-por-muro muro))
  (setq items (_add-torn items idDav dav origen))
  (setq items (_add-torn items *ID-TUERCA-GRANDE* grandes origen))
  (setq items (_add-torn items *ID-TUERCA-PEQ* pequenas origen))
  items
)

(defun _cant-por-altura-150-300 (altura)
  (cond
    ((>= altura 300.0) 3)
    ((>= altura 150.0) 2)
    (T 1)
  )
)

(defun _cant-por-longitud-150-300 (longitud)
  (cond
    ((>= longitud 300.0) 3)
    ((>= longitud 150.0) 2)
    (T 1)
  )
)
(defun _col-z1-contacto-mordaza (c / pieza)
  (setq pieza (_col-pieza c))
  (if (= (_col-giro-uso c) "NO")
    (+ (_col-z0 c) (_cat-alto pieza))
    (_col-z1 c)
  )
)
(defun _chapa-tumbada-20-30-p (col / pieza ancho)
  (setq pieza (_col-pieza col))
  (setq ancho (_cat-ancho pieza))

  (and
    (= (_col-giro-uso col) "SI")
    (member ancho '(20 30))
  )
)

(defun _cols-rectas-muro-cara-banda (cols muro cara banda / res c)
  (setq res '())
  (foreach c cols
    (if (and
          (= (_col-muro c) muro)
          (= (_col-cara c) cara)
          (= (_col-banda c) banda)
        )
      (setq res (append res (list c)))
    )
  )
  (vl-sort res '(lambda (a b) (< (_col-s0 a) (_col-s0 b))))
)

(defun _cols-rectas-muro-cara (cols muro cara / res c)
  (setq res '())
  (foreach c cols
    (if (and
          (= (_col-muro c) muro)
          (= (_col-cara c) cara)
        )
      (setq res (append res (list c)))
    )
  )
  (vl-sort res
    '(lambda (a b)
       (if (= (_col-banda a) (_col-banda b))
         (< (_col-s0 a) (_col-s0 b))
         (< (_col-banda a) (_col-banda b))
       )
     )
  )
)

(defun _bandas-de-cols (cols / res c b)
  (setq res '())
  (foreach c cols
    (setq b (_col-banda c))
    (if (not (member b res))
      (setq res (append res (list b)))
    )
  )
  (vl-sort res '<)
)

; =========================================================
; MISMA CARA - MISMA BANDA
; =========================================================

(defun _panel-ancho-20-30-p (col / pieza ancho)
  (setq pieza (_col-pieza col))
  (setq ancho (_cat-ancho pieza))
  (member ancho '(20 30))
)
(defun _usar-mordaza-corta-20-30-p (a b contexto)
  (and
    (or
      (_panel-ancho-20-30-p a)
      (_panel-ancho-20-30-p b)
    )
    (or
      (= contexto "INICIO_MURO")
      (= contexto "FINAL_MURO")
      (= contexto "ANGULO_INTERIOR")
    )
  )
)
(defun _contexto-union-cols (a b colsCara / sMin sMax tol)

  (setq tol 1e-6)

  (setq sMin
    (apply 'min (mapcar '_col-s0 colsCara))
  )

  (setq sMax
    (apply 'max (mapcar '_col-s1 colsCara))
  )

  (cond

    ;; inicio muro
    ((or
       (equal (_col-s0 a) sMin tol)
       (equal (_col-s0 b) sMin tol)
     )
     "INICIO_MURO"
    )

    ;; final muro
    ((or
       (equal (_col-s1 a) sMax tol)
       (equal (_col-s1 b) sMax tol)
     )
     "FINAL_MURO"
    )

    ;; interior normal
    (T
      "INTERIOR"
    )
  )
)
(defun _panel-estrecho-lado-largo-contacto-p (col)
  (and
    (_panel-ancho-20-30-p col)
    (= (_col-giro-uso col) "NO")
  )
)

(defun _mordaza-misma-banda-panel-panel (items colA colB / piezaA piezaB cant id estrechaA estrechaB altFis)
  (setq piezaA (_col-pieza colA))
  (setq piezaB (_col-pieza colB))
  (setq estrechaA (_panel-ancho-20-30-p colA))
  (setq estrechaB (_panel-ancho-20-30-p colB))

  (if (and (_panel-p piezaA) (_panel-p piezaB))
    (progn
      ;; REGLA GENERAL CORRECTA 09-05:
      ;; Se recorren TODAS las parejas consecutivas de una misma banda.
      ;; No se sustituye una union por otra: 100+40 y 40+30 se cuentan ambas.
      ;;
      ; Tipo de mordaza:
      ;; - union normal chapa + chapa en la misma banda -> MORDAZA DE UNION FIJA
      ;; - la regla especial de MORDAZA CORTA para 20/30 se aplica aparte:
      ;;   inicio/final de muro o union con ANGULO INTERIOR.
      ;;
      ;; Cantidad:
      ;; - vertical/vertical: por altura real de contacto (300=3, 150=2, resto=1)
      ;; - si alguna va tumbada: una union real de contacto = 1 mordaza
      ;;   porque ya se estara recorriendo cada tramo/banda real por separado.
      (setq id *ID-MORDAZA-FIJA*)

      (if (or (= (_col-giro-uso colA) "SI")
              (= (_col-giro-uso colB) "SI"))
        (setq cant 1)
        (progn
          (setq altFis
            (min
              (_altura-fisica-colocacion colA)
              (_altura-fisica-colocacion colB)
            )
          )
          (setq cant (_cant-por-altura-150-300 altFis))
        )
      )

      (if (> cant 0)
        (setq items (_add-torn items id cant "MORDAZA_MISMA_BANDA"))
      )
    )
  )

  items
)

(defun _mordaza-misma-banda-panel-grueso-panel (items colA colG colB / cant altFis)
  (if (or (= (_col-giro-uso colA) "SI")
          (= (_col-giro-uso colB) "SI"))
    (setq cant 2)
    (progn
      (setq altFis
        (min
          (_altura-fisica-colocacion colA)
          (_altura-fisica-colocacion colB)
        )
      )
      (setq cant (_cant-por-altura-150-300 altFis))
    )
  )

  (_add-torn items *ID-MORDAZA-LARGA* cant "MORDAZA_CHAPA_GRUESO_CHAPA")
)

(defun _calcular-mordazas-misma-banda-lista (lista / items i colA colB colC pA pB pC)
  (setq items '())
  (setq i 0)

  (while (< i (1- (length lista)))
    (setq colA (nth i lista))
    (setq colB (nth (1+ i) lista))
    (setq pA (_col-pieza colA))
    (setq pB (_col-pieza colB))

    (cond
      ; caso chapa + grueso + chapa
      ((and
         (< (+ i 2) (length lista))
         (_panel-p pA)
         (_perfil-p pB)
       )
        (setq colC (nth (+ i 2) lista))
        (setq pC (_col-pieza colC))

        (if (_panel-p pC)
          (progn
            (setq items
              (_mordaza-misma-banda-panel-grueso-panel items colA colB colC)
            )
            (setq i (+ i 2))
          )
          (setq i (1+ i))
        )
      )

      ; caso chapa + chapa
      ((and (_panel-p pA) (_panel-p pB))
        (setq items
          (_mordaza-misma-banda-panel-panel items colA colB)
        )
        (setq i (1+ i))
      )

      (T
        (setq i (1+ i))
      )
    )
  )

  items
)

(defun _calcular-mordazas-misma-banda (cols lista / items muro cara bandas banda colsB)
  (setq items '())

  (foreach muro lista
    (foreach cara '("BASE" "OPUESTA")
      (setq bandas (_bandas-de-cols cols))

      (foreach banda bandas
        (setq colsB
          (_cols-rectas-muro-cara-banda cols (_muro-id muro) cara banda)
        )

        (setq items
          (append items
            (_calcular-mordazas-misma-banda-lista colsB)
          )
        )
      )
    )
  )

  items
)

; =========================================================
; MISMA CARA - ENTRE BANDAS
; =========================================================

(defun _rango-solapa-p (a0 a1 b0 b1)
  (> (min a1 b1) (max a0 b0))
)

(defun _col-solapa-s-p (a b)
  (_rango-solapa-p (_col-s0 a) (_col-s1 a) (_col-s0 b) (_col-s1 b))
)

(defun _col-toca-z-p (a b)
  (or
    (equal (_col-z1 a) (_col-z0 b) 1e-8)
    (equal (_col-z1 b) (_col-z0 a) 1e-8)
  )
)

(defun _col-resto-lateral-p (a b)
  (or
    (equal (_col-s1 a) (_col-s0 b) 1e-8)
    (equal (_col-s1 b) (_col-s0 a) 1e-8)
  )
)(defun _solape-z-altura (a b / z0 z1)
  (setq z0 (max (_col-z0 a) (_col-z0 b)))
  (setq z1 (min (_col-z1 a) (_col-z1 b)))
  (max 0.0 (- z1 z0))
)
(defun _mordaza-entre-bandas-encima (items a b / cant id)
  (cond
    ((or (_chapa-tumbada-20-30-p a)
         (_chapa-tumbada-20-30-p b))
      (setq id *ID-MORDAZA-CORTA*)
      (setq cant
        (_cant-por-longitud-150-300
          (max (_longitud-uso-colocacion a)
               (_longitud-uso-colocacion b))
        )
      )
    )

    ((or (= (_col-giro-uso a) "SI")
         (= (_col-giro-uso b) "SI"))
      (setq id *ID-MORDAZA-FIJA*)
      (setq cant
        (_cant-por-longitud-150-300
          (max (_longitud-uso-colocacion a)
               (_longitud-uso-colocacion b))
        )
      )
    )

    (T
      (setq id *ID-MORDAZA-FIJA*)
      (setq cant 1)
    )
  )

  (_debug-union-mordaza "ENTRE_BANDAS_ENCIMA" a b id cant)

  (_add-torn items id cant "MORDAZA_ENTRE_BANDAS")
)


(defun _debug-union-mordaza (tipo a b id cant / pA pB)
  (if *DEBUG-TORNILLERIA*
    (progn
      (setq pA (_col-pieza a))
      (setq pB (_col-pieza b))

      (prompt
        (strcat
          "\nDEBUG DETALLE MORDAZA"
          " | TIPO=" tipo
          " | MURO=" (itoa (_col-muro a))
          " | CARA=" (_col-cara a)

          "\n  A: ID=" (_cat-id pA)
          " | " (_cat-codigo pA)
          " | BANDA=" (itoa (_col-banda a))
          " | S0=" (rtos (_col-s0 a) 2 2)
          " | S1=" (rtos (_col-s1 a) 2 2)
          " | Z0=" (rtos (_col-z0 a) 2 2)
          " | Z1=" (rtos (_col-z1 a) 2 2)
          " | GIRO=" (_fmt-str (_col-giro-uso a))

          "\n  B: ID=" (_cat-id pB)
          " | " (_cat-codigo pB)
          " | BANDA=" (itoa (_col-banda b))
          " | S0=" (rtos (_col-s0 b) 2 2)
          " | S1=" (rtos (_col-s1 b) 2 2)
          " | Z0=" (rtos (_col-z0 b) 2 2)
          " | Z1=" (rtos (_col-z1 b) 2 2)
          " | GIRO=" (_fmt-str (_col-giro-uso b))

          "\n  RESULTADO: ID=" id
          " | CANT=" (itoa cant)
        )
      )
    )
  )
)

(defun _pieza-col-estrecha-p (col / pieza ancho)
  (setq pieza (_col-pieza col))
  (setq ancho (_cat-ancho pieza))
  (member ancho '(20 30))
)
(defun _mordaza-entre-bandas-resto (items a b colsCara / cant id)
  (cond
    ((or (= (_col-giro-uso a) "SI")
         (= (_col-giro-uso b) "SI"))
      (setq cant 1)
    )
    (T
      (setq cant
        (_cant-por-altura-150-300
          (min
            (_altura-fisica-colocacion a)
            (_altura-fisica-colocacion b)
          )
        )
      )
    )
  )

  ;; RESTO_LATERAL dentro del paño:
  ;; aunque toque chapa 20/30, NO es inicio/final real de muro
  ;; ni unión con ángulo interior. Va con MORDAZA FIJA.
  (setq id *ID-MORDAZA-FIJA*)

  (_debug-union-mordaza "RESTO_LATERAL" a b id cant)

  (_add-torn items id cant "MORDAZA_RESTO_LATERAL")
)

(defun _smax-rectas-muro-cara (colsRectas muro cara / smax c)
  (setq smax 0.0)
  (foreach c colsRectas
    (if (and (= (_col-muro c) muro)
             (= (_col-cara c) cara)
             (_panel-p (_col-pieza c)))
      (setq smax (max smax (_col-s1 c)))
    )
  )
  smax
)

(defun _col-recta-toca-borde-comp-p (recta comp sMax / extremo tol)
  (setq extremo (_col-extremo comp))
  (setq tol 1e-6)
  (cond
    ((= extremo "INICIO")
      (equal (_col-s0 recta) 0.0 tol)
    )
    ((= extremo "FINAL")
      (equal (_col-s1 recta) sMax tol)
    )
    (T nil)
  )
)

(defun _clave-comp-con-banda-grupo (c)
  ;; Grupo de compensaciones que forman UNA MISMA compensacion fisica
  ;; contra el pano recto: mismo muro, extremo, cara, banda y tramo vertical.
  (strcat
    (itoa (_col-muro c))
    "|"
    (_fmt-str (_col-extremo c))
    "|"
    (_col-cara c)
    "|"
    (itoa (_col-banda c))
    "|"
    (rtos (_col-z0 c) 2 4)
    "|"
    (rtos (_col-z1 c) 2 4)
  )
)

(defun _comp-toca-pano-recto-p (comp colsComp / clave minS c tol)
  ;; Si una compensacion se resuelve con varias chapas, por ejemplo 30+20,
  ;; NO todas tocan el pano recto. Solo la primera chapa del grupo, la que
  ;; arranca en S0 minimo, se une con la banda recta.
  ;; Las siguientes se unen entre si con MORDAZA_COMP_COMP.
  (setq clave (_clave-comp-con-banda-grupo comp))
  (setq minS nil)
  (setq tol 1e-6)

  (foreach c colsComp
    (if (= (_clave-comp-con-banda-grupo c) clave)
      (if minS
        (setq minS (min minS (_col-s0 c)))
        (setq minS (_col-s0 c))
      )
    )
  )

  (and minS (equal (_col-s0 comp) minS tol))
)

(defun _debug-mordaza-comp-banda (comp recta id cant / pComp pRecta)

  (if *DEBUG-TORNILLERIA*
    (progn

      (setq pComp  (_col-pieza comp))
      (setq pRecta (_col-pieza recta))

      (prompt
        (strcat
          "\nDEBUG DETALLE MORDAZA"
          " | TIPO=COMPENSACION_CON_BANDA"
          " | MURO=" (itoa (_col-muro comp))
          " | CARA=" (_col-cara comp)
          " | EXTREMO=" (_fmt-str (_col-extremo comp))

          "\n  COMP: ID=" (_cat-id pComp)
          " | " (_cat-codigo pComp)
          " | BANDA=" (itoa (_col-banda comp))
          " | S0=" (rtos (_col-s0 comp) 2 2)
          " | S1=" (rtos (_col-s1 comp) 2 2)
          " | Z0=" (rtos (_col-z0 comp) 2 2)
          " | Z1=" (rtos (_col-z1 comp) 2 2)
          " | GIRO=" (_fmt-str (_col-giro-uso comp))

          "\n  BANDA: ID=" (_cat-id pRecta)
          " | " (_cat-codigo pRecta)
          " | BANDA=" (itoa (_col-banda recta))
          " | S0=" (rtos (_col-s0 recta) 2 2)
          " | S1=" (rtos (_col-s1 recta) 2 2)
          " | Z0=" (rtos (_col-z0 recta) 2 2)
          " | Z1=" (rtos (_col-z1 recta) 2 2)
          " | GIRO=" (_fmt-str (_col-giro-uso recta))

          "\n  RESULTADO: ID=" id
          " | CANT=" (itoa cant)
        )
      )
    )
  )
)
(defun _mordazas-contacto-compensacion-banda (comp recta / h z1Fis)
  (if (= (_col-giro-uso recta) "SI")
    1
    (progn
      (setq z1Fis (_col-z1-contacto-mordaza recta))
      (setq h (- (min z1Fis (_col-z1 comp)) (max (_col-z0 recta) (_col-z0 comp))))
      (if (<= h 0.0)
        0
        (_cant-por-altura-150-300 h)
      )
    )
  )
)
(defun _calcular-mordazas-compensaciones (colsComp colsRectas / items comp recta sMax cant id)
  (setq items '())

  ;; Une la COMPENSACION con la banda recta que toca en la esquina.
  ;; IMPORTANTE: si la compensacion de 50 se resuelve como 30+20,
  ;; NO se unen las dos chapas contra la banda recta.
  ;; Solo se une contra la banda la chapa que esta en el borde del pano recto.
  ;; La otra chapa se une a su vecina en _calcular-mordazas-entre-chapas-compensacion.
  (foreach comp colsComp
    (if (_comp-toca-pano-recto-p comp colsComp)
      (progn
        (setq sMax (_smax-rectas-muro-cara colsRectas (_col-muro comp) (_col-cara comp)))

        (foreach recta colsRectas
          (if (and
                (= (_col-muro recta) (_col-muro comp))
                (= (_col-cara recta) (_col-cara comp))
                (_panel-p (_col-pieza recta))
                (_col-recta-toca-borde-comp-p recta comp sMax)
                (> (_solape-z-altura comp recta) 0.0)
              )
            (progn
              (setq cant (_mordazas-contacto-compensacion-banda comp recta))

              ;; Union compensacion con banda recta:
		;; se mantiene MORDAZA DE UNION FIJA.
		;; La regla de MORDAZA CORTA para chapas 20/30 solo se aplica
		;; en inicio/final de muro o en union con ANGULO INTERIOR.
		(setq id *ID-MORDAZA-FIJA*)

              (_debug-mordaza-comp-banda comp recta id cant)

              (setq items
                (_add-torn items id cant "MORDAZA_COMPENSACION_CON_BANDA")
              )
            )
          )
        )
      )
    )
  )

  items
)
(defun _calcular-mordazas-entre-bandas-cara (colsCara / items i j a b pA pB horiz contadas)
  (setq items '())
  (setq contadas '())
  (setq i 0)

  (while (< i (length colsCara))
    (setq a (nth i colsCara))
    (setq pA (_col-pieza a))
    (setq j (1+ i))

    (while (< j (length colsCara))
      (setq b (nth j colsCara))
      (setq pB (_col-pieza b))

      (if (and (_panel-p pA)
               (_panel-p pB)
               (/= (_col-banda a) (_col-banda b)))
        (cond

          ;; UNA ENCIMA DE OTRA
          ((and (_col-toca-z-p a b)
                (_col-solapa-s-p a b))

            (cond
              ;; Si una de las dos va tumbada, se cuenta UNA VEZ
              ;; por chapa tumbada, no por cada chapa vertical que toca.
              ((or (= (_col-giro-uso a) "SI")
                   (= (_col-giro-uso b) "SI"))

                (setq horiz
                  (if (= (_col-giro-uso a) "SI")
                    a
                    b
                  )
                )

                (if (not (member horiz contadas))
                  (progn
                    (setq items
                      (_mordaza-entre-bandas-encima items a b)
                    )
                    (setq contadas (cons horiz contadas))
                  )
                )
              )

              ;; Si las dos van de pie, s es por unin real.
              (T
                (setq items
                  (_mordaza-entre-bandas-encima items a b)
                )
              )
            )
          )

          ;; RESTOS LATERALES
          ((and (_col-resto-lateral-p a b)
                (_rango-solapa-p
                  (_col-z0 a) (_col-z1 a)
                  (_col-z0 b) (_col-z1 b)
                )
           )
            (setq items
              (_mordaza-entre-bandas-resto items a b colsCara)
            )
          )
        )
      )

      (setq j (1+ j))
    )

    (setq i (1+ i))
  )

  items
)

(defun _calcular-mordazas-entre-bandas (cols lista / items muro cara colsCara)
  (setq items '())

  (foreach muro lista
    (foreach cara '("BASE" "OPUESTA")
      (setq colsCara (_cols-rectas-muro-cara cols (_muro-id muro) cara))
      (setq items
        (append items
          (_calcular-mordazas-entre-bandas-cara colsCara)
        )
      )
    )
  )

  items
)

; =========================================================
; UNION ENTRE CARAS
; =========================================================
(defun _debug-union-caras-col (muro col regla dav grandes pequenas / pieza)

  (if *DEBUG-TORNILLERIA*
    (progn

      (setq pieza (_col-pieza col))

      (prompt
        (strcat
          "\nDEBUG UNION_CARAS DETALLE"
          " | REGLA=" regla
          " | MURO=" (itoa (_muro-id muro))
          " | CARA=" (_col-cara col)
          " | BANDA=" (itoa (_col-banda col))
          " | PIEZA=" (_cat-id pieza) " - " (_cat-codigo pieza)
          " | S0=" (rtos (_col-s0 col) 2 2)
          " | S1=" (rtos (_col-s1 col) 2 2)
          " | Z0=" (rtos (_col-z0 col) 2 2)
          " | Z1=" (rtos (_col-z1 col) 2 2)
          " | GIRO=" (_fmt-str (_col-giro-uso col))
          " | ORIGEN_BANDA=" (_fmt-str (_col-origen-banda col))
          " | DAVIDAD=" (itoa dav)
          " | T.GRANDES=" (itoa grandes)
          " | T.PEQ=" (itoa pequenas)
        )
      )
    )
  )
)
(defun _calcular-union-caras-col
  (items muro col primeraVertical cambioGiro / giro alt longUso esResto pieza piezaAlto)

  (setq giro      (_col-giro-uso col))
  (setq alt       (_altura-uso-colocacion col))
  (setq longUso   (_longitud-uso-colocacion col))
  (setq esResto   (= (_col-origen-banda col) "RESTO_LATERAL"))
  (setq pieza     (_col-pieza col))
  (setq piezaAlto (_cat-alto pieza))

  (cond
    ;; CAMBIO DE GIRO
    (cambioGiro
      (cond
        ((= giro "NO")
          (cond
            ((>= piezaAlto 300.0)
              (_debug-union-caras-col muro col "CAMBIO_GIRO_VERTICAL_300" 8 16 0)
              (setq items (_add-davidad-tuercas-muro items muro 8 16 0 "UNION_CAMBIO_GIRO"))
            )
            ((>= piezaAlto 150.0)
              (_debug-union-caras-col muro col "CAMBIO_GIRO_VERTICAL_150" 4 8 0)
              (setq items (_add-davidad-tuercas-muro items muro 4 8 0 "UNION_CAMBIO_GIRO"))
            )
          )
        )

        ((= giro "SI")
          (cond
            ((>= longUso 300.0)
              (_debug-union-caras-col muro col "CAMBIO_GIRO_TUMBADA_300" 8 16 0)
              (setq items (_add-davidad-tuercas-muro items muro 8 16 0 "UNION_CAMBIO_GIRO"))
            )
            ((>= longUso 150.0)
              (_debug-union-caras-col muro col "CAMBIO_GIRO_TUMBADA_150" 4 8 0)
              (setq items (_add-davidad-tuercas-muro items muro 4 8 0 "UNION_CAMBIO_GIRO"))
            )
          )
        )
      )
    )

    ;; VERTICAL NORMAL
    ((= giro "NO")
      (cond
        ((>= piezaAlto 300.0)
          (if primeraVertical
            (progn
              (_debug-union-caras-col muro col "PRIMERA_VERTICAL_300" 8 16 0)
              (setq items (_add-davidad-tuercas-muro items muro 8 16 0 "UNION_ENTRE_CARAS"))
            )
            (progn
              (_debug-union-caras-col muro col "VERTICAL_300_NORMAL" 4 8 0)
              (setq items (_add-davidad-tuercas-muro items muro 4 8 0 "UNION_ENTRE_CARAS"))
            )
          )
        )

        ((>= piezaAlto 150.0)
          (if primeraVertical
            (progn
              (_debug-union-caras-col muro col "PRIMERA_VERTICAL_150" 4 8 0)
              (setq items (_add-davidad-tuercas-muro items muro 4 8 0 "UNION_ENTRE_CARAS"))
            )
            (progn
              (_debug-union-caras-col muro col "VERTICAL_150_NORMAL" 2 4 0)
              (setq items (_add-davidad-tuercas-muro items muro 2 4 0 "UNION_ENTRE_CARAS"))
            )
          )
        )
      )
    )

    ;; TUMBADA NORMAL
    ((= giro "SI")
      (cond
        ((= (_col-banda col) 0)
          (cond
            ((>= longUso 300.0)
              (_debug-union-caras-col muro col "TUMBADA_BANDA_0_300" 8 8 8)
              (setq items (_add-davidad-tuercas-muro items muro 8 8 8 "UNION_ENTRE_CARAS"))
            )
            ((>= longUso 150.0)
              (_debug-union-caras-col muro col "TUMBADA_BANDA_0_150" 4 4 4)
              (setq items (_add-davidad-tuercas-muro items muro 4 4 4 "UNION_ENTRE_CARAS"))
            )
          )
        )

        (T
          (cond
            ((>= longUso 300.0)
              (_debug-union-caras-col muro col "TUMBADA_SUPERIOR_300" 4 8 0)
              (setq items (_add-davidad-tuercas-muro items muro 4 8 0 "UNION_ENTRE_CARAS"))
            )
            ((>= longUso 150.0)
              (_debug-union-caras-col muro col "TUMBADA_SUPERIOR_150" 2 4 0)
              (setq items (_add-davidad-tuercas-muro items muro 2 4 0 "UNION_ENTRE_CARAS"))
            )
          )
        )
      )
    )
  )

  items
)
(defun _calcular-union-entre-caras
  (cols lista / items muro bandas banda colsB prevGiroCara primeraVertical cambioGiro c giro)

  (setq items '())

  (foreach muro lista

    ;; SOLO hay union entre caras si el muro tiene 2 caras.
    ;; Si el muro es de 1 cara, no debe meter davidad ni tuercas.
    (if (= (nth 8 muro) 2)
      (progn

        ;; Solo BASE para no duplicar BASE + OPUESTA
        (setq bandas (_bandas-de-cols cols))

        ;; Este NO se reinicia por banda.
        ;; Tiene que recordar el giro de la banda anterior.
        (setq prevGiroCara nil)

        (foreach banda bandas
          (setq colsB
            (_cols-rectas-muro-cara-banda
              cols
              (_muro-id muro)
              "BASE"
              banda
            )
          )

          ;; Esto SI se reinicia por banda:
          ;; primera chapa vertical de cada banda = doble.
          (setq primeraVertical T)

          (foreach c colsB
            (setq giro (_col-giro-uso c))

            ;; Cambio de giro entre la pieza anterior calculada y esta.
            ;; Asi detecta banda 0 vertical -> banda 1 tumbada.
            (setq cambioGiro
              (and prevGiroCara (/= prevGiroCara giro))
            )

            (setq items
              (_calcular-union-caras-col
                items
                muro
                c
                primeraVertical
                cambioGiro
              )
            )

            ;; Si ya hemos contado una vertical en esta banda,
            ;; la siguiente vertical ya no es primera.
            (if (= giro "NO")
              (setq primeraVertical nil)
            )

            ;; IMPORTANTE: se actualiza al final y se conserva para la siguiente banda.
            (setq prevGiroCara giro)
          )
        )
      )
    )
  )

  items
)
; =========================================================
; ESQUINAS Y COMPENSACIONES
; =========================================================

(defun _add-tornillo-pletina (items cant origen)
  (setq items (_add-torn items *ID-TORN-PLETINA* cant origen))
  (setq items (_add-torn items *ID-TUERCA-PEQ* cant origen))
  items
)

(defun _calcular-tornilleria-angulos-exteriores (colsEsq / items c pieza tramo)
  (setq items '())

  (foreach c colsEsq
    (setq pieza (_cesq-pieza c))
    (setq tramo (_cesq-tramo c))

    ; Total por angulo exterior:
    ; 300 = 12 + 12 porque son 2 compensaciones de 6 + 6.
    ; 150 = 6 + 6 porque son 2 compensaciones de 3 + 3.
    (if (_esquina-exterior-p pieza)
      (cond
        ((>= tramo 300.0)
          (setq items (_add-tornillo-pletina items 12 "ANGULO_EXTERIOR_COMPENSACION"))
        )
        ((>= tramo 150.0)
          (setq items (_add-tornillo-pletina items 6 "ANGULO_EXTERIOR_COMPENSACION"))
        )
      )
    )
  )

  items
)


(defun _col-normal-toca-extremo-p (col colsRectas muroId cara extremo / tol valor extremoReal)

  (setq tol 1e-6)

  ;; Valor extremo de ESTA pieza
  (setq valor
    (if (= extremo "INICIO")
      (_col-s0 col)
      (_col-s1 col)
    )
  )

  ;; Valor mas extremo de TODAS las piezas de la cara
  (setq extremoReal
    (_sref-extremo-cara-muro colsRectas muroId cara extremo)
  )

  ;; La pieza toca el angulo si es la mas exterior
  (equal valor extremoReal tol)
)

(defun _sref-extremo-cara-muro (colsRectas muroId cara extremo / vals c)
  (setq vals '())

  (foreach c colsRectas
    (if (and
          (= (_col-muro c) muroId)
          (= (_col-cara c) cara)
          (_panel-p (_col-pieza c))
        )
      (setq vals
        (cons
          (if (= extremo "INICIO")
            (_col-s0 c)
            (_col-s1 c)
          )
          vals
        )
      )
    )
  )

  (if vals
    (if (= extremo "INICIO")
      (apply 'min vals)
      (apply 'max vals)
    )
    nil
  )
)
(defun _mordazas-contacto-angulo-interior (col z0 z1 / h pieza altoFis)
  ;; Cuenta mordazas reales contra angulo interior.
  ;;
  ;; - Chapa tumbada: 1 mordaza por pieza que toca el angulo.
  ;; - Chapa vertical: por altura FISICA de la pieza, no por altura usada.
  ;;   Ejemplo: chapa 3x0,6 usada en paño de 180 sigue siendo pieza fisica de 300 => 3 mordazas.

  (setq h (- (min (_col-z1 col) z1) (max (_col-z0 col) z0)))

  (if (<= h 0.0)
    0
    (if (= (_col-giro-uso col) "SI")
      1
      (progn
        (setq pieza (_col-pieza col))
        (setq altoFis (_cat-alto pieza))
        (_cant-por-altura-150-300 altoFis)
      )
    )
  )
)
(defun _contar-uniones-angulo-interior-muro-extremo
  (colsRectas muroId cara extremo z0 z1 / sRef cant c inc)

  (setq cant 0)
  (setq sRef (_sref-extremo-cara-muro colsRectas muroId cara extremo))

  (if sRef
    (foreach c colsRectas
      (if (and
            (= (_col-muro c) muroId)
            (= (_col-cara c) cara)
            (_rango-solapa-p (_col-z0 c) (_col-z1 c) z0 z1)
            (_col-normal-toca-extremo-p
              c
              colsRectas
              muroId
              cara
              extremo
            )
          )
        (progn
          (setq inc (_mordazas-contacto-angulo-interior c z0 z1))
          (setq cant (+ cant inc))
        )
      )
    )
  )

  cant
)
(defun _contar-uniones-reales-angulo-interior-esquina (cesq colsRectas e / cara z0 z1 m1 m2 ext1 ext2 c1 c2)
  ;; Cuenta las uniones reales del angulo interior con las bandas rectas
  ;; de los DOS muros que forman la esquina.
  ;; Ejemplo z=180: muro 1 tiene 2 bandas + muro 2 tiene 2 bandas = 4.
  (setq cara (_cesq-cara cesq))
  (setq z0   (_cesq-z0 cesq))
  (setq z1   (_cesq-z1 cesq))
  (setq m1   (cdr (assoc "MURO1" e)))
  (setq m2   (cdr (assoc "MURO2" e)))
  (setq ext1 (cdr (assoc "EXT1" e)))
  (setq ext2 (cdr (assoc "EXT2" e)))

  (setq c1 (_contar-uniones-angulo-interior-muro-extremo colsRectas m1 cara ext1 z0 z1))
  (setq c2 (_contar-uniones-angulo-interior-muro-extremo colsRectas m2 cara ext2 z0 z1))
  (+ c1 c2)
)

(defun _calcular-mordazas-esquinas-por-esquina (colsEsq colsRectas e / items c pieza tramo cant)
  ;; Version correcta para DEPURAR_TORNILLERIA_UNICA:
  ;; no usa tabla fija 300=6 / 150=4; cuenta piezas reales que tocan el angulo.
  (setq items '())

  (foreach c colsEsq
    (setq pieza (_cesq-pieza c))
    (setq tramo (_cesq-tramo c))

    (if (_esquina-interior-p pieza)
      (progn
        (setq cant (_contar-uniones-reales-angulo-interior-esquina c colsRectas e))

        ;; Fallback solo si no se detecta nada, para no dejar la esquina sin mordazas.
        (if (<= cant 0)
          (setq cant (* 2 (_cant-por-altura-150-300 tramo)))
        )

        (if *DEBUG-TORNILLERIA*
          (prompt
            (strcat
              "\nDEBUG ANGULO INTERIOR | MORDAZAS POR UNIONES REALES"
              " | MURO=" (itoa (_cesq-muro c))
              " | EXTREMO=" (_fmt-str (_cesq-extremo c))
              " | CARA=" (_fmt-str (_cesq-cara c))
              " | Z0=" (rtos (_cesq-z0 c) 2 2)
              " | Z1=" (rtos (_cesq-z1 c) 2 2)
              " | CANT=" (itoa cant)
            )
          )
        )

        (setq items
          (_add-torn items *ID-MORDAZA-CORTA* cant "MORDAZA_ESQUINA_INTERIOR")
        )
      )
    )
  )

  items
)

(defun _calcular-mordazas-esquinas (colsEsq colsComp / items c pieza tramo cant)
  ;; Compatibilidad con comandos antiguos.
  ;; Si no se llama desde una esquina concreta, se mantiene el fallback anterior.
  (setq items '())

  (foreach c colsEsq
    (setq pieza (_cesq-pieza c))
    (setq tramo (_cesq-tramo c))

    (if (_esquina-interior-p pieza)
      (progn
        (setq cant (* 2 (_cant-por-altura-150-300 tramo)))
        (prompt
          (strcat
            "\nDEBUG ANGULO INTERIOR | FALLBACK ALTURA"
            " | MURO=" (itoa (_cesq-muro c))
            " | EXTREMO=" (_fmt-str (_cesq-extremo c))
            " | CARA=" (_fmt-str (_cesq-cara c))
            " | Z0=" (rtos (_cesq-z0 c) 2 2)
            " | Z1=" (rtos (_cesq-z1 c) 2 2)
            " | CANT=" (itoa cant)
          )
        )
        (setq items
          (_add-torn items *ID-MORDAZA-CORTA* cant "MORDAZA_ESQUINA_INTERIOR")
        )
      )
    )
  )

  items
)

(defun _compensacion-ancho-20-30-p (col / pieza ancho)
  (setq pieza (_col-pieza col))
  (setq ancho (_cat-ancho pieza))
  (member ancho '(20 30))
)
(defun _clave-comp-grupo (c)
  (strcat
    (itoa (_col-muro c))
    "|"
    (_fmt-str (_col-extremo c))
    "|"
    (_col-cara c)
    "|"
    (itoa (_col-banda c))
  )
)

(defun _calcular-mordazas-entre-chapas-compensacion (colsComp / items grupos c clave reg colsGrupo i a b cant id)
  (setq items '())
  (setq grupos '())

  ;; Agrupar compensaciones por muro/extremo/cara/banda
  (foreach c colsComp
    (setq clave (_clave-comp-grupo c))
    (setq reg (assoc clave grupos))

    (if reg
      (setq grupos
        (subst
          (cons clave (append (cdr reg) (list c)))
          reg
          grupos
        )
      )
      (setq grupos
        (append grupos (list (cons clave (list c))))
      )
    )
  )

  ;; Dentro de cada grupo, unir chapas consecutivas
  (foreach reg grupos
    (setq colsGrupo
      (vl-sort (cdr reg)
        '(lambda (a b) (< (_col-s0 a) (_col-s0 b)))
      )
    )

    (setq i 0)
    (while (< i (1- (length colsGrupo)))
      (setq a (nth i colsGrupo))
      (setq b (nth (1+ i) colsGrupo))

      ;; Si hay dos chapas de compensacion consecutivas, hay una union
      (setq cant
        (_cant-por-altura-150-300
          (min
            (_altura-fisica-colocacion a)
            (_altura-fisica-colocacion b)
          )
        )
      )

      ;; Si alguna compensacion consecutiva es chapa estrecha 20/30,
      ;; la union por su lado largo debe ir con mordaza corta.
      (setq id
        (if (or (_compensacion-ancho-20-30-p a)
                (_compensacion-ancho-20-30-p b))
          *ID-MORDAZA-CORTA*
          *ID-MORDAZA-FIJA*
        )
      )

      (setq items
        (_add-torn items id cant "MORDAZA_COMP_COMP")
      )

      (setq i (1+ i))
    )
  )

  items
)
(defun _comp-misma-posicion-planta-p (a b / tol)
  (setq tol 1e-6)
  (and
    (= (_col-muro a) (_col-muro b))
    (= (_col-cara a) (_col-cara b))
    (= (_col-extremo a) (_col-extremo b))
    (equal (_col-s0 a) (_col-s0 b) tol)
    (equal (_col-s1 a) (_col-s1 b) tol)
  )
)

(defun _calcular-mordazas-compensacion-entre-alturas (colsComp / items i j a b cant)
  (setq items '())
  (setq i 0)

  (while (< i (length colsComp))
    (setq a (nth i colsComp))
    (setq j (1+ i))

    (while (< j (length colsComp))
      (setq b (nth j colsComp))

      (if (and
            (_comp-misma-posicion-planta-p a b)
            (_col-toca-z-p a b)
          )
        (progn
          ;; Unión por lado corto entre compensaciones apiladas: fija
          (setq cant
            (_cant-por-longitud-150-300
              (min
                (_longitud-uso-colocacion a)
                (_longitud-uso-colocacion b)
              )
            )
          )

          (_debug-union-mordaza "COMPENSACION_ENTRE_ALTURAS" a b *ID-MORDAZA-FIJA* cant)

          (setq items
            (_add-torn items *ID-MORDAZA-FIJA* cant "MORDAZA_COMP_ALTURA")
          )
        )
      )

      (setq j (1+ j))
    )

    (setq i (1+ i))
  )

  items
)
(defun _calcular-union-angulos-interiores-entre-si (colsEsq / items nInteriores nUniones c pieza)
  (setq items '())
  (setq nInteriores 0)

  ;; Contamos cuantos angulos interiores reales hay en esta esquina.
  (foreach c colsEsq
    (setq pieza (_cesq-pieza c))
    (if (_esquina-interior-p pieza)
      (setq nInteriores (1+ nInteriores))
    )
  )

  ;; Solo hay union si hay mas de un angulo interior apilado.
  ;; 1 angulo  -> 0 uniones
  ;; 2 angulos -> 1 union
  ;; 3 angulos -> 2 uniones
  (setq nUniones (max 0 (1- nInteriores)))

  ;; Cada union entre angulos interiores:
  ;; 2 davidad de 0,25 m + 4 tuercas grandes.
  (if (> nUniones 0)
    (progn
      (setq items (_add-torn items "031" (* nUniones 2) "ANGULO_INTERIOR_ENTRE_ANGULOS"))
      (setq items (_add-torn items *ID-TUERCA-GRANDE* (* nUniones 4) "ANGULO_INTERIOR_ENTRE_ANGULOS"))
    )
  )

  items
)
(defun _hay-chapa-pie-justo-antes-p (colsRectas muro cara z0 z1 sAng / ok c)
  (setq ok nil)

  (foreach c colsRectas
    (if
      (and
        (= (_col-muro c) muro)
        (= (_col-cara c) cara)
        (= (_col-giro-uso c) "NO")
        (equal (_col-z0 c) z0 0.01)
        (equal (_col-z1 c) z1 0.01)
        (equal (_col-s1 c) sAng 0.01)
      )
      (setq ok T)
    )
  )

  ok
)

(defun _hay-chapa-pie-justo-despues-p (colsRectas muro cara z0 z1 sAng / ok c)
  (setq ok nil)

  (foreach c colsRectas
    (if
      (and
        (= (_col-muro c) muro)
        (= (_col-cara c) cara)
        (= (_col-giro-uso c) "NO")
        (equal (_col-z0 c) z0 0.01)
        (equal (_col-z1 c) z1 0.01)
        (equal (_col-s0 c) sAng 0.01)
      )
      (setq ok T)
    )
  )

  ok
)
(defun _hay-chapa-pie-en-extremo-tramo-p
       (colsRectas muroId cara extremo z0 z1 / ok c)
  ;; La davidad de la chapa vertical situada junto al angulo ya resuelve
  ;; este lado. Se comprueba por muro/extremo, no con S0/S1 del angulo,
  ;; porque las colocaciones de esquina no contienen esas coordenadas.
  (setq ok nil)

  (foreach c colsRectas
    (if
      (and
        (null ok)
        (= (_col-muro c) muroId)
        (= (_col-cara c) cara)
        (= (_col-giro-uso c) "NO")
        (_rango-solapa-p (_col-z0 c) (_col-z1 c) z0 z1)
        (_col-normal-toca-extremo-p
          c
          colsRectas
          muroId
          cara
          extremo
        )
      )
      (setq ok T)
    )
  )

  ok
)

(defun _calcular-union-angulos-interiores-compensacion-por-esquina
       (lista colsEsq colsRectas e / items c pieza tramo muro cara z0 z1
                                      m1 m2 ext1 ext2 ladosLibres dav tg)
  (setq items '())
  (setq m1   (cdr (assoc "MURO1" e)))
  (setq m2   (cdr (assoc "MURO2" e)))
  (setq ext1 (cdr (assoc "EXT1" e)))
  (setq ext2 (cdr (assoc "EXT2" e)))

  (foreach c colsEsq
    (setq pieza (_cesq-pieza c))
    (setq tramo (_cesq-tramo c))
    (setq muro  (_buscar-muro-por-id (_cesq-muro c) lista))

    (if (and muro (_esquina-interior-p pieza))
      (progn
        (setq cara (_cesq-cara c))
        (setq z0   (_cesq-z0 c))
        (setq z1   (_cesq-z1 c))
        (setq ladosLibres 2)

        ;; Cada muro representa uno de los dos lados del angulo interior.
        ;; Si su ultima chapa de pie ya llega a la esquina en este tramo,
        ;; ese lado no vuelve a llevar davidad.
        (if (_hay-chapa-pie-en-extremo-tramo-p
              colsRectas m1 cara ext1 z0 z1)
          (setq ladosLibres (1- ladosLibres))
        )

        (if (_hay-chapa-pie-en-extremo-tramo-p
              colsRectas m2 cara ext2 z0 z1)
          (setq ladosLibres (1- ladosLibres))
        )

        (cond
          ((>= tramo 300.0)
            (setq dav (* ladosLibres 4))
            (setq tg  (* ladosLibres 8))
          )
          ((>= tramo 150.0)
            (setq dav (* ladosLibres 2))
            (setq tg  (* ladosLibres 4))
          )
          (T
            (setq dav 0)
            (setq tg 0)
          )
        )

        (if *DEBUG-TORNILLERIA*
          (prompt
            (strcat
              "\nDEBUG ANGULO INTERIOR + COMPENSACION"
              " | MUROS=" (itoa m1) "/" (itoa m2)
              " | CARA=" (_fmt-str cara)
              " | Z0=" (rtos z0 2 2)
              " | Z1=" (rtos z1 2 2)
              " | LADOS_LIBRES=" (itoa ladosLibres)
              " | DAVIDAD=" (itoa dav)
            )
          )
        )

        (if (> dav 0)
          (setq items
            (_add-davidad-tuercas-muro
              items muro dav tg 0 "ANGULO_INTERIOR_COMPENSACION")
          )
        )
      )
    )
  )

  items
)

(defun _calcular-union-angulos-interiores-compensacion-todas
       (lista colsEsq colsRectas / items esquinas e colsEsqE colsRectasE)
  (setq items '())
  (setq esquinas (_recolectar-esquinas-unicas lista))

  (foreach e esquinas
    (setq colsEsqE    (_cols-esq-de-esquina colsEsq e))
    (setq colsRectasE (_cols-rectas-de-esquina colsRectas e))
    (setq items
      (append
        items
        (_calcular-union-angulos-interiores-compensacion-por-esquina
          lista colsEsqE colsRectasE e)
      )
    )
  )

  items
)

(defun _calcular-union-angulos-interiores-compensacion
       (lista colsEsq colsRectas / items c pieza tramo muro cara z0 z1 s0 s1 ladosLibres dav tg)
  (setq items '())

  (foreach c colsEsq
    (setq pieza (_cesq-pieza c))
    (setq tramo (_cesq-tramo c))
    (setq muro  (_buscar-muro-por-id (_cesq-muro c) lista))

    (if (and muro (_esquina-interior-p pieza))
      (progn
        (setq ladosLibres 2)

        (setq cara (_col-cara c))
	(setq z0   (_col-z0 c))
	(setq z1   (_col-z1 c))
	(setq s0   (_col-s0 c))
	(setq s1   (_col-s1 c))

        ;; Si hay chapa de pie justo antes del angulo, ese lado ya esta contado
        (if (_hay-chapa-pie-justo-antes-p colsRectas (_cesq-muro c) cara z0 z1 s0)
          (setq ladosLibres (1- ladosLibres))
        )

        ;; Si hay chapa de pie justo despues del angulo, ese lado ya esta contado
        (if (_hay-chapa-pie-justo-despues-p colsRectas (_cesq-muro c) cara z0 z1 s1)
          (setq ladosLibres (1- ladosLibres))
        )

        (cond
          ((>= tramo 300.0)
            (setq dav (* ladosLibres 4))
            (setq tg  (* ladosLibres 8))
          )
          ((>= tramo 150.0)
            (setq dav (* ladosLibres 2))
            (setq tg  (* ladosLibres 4))
          )
          (T
            (setq dav 0)
            (setq tg 0)
          )
        )

        (if (> dav 0)
          (setq items
            (_add-davidad-tuercas-muro items muro dav tg 0 "ANGULO_INTERIOR_COMPENSACION")
          )
        )
      )
    )
  )

  items
)

; =========================================================
; TORNILLERIA TOTAL
; =========================================================

(defun _generar-items-tornilleria (lista / colsRectas colsEsq colsComp items)

  (setq colsRectas (_generar-colocaciones-rectas lista))
  (setq colsEsq    (_generar-colocaciones-esquinas lista))
  (setq colsComp   (_generar-colocaciones-compensaciones lista))

  (setq items '())

  ; 1. Mordazas misma banda
  (setq items
    (append items
      (_calcular-mordazas-misma-banda colsRectas lista)
    )
  )

  ; 2. Mordazas entre bandas y restos laterales
  (setq items
    (append items
      (_calcular-mordazas-entre-bandas colsRectas lista)
    )
  )

  ; 3. Davidad + tuercas entre caras
  (setq items
    (append items
      (_calcular-union-entre-caras colsRectas lista)
    )
  )

  ; 4. Mordazas de esquinas interiores
  (setq items
    (append items
      (_calcular-mordazas-esquinas colsEsq colsComp)
    )
  )

  ; 5. Compensaciones con bandas
  (setq items
    (append items
      (_calcular-mordazas-compensaciones colsComp colsRectas)
    )
  )

  ; 5B. ENTRE CHAPAS DE COMPENSACION (NUEVO)
  (setq items
    (append items
      (_calcular-mordazas-entre-chapas-compensacion colsComp)
    )
  )

  ; 6. Angulo exterior + compensacion
  (setq items
    (append items
      (_calcular-tornilleria-angulos-exteriores colsEsq)
    )
  )

  ; 7. Angulo interior + compensacion entre caras
  (setq items
    (append items
      (_calcular-union-angulos-interiores-compensacion-todas
        lista colsEsq colsRectas)
    )
  )

  items
)

(defun c:DEPURAR_TORNILLERIA (/ lista
                                colsRectas colsEsq colsComp
                                itemsMisma itemsBandas itemsCaras
                                itemsEsq itemsComp itemsCompComp itemsAngExt itemsAngInt
                                items resumen)

  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (_stock-iniciar-calculo)
      (_stock-imprimir-limitaciones)

      (setq colsRectas (_generar-colocaciones-rectas lista))
      (setq colsEsq    (_generar-colocaciones-esquinas lista))
      (setq colsComp   (_generar-colocaciones-compensaciones lista))

      (prompt "\n===== DEPURACION TORNILLERIA =====")

      ;; 1. Misma banda
      (prompt "\n\n--- 1. MORDAZAS MISMA BANDA ---")
      (setq itemsMisma (_calcular-mordazas-misma-banda colsRectas lista))
      (_imprimir-resumen-consolidado (_consolidar-items-por-id itemsMisma))

      ;; 2. Entre bandas / restos
      (prompt "\n\n--- 2. MORDAZAS ENTRE BANDAS / RESTOS ---")
      (setq itemsBandas (_calcular-mordazas-entre-bandas colsRectas lista))
      (_imprimir-resumen-consolidado (_consolidar-items-por-id itemsBandas))

      ;; 3. Unin entre caras
      (prompt "\n\n--- 3. UNION ENTRE CARAS ---")
      (setq itemsCaras (_calcular-union-entre-caras colsRectas lista))
      (_imprimir-resumen-consolidado (_consolidar-items-por-id itemsCaras))

      ;; 4. Esquinas interiores
      (prompt "\n\n--- 4. MORDAZAS ESQUINAS INTERIORES ---")
      (setq itemsEsq (_calcular-mordazas-esquinas colsEsq colsComp))
      (_imprimir-resumen-consolidado (_consolidar-items-por-id itemsEsq))

      ;; 5. Compensaciones con bandas
      (prompt "\n\n--- 5. MORDAZAS COMPENSACIONES CON BANDAS ---")
      (setq itemsComp (_calcular-mordazas-compensaciones colsComp colsRectas))
      (_imprimir-resumen-consolidado (_consolidar-items-por-id itemsComp))
      ;; 5B. Entre chapas de compensacion
	(prompt "\n\n--- 5B. MORDAZAS ENTRE CHAPAS DE COMPENSACION ---")
	(setq itemsCompComp (_calcular-mordazas-entre-chapas-compensacion colsComp))
	(_imprimir-resumen-consolidado (_consolidar-items-por-id itemsCompComp))

      ;; 6. Angulos exteriores + compensacion
      (prompt "\n\n--- 6. ANGULO EXTERIOR + COMPENSACION ---")
      (setq itemsAngExt (_calcular-tornilleria-angulos-exteriores colsEsq))
      (_imprimir-resumen-consolidado (_consolidar-items-por-id itemsAngExt))

      ;; 7. Angulos interiores + compensacion entre caras
      (prompt "\n\n--- 7. ANGULO INTERIOR + COMPENSACION ENTRE CARAS ---")
      (setq itemsAngInt
        (_calcular-union-angulos-interiores-compensacion-todas
          lista colsEsq colsRectas)
      )
      (_imprimir-resumen-consolidado (_consolidar-items-por-id itemsAngInt))

      ;; Total
      (setq items
        (append
          itemsMisma
          itemsBandas
          itemsCaras
          itemsEsq
          itemsComp
	  itemsCompComp
          itemsAngExt
          itemsAngInt
        )
      )

      (setq resumen (_consolidar-items-por-id items))

      (prompt "\n\n===== TORNILLERIA TOTAL =====")
      (_imprimir-resumen-consolidado resumen)
    )
  )

  (princ)
)

(defun _filtrar-cols-por-id-muro (cols idMuro / res c)
  (setq res '())
  (foreach c cols
    (if (= (_col-muro c) idMuro)
      (setq res (append res (list c)))
    )
  )
  res
)

(defun _filtrar-esquinas-por-id-muro (colsEsq idMuro / res c)
  (setq res '())
  (foreach c colsEsq
    (if (= (_cesq-muro c) idMuro)
      (setq res (append res (list c)))
    )
  )
  res
)


(defun _cols-comp-de-esquina (colsComp e / res c m1 m2 ext1 ext2)
  (setq res '())
  (setq m1   (cdr (assoc "MURO1" e)))
  (setq m2   (cdr (assoc "MURO2" e)))
  (setq ext1 (cdr (assoc "EXT1" e)))
  (setq ext2 (cdr (assoc "EXT2" e)))

  (foreach c colsComp
    (if (or
          (and (= (_col-muro c) m1) (= (_col-extremo c) ext1))
          (and (= (_col-muro c) m2) (= (_col-extremo c) ext2))
        )
      (setq res (append res (list c)))
    )
  )
  res
)

(defun _cols-rectas-de-esquina (colsRectas e / res c m1 m2)
  (setq res '())
  (setq m1 (cdr (assoc "MURO1" e)))
  (setq m2 (cdr (assoc "MURO2" e)))

  (foreach c colsRectas
    (if (or (= (_col-muro c) m1) (= (_col-muro c) m2))
      (setq res (append res (list c)))
    )
  )
  res
)

(defun _cols-esq-de-esquina (colsEsq e / res c m1 ext1)
  (setq res '())
  (setq m1   (cdr (assoc "MURO1" e)))
  (setq ext1 (cdr (assoc "EXT1" e)))

  ;; Las colocaciones angulares se generan una sola vez,
  ;; normalmente sobre MURO1/EXT1 de la esquina unica.
  (foreach c colsEsq
    (if (and (= (_cesq-muro c) m1) (= (_cesq-extremo c) ext1))
      (setq res (append res (list c)))
    )
  )
  res
)

(defun c:DEPURAR_TORNILLERIA_UNICA
  (/ lista datosStock colsRectas colsEsq colsComp esquinas
     muro id colsRectasM
     itemsMisma itemsBandas itemsCaras
     itemsMuro itemsTotal
     e m1 m2 ext1 ext2 colsEsqE colsCompE colsRectasE
     itemsEsq itemsComp itemsCompComp itemsCompAlt itemsAngExt itemsAngInt itemsCorner itemsAngIntEntreSi)

  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (_stock-iniciar-calculo)
      (_stock-imprimir-limitaciones)

      ;; Usar el mismo criterio de stock que LISTAR_DESPIECE:
      ;; compensaciones con reserva preferente y fallback flexible.
      (setq datosStock (_generar-cols-stock-comp-preferente lista))
      (setq colsRectas (cdr (assoc "RECTAS" datosStock)))
      (setq colsComp   (cdr (assoc "COMP" datosStock)))
      (setq colsEsq    (cdr (assoc "ESQ" datosStock)))
      (setq esquinas   (_recolectar-esquinas-unicas lista))

      (setq itemsTotal '())

      (prompt "\n\n===== DEPURACION TORNILLERIA POR MUROS =====")
      (prompt "\nNOTA: los subtotales de MURO solo incluyen tornilleria del pano recto.")
      (prompt "\n      La tornilleria de esquinas y compensaciones se lista aparte por pareja de muros.")

      ;; =========================================================
      ;; 1) SUBTOTALES LIMPIOS POR MURO: SOLO PANO RECTO
      ;; =========================================================
      (foreach muro lista
        (setq id (_muro-id muro))
        (setq colsRectasM (_filtrar-cols-por-id-muro colsRectas id))

        (prompt
          (strcat
            "\n\n===================================="
            "\nMURO " (itoa id)
            "\n===================================="
          )
        )

        ;; 1. Misma banda
        (prompt "\n\n--- 1. MORDAZAS MISMA BANDA ---")
        (setq itemsMisma (_calcular-mordazas-misma-banda colsRectasM (list muro)))
        (_imprimir-resumen-consolidado (_consolidar-items-por-id itemsMisma))

        ;; 2. Entre bandas / restos
        (prompt "\n\n--- 2. MORDAZAS ENTRE BANDAS / RESTOS ---")
        (setq itemsBandas (_calcular-mordazas-entre-bandas colsRectasM (list muro)))
        (_imprimir-resumen-consolidado (_consolidar-items-por-id itemsBandas))

        ;; 3. Union entre caras del pano recto
        (prompt "\n\n--- 3. UNION ENTRE CARAS DEL PANO RECTO ---")
        (setq itemsCaras (_calcular-union-entre-caras colsRectasM (list muro)))
        (_imprimir-resumen-consolidado (_consolidar-items-por-id itemsCaras))

        (setq itemsMuro
          (append
            itemsMisma
            itemsBandas
            itemsCaras
          )
        )

        (prompt
          (strcat
            "\n\n--- TOTAL TORNILLERIA MURO "
            (itoa id)
            " (SIN ESQUINAS) ---"
          )
        )
        (_imprimir-resumen-consolidado (_consolidar-items-por-id itemsMuro))

        (setq itemsTotal (append itemsTotal itemsMuro))
      )

      ;; =========================================================
      ;; 2) SUBTOTALES POR ESQUINA: TODO LO QUE PERTENECE A LA ESQUINA
      ;; =========================================================
      (foreach e esquinas
        (setq m1   (cdr (assoc "MURO1" e)))
        (setq m2   (cdr (assoc "MURO2" e)))
        (setq ext1 (cdr (assoc "EXT1" e)))
        (setq ext2 (cdr (assoc "EXT2" e)))

        (setq colsEsqE    (_cols-esq-de-esquina colsEsq e))
        (setq colsCompE   (_cols-comp-de-esquina colsComp e))
        (setq colsRectasE (_cols-rectas-de-esquina colsRectas e))

        (prompt
          (strcat
            "\n\n===================================="
            "\nESQUINA MURO " (itoa m1) " " ext1
            " CON MURO " (itoa m2) " " ext2
            "\n===================================="
          )
        )

        ;; A. Mordazas del angulo interior
        (prompt "\n\n--- A. MORDAZAS ESQUINA INTERIOR ---")
        (setq itemsEsq (_calcular-mordazas-esquinas-por-esquina colsEsqE colsRectasE e))
        (_imprimir-resumen-consolidado (_consolidar-items-por-id itemsEsq))

	(prompt "\n\n--- A2. UNION ENTRE ANGULOS INTERIORES ---")
	(setq itemsAngIntEntreSi (_calcular-union-angulos-interiores-entre-si colsEsqE))
	(_imprimir-resumen-consolidado (_consolidar-items-por-id itemsAngIntEntreSi))

        ;; B. Compensaciones con bandas, de los dos muros de esa esquina
        (prompt "\n\n--- B. MORDAZAS COMPENSACIONES CON BANDAS ---")
        (setq itemsComp (_calcular-mordazas-compensaciones colsCompE colsRectasE))
        (_imprimir-resumen-consolidado (_consolidar-items-por-id itemsComp))

        ;; C. Entre chapas de compensacion
        (prompt "\n\n--- C. MORDAZAS ENTRE CHAPAS DE COMPENSACION ---")
        (setq itemsCompComp (_calcular-mordazas-entre-chapas-compensacion colsCompE))
        (_imprimir-resumen-consolidado (_consolidar-items-por-id itemsCompComp))
	
	(prompt "\n\n--- C2. MORDAZAS COMPENSACION ENTRE ALTURAS ---")
	(setq itemsCompAlt (_calcular-mordazas-compensacion-entre-alturas colsCompE))
	(_imprimir-resumen-consolidado (_consolidar-items-por-id itemsCompAlt))

	
        ;; D. Angulo exterior + compensacion
        (prompt "\n\n--- D. ANGULO EXTERIOR + COMPENSACION ---")
        (setq itemsAngExt (_calcular-tornilleria-angulos-exteriores colsEsqE))
        (_imprimir-resumen-consolidado (_consolidar-items-por-id itemsAngExt))

        ;; E. Angulo interior + compensacion entre caras
        (prompt "\n\n--- E. ANGULO INTERIOR + COMPENSACION ENTRE CARAS ---")
        (setq itemsAngInt
          (_calcular-union-angulos-interiores-compensacion-por-esquina
            lista colsEsqE colsRectasE e)
        )
        (_imprimir-resumen-consolidado (_consolidar-items-por-id itemsAngInt))

        (setq itemsCorner
	  (append
	    itemsEsq
	    itemsAngIntEntreSi
	    itemsComp
	    itemsCompComp
	    itemsCompAlt
	    itemsAngExt
	    itemsAngInt
	  )
	)

        (prompt
          (strcat
            "\n\n--- TOTAL TORNILLERIA ESQUINA MURO "
            (itoa m1)
            " CON MURO "
            (itoa m2)
            " ---"
          )
        )
        (_imprimir-resumen-consolidado (_consolidar-items-por-id itemsCorner))

        (setq itemsTotal (append itemsTotal itemsCorner))
      )

      (prompt "\n\n====================================")
      (prompt "\nTOTAL GENERAL TORNILLERIA")
      (prompt "\n====================================")
      (_imprimir-resumen-consolidado (_consolidar-items-por-id itemsTotal))
    )
  )

  (princ)
)

; =========================================================
; PATCH - LISTAR_DESPIECE INCLUYE TORNILLERIA
;         + COMANDO PARA GENERAR/INSERTAR MURO COMPLETO
; =========================================================




(defun c:LISTAR_DESPIECE_SIN_TORNILLERIA (/ lista itemsRectos regsEsquinas itemsEsquinas itemsTotales)
  ;; Por si quieres conservar el listado antiguo solo de piezas.
  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (setq itemsRectos   (_generar-piezas-rectas lista))
      (setq regsEsquinas  (_generar-registros-esquinas lista))
      (setq itemsEsquinas (_items-de-registros-esquinas regsEsquinas))
      (setq itemsTotales  (append itemsRectos itemsEsquinas))
      (_imprimir-despiece-consolidado-global itemsTotales)
      (_imprimir-resumen-madera lista)
    )
  )
  (princ)
)

(defun _insertar-cols-rectas-o-compensacion (cols / c pt ang blk ok nok)
  (setq ok 0)
  (setq nok 0)

  (foreach c cols
    (setq blk (_col-bloque c))
    (setq pt  (_punto-insercion-colocacion-3d c))
    (setq ang (_angulo-insercion-colocacion c))

    (if (_insertar-bloque-simple blk pt ang)
      (setq ok (1+ ok))
      (setq nok (1+ nok))
    )
  )

  (list ok nok)
)

(defun _insertar-cols-esquina (cols / c pt ang blk ok nok)
  (setq ok 0)
  (setq nok 0)

  (foreach c cols
    (setq blk (_cesq-bloque c))
    (setq pt  (_pt+z (_cesq-punto c) (_cesq-z0 c)))
    (setq ang (_cesq-ang c))

    (if (_insertar-bloque-simple blk pt ang)
      (setq ok (1+ ok))
      (setq nok (1+ nok))
    )
  )

  (list ok nok)
)



(defun c:INSERTAR_BLOQUES_COMPLETO_PLANTA ()
  ;; Alias por si lo quieres llamar con nombre mas descriptivo.
  (c:GENERAR_MURO_COMPLETO)
)

(prompt "\n>>> PATCH DESPIECE CON TORNILLERIA + GENERAR_MURO_COMPLETO CARGADO <<<")

; =========================================================
; PATCH STOCK: PRIORIDAD FLEXIBLE A COMPENSACIONES
; Si hay stock limitado, se intenta reservar primero para compensaciones.
; Si con esa reserva no se puede resolver el pano recto, se rehace el calculo
; en modo normal para que la limitacion pueda afectar tambien a compensaciones.
; =========================================================

(defun _stock-reservar-items-despiece (items / it id cant)
  (foreach it items
    (setq id (_despiece-id it))
    (setq cant (_despiece-cant it))
    (if (and id cant)
      (_stock-sumar-consumo-id id cant)
    )
  )
)

(defun _hay-col-recta-muro-cara-p (cols id cara / ok c)
  (setq ok nil)
  (foreach c cols
    (if (and (= (_col-muro c) id) (= (_col-cara c) cara))
      (setq ok T)
    )
  )
  ok
)

(defun _cols-rectas-completas-p (cols lista / ok muro aj caras id longBase longOpuesta)
  (setq ok T)
  (foreach muro lista
    (setq aj (_ajustar-muro-por-extremos-v2 muro lista))
    (setq caras (nth 8 muro))
    (setq id (_muro-id muro))
    (setq longBase (_longitud-util-cara-muro muro aj lista "BASE"))
    (if (and (> (_longitud-modular-encofrado longBase) 0.0)
             (null (_hay-col-recta-muro-cara-p cols id "BASE")))
      (setq ok nil)
    )
    (if (= caras 2)
      (progn
        (setq longOpuesta (_longitud-util-cara-muro muro aj lista "OPUESTA"))
        (if (and (> (_longitud-modular-encofrado longOpuesta) 0.0)
                 (null (_hay-col-recta-muro-cara-p cols id "OPUESTA")))
          (setq ok nil)
        )
      )
    )
  )
  ok
)

(defun _hay-item-recto-muro-cara-p (items id cara / ok it)
  (setq ok nil)
  (foreach it items
    (if (and (= (_despiece-origen it) "RECTO")
             (= (_despiece-muro it) id)
             (= (_despiece-cara it) cara))
      (setq ok T)
    )
  )
  ok
)

(defun _items-rectos-completos-p (items lista / ok muro aj caras id longBase longOpuesta)
  (setq ok T)
  (foreach muro lista
    (setq aj (_ajustar-muro-por-extremos-v2 muro lista))
    (setq caras (nth 8 muro))
    (setq id (_muro-id muro))
    (setq longBase (_longitud-util-cara-muro muro aj lista "BASE"))
    (if (and (> (_longitud-modular-encofrado longBase) 0.0)
             (null (_hay-item-recto-muro-cara-p items id "BASE")))
      (setq ok nil)
    )
    (if (= caras 2)
      (progn
        (setq longOpuesta (_longitud-util-cara-muro muro aj lista "OPUESTA"))
        (if (and (> (_longitud-modular-encofrado longOpuesta) 0.0)
                 (null (_hay-item-recto-muro-cara-p items id "OPUESTA")))
          (setq ok nil)
        )
      )
    )
  )
  ok
)

(defun _generar-cols-stock-comp-preferente (lista / consumo0 colsComp colsRectas colsEsq ok)
  (setq consumo0 *STOCK-CONSUMO-CALCULO*)

  ;; Intento 1: compensaciones primero, para que la limitacion parcial les afecte lo menos posible.
  (setq *STOCK-CONSUMO-CALCULO* consumo0)
  (setq colsComp   (_generar-colocaciones-compensaciones lista))
  (setq colsRectas (_generar-colocaciones-rectas lista))
  (setq ok (_cols-rectas-completas-p colsRectas lista))

  ;; Fallback: si el pano recto no encuentra solucion, no reservamos antes la compensacion.
  ;; Asi la limitacion puede recaer en la compensacion si es la unica forma de resolver el resto.
  (if (null ok)
    (progn
      (prompt "\nAVISO STOCK: con prioridad a compensaciones no se resuelve algun pano recto. Se recalcula permitiendo que el limite afecte a compensaciones.")
      (setq *STOCK-CONSUMO-CALCULO* consumo0)
      (setq colsRectas (_generar-colocaciones-rectas lista))
      (setq colsComp   (_generar-colocaciones-compensaciones lista))
    )
  )

  (setq colsEsq (_generar-colocaciones-esquinas lista))

  (list
    (cons "RECTAS" colsRectas)
    (cons "COMP"   colsComp)
    (cons "ESQ"    colsEsq)
  )
)

(defun _generar-despiece-stock-comp-preferente (lista / consumo0 regsEsquinas itemsEsquinas itemsRectos ok)
  (setq consumo0 *STOCK-CONSUMO-CALCULO*)

  ;; Intento 1: esquinas/compensaciones primero.
  (setq *STOCK-CONSUMO-CALCULO* consumo0)
  (setq regsEsquinas  (_generar-registros-esquinas lista))
  (setq itemsEsquinas (_items-de-registros-esquinas regsEsquinas))
  (_stock-reservar-items-despiece itemsEsquinas)
  (setq itemsRectos (_generar-piezas-rectas lista))
  (setq ok (_items-rectos-completos-p itemsRectos lista))

  ;; Fallback: si no hay solucion en rectos, orden normal.
  (if (null ok)
    (progn
      (prompt "\nAVISO STOCK: con prioridad a compensaciones no se resuelve algun pano recto. Se recalcula permitiendo que el limite afecte a compensaciones.")
      (setq *STOCK-CONSUMO-CALCULO* consumo0)
      (setq itemsRectos   (_generar-piezas-rectas lista))
      (setq regsEsquinas  (_generar-registros-esquinas lista))
      (setq itemsEsquinas (_items-de-registros-esquinas regsEsquinas))
    )
  )

  (list
    (cons "RECTOS" itemsRectos)
    (cons "REGS" regsEsquinas)
    (cons "ESQUINAS" itemsEsquinas)
  )
)

(defun _generar-items-tornilleria-unica-global
  (lista / datos colsRectas colsEsq colsComp esquinas
           muro id colsRectasM
           itemsTotal itemsMisma itemsBandas itemsCaras itemsMuro
           e colsEsqE colsCompE colsRectasE
           itemsEsq itemsComp itemsCompComp itemsCompAlt
           itemsAngExt itemsAngInt itemsAngIntEntreSi
           itemsCorner)

  (setq datos      (_generar-cols-stock-comp-preferente lista))
  (setq colsRectas (cdr (assoc "RECTAS" datos)))
  (setq colsComp   (cdr (assoc "COMP" datos)))
  (setq colsEsq    (cdr (assoc "ESQ" datos)))
  (setq esquinas   (_recolectar-esquinas-unicas lista))
  (setq itemsTotal '())

  ;; 1) Tornilleria de tramos rectos por muro
  (foreach muro lista
    (setq id (_muro-id muro))
    (setq colsRectasM (_filtrar-cols-por-id-muro colsRectas id))

    (setq itemsMisma
      (_calcular-mordazas-misma-banda colsRectasM (list muro))
    )

    (setq itemsBandas
      (_calcular-mordazas-entre-bandas colsRectasM (list muro))
    )

    (setq itemsCaras
      (_calcular-union-entre-caras colsRectasM (list muro))
    )

    (setq itemsMuro
      (append
        itemsMisma
        itemsBandas
        itemsCaras
      )
    )

    (setq itemsTotal
      (append itemsTotal itemsMuro)
    )
  )

  ;; 2) Tornilleria de esquinas/compensaciones una sola vez por esquina
  (foreach e esquinas
    (setq colsEsqE    (_cols-esq-de-esquina colsEsq e))
    (setq colsCompE   (_cols-comp-de-esquina colsComp e))
    (setq colsRectasE (_cols-rectas-de-esquina colsRectas e))

    ;; A. Mordazas del angulo interior contra los panos rectos
    (setq itemsEsq
      (_calcular-mordazas-esquinas-por-esquina colsEsqE colsRectasE e)
    )

    ;; A2. Union entre angulos interiores
    (setq itemsAngIntEntreSi
      (_calcular-union-angulos-interiores-entre-si colsEsqE)
    )

    ;; B. Mordazas compensacion con banda recta
    (setq itemsComp
      (_calcular-mordazas-compensaciones colsCompE colsRectasE)
    )

    ;; C. Mordazas entre chapas de una misma compensacion
    (setq itemsCompComp
      (_calcular-mordazas-entre-chapas-compensacion colsCompE)
    )

    ;; C2. Mordazas entre compensaciones apiladas en altura
    (setq itemsCompAlt
      (_calcular-mordazas-compensacion-entre-alturas colsCompE)
    )

    ;; D. Tornilleria angulo exterior + compensacion
    (setq itemsAngExt
      (_calcular-tornilleria-angulos-exteriores colsEsqE)
    )

    ;; E. Davidad/tuercas angulo interior + compensacion
    (setq itemsAngInt
      (_calcular-union-angulos-interiores-compensacion-por-esquina
        lista colsEsqE colsRectasE e)
    )

    (setq itemsCorner
      (append
        itemsEsq
        itemsAngIntEntreSi
        itemsComp
        itemsCompComp
        itemsCompAlt
        itemsAngExt
        itemsAngInt
      )
    )

    (setq itemsTotal
      (append itemsTotal itemsCorner)
    )
  )

  itemsTotal
)

(defun c:LISTAR_DESPIECE (/ lista datos itemsRectos regsEsquinas itemsEsquinas itemsPiezas itemsTorn itemsTotales)
  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (_stock-iniciar-calculo)
      (_stock-imprimir-limitaciones)

      (setq datos         (_generar-despiece-stock-comp-preferente lista))
      (setq itemsRectos   (cdr (assoc "RECTOS" datos)))
      (setq regsEsquinas  (cdr (assoc "REGS" datos)))
      (setq itemsEsquinas (cdr (assoc "ESQUINAS" datos)))
      (setq itemsPiezas   (append itemsRectos itemsEsquinas))

      ;; Tornilleria recalculada con la misma preferencia de stock.
      (_stock-iniciar-calculo)
      (setq itemsTorn (_generar-items-tornilleria-unica-global lista))

      (prompt "\n===== DESPIECE CONSOLIDADO GLOBAL CON TORNILLERIA =====")
      (prompt "\nCRITERIO STOCK: compensaciones con prioridad flexible; si el resto no tiene solucion, la limitacion puede afectar a compensaciones.")
      (prompt "\n\n--- PIEZAS / ENCOFRADO ---")
      (_imprimir-resumen-consolidado (_consolidar-despiece itemsPiezas))
      (prompt "\n\n--- TORNILLERIA / ACCESORIOS ---")
      (_imprimir-resumen-consolidado (_consolidar-items-por-id itemsTorn))
      (prompt "\n\n--- TOTAL GENERAL DESPIECE + TORNILLERIA ---")
      (setq itemsTotales (append itemsPiezas itemsTorn))
      (_imprimir-resumen-consolidado (_consolidar-despiece itemsTotales))
      (_imprimir-resumen-madera lista)
    )
  )
  (princ)
)

(defun c:GENERAR_MURO_COMPLETO (/ lista datos colsRectas colsComp colsEsq colsMadera r1 r2 r3 r4 r5 ok nok)
  (setq ok 0)
  (setq nok 0)
  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (_stock-iniciar-calculo)
      (_stock-imprimir-limitaciones)
      (setq datos (_generar-cols-stock-comp-preferente lista))
      (setq colsRectas (cdr (assoc "RECTAS" datos)))
      (setq colsComp   (cdr (assoc "COMP" datos)))
      (setq colsEsq    (cdr (assoc "ESQ" datos)))
      (setq colsMadera
        (append
          (_generar-colocaciones-madera lista)
          (_generar-colocaciones-madera-compensaciones lista)
        )
      )

      (prompt "\n===== GENERANDO MURO COMPLETO =====")
      (prompt "\nCRITERIO STOCK: compensaciones con prioridad flexible.")

      (setq r1 (_insertar-cols-rectas-o-compensacion colsRectas))
      (setq ok  (+ ok  (car r1)))
      (setq nok (+ nok (cadr r1)))
      (prompt (strcat "\nRectos insertados: " (itoa (car r1)) " | Fallidos: " (itoa (cadr r1))))

      (setq r2 (_insertar-cols-rectas-o-compensacion colsComp))
      (setq ok  (+ ok  (car r2)))
      (setq nok (+ nok (cadr r2)))
      (prompt (strcat "\nCompensaciones insertadas: " (itoa (car r2)) " | Fallidas: " (itoa (cadr r2))))

      (setq r3 (_insertar-cols-esquina colsEsq))
      (setq ok  (+ ok  (car r3)))
      (setq nok (+ nok (cadr r3)))
      (prompt (strcat "\nEsquinas insertadas: " (itoa (car r3)) " | Fallidas: " (itoa (cadr r3))))

      (setq r5 (_dibujar-angulos-interiores-oblicuos lista))
      (setq ok  (+ ok  (car r5)))
      (setq nok (+ nok (cadr r5)))
      (prompt (strcat "\nAngulos interiores oblicuos dibujados: " (itoa (car r5)) " | Fallidos: " (itoa (cadr r5))))

      (setq r4 (_dibujar-colocaciones-madera colsMadera))
      (setq ok  (+ ok  (car r4)))
      (setq nok (+ nok (cadr r4)))
      (prompt (strcat "\nTramos de madera dibujados: " (itoa (car r4)) " | Fallidos: " (itoa (cadr r4))))

      (prompt (strcat "\nTOTAL insertados: " (itoa ok) " | Fallidos: " (itoa nok)))
    )
  )
  (princ)
)









; =========================================================
; PATCH FINAL - PRESUPUESTO HTML A4 SIN CADENAS FIJAS
; Comando: GENERAR_PRESUPUESTO
; =========================================================

(defun _html-escape (s / r i ch)
  (if (null s) (setq s ""))
  (setq r "")
  (setq i 1)
  (while (<= i (strlen s))
    (setq ch (substr s i 1))
    (setq r
      (strcat r
        (cond
          ((= ch "&") "&amp;")
          ((= ch "<") "&lt;")
          ((= ch ">") "&gt;")
          ((= ch "\"") "&quot;")
          (T ch)
        )
      )
    )
    (setq i (1+ i))
  )
  r
)

(defun _fmt-eur (v)
  (strcat (rtos v 2 2) " &euro;")
)

(defun _presu-write-css (f imprimirFondo)
  (write-line "<style>" f)
  (write-line
    ":root {
        --borde-presu: 0.75px solid #444;
      }"
    f
  )
  (write-line "@page { size: A4; margin: 0mm; }" f)
  (write-line "* { box-sizing: border-box; }" f)
  (write-line "html, body { width: 210mm; height: 297mm; margin: 0; padding: 0; }" f)

  (write-line
    "body {
      font-family: Arial, Helvetica, sans-serif;
      color: #222;
      font-size: 12px;
      
    }"
    f
  )

  (write-line
    ".hoja-presupuesto {
      width: 210mm;
      height: 297mm;
      margin: 0;
      padding: 0;
      overflow: hidden;
      page-break-after: always;
    }"
    f
  )

  (write-line ".hoja-presupuesto:last-child { page-break-after: auto; }" f)

  (write-line
    ".page {
      width: 190mm;
      height: 230mm;
      margin: 60mm auto 0 auto;
      position: relative;
      z-index: 0;
    }"
    f
  )
  (if imprimirFondo
    (write-line
    ".page::before {
        content: '';
        position: absolute;
        left: -10mm;
        top: -40mm;
        width: 210mm;
        height: 297mm;
        background-image:url('fondo.jpg');
        background-size:210mm 297mm;
        background-repeat:no-repeat;
        background-position:top center;
        z-index:-1;
      }"
    f
  )
  )

  (write-line
    ".caja-presupuesto {
      position: absolute;
      left: 0mm;
      right: 0mm;
      top: 47mm;
      bottom: 40mm;
      border-left: none;
      border-right: none;
      pointer-events: none;
    }"
    f
  )

  (write-line ".header { padding-bottom: 10px; margin-bottom: 18px; }" f)

  (write-line
    ".datos-superiores {
      width: 83mm;
      margin-left: auto;
      margin-right: 0mm;
      margin-top: -18mm;
      margin-bottom: 8mm;
      font-size: 11px;
      line-height: 1.15;
      border: var(--borde-presu);
      padding: 6px 8px;
      background: rgba(255,255,255,0.75);
      border-radius: 0px;
    }"
    f
  )

  (write-line ".datos-superiores p { margin: 0 0 3px 0; }" f)
  (write-line "h1 { margin: 0; font-size: 18px; letter-spacing: 0.5px; }" f)

  ;; ALTURAS FIJAS SEGUN TIPO DE HOJA
  (write-line
    ".tabla-wrapper {
      overflow: hidden;
      position: relative;
    }"
    f
  )

  (write-line
    ".tabla-con-notas {
      height: 150mm;
    }"
    f
  )

  (write-line
    ".tabla-sin-notas {
      height: 175mm;
    }"
    f
  )

  ;; TABLA PRESUPUESTO
  (write-line
    "table {
      width: 100%;
      border-collapse: collapse;
      border-spacing: 0;
      margin-top: 8px;
      border-left: none;
      border-right: none;
    }"
    f
  )

  (write-line ".tabla-wrapper table { margin-top: 8px; margin-bottom: 0; }" f)
  (write-line ".col-desc    { width: 56%; }" f)
  (write-line ".col-cant    { width: 8%; }" f)
  (write-line ".col-dias    { width: 8%; }" f)
  (write-line ".col-precio  { width: 14%; }" f)
  (write-line ".col-importe { width: 14%; }" f)
  (write-line ".tabla-presupuesto { table-layout: fixed; }" f)
  

(write-line
  "th {
      background: #fff;
      color: #000;
      padding: 6px;
      border-top: var(--borde-presu);
      border-bottom: var(--borde-presu);
      border-right: var(--borde-presu);
      border-left: none;
      font-size: 10px;
      font-weight: bold;
    }"
  f
)
  (write-line
  "th:first-child {
      border-left: var(--borde-presu);
    }"
  f
)

  ;; FILAS DE ALTURA FIJA


(write-line
  ".tabla-presupuesto td {
      border-top: none;
      border-bottom: none;
      border-right: var(--borde-presu);
      padding: 4px 5px;
      vertical-align: top;
      font-size: 10px;
      white-space: nowrap;
      overflow: hidden;
    }"
  f
)
(write-line
 ".tabla-presupuesto td:first-child {
  border-left: var(--borde-presu);
 }"
 f
)



  (write-line
    ".fila-vacia td {
      color: transparent;
    }"
    f
  )
  (write-line
    ".cierre-sin-notas td {
        border-bottom: var(--borde-presu);
      }"
    f
  )

  (write-line ".desc { font-weight: normal; }" f)
  (write-line ".num { text-align: right; white-space: nowrap; }" f)

  (write-line
    ".separador-transporte td {
      border-top: none;
      border-bottom: none;
      border-right: var(--borde-presu);
      height: 7mm;
      padding: 0;
    }"
    f
  )
  (write-line
   ".separador-transporte td:first-child {
   border-left: var(--borde-presu);
   }"
   f
  )

  ;; NOTAS
  (write-line
    ".nota {
      width: 100%;
      margin: 0;
      margin-top: -1px;
      border-collapse: collapse;
      border-spacing: 0;
  }"
    f
  )
  (write-line
    ".nota td {
      border: var(--borde-presu);
      padding: 6px;
      font-size: 9px;
      color: #444;
      line-height: 1.20;
  }"
    f
  )

  ;; TOTALES
  (write-line ".marco-totales { width: 70mm; margin-left: auto; margin-top: -9px; padding: 0; }" f)
(write-line
  ".totales td {
      padding: 4px 5px;
      border-bottom: var(--borde-presu);
      border-top: none;
      border-left: none;
      border-right: none;
    }"
  f
)

(write-line
  ".totales td:first-child {
      border-left: var(--borde-presu);
      border-right: var(--borde-presu);
    }"
  f
)

(write-line
  ".totales td:last-child {
      border-right: var(--borde-presu);
    }"
  f
)

(write-line
  ".totales tr:first-child td {
      border-top: var(--borde-presu);
    }"
  f
)	  
  (write-line ".label { font-weight: normal; text-align: left; background: #fff; }" f)
  (write-line ".total-final td { background: #444; color: #fff; font-size: 10px; font-weight: bold; padding: 4px 5px; }" f)
  (write-line ".hoja-dibujo { width: 210mm; height: 297mm; page-break-before: always; }" f)
  (write-line ".page-dibujo { width: 190mm; height: 230mm; margin: 55mm auto 0 auto; position: relative; z-index: 0; }" f)
  (write-line ".vista-dibujo { width: 100%; height: 185mm; border: var(--borde-presu); margin-top: 3mm; padding: 0; text-align: center; background: #fff; overflow: hidden; display: flex; align-items: center; justify-content: center; }" f)
  (write-line ".vista-dibujo img { width: 100%; height: 100%; object-fit: contain; transform: scale(1.35); transform-origin: center center; filter: invert(1) grayscale(1) contrast(1.25); }" f)

  (write-line
    "@media print {
      body { margin: 0; }
      body.presupuesto-sin-fondo .hoja-presupuesto {
        transform: translate(5mm, 2mm) rotate(180deg);
        transform-origin: 105mm 148.5mm;
      }
    }"
    f
  )
  (write-line "</style>" f)
)
(defun _presu-write-linea-item (f reg dias / id cant pieza desc precio impTotal)
  (setq id    (car reg))
  (setq cant  (cdr reg))
  (setq pieza (_buscar-pieza-por-id id))
  (setq desc  (if pieza (_cat-codigo pieza) id))
  (setq precio (if pieza (_cat-precio pieza) 0.0))
  (setq impTotal (* cant precio dias))

  (write-line
    (strcat
      "<tr>"
      "<td class='col-desc desc'>" (_html-escape desc) "</td>"
      "<td class='col-cant num'>" (itoa cant) "</td>"
      "<td class='col-dias num'>" (rtos dias 2 0) "</td>"
      "<td class='col-precio num'>" (_fmt-eur precio) "</td>"
      "<td class='col-importe num'>" (_fmt-eur impTotal) "</td>"
      "</tr>"
    )
    f
  )

  impTotal
)
(defun _filtrar-extras-por-tipo (extras tipo / res reg)
  (setq res '())
  (foreach reg extras
    (if (= (cdr (assoc "TIPO" reg)) tipo)
      (setq res (append res (list reg)))
    )
  )
  res
)

(defun _presu-subtotal-alquiler-extra-solo-articulos (extras dias / total reg cant precio)
  (setq total 0.0)

  (foreach reg extras
    (if (= (cdr (assoc "TIPO" reg)) "ALQUILER")
      (progn
        (setq cant   (cdr (assoc "CANT" reg)))
        (setq precio (cdr (assoc "PRECIO" reg)))
        (setq total (+ total (* cant dias precio)))
      )
    )
  )

  total
)
(defun _presu-write-tabla-unica (f lineasPagina dias obra llevaNotas / linea total maxFilas relleno n)
  (setq total 0.0)

  (setq maxFilas
    (if llevaNotas
      28
      32
    )
  )

  (write-line
    (if llevaNotas
      "<div class='tabla-wrapper tabla-con-notas'>"
      "<div class='tabla-wrapper tabla-sin-notas'>"
    )
    f
  )

  (write-line "<table class='tabla-presupuesto'>" f)
  (write-line "<thead>" f)
  (write-line "<tr>" f)
  (write-line "<th class='col-desc'>Denominacion</th>" f)
  (write-line "<th class='col-cant'>Unidades</th>" f)
  (write-line "<th class='col-dias'>Dias</th>" f)
  (write-line "<th class='col-precio'>P. dia</th>" f)
  (write-line "<th class='col-importe'>Importe</th>" f)
  (write-line "</tr>" f)
  (write-line "</thead>" f)
  (write-line "<tbody>" f)

  ;; Lineas reales
  (foreach linea lineasPagina
    (setq total (+ total (_presu-write-linea-final f linea dias obra)))
  )

  ;; Lineas vacias reales hasta completar 25 o 30
  (setq relleno (- maxFilas (length lineasPagina)))
  (prompt
	  (strcat
	    "\n[PRESU DEBUG]"
	    " | llevaNotas: " (if llevaNotas "SI" "NO")
	    " | lineas reales: " (itoa (length lineasPagina))
	    " | lineas vacias: " (itoa relleno)
	    " | total filas: " (itoa (+ (length lineasPagina) relleno))
	  )
	)
  (setq n 0)

  (while (< n relleno)
    (if (and (= n (1- relleno)) (not llevaNotas))
      (write-line
        "<tr class='fila-vacia cierre-sin-notas'><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>"
        f
      )
      (write-line
        "<tr class='fila-vacia'><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>"
        f
      )
    )
    (setq n (1+ n))
  )

  (write-line "</tbody>" f)
  (write-line "</table>" f)
  (write-line "</div>" f)

  total
)
(defun _presu-write-nota (f transporte)
  (write-line "<table class='nota'><tr><td>" f)
  (write-line "-IVA no incluido.<br>" f)
  (write-line "-Este presupuesto tendr&aacute; validez siempre y cuando exista cobertura del riesgo de impago en nuestra aseguradora.<br>" f)
  (write-line "-Se cobrar&aacute; por d&iacute;a natural.<br>" f)
  (write-line "-Alquiler m&iacute;nimo de 10 d&iacute;as. <br>" f)
  (write-line "-Todo material no devuelto o devuelto en  mal estado se pasar&aacute; cargo adicional.<br>" f)
  (write-line "-En caso de no colocar tapones en los orificios sin davidad, se facturar&aacute; la limpieza correspondiente.<br>" f)
  (write-line "-Por inclemencias metereol&oacute;gicas no se descontar&aacute;n dias de alquiler.<br>" f)
  (write-line "-Toda baja realizada en el d&iacute;a (independientemente de la hora) el d&iacute;a se contemplar&aacute a efectos de facturaci&oacute;n.<br>" f)
  (write-line "-Si el transporte se realiza con sus medios, el material deber&aacute ser devuelto en nuestras instalaciones en Binefar.<br>" f)
  (if (= transporte 0.0)
  	(write-line "-El transporte de entrega y recogida no est&aacute; incluido.<br>" f)

  	(write-line "-Deber&aacute; haber alg&uacute;n representante por parte del cliente tanto en la entrega como en la recogida del material para firmar el albar&aacute;n y dar conformidad al material entregado o recogido. En la recogida, el material deber&aacute; estar ordenado de la misma forma en que se entreg&oacute;. En caso de tener que ordenar la carga para poder realizar el transporte, se facturar&aacute;n las horas de trabajo. Toda carga en obra que supere una hora de trabajo se facturar&aacute; a 64&#8364;/hora." f)
  )

  (write-line "</td></tr></table>" f)
)

(defun _presu-write-totales (f subtotal / totalIva)

  (setq totalIva subtotal)

  (write-line "<div class='marco-totales'>" f)
  (write-line "<table class='totales'>" f)

(write-line
  (strcat
    "<tr>"
    "<td class='num' style='font-weight:bold;'>TOTAL</td>"
    "<td class='num' style='font-weight:bold;'>"
    (_fmt-eur totalIva)
    "</td>"
    "</tr>"
  )
  f
)

  (write-line "</table>" f)
  (write-line "</div>" f)
)

(defun _presu-write-cabecera-pagina (f cliente obra fecha)
  (write-line "<div class='hoja-presupuesto'>" f)
  (write-line "<div class='page'>" f)

  (write-line "<div class='datos-superiores'>" f)
  (write-line (strcat "<p><strong>Cliente:</strong> " (_html-escape (strcase cliente)) "</p>") f)
  (write-line (strcat "<p><strong>Obra:</strong> " (_html-escape (strcase obra)) "</p>") f)
  (write-line (strcat "<p><strong>Fecha:</strong> " (_html-escape fecha) "</p>") f)
  (write-line "</div>" f)

  (write-line "<div class='header'>" f)
  (write-line "<h1>PRESUPUESTO DE ALQUILER DE ENCOFRADO</h1>" f)
  (write-line "</div>" f)

  (_write-stock-html-presu f)
  (write-line "<div class='caja-presupuesto'></div>" f)
)

(defun _presu-path-url (path / s i ch)
  (setq s "")
  (setq i 1)
  (while (<= i (strlen path))
    (setq ch (substr path i 1))
    (setq s
      (strcat s
        (cond
          ((= ch "\\") "/")
          ((= ch " ") "%20")
          (T ch)
        )
      )
    )
    (setq i (1+ i))
  )
  s
)

(defun _presu-ruta-vista-desde-presupuesto (path / dir base)
  (setq dir (vl-filename-directory path))
  (setq base (vl-filename-base path))
  (strcat dir "\\" base "_vista.jpg")
)

(defun _presu-color-fondo-modelo (/ prefs display colors color)
  (setq color nil)
  (vl-catch-all-apply
    '(lambda ()
      (setq prefs (vlax-get-property (vlax-get-acad-object) 'Preferences))
      (setq display (vlax-get-property prefs 'Display))
      (setq color (vlax-get-property display 'GraphicsWinModelBackgrndColor))
    )
  )
  color
)

(defun _presu-set-color-fondo-modelo (color / prefs display)
  (vl-catch-all-apply
    '(lambda ()
      (setq prefs (vlax-get-property (vlax-get-acad-object) 'Preferences))
      (setq display (vlax-get-property prefs 'Display))
      (vlax-put-property display 'GraphicsWinModelBackgrndColor color)
      (vla-Regen (vla-get-ActiveDocument (vlax-get-acad-object)) acAllViewports)
    )
  )
)

(defun _presu-capturar-vista-jpgout (pathImg / oldFiledia oldCmddia oldBg ss err)
  (setq oldFiledia (getvar "FILEDIA"))
  (setq oldCmddia (getvar "CMDDIA"))
  (setq oldBg (_presu-color-fondo-modelo))

  (if (findfile pathImg)
    (vl-file-delete pathImg)
  )

  (setvar "FILEDIA" 0)
  (setvar "CMDDIA" 0)
  (_presu-set-color-fondo-modelo 16777215)

  (setq ss (ssget "_X"))

  (setq err
    (vl-catch-all-apply
      '(lambda ()
        (if ss
          (command "_.JPGOUT" pathImg ss "")
        )
      )
    )
  )

  (while (> (getvar "CMDACTIVE") 0)
    (command)
  )

  (setvar "FILEDIA" oldFiledia)
  (setvar "CMDDIA" oldCmddia)
  (if oldBg
    (_presu-set-color-fondo-modelo oldBg)
  )

  (if (and (not (vl-catch-all-error-p err)) (findfile pathImg))
    (progn
      (prompt (strcat "\nImagen de vista creada con JPGOUT: " pathImg))
      pathImg
    )
    nil
  )
)

(defun _presu-capturar-vista-plot (pathImg / oldFiledia oldCmddia oldBack err)
  (setq oldFiledia (getvar "FILEDIA"))
  (setq oldCmddia (getvar "CMDDIA"))
  (setq oldBack (getvar "BACKGROUNDPLOT"))

  (if (findfile pathImg)
    (vl-file-delete pathImg)
  )

  (setvar "FILEDIA" 0)
  (setvar "CMDDIA" 0)
  (setvar "BACKGROUNDPLOT" 0)

  (setq err
    (vl-catch-all-apply
      '(lambda ()
        (command
          "_.-PLOT"
          "_Yes"
          ""
          "PublishToWeb JPG.pc3"
          ""
          ""
          "_No"
          "_Display"
          "_Fit"
          "_Center"
          "_Yes"
          "monochrome.ctb"
          "_Yes"
          "_As displayed"
          pathImg
          "_No"
          "_Yes"
        )
      )
    )
  )

  (setvar "FILEDIA" oldFiledia)
  (setvar "CMDDIA" oldCmddia)
  (setvar "BACKGROUNDPLOT" oldBack)

  (while (> (getvar "CMDACTIVE") 0)
    (command)
  )

  (if (and (not (vl-catch-all-error-p err)) (findfile pathImg))
    (progn
      (prompt (strcat "\nImagen de vista creada: " pathImg))
      pathImg
    )
    (progn
      (if (vl-catch-all-error-p err)
        (prompt (strcat "\nError AutoCAD al capturar vista: " (vl-catch-all-error-message err)))
      )
      nil
    )
  )
)

(defun _presu-capturar-vista-actual (pathImg / img)
  (setq img (_presu-capturar-vista-jpgout pathImg))

  (if (null img)
    (progn
      (prompt "\nJPGOUT no pudo crear la imagen. Probando captura por trazado...")
      (setq img (_presu-capturar-vista-plot pathImg))
    )
  )

  img
)

(defun _presu-write-hoja-dibujo (f cliente obra fecha imagenVista)
  (write-line "<div class='hoja-presupuesto hoja-dibujo'>" f)
  (write-line "<div class='page page-dibujo'>" f)

  (write-line "<div class='datos-superiores'>" f)
  (write-line (strcat "<p><strong>Cliente:</strong> " (_html-escape (strcase cliente)) "</p>") f)
  (write-line (strcat "<p><strong>Obra:</strong> " (_html-escape (strcase obra)) "</p>") f)
  (write-line (strcat "<p><strong>Fecha:</strong> " (_html-escape fecha) "</p>") f)
  (write-line "</div>" f)

  (write-line "<div class='header'>" f)
  (write-line "<h1>VISTA DEL DIBUJO DEL ENCOFRADO</h1>" f)
  (write-line "</div>" f)

  (write-line "<div class='vista-dibujo'>" f)
  (write-line
    (strcat
      "<img src='file:///"
      (_html-escape (_presu-path-url imagenVista))
      "' alt='Vista del dibujo del encofrado'>"
    )
    f
  )
  (write-line "</div>" f)

  (write-line "</div>" f)
  (write-line "</div>" f)
)

(defun _generar-datos-presupuesto-final (lista / datos itemsRectos regsEsquinas itemsEsquinas itemsPiezas itemsTorn itemsTotales)
  (_stock-iniciar-calculo)
  (setq datos         (_generar-despiece-stock-comp-preferente lista))
  (setq itemsRectos   (cdr (assoc "RECTOS" datos)))
  (setq regsEsquinas  (cdr (assoc "REGS" datos)))
  (setq itemsEsquinas (cdr (assoc "ESQUINAS" datos)))
  (setq itemsPiezas   (append itemsRectos itemsEsquinas))

  (_stock-iniciar-calculo)
  (setq itemsTorn (_generar-items-tornilleria-unica-global lista))

  (setq itemsTotales (append itemsPiezas itemsTorn))

  ;; AÑADIR SIEMPRE 1 GANCHO PARA COLOCAR CHAPAS
  (setq itemsTotales
  (append
    itemsTotales
    (list
      (list
        (cons "ID" "039")
        (cons "CANT" 1)
      )
    )
  )
)

  (_consolidar-despiece itemsTotales)
)

(defun _write-stock-html-presu (f / reg id cant pieza desc)
  (if *STOCK-LIMITADO*
    (progn
      (write-line "<div class='stock'>" f)
      (write-line "<strong>Stock limitado activo:</strong>" f)
      (write-line "<ul>" f)
      (foreach reg (_ordenar-resumen-por-id *STOCK-LIMITADO*)
        (setq id (car reg))
        (setq cant (cdr reg))
        (setq pieza (_buscar-pieza-por-id id))
        (setq desc (if pieza (_cat-codigo pieza) id))
        (write-line
          (strcat "<li>" (_html-escape desc) " &rarr; MAX " (itoa cant) "</li>")
          f
        )
      )
      (write-line "</ul>" f)
      (write-line "</div>" f)
    )
  )
)

(defun _write-presupuesto-html-a4-final
       (path cliente obra dias transporte ventasPVC alquilerExtra resumenTotal imprimirFondo imagenVista
        / f fecha lineasFinales paginas numPag idx pagina ultima subtotal alquilerBase seguroRC)

  (setq f (open path "w"))

  (if (null f)
    nil
    (progn
      (setq fecha (menucmd "M=$(edtime,$(getvar,date),DD/MO/YYYY)"))

      (setq alquilerBase
        (+ (_presu-subtotal-resumen resumenTotal dias)
           (_presu-subtotal-alquiler-extra-solo-articulos alquilerExtra dias))
      )

      (setq seguroRC (* alquilerBase 0.14))

      (setq subtotal
        (+ alquilerBase
           seguroRC
           10.0
           (_presu-subtotal-alquiler-extra
             (_filtrar-extras-por-tipo alquilerExtra "TASA")
             dias
           )
           (_presu-subtotal-ventas ventasPVC)
           (_presu-transporte-total transporte))
      )

      (setq lineasFinales
        (_presu-generar-lineas-finales
          resumenTotal
          dias
          alquilerExtra
          ventasPVC
          transporte
          obra
        )
      )

      (setq paginas (_presu-paginar-lineas lineasFinales))
      (setq numPag (length paginas))
      (setq idx 0)

      (write-line "<!DOCTYPE html>" f)
      (write-line "<html lang='es'>" f)
      (write-line "<head>" f)
      (write-line "<meta charset='utf-8'>" f)
      (write-line "<title>Presupuesto alquiler encofrado</title>" f)
      (_presu-write-css f imprimirFondo)
      (write-line "</head>" f)
      (if imprimirFondo
        (write-line "<body>" f)
        (write-line "<body class='presupuesto-sin-fondo'>" f)
      )

      (foreach pagina paginas
        (setq idx (1+ idx))
        (setq ultima (= idx numPag))

        (_presu-write-cabecera-pagina f cliente obra fecha)

        (_presu-write-tabla-unica f pagina dias obra ultima)

      

	(if ultima
	  (progn
	    (_presu-write-nota f transporte)
	    (_presu-write-totales f subtotal)
	  )
	)

	(write-line "</div>" f)
	(write-line "</div>" f)
      )

      (if (and imagenVista (/= imagenVista ""))
        (_presu-write-hoja-dibujo f cliente obra fecha imagenVista)
      )

      (write-line "</body>" f)
      (write-line "</html>" f)

      (close f)
      T
    )
  )
)
(defun c:GENERAR_PRESUPUESTO (/ lista cliente obra dias transporte ventasPVC alquilerExtra path resumenTotal ok resp imprimirFondo incluirVista imagenVista pathVista)
  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))

      (_stock-imprimir-limitaciones)

      (setq cliente (getstring T "\nCliente <SIN CLIENTE>: "))
      (if (= cliente "") (setq cliente "SIN CLIENTE"))

      (setq obra (getstring T "\nObra / referencia <SIN OBRA>: "))
      (if (= obra "") (setq obra "SIN OBRA"))

      (setq dias (getint "\nDias de alquiler <1>: "))
      (if (or (null dias) (<= dias 0))
        (setq dias 1)
      )

      ;; piezas manuales en alquiler
      (setq alquilerExtra (_pedir-alquiler-extra))

      ;; transporte
      (setq transporte (getreal "\nSi el transporte esta incluido indique el importe <0>: "))
      (if (null transporte)
        (setq transporte 0.0)
      )

      ;; venta PVC
      (setq ventasPVC (_pedir-pvc-venta))

      (initget "SI NO")
      (setq resp (getkword "\nImprimir fondo? [SI/NO] <SI>: "))
      (setq imprimirFondo (/= resp "NO"))

      (initget "SI NO")
      (setq resp (getkword "\nIncluir vista del dibujo en hoja aparte? [SI/NO] <NO>: "))
      (setq incluirVista (= resp "SI"))

      (setq path (getfiled "Guardar presupuesto HTML" "presupuesto_encofrado.html" "html" 1))

      (if (null path)
        (prompt "\nCancelado. No se genero presupuesto.")
        (progn
          (setq imagenVista nil)

          (if incluirVista
            (progn
              (setq pathVista (_presu-ruta-vista-desde-presupuesto path))
              (prompt (strcat "\nCapturando vista actual de AutoCAD: " pathVista))
              (setq imagenVista (_presu-capturar-vista-actual pathVista))

              (if (null imagenVista)
                (progn
                  (prompt "\nNo se pudo capturar automaticamente la vista actual con PublishToWeb JPG.pc3.")
                  (prompt (strcat "\nNo se genero la imagen: " pathVista))
                )
              )
            )
          )

          (setq resumenTotal (_generar-datos-presupuesto-final lista))

          (setq ok
            (_write-presupuesto-html-a4-final
              path
              cliente
              obra
              dias
              transporte
              ventasPVC
              alquilerExtra
              resumenTotal
              imprimirFondo
              imagenVista
            )
          )

          (if ok
            (progn
              (prompt (strcat "\nPresupuesto HTML generado: " path))
              (startapp "explorer" path)
            )
            (prompt "\nERROR: no se pudo escribir el archivo HTML.")
          )
        )
      )
    )
  )

  (princ)
)

(defun _acotar-alineada (p0 p1 offset / acad doc ms n pm ptDim dimObj)
  (setq p0 (list (car p0) (cadr p0) 0.0))
  (setq p1 (list (car p1) (cadr p1) 0.0))

  ;; normal perpendicular para separar la acotacion
  (setq n (_vec-unit (list (- (cadr p1) (cadr p0)) (- (car p0) (car p1)) 0.0)))
  (setq pm (_pmid p0 p1))
  (setq ptDim (_vec-add pm (_vec-scale n offset)))

  (setq acad (vlax-get-acad-object))
  (setq doc  (vla-get-ActiveDocument acad))
  (setq ms   (vla-get-ModelSpace doc))

  (setq dimObj
    (vla-AddDimAligned
      ms
      (vlax-3d-point p0)
      (vlax-3d-point p1)
      (vlax-3d-point ptDim)
    )
  )

  (if dimObj
    (progn
      (vla-Update dimObj)
      T
    )
    nil
  )
)
(defun c:ACOTAR_PLANTA_BASE (/ lista datos colsRectas colsComp colsMadera c muro dir ok nok)
  (setq ok 0)
  (setq nok 0)

  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (_stock-iniciar-calculo)

      (setq datos (_generar-cols-stock-comp-preferente lista))
      (setq colsRectas (cdr (assoc "RECTAS" datos)))
      (setq colsComp (_generar-colocaciones-compensaciones lista))
      (setq colsMadera (_generar-colocaciones-madera lista))

      ;; RECTOS: solo cara BASE
      (foreach c colsRectas
        (if (= (_col-cara c) "BASE")
          (progn
            (setq muro (_buscar-muro-por-id (_col-muro c) lista))
            (setq dir (_normal-exterior-cara muro "BASE"))

            (if (_acotar-alineada-hacia (_col-p0 c) (_col-p1 c) 50.0 dir)
              (setq ok (1+ ok))
              (setq nok (1+ nok))
            )
          )
        )
      )

      ;; ESQUINAS / COMPENSACIONES: también solo por la BASE del muro
      ;; y forzando la cota al mismo lado que las demás
      (foreach c colsComp
        (if (= (_col-cara c) "BASE")
          (progn
            (setq muro (_buscar-muro-por-id (_col-muro c) lista))
            (setq dir (_normal-exterior-cara muro "BASE"))

            (if (_acotar-alineada-hacia (_col-p0 c) (_col-p1 c) 50.0 dir)
              (setq ok (1+ ok))
              (setq nok (1+ nok))
            )
          )
        )
      )

      ;; MADERA: se acota como tramo independiente, pero no entra en despiece.
      (foreach c colsMadera
        (if (= (_col-cara c) "BASE")
          (progn
            (setq muro (_buscar-muro-por-id (_col-muro c) lista))
            (setq dir (_normal-exterior-cara muro "BASE"))

            (if (_acotar-alineada-hacia (_col-p0 c) (_col-p1 c) 50.0 dir)
              (setq ok (1+ ok))
              (setq nok (1+ nok))
            )
          )
        )
      )

      (vla-Regen
        (vla-get-ActiveDocument (vlax-get-acad-object))
        acAllViewports
      )

      (prompt
        (strcat
          "\nAcotacion en planta generada SOLO por BASE."
          "\nRectos + madera + compensaciones/esquinas."
          "\nCotas creadas: " (itoa ok)
          " | Fallidas: " (itoa nok)
        )
      )
    )
  )
  (princ)
)
(defun _dot (a b)
  (+ (* (car a) (car b)) (* (cadr a) (cadr b)))
)

(defun _acotar-alineada-hacia (p0 p1 offset dirRef / acad doc ms n pm ptDim dimObj)
  (setq p0 (list (car p0) (cadr p0) 0.0))
  (setq p1 (list (car p1) (cadr p1) 0.0))

  ;; normal propia de la cota
  (setq n (_vec-unit (list (- (cadr p1) (cadr p0)) (- (car p0) (car p1)) 0.0)))

  ;; si la normal apunta al lado contrario, la damos la vuelta
  (if (< (_dot n dirRef) 0.0)
    (setq n (_vec-scale n -1.0))
  )

  (setq pm (_pmid p0 p1))
  (setq ptDim (_vec-add pm (_vec-scale n (abs offset))))

  (setq acad (vlax-get-acad-object))
  (setq doc  (vla-get-ActiveDocument acad))
  (setq ms   (vla-get-ModelSpace doc))

  (setq dimObj
    (vla-AddDimAligned
      ms
      (vlax-3d-point p0)
      (vlax-3d-point p1)
      (vlax-3d-point ptDim)
    )
  )

  (if dimObj
    (progn
      (vla-Update dimObj)
      T
    )
    nil
  )
)

(defun _ayuda-cmd (cmd desc)
  (prompt
    (strcat
      "\n"
      cmd
      " -> "
      desc
    )
  )
)

(defun c:AYUDA_ENCOFRADO ()

  (prompt "\n========================================")
  (prompt "\n   COMANDOS DISPONIBLES - ENCOFRADO")
  (prompt "\n========================================")

;; -------------------------------------------------
;; MUROS
;; -------------------------------------------------

(prompt "\n\n--- MUROS ---")

(_ayuda-cmd
  "DEFINIR_MUROS"
  "Lee, crea y define muros directamente desde lineas."
)

(_ayuda-cmd
  "LISTAR_MUROS"
  "Muestra todos los muros cargados."
)

(_ayuda-cmd
  "CARGAR_MUROS_DWG"
  "Recupera muros guardados en el DWG mediante XRecord."
)

(_ayuda-cmd
  "VER_DATOS_MURO"
  "Muestra los datos persistentes de un muro."
)

(_ayuda-cmd
  "BORRAR_MUROS_MEM"
  "Limpia la memoria temporal de muros."
)

  ;; -------------------------------------------------
  ;; CATALOGO
  ;; -------------------------------------------------

  (prompt "\n\n--- CATALOGO ---")

  (_ayuda-cmd
    "LISTAR_CATALOGO"
    "Muestra todas las piezas del catalogo."
  )

  (_ayuda-cmd
    "LISTAR_PANELES"
    "Lista los paneles disponibles."
  )

  (_ayuda-cmd
    "LISTAR_ESQUINAS"
    "Lista las piezas de esquina."
  )

  (_ayuda-cmd
    "LISTAR_PERFILES"
    "Lista perfiles/gruesos."
  )

  ;; -------------------------------------------------
  ;; STOCK
  ;; -------------------------------------------------

  (prompt "\n\n--- STOCK ---")

  (_ayuda-cmd
    "LIMITAR_STOCK"
    "Limita unidades disponibles de una pieza."
  )

  (_ayuda-cmd
    "QUITAR_LIMITE_STOCK"
    "Elimina limite de stock de una pieza."
  )

  (_ayuda-cmd
    "LISTAR_STOCK_LIMITADO"
    "Muestra stock limitado activo."
  )

  (_ayuda-cmd
    "LIMPIAR_STOCK"
    "Borra todas las limitaciones de stock."
  )

  ;; -------------------------------------------------
  ;; GENERACION
  ;; -------------------------------------------------


  (prompt "\n\n--- GENERACION 3D ---")

  (_ayuda-cmd
   	  "GENERAR_VOLUMEN_TOTAL_AJUSTADO"
	   "Genera el volumen 3D completo de todos los muros como un unico bloque ajustado en esquinas."
  )

  ;; -------------------------------------------------
  ;; ENCOFRADO
  ;; -------------------------------------------------

  (prompt "\n\n--- ENCOFRADO ---")

  (_ayuda-cmd
    "INSERTAR_BLOQUES_COMPENSACION_PLANTA"
    "Inserta bloques de compensacion en planta."
  )

  (_ayuda-cmd
    "LISTAR_COLOCACIONES_COMPENSACION"
    "Lista compensaciones generadas."
  )

  (_ayuda-cmd
    "LISTAR_MADERA"
    "Lista madera fuera de despiece, incluyendo compensaciones oblicuas."
  )

  (_ayuda-cmd
    "DEPURAR_ESQUINAS_OBLICUAS"
    "Muestra angulo real y compensacion teorica de cada esquina."
  )

  (_ayuda-cmd
    "DEPURAR_OBLICUAS_PLANTA"
    "Dibuja vertices, arranques y tramos de compensacion oblicua."
  )

  (_ayuda-cmd
    "DIBUJAR_ANGULOS_INTERIORES_OBLICUOS"
    "Dibuja los angulos interiores oblicuos como solidos unidos por tramo de altura."
  )

  (_ayuda-cmd
    "DEPURAR_GENERAR_MURO_COMPLETO"
    "Prueba por separado rectos, compensaciones, esquinas y stock."
  )

  ;; -------------------------------------------------
  ;; ACOTACION
  ;; -------------------------------------------------

  (prompt "\n\n--- ACOTACION ---")

  (_ayuda-cmd
    "ACOTAR_PLANTA_BASE"
    "Acota rectos y esquinas solo por la cara BASE."
  )

  (_ayuda-cmd
    "LIMPIAR_ACOTACION_PLANTA_BASE"
    "Borra las cotas generadas por ACOTAR_PLANTA_BASE."
  )

  (prompt "\n\n========================================")
  (prompt "\n Fin de ayuda.")
  (prompt "\n========================================")

  (princ)
)

(defun _crear-3dpoly-cerrada (pts / e)
  (setq e
    (entmakex
      (list
        (cons 0 "POLYLINE")
        (cons 66 1)
        (cons 70 9) ; 1=cerrada, 8=3D polyline
      )
    )
  )

  (foreach p pts
    (entmakex
      (list
        (cons 0 "VERTEX")
        (cons 10 p)
        (cons 70 32)
      )
    )
  )

  (entmakex (list (cons 0 "SEQEND")))
  e
)

(defun _crear-solido-muro-loft (muro / d q1 q2 r1 r2
                                      zinf1 zinf2 zsup1 zsup2
                                      inf sup pInf pSup antes sol)

  (setq zinf1 (nth 10 muro))
  (setq zinf2 (nth 11 muro))
  (setq zsup1 (nth 12 muro))
  (setq zsup2 (nth 13 muro))

  (if (and zinf1 zinf2 zsup1 zsup2)
    (progn
      (setq d (_muro-offset-linea muro))

      (if d
        (progn
          (setq q1 (nth 0 d))
          (setq q2 (nth 1 d))
          (setq r1 (nth 2 d))
          (setq r2 (nth 3 d))

          ;; Perfil inferior del muro
          (setq pInf
            (list
              (list (car q1) (cadr q1) zinf1)
              (list (car q2) (cadr q2) zinf2)
              (list (car r2) (cadr r2) zinf2)
              (list (car r1) (cadr r1) zinf1)
            )
          )

          ;; Perfil superior del muro
          (setq pSup
            (list
              (list (car q1) (cadr q1) zsup1)
              (list (car q2) (cadr q2) zsup2)
              (list (car r2) (cadr r2) zsup2)
              (list (car r1) (cadr r1) zsup1)
            )
          )

          (setq inf (_crear-3dpoly-cerrada pInf))
          (setq sup (_crear-3dpoly-cerrada pSup))

          (setq antes (entlast))

          ;; LOFT entre perfil inferior y superior
          (vl-cmdf "_.LOFT" inf sup "" "")

          (setq sol (_ent-last-nuevo antes))

          ;; borrar perfiles auxiliares
          (if (and inf (entget inf)) (entdel inf))
          (if (and sup (entget sup)) (entdel sup))

          sol
        )
        nil
      )
    )
    nil
  )
)

(defun _unionar-solidos (solidos / ss s antes res)
  (setq ss (ssadd))

  (foreach s solidos
    (if (and s (entget s))
      (ssadd s ss)
    )
  )

  (if (> (sslength ss) 1)
    (progn
      (setq antes (entlast))
      (vl-cmdf "_.UNION" ss "")
      (_ent-last-nuevo antes)
    )
    (if (= (sslength ss) 1)
      (ssname ss 0)
      nil
    )
  )
)

(defun _nombre-bloque-unico (pref / n nombre)
  (setq n 1)
  (setq nombre (strcat pref "_" (itoa n)))
  (while (tblsearch "BLOCK" nombre)
    (setq n (1+ n))
    (setq nombre (strcat pref "_" (itoa n)))
  )
  nombre
)

(defun _3dface-entmake (p1 p2 p3 p4)
  (entmake
    (list
      (cons 0 "3DFACE")
      (cons 8 (getvar "CLAYER"))
      (cons 10 p1)
      (cons 11 p2)
      (cons 12 p3)
      (cons 13 p4)
    )
  )
)
(defun _meter-muro-en-bloque-3d (g / a1 a2 b1 b2 c1 c2 d1 d2)
  (setq a1 (nth 0 g))
  (setq a2 (nth 1 g))
  (setq b1 (nth 2 g))
  (setq b2 (nth 3 g))
  (setq c1 (nth 4 g))
  (setq c2 (nth 5 g))
  (setq d1 (nth 6 g))
  (setq d2 (nth 7 g))

  ;; cara inferior
  (_3dface-entmake a1 a2 b2 b1)

  ;; cara superior
  (_3dface-entmake c1 c2 d2 d1)

  ;; cara base
  (_3dface-entmake a1 a2 c2 c1)

  ;; cara opuesta
  (_3dface-entmake b1 b2 d2 d1)

  ;; testero inicio
  (_3dface-entmake a1 b1 d1 c1)

  ;; testero final
  (_3dface-entmake a2 b2 d2 c2)
)

(defun c:GENERAR_VOLUMEN_TOTAL_AJUSTADO (/ lista item res g nombre hechos fallos)

  (setq hechos 0)
  (setq fallos 0)

  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (setq nombre (_nombre-bloque-unico "VOLUMEN_TOTAL_AJUSTADO"))

      (entmake
        (list
          (cons 0 "BLOCK")
          (cons 2 nombre)
          (cons 70 0)
          (cons 10 '(0.0 0.0 0.0))
        )
      )

      (foreach item lista
        (setq res (_ajustar-muro-por-extremos-v2 item lista))
        (setq g nil)

        (if res
          (setq g (_resultado-ajuste-a-8pts item res))
        )

        (if (null g)
          (setq g (_generar-geometria-muro item))
        )

        (if g
          (progn
            (_meter-muro-en-bloque-3d g)
            (setq hechos (1+ hechos))
          )
          (progn
            (prompt
              (strcat
                "\nMuro ID " (itoa (nth 0 item))
                " omitido."
              )
            )
            (setq fallos (1+ fallos))
          )
        )
      )

      (entmake (list (cons 0 "ENDBLK")))

      (entmake
        (list
          (cons 0 "INSERT")
          (cons 2 nombre)
          (cons 10 '(0.0 0.0 0.0))
          (cons 41 1.0)
          (cons 42 1.0)
          (cons 43 1.0)
          (cons 50 0.0)
        )
      )

      (prompt
        (strcat
          "\nVolumen total AJUSTADO generado como bloque 3D."
          "\nNombre bloque: " nombre
          "\nMuros incluidos: " (itoa hechos)
          " | Fallidos: " (itoa fallos)
        )
      )
    )
  )

  (princ)
)


; =========================================================
; PRESUPUESTO - PAGINACION POR ALTURA FISICA
; =========================================================

(defun _presu-max-filas-por-hoja
       (altura-wrapper-mm altura-nota-mm altura-fila-mm / altura-tabla maxfilas)

  ;; altura-wrapper-mm = altura total disponible para tabla + nota
  ;; altura-nota-mm    = altura aproximada de la nota final
  ;; altura-fila-mm    = altura aproximada de cada fila de tabla

  (setq altura-tabla (- altura-wrapper-mm altura-nota-mm))

  (if (<= altura-fila-mm 0.0)
    (setq maxfilas 1)
    (setq maxfilas (fix (/ altura-tabla altura-fila-mm)))
  )

  (if (< maxfilas 1)
    (setq maxfilas 1)
  )

  maxfilas
)


(defun _partir-lista-en-bloques (lst n / res bloque i item)

  (setq res '())
  (setq bloque '())
  (setq i 0)

  (if (< n 1)
    (setq n 1)
  )

  (foreach item lst
    (setq bloque (append bloque (list item)))
    (setq i (1+ i))

    (if (= i n)
      (progn
        (setq res (append res (list bloque)))
        (setq bloque '())
        (setq i 0)
      )
    )
  )

  (if bloque
    (setq res (append res (list bloque)))
  )

  res
)


(defun _presu-paginar-resumen (resumen / maxfilas paginas)

  ;; Según el HTML actual:
  ;; .tabla-wrapper = 175mm
  ;; nota aprox = 18mm
  ;; fila aprox = 6mm
  ;;
  ;; Resultado aproximado: 26 filas.
  ;; Si quieres ir más seguro, cambia 6.0 por 6.5 o 7.0.

  (setq maxfilas
    (_presu-max-filas-por-hoja
      175.0   ; altura total tabla + nota
      18.0    ; altura reservada para nota
      7.0     ; altura estimada por fila
    )
  )

  (setq paginas (_partir-lista-en-bloques resumen maxfilas))

  paginas
)

(defun _presu-subtotal-resumen (resumen dias / total reg id cant pieza precio)
  (setq total 0.0)
  (foreach reg resumen
    (setq id     (car reg))
    (setq cant   (cdr reg))
    (setq pieza  (_buscar-pieza-por-id id))
    (setq precio (if pieza (_cat-precio pieza) 0.0))
    (setq total (+ total (* cant precio dias)))
  )
  total
)

(defun _presu-transporte-total (transporte)
  (if (> transporte 0.0)
    (* transporte 2.0)
    0.0
  )
)


(defun _pedir-pvc-venta (/ resp conos tapones tubo res)
  (setq res '())

  (initget "SI NO")
  (setq resp (getkword "\nEs necesario venta de PVC? [SI/NO] <NO>: "))

  (if (= resp "SI")
    (progn
      (setq conos (getint "\nCantidad de conos de PVC <0>: "))
      (if (null conos) (setq conos 0))

      (setq tapones (getint "\nCantidad de tapones de PVC <0>: "))
      (if (null tapones) (setq tapones 0))

      (setq tubo (getreal "\nCantidad de metros de tubo de PVC <0>: "))
      (if (null tubo) (setq tubo 0.0))

      (if (> conos 0)
        (setq res (append res (list (cons "101" conos))))
      )

      (if (> tapones 0)
        (setq res (append res (list (cons "102" tapones))))
      )

      (if (> tubo 0.0)
        (setq res (append res (list (cons "103" tubo))))
      )
    )
  )

  res
)

(defun _presu-write-linea-venta (f reg / id cant pieza desc precio importe cantTxt)
  (setq id     (car reg))
  (setq cant   (cdr reg))
  (setq pieza  (_buscar-pieza-por-id id))
  (setq desc   (if pieza (_cat-codigo pieza) id))
  (setq precio (if pieza (_cat-precio pieza) 0.0))
  (setq importe (* cant precio))

  (if (= (type cant) 'INT)
    (setq cantTxt (itoa cant))
    (setq cantTxt (rtos cant 2 2))
  )

  (write-line
    (strcat
      "<tr>"
      "<td class='col-desc desc'>" (_html-escape desc) "</td>"
      "<td class='col-cant num'>" cantTxt "</td>"
      "<td class='col-dias num'>-</td>"
      "<td class='col-precio num'>" (_fmt-eur precio) "</td>"
      "<td class='col-importe num'>" (_fmt-eur importe) "</td>"
      "</tr>"
    )
    f
  )

  importe
)

(defun _presu-subtotal-ventas (ventas / total reg pieza precio)
  (setq total 0.0)

  (foreach reg ventas
    (setq pieza (_buscar-pieza-por-id (car reg)))
    (setq precio (if pieza (_cat-precio pieza) 0.0))
    (setq total (+ total (* (cdr reg) precio)))
  )

  total
)

(defun _pedir-alquiler-extra (/ resp seguir desc descMay descTasa cant precio tasaResp tasa res tasas)
  (setq res '())
  (setq tasas '())

  (initget "SI NO")
  (setq resp (getkword "\nAgregar alguna pieza mas en alquiler? [SI/NO] <NO>: "))

  (if (= resp "SI")
    (progn
      (setq seguir T)

      (while seguir
        (setq desc (getstring T "\nDenominacion de la pieza en alquiler: "))

        (if (/= desc "")
          (progn
            (setq descMay (strcase desc))

            (setq cant (getreal "\nCantidad <1>: "))
            (if (or (null cant) (<= cant 0.0))
              (setq cant 1.0)
            )

            (setq precio (getreal "\nPrecio diario de alquiler <0>: "))
            (if (or (null precio) (< precio 0.0))
              (setq precio 0.0)
            )

            ;; guardamos la pieza
            (setq res
              (append res
                (list
                  (list
                    (cons "TIPO" "ALQUILER")
                    (cons "DESC" descMay)
                    (cons "CANT" cant)
                    (cons "PRECIO" precio)
                  )
                )
              )
            )

            ;; tasa de esta pieza concreta
            (initget "SI NO")
            (setq tasaResp
              (getkword
                (strcat
                  "\nLleva tasa de gestion de residuos "
                  descMay
                  "? [SI/NO] <NO>: "
                )
              )
            )

            (if (= tasaResp "SI")
              (progn
                (setq tasa (getreal "\nImporte de la tasa de gestion de residuos <0>: "))
                (if (or (null tasa) (< tasa 0.0))
                  (setq tasa 0.0)
                )

                (if (> tasa 0.0)
                  (progn
                    (setq descTasa (_presu-desc-base-tasa descMay))

                    (setq tasas
                      (append tasas
                        (list
                          (list
                            (cons "TIPO" "TASA")
                            (cons "DESC" (strcat "TASA GESTION DE RESIDUOS DE " descTasa))
                            (cons "CANT" 1.0)
                            (cons "PRECIO" tasa)
                          )
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )

        ;; esto va DESPUES de preguntar la tasa de esa pieza
        (initget "SI NO")
        (setq resp (getkword "\nAgregar otra pieza mas en alquiler? [SI/NO] <NO>: "))

        (if (/= resp "SI")
          (setq seguir nil)
        )
      )

      ;; las tasas se agregan al final, no justo despues de cada articulo
      (setq res (append res tasas))
    )
  )

  res
)


(defun _presu-write-linea-alquiler-extra (f reg dias / tipo desc cant precio importe cantTxt diasTxt)
  (setq tipo   (cdr (assoc "TIPO" reg)))
  (setq desc   (strcase (cdr (assoc "DESC" reg))))
  (setq cant   (cdr (assoc "CANT" reg)))
  (setq precio (cdr (assoc "PRECIO" reg)))

  (if (= tipo "TASA")
    (progn
      (setq importe precio)
      (setq diasTxt "1")
    )
    (progn
      (setq importe (* cant dias precio))
      (setq diasTxt (itoa dias))
    )
  )

  (if (= (type cant) 'INT)
    (setq cantTxt (itoa cant))
    (setq cantTxt (rtos cant 2 2))
  )

  (write-line
    (strcat
      "<tr>"
      "<td class='desc'>" (_html-escape desc) "</td>"
      "<td class='num'>" cantTxt "</td>"
      "<td class='num'>" diasTxt "</td>"
      "<td class='num'>" (_fmt-eur precio) "</td>"
      "<td class='num'>" (_fmt-eur importe) "</td>"
      "</tr>"
    )
    f
  )

  importe
)
(defun _presu-subtotal-alquiler-extra (extras dias / total reg tipo cant precio)
  (setq total 0.0)

  (foreach reg extras
    (setq tipo   (cdr (assoc "TIPO" reg)))
    (setq cant   (cdr (assoc "CANT" reg)))
    (setq precio (cdr (assoc "PRECIO" reg)))

    (if (= tipo "TASA")
      (setq total (+ total precio))
      (setq total (+ total (* cant dias precio)))
    )
  )

  total
)

(defun _str-rpos (s sub / i n m res)
  (setq i 1)
  (setq n (strlen s))
  (setq m (strlen sub))
  (setq res nil)

  (while (<= i (- n m -1))
    (if (= (substr s i m) sub)
      (setq res i)
    )
    (setq i (1+ i))
  )

  res
)

(defun _str-tiene-numero-p (s)
  (if (wcmatch s "*#*") T nil)
)

(defun _presu-desc-base-tasa (desc / s p resto)
  (setq s (strcase desc))
  (setq p (_str-rpos s " DE "))

  (if p
    (progn
      (setq resto (substr s (+ p 4)))

      ;; si lo que va despues del ultimo " DE " tiene numeros,
      ;; lo consideramos medida y lo quitamos
      (if (_str-tiene-numero-p resto)
        (substr s 1 (1- p))
        s
      )
    )
    s
  )
)
(defun _presu-linea (tipo dato)
  (list (cons "TIPO" tipo) (cons "DATO" dato))
)
(defun _presu-paginar-lineas (lineas / maxConNotas maxSinNotas paginas pagina resto)
  (setq maxConNotas 28)
  (setq maxSinNotas 32)

  (setq paginas '())
  (setq resto lineas)

  (while resto
    (cond
      ;; Si cabe con notas, esta es la ultima hoja
      ((<= (length resto) maxConNotas)
        (setq paginas (append paginas (list resto)))
        (setq resto nil)
      )

      ;; Si no cabe con notas, pero cabe sin notas:
      ;; hoja de presupuesto + hoja vacia de notas/totales
      ((<= (length resto) maxSinNotas)
        (setq paginas (append paginas (list resto)))
        (setq paginas (append paginas (list '())))
        (setq resto nil)
      )

      ;; Si hay mas de lo que cabe sin notas, metemos hoja llena sin notas
      (T
        (setq pagina '())
        (while (and resto (< (length pagina) maxSinNotas))
          (setq pagina (append pagina (list (car resto))))
          (setq resto (cdr resto))
        )
        (setq paginas (append paginas (list pagina)))
      )
    )
  )

  (if (null paginas)
    (setq paginas (list '()))
  )

  paginas
)

(defun _presu-generar-lineas-finales
       (resumenTotal dias alquilerExtra ventasPVC transporte obra
        / lineas reg extrasArticulos tasas alquilerBase seguroRC)

  (setq lineas '())

  (foreach reg (_ordenar-resumen-por-id resumenTotal)
    (setq lineas (append lineas (list (_presu-linea "CATALOGO" reg))))
  )

  (setq extrasArticulos (_filtrar-extras-por-tipo alquilerExtra "ALQUILER"))
  (foreach reg extrasArticulos
    (setq lineas (append lineas (list (_presu-linea "ALQUILER_EXTRA" reg))))
  )

  (setq alquilerBase
    (+ (_presu-subtotal-resumen resumenTotal dias)
       (_presu-subtotal-alquiler-extra-solo-articulos alquilerExtra dias))
  )

  (setq seguroRC (* alquilerBase 0.14))

  (setq lineas (append lineas (list (_presu-linea "ESPACIO" nil))))
  (setq lineas (append lineas (list (_presu-linea "SEGURO_RC" seguroRC))))
  (setq lineas (append lineas (list (_presu-linea "TASA_ENCOFRADO" 10.0))))

  (setq tasas (_filtrar-extras-por-tipo alquilerExtra "TASA"))
  (foreach reg tasas
    (setq lineas (append lineas (list (_presu-linea "TASA_EXTRA" reg))))
  )

  (if ventasPVC
    (progn
      (setq lineas (append lineas (list (_presu-linea "ESPACIO" nil))))
      (foreach reg ventasPVC
        (setq lineas (append lineas (list (_presu-linea "VENTA_PVC" reg))))
      )
    )
  )

  (if (> transporte 0.0)
    (progn
      (setq lineas (append lineas (list (_presu-linea "ESPACIO" nil))))
      (setq lineas (append lineas (list (_presu-linea "TRANSPORTE_ENTREGA" transporte))))
      (setq lineas (append lineas (list (_presu-linea "TRANSPORTE_RECOGIDA" transporte))))
    )
  )

  lineas
)
(defun _presu-write-linea-final (f linea dias obra / tipo dato total)
  (setq tipo (cdr (assoc "TIPO" linea)))
  (setq dato (cdr (assoc "DATO" linea)))
  (setq total 0.0)

  (cond
    ((= tipo "CATALOGO")
      (setq total (_presu-write-linea-item f dato dias))
    )

    ((= tipo "ALQUILER_EXTRA")
      (setq total (_presu-write-linea-alquiler-extra f dato dias))
    )

    ((= tipo "TASA_EXTRA")
      (setq total (_presu-write-linea-alquiler-extra f dato dias))
    )

    ((= tipo "VENTA_PVC")
      (setq total (_presu-write-linea-venta f dato))
    )

    ((= tipo "ESPACIO")
      (write-line "<tr class='espacio-extra'><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>" f)
    )

    ((= tipo "SEGURO_RC")
      (progn
        (write-line
          (strcat
            "<tr>"
            "<td class='desc'>SEGURO DE RESPONSABILIDAD CIVIL</td>"
            "<td class='num'>1</td>"
            "<td class='num'>1</td>"
            "<td class='num'>" (_fmt-eur dato) "</td>"
            "<td class='num'>" (_fmt-eur dato) "</td>"
            "</tr>"
          )
          f
        )
        (setq total dato)
      )
    )

    ((= tipo "TASA_ENCOFRADO")
      (progn
        (write-line
          (strcat
            "<tr>"
            "<td class='desc'>TASA GESTION DE RESIDUOS DE ENCOFRADO</td>"
            "<td class='num'>1</td>"
            "<td class='num'>1</td>"
            "<td class='num'>" (_fmt-eur dato) "</td>"
            "<td class='num'>" (_fmt-eur dato) "</td>"
            "</tr>"
          )
          f
        )
        (setq total dato)
      )
    )

    ((= tipo "TRANSPORTE_ENTREGA")
      (progn
        (write-line
          (strcat
            "<tr>"
            "<td class='desc'>TRANSPORTE DE ENTREGA DE ENCOFRADO A " (_html-escape (strcase obra)) "</td>"
            "<td class='num'>1</td>"
            "<td class='num'>1</td>"
            "<td class='num'>" (_fmt-eur dato) "</td>"
            "<td class='num'>" (_fmt-eur dato) "</td>"
            "</tr>"
          )
          f
        )
        (setq total dato)
      )
    )

    ((= tipo "TRANSPORTE_RECOGIDA")
      (progn
        (write-line
          (strcat
            "<tr>"
            "<td class='desc'>TRANSPORTE DE RECOGIDA DE ENCOFRADO EN " (_html-escape (strcase obra)) "</td>"
            "<td class='num'>1</td>"
            "<td class='num'>1</td>"
            "<td class='num'>" (_fmt-eur dato) "</td>"
            "<td class='num'>" (_fmt-eur dato) "</td>"
            "</tr>"
          )
          f
        )
        (setq total dato)
      )
    )
  )

  total
)

; =========================================================
; PATCH ACOTACION PLANTA BASE
; Mantiene la acotacion original y elimina duplicados en planta.
;
; PENDIENTE:
; La acotacion actual agrupa por muro/cara/S0/S1 y funciona cuando las
; bandas en altura tienen el mismo despiece. Si varias bandas tienen
; divisiones distintas, acotar todas en planta mezcla cotas incompatibles.
;
; Antes de ampliar esta parte hay que definir una estrategia grafica:
; - Planta: acotar solamente una banda de referencia, probablemente Z0=0.
; - Alzado: representar y acotar por separado cada banda diferente.
; - Detectar bandas con el mismo patron para no repetir alzados/cotas.
; - Evitar que AutoCAD desplace automaticamente textos de cotas pequenas
;   a posiciones desordenadas cuando no caben entre las lineas auxiliares.
; - Definir un criterio comun para textos exteriores, lideres y separacion
;   minima, detectando colisiones entre cotas consecutivas.
; - Tratar especialmente madera y piezas estrechas de 2 a 5 cm para que
;   su texto sea legible sin romper la cadena general de acotacion.
; No modificar el criterio actual hasta decidir el formato de planos.
; =========================================================

(defun _clave-cota-planta-base (c)
  (strcat
    (itoa (_col-muro c)) "|"
    (_fmt-str (_col-cara c)) "|"
    (rtos (_col-s0 c) 2 4) "|"
    (rtos (_col-s1 c) 2 4) "|"
    (_fmt-str (_col-extremo c))
  )
)

(defun _cols-planta-base-unicas (cols / res claves c clave)
  (setq res '())
  (setq claves '())
  (foreach c cols
    (if (= (_col-cara c) "BASE")
      (progn
        (setq clave (_clave-cota-planta-base c))
        (if (not (member clave claves))
          (progn
            (setq claves (cons clave claves))
            (setq res (append res (list c)))
          )
        )
      )
    )
  )
  res
)

(defun _capa-acotacion-planta-base ()
  "COTAS_PLANTA_BASE"
)

(defun _asegurar-capa-simple (nombre / ent datos)
  (if (not (tblsearch "LAYER" nombre))
    (entmakex
      (list
        (cons 0 "LAYER")
        (cons 100 "AcDbSymbolTableRecord")
        (cons 100 "AcDbLayerTableRecord")
        (cons 2 nombre)
        (cons 70 0)
        (cons 62 7)
        (cons 6 "Continuous")
      )
    )
    (progn
      (setq ent (tblobjname "LAYER" nombre))
      (setq datos (entget ent))
      (if (assoc 62 datos)
        (setq datos (subst (cons 62 7) (assoc 62 datos) datos))
        (setq datos (append datos (list (cons 62 7))))
      )
      (entmod datos)
      (entupd ent)
    )
  )
  nombre
)

(defun c:LIMPIAR_ACOTACION_PLANTA_BASE (/ capa ss i ent borradas)
  (setq capa (_capa-acotacion-planta-base))
  (setq borradas 0)

  (setq ss (ssget "_X" (list (cons 0 "DIMENSION") (cons 8 capa))))

  (if ss
    (progn
      (setq i 0)
      (while (< i (sslength ss))
        (setq ent (ssname ss i))
        (if ent
          (progn
            (entdel ent)
            (setq borradas (1+ borradas))
          )
        )
        (setq i (1+ i))
      )
    )
  )

  (prompt
    (strcat
      "\nCotas de ACOTAR_PLANTA_BASE eliminadas: "
      (itoa borradas)
    )
  )
  (princ)
)

(defun _rango-altura-en-lista-p (r lst / ok item)
  (setq ok nil)
  (foreach item lst
    (if (and (equal (car r) (car item) 1e-8)
             (equal (cadr r) (cadr item) 1e-8))
      (setq ok T)
    )
  )
  ok
)

(defun _rangos-altura-cols-muro-base (cols muro / res c r)
  (setq res '())
  (foreach c cols
    (if (and (= (_col-muro c) (_muro-id muro))
             (= (_col-cara c) "BASE")
             (_col-z0 c)
             (_col-z1 c)
             (> (- (_col-z1 c) (_col-z0 c)) 0.0))
      (progn
        (setq r (list (_col-z0 c) (_col-z1 c)))
        (if (not (_rango-altura-en-lista-p r res))
          (setq res (append res (list r)))
        )
      )
    )
  )
  (vl-sort
    res
    '(lambda (a b)
      (if (equal (car a) (car b) 1e-8)
        (< (cadr a) (cadr b))
        (< (car a) (car b))
      )
    )
  )
)

(defun _acotar-altura-muro-extremo-rango
  (muro z0 z1 offset / p h p0 p1 p0u p1u pmu ptDim oldCmdecho err)
  (setq p  (nth 3 muro))
  (setq h (abs (- z1 z0)))

  (if (and p h (> h 0.0))
    (progn
      (setq p0 (list (car p) (cadr p) z0))
      (setq p1 (list (car p) (cadr p) z1))

      (setq oldCmdecho (getvar "CMDECHO"))
      (setvar "CMDECHO" 0)

      (setq err
        (vl-catch-all-apply
          '(lambda ()
            (command "_.UCS" "_X" "90")

            (setq p0u (trans p0 0 1))
            (setq p1u (trans p1 0 1))
            (setq p0u (list (car p0u) (cadr p0u) 0.0))
            (setq p1u (list (car p1u) (cadr p1u) 0.0))
            (setq pmu (_pmid p0u p1u))
            (setq ptDim
              (list
                (- (car pmu) (abs offset))
                (cadr pmu)
                0.0
              )
            )

            (command "_.DIMALIGNED" p0u p1u ptDim)
          )
        )
      )

      (while (> (getvar "CMDACTIVE") 0)
        (command)
      )

      (command "_.UCS" "_Previous")
      (setvar "CMDECHO" oldCmdecho)

      (if (not (vl-catch-all-error-p err))
        T
        nil
      )
    )
    nil
  )
)

(defun _acotar-altura-muro-extremo
  (muro offset dirRef / z0 z1 h)
  (setq z0 (nth 10 muro))
  (setq z1 (nth 12 muro))

  (if (and z0 z1 (/= z0 z1))
    (_acotar-altura-muro-extremo-rango muro z0 z1 offset)
    (progn
      (setq h (_altura-real-muro muro))
      (if (and h (> h 0.0))
        (_acotar-altura-muro-extremo-rango muro 0.0 h offset)
        nil
      )
    )
  )
)

(defun c:ACOTAR_PLANTA_BASE
  (/ lista datos colsRectas colsComp colsMadera c muro dir ok nok okTot okAlt offsetPiezas offsetTotal capaCotas oldLayer rangosAlt r)
  (setq ok 0)
  (setq nok 0)
  (setq okTot 0)
  (setq okAlt 0)
  (setq offsetPiezas 50.0)
  (setq offsetTotal 90.0)
  (setq capaCotas (_capa-acotacion-planta-base))

  (if (null *MUROS*)
    (prompt "\nNo hay muros cargados.")
    (progn
      (_asegurar-capa-simple capaCotas)
      (setq oldLayer (getvar "CLAYER"))
      (setvar "CLAYER" capaCotas)

      (setq lista (mapcar '(lambda (x) (_actualizar-geometria-muro x)) *MUROS*))
      (_stock-iniciar-calculo)
      (setq datos (_generar-cols-stock-comp-preferente lista))

      (setq colsRectas
        (_cols-planta-base-unicas (cdr (assoc "RECTAS" datos)))
      )
      (setq colsComp
        (_cols-planta-base-unicas (_generar-colocaciones-compensaciones lista))
      )
      (setq colsMadera
        (_cols-planta-base-unicas (_generar-colocaciones-madera lista))
      )

      (foreach c (append colsRectas colsComp colsMadera)
        (setq muro (_buscar-muro-por-id (_col-muro c) lista))
        (setq dir (_normal-exterior-cara muro "BASE"))
        (if (_acotar-alineada-hacia (_col-p0 c) (_col-p1 c) offsetPiezas dir)
          (setq ok (1+ ok))
          (setq nok (1+ nok))
        )
      )

      ;; Largo total de cada tramo, por el mismo lado y mas separado.
      (foreach muro lista
        (setq dir (_normal-exterior-cara muro "BASE"))
        (if (_acotar-alineada-hacia (nth 3 muro) (nth 4 muro) offsetTotal dir)
          (progn
            (setq ok (1+ ok))
            (setq okTot (1+ okTot))
          )
          (setq nok (1+ nok))
        )
      )

      ;; Altura solo en el extremo inicial del muro 1.
      (foreach muro lista
        (if (= (nth 0 muro) 1)
          (progn
            (setq dir (_normal-exterior-cara muro "BASE"))
            (setq rangosAlt (_rangos-altura-cols-muro-base colsRectas muro))

            (if (> (length rangosAlt) 1)
              (foreach r rangosAlt
                (if (_acotar-altura-muro-extremo-rango muro (car r) (cadr r) offsetTotal)
                  (progn
                    (setq ok (1+ ok))
                    (setq okAlt (1+ okAlt))
                  )
                  (setq nok (1+ nok))
                )
              )
              (if (_acotar-altura-muro-extremo muro offsetTotal dir)
                (progn
                  (setq ok (1+ ok))
                  (setq okAlt (1+ okAlt))
                )
                (setq nok (1+ nok))
              )
            )
          )
        )
      )

      (vla-Regen
        (vla-get-ActiveDocument (vlax-get-acad-object))
        acAllViewports
      )

      (if oldLayer
        (setvar "CLAYER" oldLayer)
      )

      (prompt
        (strcat
          "\nAcotacion en planta generada SOLO por BASE."
          "\nRectos + madera + compensaciones/esquinas."
          "\nCotas duplicadas por bandas de altura eliminadas."
          "\nLargos totales de muro: " (itoa okTot)
          " | Alturas en extremo: " (itoa okAlt)
          "\nCotas creadas: " (itoa ok)
          " | Fallidas: " (itoa nok)
        )
      )
    )
  )
  (princ)
)
