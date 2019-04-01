;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;         VARIABILI GLOBALI PER LE PRIORITA'            ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defglobal ?*top-priority*                      = 2000)
(defglobal ?*highest-priority*                  = 1000)
(defglobal ?*high-priority*                     = 100)
(defglobal ?*normal-priority*                   = 10)
(defglobal ?*zero-priority*                     = 1)
(defglobal ?*sub-normal-priority*               = -10)
(defglobal ?*low-priority*                      = -100)
(defglobal ?*lowest-priority*                   = -1000)
(defglobal ?*bottom-priority*                   = -2000)

(defrule starting-rule
        (declare (salience ?*top-priority*))
        =>        
        (print-welcome-screen)
        (seed (round (time))) 
        (set-strategy random)
        (assert (last-question (question 0)))
        (assert (asked-questions (question (create$))))
)

(defrule print-configuration
        (declare (salience ?*top-priority*))
        (not (retraction))
        (not (inferred (feature gaming-device) (value ?value)))
        (final-pc (label ?label))
        =>
        (printout t crlf crlf (load_description ?label))
        (printout t crlf "  Per vedere le immagini di questo dispositivo, accedi alla cartella delle immagini utilizzando questa etichetta: '" ?label "'")
        (printout t crlf crlf)
)

(defrule print-configuration-gaming-device
        (declare (salience ?*top-priority*))
        (not (retraction))
	(inferred (feature gaming-device) (value ?value))
        (final-pc (label ?label))
        =>
        (printout t crlf crlf (load_description ?label))
        (printout t crlf "  Il pc e' inoltre corredato di questo dispositivo da gaming: " ?value "." crlf crlf)
        (printout t crlf "  Per vedere le immagini di questo dispositivo, accedi alla cartella delle immagini utilizzando questa etichetta: '" ?label "'")
        (printout t crlf crlf)
)