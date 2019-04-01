;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;     REGOLE DI INFERENZA PER I FATTI RESULT FINALI     ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule infer-result
		(declare (salience ?*top-priority*))
		?f1 <- (infering-result (feature ?feature) (value ?value))
		(not (result (feature ?feature)))
		(last-question (question ?last))
		=>
		(retract ?f1)
		(assert (result (feature ?feature) (value ?value) (number ?last)))
		(if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Result: " (upcase ?feature) " " ?value))
)

(defrule not-infer-already-inferred-result
		(declare (salience ?*top-priority*))
		?f1 <- (infering-result (feature ?feature) (value ?value))
		(result (feature ?feature))
		=>
		(retract ?f1)
)

;;====================================================;;
(defrule result-purpose-workstation
		(declare (salience ?*highest-priority*))
		(or     (and    (inferred (feature work-perf) (value "high"))
				(inferred (feature budget) (value "medium"|"high")) )
			(inferred (feature pc-yestype) (value "workstation")) )
		=>
		(assert (infering-result (feature purpose) (value 1)))
)

(defrule result-purpose-tabletpc
		(declare (salience ?*highest-priority*))
		(inferred (feature comptype) (value "laptop"))
		(or     (and    (info (feature tablet) (value "si"))
				(inferred (feature budget) (value "medium"|"high"))
				(or     (inferred (feature work-perf) (value "medium"))
					(inferred (feature study-perf) (value "low"|"medium"))
					(and    (info (feature purpose-internet) (value "si"))
						(info (feature big-display) (value "si")) ) ) )
			(inferred (feature pc-yestype) (value "tablet-pc")) )
		=>
		(assert (infering-result (feature purpose) (value 2)))
)

(defrule result-purpose-allinone
		(declare (salience ?*highest-priority*))
		(inferred (feature comptype) (value "desktop"))        
		(or     (and    (inferred (feature budget) (value "medium"|"high"))
				(info (feature still-space) (value "si")) )
			(inferred (feature pc-yestype) (value "all-in-one")) )
		=>
		(assert (infering-result (feature purpose) (value 3)))
)

(defrule result-purpose-netbook
		(declare (salience ?*highest-priority*))
		(inferred (feature comptype) (value "laptop"))
		(or     (and    (info (feature tablet) (value "si"))
				(inferred (feature budget) (value "low"))
				(not (inferred (feature gaming-perf)))
				(not (inferred (feature work-perf) (value "medium"|"high"))) )
			(inferred (feature pc-yestype) (value "netbook")) )
		=>
		(assert (infering-result (feature purpose) (value 4)))
)

(defrule result-purpose-gaming
		(declare (salience ?*highest-priority*))
		(not (info (feature gaming-genre) (value "super-mario"|"clash-royale")))
		(or     (inferred (feature gaming-perf) (value "medium"|"high"))
			(inferred (feature pc-yestype) (value "gaming")) )
		=>
		(assert (infering-result (feature purpose) (value 5)))
)

(defrule result-purpose-desktop
		(declare (salience ?*sub-normal-priority*))
		(inferred (feature comptype) (value "desktop"))
		(or     (and    (result (feature quality))
				(result (feature performance)) )
			(inferred (feature pc-yestype) (value "desktop")) )
		=> 
		(assert (infering-result (feature purpose) (value 6)))
)

(defrule result-purpose-laptop
		(declare (salience ?*sub-normal-priority*))
		(inferred (feature comptype) (value "laptop"))
		(or     (and    (result (feature quality))
				(result (feature performance)) )
			(inferred (feature pc-yestype) (value "laptop")) )        
		=>
		(assert (infering-result (feature purpose) (value 7)))
)

(defrule result-purpose-ultrabook
		(declare (salience ?*highest-priority*))
		(inferred (feature comptype) (value "laptop"))        
		(or     (and    (info (feature tablet) (value "no"))
				(inferred (feature budget) (value "medium"|"high"))
				(or     (inferred (feature work-perf) (value "medium"|"high"))
					(inferred (feature study-perf) (value "medium"|"high")) ) )
			(inferred (feature pc-yestype) (value "ultrabook")) )
		=>
		(assert (infering-result (feature purpose) (value 8)))
)

(defrule result-purpose-tablet
		(declare (salience ?*highest-priority*))
		(inferred (feature comptype) (value "laptop"))
		(or     (inferred (feature gaming-perf) (value "mobile"))
			(and    (info (feature tablet) (value "si"))
				(info (feature purpose-internet) (value "si"))
				(info (feature big-display) (value "no")) )
			(inferred (feature pc-yestype) (value "tablet")) )
		=>
		(assert (infering-result (feature purpose) (value 9)))
)

(defrule result-purpose-toughbook
		(declare (salience ?*highest-priority*))
		(or     (and    (inferred (feature work-perf) (value "low"|"medium"))
				(info (feature work-risk) (value "si")) )
			(inferred (feature pc-yestype) (value "toughbook")) )
		=>
		(assert (infering-result (feature purpose) (value 10)))
)

;;====================================================;;
(defrule result-type-laptop
		(declare (salience ?*highest-priority*))
		(inferred (feature comptype) (value "laptop"))
		=>
		(assert (infering-result (feature type) (value 1)))
)

(defrule result-type-desktop
		(declare (salience ?*highest-priority*))
		(inferred (feature comptype) (value "desktop"))
		=>
		(assert (infering-result (feature type) (value 2)))
)

;;====================================================;;
(defrule result-quality-low
		(declare (salience ?*highest-priority*))
		(inferred (feature quality) (value "low"))
		=>
		(assert (infering-result (feature quality) (value 1)))
)

(defrule result-quality-medium
		(declare (salience ?*high-priority*))
		(inferred (feature quality) (value "medium"))
		=>
		(assert (infering-result (feature quality) (value 2)))
)

(defrule result-quality-high
		(declare (salience ?*highest-priority*))
		(inferred (feature quality) (value "high"))
		=>
		(assert (infering-result (feature quality) (value 3)))
)

;;====================================================;;
(defrule result-performance-low
		(declare (salience ?*highest-priority*))
		(inferred (feature budget) (value "low"))
		=>
		(assert (infering-result (feature performance) (value 1)))
)

(defrule result-performance-medium
		(declare (salience ?*highest-priority*))
		(or     (inferred (feature budget) (value "medium"))
			(inferred (feature performance) (value "medium")) )
		=>
		(assert (infering-result (feature performance) (value 2)))
)

(defrule result-performance-high
		(declare (salience ?*highest-priority*))
		(or     (inferred (feature budget) (value "high"))
			(inferred (feature performance) (value "high")) )
		=>
		(assert (infering-result (feature performance) (value 3)))
)

;;====================================================;;
(defrule result-vid-performance-low
		(declare (salience ?*highest-priority*))
		(inferred (feature gpu) (value "yes"))
		(inferred (feature budget) (value "low"))
		=>
		(assert (infering-result (feature vid-performance) (value 1)))
)

(defrule result-vid-performance-medium
		(declare (salience ?*highest-priority*))
		(inferred (feature gpu) (value "yes"))
		(inferred (feature budget) (value "medium"))
		=>
		(assert (infering-result (feature vid-performance) (value 2)))
)

(defrule result-vid-performance-high
		(declare (salience ?*highest-priority*))
		(inferred (feature gpu) (value "yes"))
		(inferred (feature budget) (value "high"))
		=>
		(assert (infering-result (feature vid-performance) (value 3)))
)

;;====================================================;;
(defrule result-portability-low
		(declare (salience ?*highest-priority*))
		(inferred (feature comptype) (value "desktop"))      
		=>
		(assert (infering-result (feature portability) (value 1)))
)

(defrule result-portability-medium
		(declare (salience ?*highest-priority*))
		(inferred (feature comptype) (value "laptop"))
		(result (feature purpose) (value 1|5|7|10)) ;workstation gaming laptop toughbook
		=>
		(assert (infering-result (feature portability) (value 2)))
)

(defrule result-portability-high
		(declare (salience ?*highest-priority*))
		(inferred (feature comptype) (value "laptop"))
		(result (feature purpose) (value 2|4|7|8|9)) ;tabletpc netbook laptop ultrabook tablet
		=>
		(assert (infering-result (feature portability) (value 3)))
)

;;====================================================;;
(defrule result-hddspace-low
		(declare (salience ?*highest-priority*))
		(inferred (feature capacity) (value "low"))
		=>
		(assert (infering-result (feature hdd-space) (value 1)))
)

(defrule result-hddspace-medium
		(declare (salience ?*highest-priority*))
		(inferred (feature capacity) (value "medium"))
		=>
		(assert (infering-result (feature hdd-space) (value 2)))
)

(defrule result-hddspace-high
		(declare (salience ?*highest-priority*))
		(inferred (feature capacity) (value "high"))
		=>
		(assert (infering-result (feature hdd-space) (value 3)))
)

;;====================================================;;
(defrule result-usbports-low
		(declare (salience ?*highest-priority*))
		(inferred (feature nusb) (value "low"))
		=>
		(assert (infering-result (feature usb-ports) (value 1)))
)

(defrule result-usbports-medium
		(declare (salience ?*highest-priority*))
		(inferred (feature nusb) (value "medium"))
		=>
		(assert (infering-result (feature usb-ports) (value 2)))
)

(defrule result-usbports-high
		(declare (salience ?*highest-priority*))
		(inferred (feature nusb) (value "high"))
		=>
		(assert (infering-result (feature usb-ports) (value 3)))
)