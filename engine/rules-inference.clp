;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;   REGOLE DI INFERENZA PER I FATTI INFERRED INTERMEDI  ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule infer-feature
        (declare (salience ?*top-priority*))
        ?f1 <- (infering (feature ?feature) (value ?value))
        (not (inferred (feature ?feature)))
        (last-question (question ?last))
        =>
        (retract ?f1)
        (assert (inferred (feature ?feature) (value ?value) (number ?last)))
        (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Inferred: " (upcase ?feature) " " (upcase ?value)))
)

(defrule not-infer-already-inferred-feature
        (declare (salience ?*top-priority*))
        ?f1 <- (infering (feature ?feature) (value ?value))
        (inferred (feature ?feature))
        =>
        (retract ?f1)
)

;;====================================================;;
(defrule inferred-age-child
        (declare (salience ?*high-priority*))
        (info (feature user-age) (value "0<10"))
        =>
        (assert (infering (feature age) (value "child")))
)

(defrule inferred-age-boy
        (declare (salience ?*high-priority*))
        (info (feature user-age) (value "10<20"))
        =>
        (assert (infering (feature age) (value "boy")))
)

(defrule inferred-age-young
        (declare (salience ?*high-priority*))
        (info (feature user-age) (value "20<30"|"30<40"))
        =>
        (assert (infering (feature age) (value "young")))
)

(defrule inferred-age-adult
        (declare (salience ?*high-priority*))
        (info (feature user-age) (value "40<50"|"50<60"|"60<70"))
        =>
        (assert (infering (feature age) (value "adult")))
)

(defrule inferred-age-elder
        (declare (salience ?*high-priority*))
        (info (feature user-age) (value "70<")) 
        =>
        (assert (infering (feature age) (value "elder")))
)

;;====================================================;;
(defrule inferred-oldpc-yestype
        (declare (salience ?*high-priority*))
        (info (feature oldpc-purpose) (value "si"))
        (info (feature oldpc-type) (value ?type&~"sconosciuto"))
        =>
        (assert (infering (feature pc-yestype) (value ?type)))
)

;;====================================================;;
(defrule inferred-purpose-gaming-low
        (declare (salience ?*high-priority*))
        (or     (info (feature gaming-epoch) (value "2000-2007"))
                (info (feature gaming-genre) (value "super-mario"))
                (info (feature gaming-graphic) (value "bassissimo")) )
        =>
        (assert (infering (feature gaming-perf) (value "low")))
)
        
(defrule inferred-purpose-gaming-medium
        (declare (salience ?*high-priority*))
        (or     (info (feature gaming-epoch) (value "2007-2014"))
                (info (feature gaming-genre) (value "league-of-legends"|"civilization"|"x-plane"))                        
                (info (feature gaming-graphic) (value "basso"|"medio")) )
        =>
        (assert (infering (feature gaming-perf) (value "medium")))
)

(defrule inferred-purpose-gaming-high
        (declare (salience ?*high-priority*))        
        (or     (info (feature gaming-epoch) (value "2014-2017"))
                (info (feature gaming-genre) (value "call-of-duty"|"x-plane"|"tomb-raider"|"the-last-of-us"|"need-for-speed"|"fifa"))
                (info (feature gaming-graphic) (value "alto"|"altissimo")) )
        =>
        (assert (infering (feature gaming-perf) (value "high")))
)

(defrule inferred-purpose-gaming-mobile
        (declare (salience ?*high-priority*))
        (or     (info (feature gaming-epoch) (value "mobile"))
                (info (feature gaming-genre) (value "clash-royale"))
                (info (feature gaming-graphic) (value "mobile")) )
        =>
        (assert (infering (feature gaming-perf) (value "mobile")))
)

;;====================================================;;
(defrule inferred-purpose-workperf-low
        (declare (salience ?*high-priority*))
        (info (feature work-type) (value "manodopera"))
        =>
        (assert (infering (feature work-perf) (value "low")))
)

(defrule inferred-purpose-workperf-medium
        (declare (salience ?*high-priority*))
        (or     (info (feature work-type) (value "amministrativo"|"sconosciuto"))
                (and    (info (feature work-type) (value "tecnico-professionale"))
                        (info (feature work-graphic) (value "no"))
                        (info (feature work-audio) (value "no"))
                        (info (feature work-data) (value "no")) ) )
        =>
        (assert (infering (feature work-perf) (value "medium")))
)

(defrule inferred-purpose-workperf-high
        (declare (salience ?*high-priority*))
        (info (feature work-type) (value "tecnico-professionale"))
        (or     (info (feature work-graphic) (value "si"))
                (info (feature work-audio) (value "si"))
                (info (feature work-data) (value "si")) )
        =>
        (assert (infering (feature work-perf) (value "high")))
)

;;====================================================;;
(defrule inferred-purpose-studyperf-low
        (declare (salience ?*high-priority*))
        (info (feature study-progs) (value "no"))
        =>
        (assert (infering (feature study-perf) (value "low")))
)

(defrule inferred-purpose-studyperf-medium
        (declare (salience ?*high-priority*))
        (info (feature study-progs) (value "si"))
        (inferred (feature budget) (value "low"|"medium"))
        =>
        (assert (infering (feature study-perf) (value "medium")))
)

(defrule inferred-purpose-studyperf-high
        (declare (salience ?*high-priority*))
        (info (feature study-progs) (value "si"))
        (inferred (feature budget) (value "high"))
        =>
        (assert (infering (feature study-perf) (value "high")))
)

;;====================================================;;
(defrule inferred-purpose-comptype-laptop
        (declare (salience ?*high-priority*))
        (or     (info (feature oldpc-why) (value "non-portabile"))
                (info (feature study-voyage) (value "si"))
                (info (feature internet-voyage) (value "si"))
                (info (feature work-voyage) (value "si"))
                (info (feature voyage) (value "si"))
                (info (feature work-risk) (value "si"))
                (inferred (feature pc-yestype) (value "tablet-pc"|"netbook"|"laptop"|"ultrabook"|"toughbook")) )
        =>
        (assert (infering (feature comptype) (value "laptop")))
)

(defrule inferred-purpose-comptype-desktop
        (declare (salience ?*high-priority*))
        (or     (info (feature study-voyage) (value "no"))
                (info (feature internet-voyage) (value "no"))
                (info (feature work-voyage) (value "no"))
                (info (feature voyage) (value "no"))
                (inferred (feature pc-yestype) (value "all-in-one"|"desktop")) )
        =>
        (assert (infering (feature comptype) (value "desktop")))
)

;;====================================================;;
(defrule inferred-gpu-yes
        (declare (salience ?*high-priority*))
        (or     (info (feature work-graphic) (value "si"))
                (inferred (feature gaming-perf) (value "medium"|"high")) )
        =>
        (assert (infering (feature gpu) (value "yes")))
)

;;====================================================;;
(defrule inferred-budget-low
        (declare (salience ?*high-priority*))
        (info (feature user-budget) (value "<300"|"300<600"))
        =>
        (assert (infering (feature budget) (value "low")))
)

(defrule inferred-budget-medium
        (declare (salience ?*high-priority*))
        (info (feature user-budget) (value "600<900"|"900<1500"))
        =>
        (assert (infering (feature budget) (value "medium")))
)

(defrule inferred-budget-high
        (declare (salience ?*high-priority*))
        (info (feature user-budget) (value "1500<2500"|"2500<")) 
        =>
        (assert (infering (feature budget) (value "high")))
)

;;====================================================;;
(defrule inferred-quality-low
        (declare (salience ?*high-priority*))
        (info (feature brand) (value "pochissimo"))
        =>
        (assert (infering (feature quality) (value "low")))
)       

(defrule inferred-quality-medium
        (declare (salience ?*high-priority*))
        (info (feature brand) (value "poco"|"abbastanza"))
        =>
        (assert (infering (feature quality) (value "medium")))
)       

(defrule inferred-quality-high
        (declare (salience ?*high-priority*))
        (info (feature brand) (value "molto"|"moltissimo"))
        =>
        (assert (infering (feature quality) (value "high")))
)       

;;====================================================;;
(defrule inferred-capacity-low
        (declare (salience ?*high-priority*))
        (info (feature details-hdd) (value "pochissimo"))
        =>
        (assert (infering (feature capacity) (value "low")))
)       

(defrule inferred-capacity-medium
        (declare (salience ?*high-priority*))
        (info (feature details-hdd) (value "poco"|"abbastanza"))
        =>
        (assert (infering (feature capacity) (value "medium")))
)       

(defrule inferred-capacity-high
        (declare (salience ?*high-priority*))
        (info (feature details-hdd) (value "molto"|"moltissimo"))
        =>
        (assert (infering (feature capacity) (value "high")))
)       

;;====================================================;;
(defrule inferred-nusb-low
        (declare (salience ?*high-priority*))
        (info (feature details-usb) (value "pochissime"))
        =>
        (assert (infering (feature nusb) (value "low")))
)       

(defrule inferred-nusb-medium
        (declare (salience ?*high-priority*))
        (info (feature details-usb) (value "poche"|"abbastanza"))
        =>
        (assert (infering (feature nusb) (value "medium")))
)       

(defrule inferred-nusb-high
        (declare (salience ?*high-priority*))
        (info (feature details-usb) (value "molte"|"moltissime"))
        =>
        (assert (infering (feature nusb) (value "high")))
) 

;;====================================================;;
(defrule inferred-gaming-device-gamepad
        (declare (salience ?*high-priority*))
	(info (feature details-gaming) (value "si"))
	(inferred (feature budget) (value ~"high"))
        (info (feature gaming-genre) (value "call-of-duty"|"tomb-raider"|"the-last-of-us"|"fifa"))
	=>
        (assert (infering (feature gaming-device) (value "gamepad")))
)

(defrule inferred-gaming-device-wheel
        (declare (salience ?*high-priority*))
	(info (feature details-gaming) (value "si"))
        (info (feature gaming-genre) (value "need-for-speed"))
        =>
        (assert (infering (feature gaming-device) (value "volante")))
)

(defrule inferred-gaming-device-joystick
        (declare (salience ?*high-priority*))
	(info (feature details-gaming) (value "si"))
        (info (feature gaming-genre) (value "x-plane"))
        =>
        (assert (infering (feature gaming-device) (value "joystick")))
)

(defrule inferred-gaming-device-keyboard-mouse
        (declare (salience ?*high-priority*))
	(info (feature details-gaming) (value "si"))
        (info (feature gaming-genre) (value "super-mario"|"civilization"|"league-of-legends"))
        =>
        (assert (infering (feature gaming-device) (value "tastiera e mouse da gaming")))
)

(defrule inferred-gaming-device-oculus
        (declare (salience ?*high-priority*))
	(info (feature details-gaming) (value "si"))
	(inferred (feature budget) (value "high"))
        (info (feature gaming-genre) (value "call-of-duty"|"tomb-raider"|"the-last-of-us"|"fifa"))
	=>
        (assert (infering (feature gaming-device) (value "oculus rift")))
)