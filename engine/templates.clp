;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;                DEFINIZIONI DEI TEMPLATE               ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;====================================================;;
; TEMPLATE PER LE DOMANDE CHE IL SISTEMA PONE ALL'UTENTE
(deftemplate asking-question
        (slot question          (type SYMBOL))
        (multislot answers)
)

(deftemplate asked-question
        (slot question          (type SYMBOL))
        (slot number            (type INTEGER))
        (multislot values)
        (slot answer)
)

(deftemplate asked-questions
        (multislot question     (type SYMBOL)))

(deftemplate last-question
        (slot question          (type INTEGER))
)

;;====================================================;;
; TEMPLATE PER LE RISPOSTE ALLE DOMANDE DATE DALL'UTENTE
(deftemplate info
        (slot feature           (type SYMBOL))
        (slot value             (type STRING))
        (slot question          (type SYMBOL))
)

(deftemplate user-budget
        (slot min-budget        (type INTEGER))
        (slot max-budget        (type INTEGER))
)

;;====================================================;;
; TEMPLATE PER I FATTI CHE IL SISTEMA INFERISCE
(deftemplate infering
        (slot feature           (type SYMBOL))
        (slot value             (type STRING))
)

(deftemplate inferred
        (slot feature           (type SYMBOL))
        (slot value             (type STRING))
        (slot number            (type INTEGER))
)

;;====================================================;;
; TEMPLATE PER I FATTI DI TIPO RESULT CHE IL SISTEMA INFERISCE
(deftemplate infering-result
        (slot feature           (type SYMBOL))
        (slot value             (type INTEGER))
)

(deftemplate result
        (slot feature           (type SYMBOL))
        (slot value             (type INTEGER))
        (slot number            (type INTEGER))
)

;;====================================================;;
; TEMPLATE PER I FATTI CHE VENGONO UTILIZZATI PER INFERIRE IL PC MIGLIORE PER L'UTENTE
(deftemplate hypotetical-final-pc
        (slot label             (type SYMBOL))
        (multislot what         (type SYMBOL))
)

(deftemplate removing-detail
        (slot detail            (type SYMBOL))
)

(deftemplate final-pc
        (slot label             (type SYMBOL))
)

;;====================================================;;
; TEMPLATE PER LA RITRATTAZIONE
(deftemplate reasked-question
        (slot question          (type INTEGER))
)

;;====================================================;;
; TEMPLATE PER I DATI DI UN COMPUTER
(deftemplate pc
        (slot label             (type SYMBOL))
        (slot model-name        (type STRING))
        (slot price             (type FLOAT))
        (slot type              (type INTEGER)          (allowed-values 1 2))
        (slot purpose           (type INTEGER)          (allowed-values 1 2 3 4 5 6 7 8 9 10))
        (slot quality           (type INTEGER)          (allowed-values 1 2 3))
        (slot performance       (type INTEGER)          (allowed-values 1 2 3))
        (slot vid-performance   (type INTEGER)          (allowed-values 1 2 3))
        (slot portability       (type INTEGER)          (allowed-values 1 2 3))
)

(deftemplate pc-details
        (slot label             (type SYMBOL))
        (slot hdd-space         (type INTEGER)          (allowed-values 1 2 3))
        (slot usb-ports         (type INTEGER)          (allowed-values 1 2 3))
        (multislot details      (type SYMBOL))
)