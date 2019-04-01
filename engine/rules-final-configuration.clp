;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;      REGOLE DI INFERENZA DEL COMPUTER FINALE          ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule find-hypotetical-final-pc
        (declare (salience ?*sub-normal-priority*))
        (result (feature type) (value ?type))
        (result (feature purpose) (value ?purpose))
        (result (feature quality) (value ?quality))
        (result (feature performance) (value ?performance))
        (result (feature portability) (value ?portability))
        (pc (label ?label) (type ?type) (purpose ?purpose) (quality ?quality) (performance ?performance) (portability ?portability))
        =>
        (assert (hypotetical-final-pc (label ?label) (what budget)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Hypotetical Final PC: " ?label))
)

(defrule find-hypotetical-final-pc-with-better-quality
        (declare (salience ?*sub-normal-priority*))
        (result (feature type) (value ?type))
        (result (feature purpose) (value ?purpose))
        (result (feature quality) (value ?requested-quality))        
        (result (feature performance) (value ?performance))
        (result (feature portability) (value ?portability))
        (pc (label ?label) (type ?type) (purpose ?purpose) (quality ?quality) (performance ?performance) (portability ?portability))
        (not (test (> (+ ?requested-quality 1) 3)))
        (test (= ?quality (+ ?requested-quality 1)))
        =>
        (assert (hypotetical-final-pc (label ?label) (what budget better-quality)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Hypotetical Final PC: " ?label " (with better quality)"))
)

(defrule find-hypotetical-final-pc-with-worse-quality
        (declare (salience ?*sub-normal-priority*))
        (result (feature type) (value ?type))
        (result (feature purpose) (value ?purpose))
        (result (feature quality) (value ?requested-quality))        
        (result (feature performance) (value ?performance))
        (result (feature portability) (value ?portability))
        (pc (label ?label) (type ?type) (purpose ?purpose) (quality ?quality) (performance ?performance) (portability ?portability))
        (not (test (< (- ?requested-quality 1) 1)))
        (test (= ?quality (- ?requested-quality 1)))
        =>
        (assert (hypotetical-final-pc (label ?label) (what budget worse-quality)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Hypotetical Final PC: " ?label " (with worse quality)"))
)

(defrule find-hypotetical-final-pc-with-better-performance
        (declare (salience ?*sub-normal-priority*))
        (result (feature type) (value ?type))
        (result (feature purpose) (value ?purpose))
        (result (feature quality) (value ?quality))
        (result (feature performance) (value ?requested-performance))
        (result (feature portability) (value ?portability))
        (pc (label ?label) (type ?type) (purpose ?purpose) (quality ?quality) (performance ?performance) (portability ?portability))
        (not (test (> (+ ?requested-performance 1) 3)))
        (test (= ?performance (+ ?requested-performance 1)))
        =>
        (assert (hypotetical-final-pc (label ?label) (what budget better-performance)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Hypotetical Final PC: " ?label " (with better performance)"))
)

(defrule find-hypotetical-final-pc-with-worse-performance
        (declare (salience ?*sub-normal-priority*))
        (result (feature type) (value ?type))
        (result (feature purpose) (value ?purpose))
        (result (feature quality) (value ?quality))
        (result (feature performance) (value ?requested-performance))
        (result (feature portability) (value ?portability))
        (pc (label ?label) (type ?type) (purpose ?purpose) (quality ?quality) (performance ?performance) (portability ?portability))
        (not (test (< (- ?requested-performance 1) 1)))
        (test (= ?performance (- ?requested-performance 1)))
        =>
        (assert (hypotetical-final-pc (label ?label) (what budget worse-performance)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Hypotetical Final PC: " ?label " (with worse performance)"))
)

(defrule remove-without-vid-performance-hypotetical-final-pc
        (declare (salience ?*highest-priority*))
        ?pc <- (hypotetical-final-pc (label ?label))
        (result (feature vid-performance) (value ?requested-vid-performance))
        (pc (label ?label) (vid-performance ?vid-performance))
        (test (<> ?vid-performance ?requested-vid-performance))
        =>
        (retract ?pc)
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Removed Hypotetical Final PC: " ?label " (without vid performance)"))
)

(defrule remove-not-good-hypotetical-final-pc
        (declare (salience ?*highest-priority*))
        ?pc <- (hypotetical-final-pc (label ?label) (what $?what))
        (test (> (length$ $?what) 3))
        =>
        (retract ?pc)
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Removed Hypotetical Final PC: " ?label " (too many missing details)"))
)

(defrule remove-excessively-out-of-max-budget-hypotetical-final-pc
        (declare (salience ?*highest-priority*))
        ?pc <- (hypotetical-final-pc (label ?label))
        (user-budget (max-budget ?max-budget))
        (pc (label ?label) (price ?price))
        (test (> ?price ?max-budget))
        (test (> (- ?price ?max-budget) 200))
        =>
        (retract ?pc)
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Removed Hypotetical Final PC: " ?label " (out of max budget)"))
)

(defrule add-missing-detail-to-hypotetical-final-pc
        (declare (salience ?*highest-priority*))
        (removing-detail (detail ?detail))
        ?pc <- (hypotetical-final-pc (label ?label) (what $?what))
        (test (not (member$ ?detail $?what)))
        (pc-details (label ?label) (details $?details))
        (test (not (member$ ?detail $?details)))
        =>
        (modify ?pc (what ?what ?detail))
)

(defrule remove-removing-detail
        (declare (salience ?*low-priority*))
        ?r <- (removing-detail)
        =>
        (retract ?r)
)

(defrule remove-hypotetical-final-pc-without-hdd-space
        (declare (salience ?*normal-priority*))
        (result (feature hdd-space) (value ?hdd-space))
        ?pc <- (hypotetical-final-pc (label ?label) (what $?what))
        (test (not (member$ hdd-space $?what)))
        (pc-details (label ?label) (hdd-space ~?hdd-space))
        =>
        (modify ?pc (what ?what hdd-space))
)

(defrule remove-hypotetical-final-pc-without-usb-ports
        (declare (salience ?*normal-priority*))
        (result (feature usb-ports) (value ?usb-ports))
        ?pc <- (hypotetical-final-pc (label ?label) (what $?what))
        (test (not (member$ usb-ports $?what)))
        (pc-details (label ?label) (usb-ports ~?usb-ports))      
        =>
        (modify ?pc (what ?what usb-ports))
)

(defrule remove-hypotetical-final-pc-without-battery
        (declare (salience ?*normal-priority*))
        (hypotetical-final-pc)
        (info (feature details-battery) (value "si"))
        =>
        (assert (removing-detail (detail battery)))
)

(defrule remove-hypotetical-final-pc-without-screen-resolution
        (declare (salience ?*normal-priority*))
        (hypotetical-final-pc)
        (info (feature details-screen-resolution) (value "si"))
        =>
        (assert (removing-detail (detail screen-resolution)))
)

(defrule remove-hypotetical-final-pc-without-wireless
        (declare (salience ?*normal-priority*))
        (hypotetical-final-pc)
        (info (feature details-wireless) (value "si"))
        =>
        (assert (removing-detail (detail wireless)))
)

(defrule remove-hypotetical-final-pc-without-bluetooth
        (declare (salience ?*normal-priority*))
        (hypotetical-final-pc)
        (info (feature details-bluetooth) (value "si"))
        =>
        (assert (removing-detail (detail bluetooth)))
)

(defrule remove-hypotetical-final-pc-without-cd
        (declare (salience ?*normal-priority*))
        (hypotetical-final-pc)
        (info (feature details-cd) (value "si"))
        =>
        (assert (removing-detail (detail cd)))
)

(defrule remove-hypotetical-final-pc-without-sim
        (declare (salience ?*normal-priority*))
        (hypotetical-final-pc)
        (info (feature details-sim) (value "si"))
        =>
        (assert (removing-detail (detail sim)))
)

(defrule remove-hypotetical-final-pc-without-smartcard
        (declare (salience ?*normal-priority*))
        (hypotetical-final-pc)
        (info (feature details-smartcard) (value "si"))
        =>
        (assert (removing-detail (detail smartcard)))
)

(defrule remove-hypotetical-final-pc-without-fingerprint
        (declare (salience ?*normal-priority*))
        (hypotetical-final-pc)
        (info (feature details-fingerprint) (value "si"))
        =>
        (assert (removing-detail (detail fingerprint)))
)

(defrule remove-hypotetical-final-pc-without-hdmi
        (declare (salience ?*normal-priority*))
        (hypotetical-final-pc)
        (info (feature details-hdmi) (value "si"))
        =>
        (assert (removing-detail (detail hdmi)))
)

(defrule remove-hypotetical-final-pc-without-sdcard
        (declare (salience ?*normal-priority*))
        (hypotetical-final-pc)
        (info (feature details-sdcard) (value "si"))
        =>
        (assert (removing-detail (detail sdcard)))
)

(defrule remove-hypotetical-final-pc-without-daylight-sensor
        (declare (salience ?*normal-priority*))
        (hypotetical-final-pc)
        (info (feature details-daylight-sensor) (value "si"))
        =>
        (assert (removing-detail (detail daylight-sensor)))
)

(defrule remove-hypotetical-final-pc-without-esata
        (declare (salience ?*normal-priority*))
        (hypotetical-final-pc)
        (info (feature details-esata) (value "si"))
        =>
        (assert (removing-detail (detail esata)))
)

(defrule remove-hypotetical-final-pc-without-extendibility
        (declare (salience ?*normal-priority*))
        (hypotetical-final-pc)
        (info (feature details-extendibility) (value "si"))
        =>
        (assert (removing-detail (detail extendibility)))
)

(defrule find-final-pc
        (declare (salience ?*low-priority*))
        ?hypotetical-final-pc <- (hypotetical-final-pc (label ?label) (what $?what))
        (test (= (length$ $?what) 1))
        (pc (label ?label) (price ?price))
        (user-budget (min-budget ?min-budget) (max-budget ?max-budget)) 
        (test (>= ?price ?min-budget))
        (test (<= ?price ?max-budget))
        =>
        (retract ?hypotetical-final-pc)
        (assert (final-pc (label ?label)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Best Final PC: " ?label))
        (assert (ask-rejection))
)

(defrule no-final-pc-but-hypotetical-final-pc
        (declare (salience ?*lowest-priority*))
        (hypotetical-final-pc (label ?label) (what $?what))
        (user-budget (min-budget ?min-budget) (max-budget ?max-budget))
        (pc (label ?label) (model-name ?model-name) (price ?price))
        (last-question (question ?last))
        =>
        (print-hypotetical-final-pc ?model-name ?price ?min-budget ?max-budget ?what)
        (ask-boolean want-to-see-hypotetical-final-pc ?last)
        (assert (want-to-see-hypotetical-final-pc ?label))
)

(defrule want-to-see-hypotetical-final-pc-yes
        (declare (salience ?*highest-priority*))
        ?f1 <- (want-to-see-hypotetical-final-pc ?label)
        ?f2 <- (want-to-see yes)
        ?hypotetical-final-pc <- (hypotetical-final-pc (label ?label))
        =>
        (retract ?f1 ?f2 ?hypotetical-final-pc)
        (assert (final-pc (label ?label)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Best Final PC: " ?label))
        (assert (ask-rejection))
)

(defrule want-to-see-hypotetical-final-pc-no
        (declare (salience ?*highest-priority*))
        ?f1 <- (want-to-see-hypotetical-final-pc ?label)
        ?f2 <- (want-to-see no)
        ?f3 <- (hypotetical-final-pc (label ?label))
        =>
        (retract ?f1 ?f2 ?f3)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;  REGOLE DI INFERENZA PER IL RIFIUTO DI UN COMPUTER FINALE   ;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule rejection
        (declare (salience ?*highest-priority*))
        (last-question (question ?last))
        ?f1 <- (ask-rejection)
        =>
        (retract ?f1)
        (ask-boolean rejection ?last)
)

(defrule reject-final-pc
        (declare (salience ?*highest-priority*))
        ?f1 <- (rejection)
        ?pc <- (final-pc (label ?label))
        =>
        (retract ?f1 ?pc)        
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;  REGOLE DI INFERENZA PER COMPUTER FINALE SCONOSCIUTO  ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule cant-find-any-final-pc
        (declare (salience ?*bottom-priority*))
        (not (final-pc))
        (not (hypotetical-final-pc))
        (not (hypotetical-final-pc-without-detail))
        =>
        (printout t crlf crlf crlf "  ")
        (printout t "Mi dispiace, ma non riesco a trovare nessun computer adeguato alle tue esigenze." crlf)
        (assert (retraction))
        (assert (ask-retraction))
)