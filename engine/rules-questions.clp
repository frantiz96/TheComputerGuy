;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;       REGOLE PER LA FORMULAZIONE DELLE DOMANDE        ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;                     SEZIONE UTENTE                    ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule ask-question
        (declare (salience ?*highest-priority*))
        ?f1 <- (asking-question (question ?question) (answers $?answers))
        ?f2 <- (last-question (question ?last))
        ?f3 <- (asked-questions (question $?asked))
        (test (not (member$ ?question ?asked)))
        =>
        (retract ?f1)
        (modify ?f2 (question (+ ?last 1)))
        (modify ?f3 (question ?asked ?question))
        (ask ?question (+ ?last 1) ?answers)
)

(defrule not-ask-already-asked-question
        (declare (salience ?*highest-priority*))
        ?f1 <- (asking-question (question ?question) (answers $?answers))
        (asked-questions (question $?asked))
        (test (member$ ?question ?asked))
        =>
        (retract ?f1)
)

;;====================================================;;
(defrule ask-user-age           
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        =>
        (assert (asking-question (question user-age) (answers 1 2 3 4 5 6 7 8)))
)

(defrule ask-user-life          
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        =>
        (assert (asking-question (question user-life) (answers 1 2 3 4)))
)

(defrule ask-user-gift  
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question user-gift) (answers s n)))
)

(defrule ask-user-budget        
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question user-budget) (answers 1 2 3 4 5 6)))
)

(defrule ask-user-exp           
        (declare (salience ?*normal-priority*))
        (not (retraction))
        =>
        (assert (asking-question (question user-exp) (answers 0 1 2 3 4 5)))
)

;;====================================================;;
(defrule ask-user-oldpc
        (declare (salience ?*zero-priority*))        
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not (info (feature purpose-gaming) (value "si")))
        (not (info (feature purpose-work) (value "si")))
        (not (result (feature purpose)))        
        =>
        (assert (asking-question (question user-oldpc) (answers s n)))
)

(defrule ask-oldpc-purpose      
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature user-oldpc) (value "si"))
        =>
        (assert (asking-question (question oldpc-purpose) (answers s n)))
)

(defrule ask-oldpc-type         
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature oldpc-purpose) (value "si"))
        =>
        (assert (asking-question (question oldpc-type) (answers 0 1 2 3 4 5 6 7 8 9 10)))
)

(defrule ask-oldpc-why          
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature oldpc-purpose) (value "si"))
        =>
        (assert (asking-question (question oldpc-why) (answers 0 1 2 3 4)))
)

;;====================================================;;
(defrule ask-purpose-gaming
        (declare (salience ?*zero-priority*))     
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not (info (feature purpose-work) (value "si")))
        (not (info (feature purpose-internet) (value "si")))
        (not (info (feature purpose-family) (value "si")))
        (not (info (feature purpose-study) (value "si")))
        (not (result (feature purpose)))
        =>
        (assert (asking-question (question purpose-gaming) (answers s n)))
)

(defrule ask-gaming-graphic     
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or     (info (feature purpose-gaming) (value "si"))
                (info (feature oldpc-type) (value "gaming")) )
        (not (inferred (feature gaming-perf)))
        =>
        (assert (asking-question (question gaming-graphic) (answers 1 2 3 4 5 6)))
)

(defrule ask-gaming-epoch       
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or     (info (feature purpose-gaming) (value "si"))
                (info (feature oldpc-type) (value "gaming")) )
        (not (inferred (feature gaming-perf)))
        =>
        (assert (asking-question (question gaming-epoch) (answers 1 2 3 4)))
)

(defrule ask-gaming-genre       
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or     (info (feature purpose-gaming) (value "si"))
                (info (feature oldpc-type) (value "gaming")) )
        (not (inferred (feature gaming-perf)))
        =>
        (assert (asking-question (question gaming-genre) (answers 0 1 2 3 4 5 6 7 8 9 10)))
)

;;====================================================;;
(defrule ask-purpose-study
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not (info (feature purpose-work) (value "si")))
        (not (info (feature purpose-gaming) (value "si")))
        (not (info (feature purpose-internet) (value "si")))
        (not (info (feature purpose-family) (value "si")))
        (or     (info (feature user-life) (value "studio"))
                (inferred (feature age) (value "boy"|"young"|"adult"|"elder")) )
        (not (result (feature purpose)))
        =>
        (assert (asking-question (question purpose-study) (answers s n)))
)

(defrule ask-study-progs        
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature purpose-study) (value "si"))
        =>
        (assert (asking-question (question study-progs) (answers s n)))
)

(defrule ask-study-voyage
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature purpose-study) (value "si"))
        (not (inferred (feature comptype)))
        =>
        (assert (asking-question (question study-voyage) (answers s n)))
)

;;====================================================;;
(defrule ask-purpose-internet
        (declare (salience ?*zero-priority*))   
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not (result (feature purpose)))
        (not (info (feature purpose-work) (value "si")))
        (not (info (feature purpose-gaming) (value "si")))
        (not (info (feature purpose-study) (value "si")))
        (not (info (feature purpose-family) (value "si")))
        (or     (info (feature user-life) (value "pensione")) 
                (inferred (feature age) (value "boy"|"young"|"adult"|"elder")) )
        =>
        (assert (asking-question (question purpose-internet) (answers s n)))
)

(defrule ask-internet-voyage
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature purpose-internet) (value "si"))
        (not (inferred (feature comptype)))
        =>
        (assert (asking-question (question internet-voyage) (answers s n)))
)

;;====================================================;;
(defrule ask-purpose-family
        (declare (salience ?*zero-priority*))     
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not (info (feature purpose-work) (value "si")))
        (not (info (feature purpose-gaming) (value "si")))
        (not (info (feature purpose-study) (value "si")))
        (not (info (feature purpose-internet) (value "si")))
        (inferred (feature age) (value "young"|"adult"|"elder"))
        (not (result (feature purpose)))
        =>
        (assert (asking-question (question purpose-family) (answers s n)))
)

;;====================================================;;
(defrule ask-purpose-work
        (declare (salience ?*zero-priority*))       
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not (info (feature user-life) (value "disoccupato"|"pensione")))
        (not (inferred (feature age) (value "child"|"boy"|"elder")))
        (not (info (feature purpose-family) (value "si")))
        (not (info (feature purpose-gaming) (value "si")))
        (not (info (feature purpose-study) (value "si")))
        (not (info (feature purpose-internet) (value "si")))
        (not (result (feature purpose)))
        =>
        (assert (asking-question (question purpose-work) (answers s n)))
)

(defrule ask-work-type          
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature purpose-work) (value "si"))
        =>
        (assert (asking-question (question work-type) (answers 1 2 3 4)))
)

(defrule ask-work-risk          
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature purpose-work) (value "si"))
        (info (feature work-type) (value "manodopera"|"sconosciuto"))
        =>
        (assert (asking-question (question work-risk) (answers s n)))
)

(defrule ask-work-graphic       
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or     (and    (info (feature purpose-work) (value "si"))
                        (info (feature work-type) (value "tecnico-professionale")) )
                (info (feature oldpc-type) (value "workstation")) )
        (not (info (feature work-audio) (value "si")))
        (not (info (feature work-data) (value "si")))
        (not (inferred (feature work-perf)))
        =>
        (assert (asking-question (question work-graphic) (answers s n)))
)

(defrule ask-work-audio         
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or     (and    (info (feature purpose-work) (value "si"))
                        (info (feature work-type) (value "tecnico-professionale")) )
                (info (feature oldpc-type) (value "workstation")) )
        (not (info (feature work-data) (value "si")))
        (not (info (feature work-graphic) (value "si")))
        (not (inferred (feature work-perf)))
        =>
        (assert (asking-question (question work-audio) (answers s n)))
)

(defrule ask-work-data          
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or     (and    (info (feature purpose-work) (value "si"))
                        (info (feature work-type) (value "tecnico-professionale")) )
                (info (feature oldpc-type) (value "workstation")) )
        (not (info (feature work-audio) (value "si")))
        (not (info (feature work-graphic) (value "si")))
        (not (inferred (feature work-perf)))
        =>
        (assert (asking-question (question work-data) (answers s n)))
)

(defrule ask-work-voyage                
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature purpose-work) (value "si"))
        (not (inferred (feature comptype)))
        =>
        (assert (asking-question (question work-voyage) (answers s n)))
)

;;====================================================;;
(defrule ask-voyage     
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (not (inferred (feature comptype)))
        =>
        (assert (asking-question (question voyage) (answers s n)))
)

(defrule ask-still-space
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (inferred (feature comptype) (value "desktop"))
        (not (result (feature purpose)))
        =>
        (assert (asking-question (question still-space) (answers s n)))
)

(defrule ask-brand      
        (not (retraction))
        (info (feature user-gift) (value "no"))
        =>
        (assert (asking-question (question brand) (answers 1 2 3 4 5)))
)

(defrule ask-tablet     
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (inferred (feature comptype) (value "laptop"))
        (not (info (feature work-risk) (value "si")))
        =>
        (assert (asking-question (question tablet) (answers s n)))
)

(defrule ask-big-display        
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (or     (and    (info (feature tablet) (value "si"))
                        (inferred (feature age) (value "elder")) )
                (and    (info (feature purpose-gaming) (value "si")) 
                        (inferred (feature comptype) (value "laptop")) ) )
        =>
        (assert (asking-question (question big-display) (answers s n)))
)

;;====================================================;;
(defrule ask-details
        (declare (salience ?*sub-normal-priority*))
        (not (retraction))
        (not (info (feature work-risk) (value "si")))
        (inferred (feature age) (value ~"child"))
        =>
        (assert (asking-question (question details) (answers s n)))
)

(defrule ask-details-hdd                
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature details) (value "si"))
        =>
        (assert (asking-question (question details-hdd) (answers 1 2 3 4 5)))
)

(defrule ask-details-battery
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature details) (value "si"))
        (inferred (feature comptype) (value "laptop"))
        =>
        (assert (asking-question (question details-battery) (answers s n i)))
)

(defrule ask-details-screen-resolution
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature details) (value "si") )
        (info (feature user-exp) (value "basso"|"medio"|"alto"|"altissimo"))
        (or     (inferred (feature comptype) (value "laptop"))
                (result (feature purpose) (value 3)) )       ; all-in-one
        =>
        (assert (asking-question (question details-screen-resolution) (answers s n i)))
)

(defrule ask-details-wireless
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature details) (value "si"))
        =>
        (assert (asking-question (question details-wireless) (answers s n i)))
)

(defrule ask-details-bluetooth
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature details) (value "si"))
        =>
        (assert (asking-question (question details-bluetooth) (answers s n i)))
)

(defrule ask-details-cd
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature details) (value "si"))
        =>
        (assert (asking-question (question details-cd) (answers s n i)))
)

(defrule ask-details-usb
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature details) (value "si"))
        (info (feature user-exp) (value "basso"|"medio"|"alto"|"altissimo"))
        (not (result (feature purpose) (value 9)))   ;tablet
        =>
        (assert (asking-question (question details-usb) (answers 1 2 3 4 5)))
)

(defrule ask-details-sim
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature details) (value "si"))
        (inferred (feature comptype) (value "laptop"))
        =>
        (assert (asking-question (question details-sim) (answers s n i)))
)

(defrule ask-details-smartcard
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature details) (value "si"))
        (info (feature user-exp) (value "basso"|"medio"|"alto"|"altissimo"))
        (inferred (feature comptype) (value "laptop"))
        (not (result (feature purpose) (value 9)))   ;tablet
        =>
        (assert (asking-question (question details-smartcard) (answers s n i)))
)

(defrule ask-details-fingerprint
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature details) (value "si"))
        (info (feature user-exp) (value "medio"|"alto"|"altissimo"))
        (inferred (feature work-perf) (value "normal"|"high"))
        (inferred (feature comptype) (value "laptop"))
        (result (feature purpose) (value 1|2|7|8))         ;workstation tablet-pc laptop ultrabook
        =>
        (assert (asking-question (question details-fingerprint) (answers s n i)))
)

(defrule ask-details-hdmi
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature details) (value "si"))
        (info (feature user-exp) (value "medio"|"alto"|"altissimo"))
        (not (result (feature purpose) (value 9|10)))   ;tablet toughbook
        =>
        (assert (asking-question (question details-hdmi) (answers s n i)))
)

(defrule ask-details-sdcard
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature details) (value "si"))
        (info (feature user-exp) (value "basso"|"medio"|"alto"|"altissimo"))
        =>
        (assert (asking-question (question details-sdcard) (answers s n i)))
)

(defrule ask-details-daylight-sensor
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature details) (value "si"))
        (info (feature user-exp) (value "medio"|"alto"|"altissimo"))
        (inferred (feature comptype) (value "laptop"))
        =>
        (assert (asking-question (question details-daylight-sensor) (answers s n i)))
)

(defrule ask-details-gaming
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature details) (value "si"))
        (info (feature gaming-genre) (value ~"sconosciuto"))
        (result (feature purpose) (value 5))         ;gaming
        =>
        (assert (asking-question (question details-gaming) (answers s n i)))
)

(defrule ask-details-esata
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature details) (value "si"))
        (info (feature user-exp) (value "alto"|"altissimo"))
        (inferred (feature comptype) (value "laptop"))
        =>
        (assert (asking-question (question details-esata) (answers s n i)))
)

(defrule ask-details-extendibility
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "no"))
        (info (feature details) (value "si"))
        (info (feature user-exp) (value "alto"|"altissimo"))
        =>
        (assert (asking-question (question details-extendibility) (answers s n)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;       REGOLE PER LA FORMULAZIONE DELLE DOMANDE        ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;                     SEZIONE REGALO                    ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule ask-gift-user-age              
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        =>
        (assert (asking-question (question gift-user-age) (answers 1 2 3 4 5 6 7 8)))
)

(defrule ask-gift-user-life             
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        =>
        (assert (asking-question (question gift-user-life) (answers 1 2 3 4)))
)

;;====================================================;;
(defrule ask-gift-user-oldpc
        (declare (salience ?*zero-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (not (info (feature purpose-gaming) (value "si")))
        (not (info (feature purpose-work) (value "si")))
        (not (result (feature purpose)))
        =>
        (assert (asking-question (question gift-user-oldpc) (answers s n)))
)

(defrule ask-gift-oldpc-purpose         
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (info (feature user-oldpc) (value "si"))
        =>
        (assert (asking-question (question gift-oldpc-purpose) (answers s n)))
)

(defrule ask-gift-oldpc-type    
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (info (feature oldpc-purpose) (value "si"))
        =>
        (assert (asking-question (question gift-oldpc-type) (answers 0 1 2 3 4 5 6 7 8 9 10)))
)

(defrule ask-gift-oldpc-why     
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (info (feature oldpc-purpose) (value "si"))
        =>
        (assert (asking-question (question gift-oldpc-why) (answers 0 1 2 3 4)))
)

;;====================================================;;
(defrule ask-gift-purpose-gaming
        (declare (salience ?*zero-priority*))        
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (not (info (feature purpose-work) (value "si")))
        (not (info (feature purpose-internet) (value "si")))
        (not (info (feature purpose-family) (value "si")))
        (not (info (feature purpose-study) (value "si")))
        (not (result (feature purpose)))
        =>
        (assert (asking-question (question gift-purpose-gaming) (answers s n)))
)

(defrule ask-gift-gaming-graphic        
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (or     (info (feature purpose-gaming) (value "si"))
                (info (feature oldpc-type) (value "gaming")) )
        (not (inferred (feature gaming-perf)))
        =>
        (assert (asking-question (question gift-gaming-graphic) (answers 1 2 3 4 5 6)))
)

(defrule ask-gift-gaming-epoch          
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (or     (info (feature purpose-gaming) (value "si"))
                (info (feature oldpc-type) (value "gaming")) )
        (not (inferred (feature gaming-perf)))
        =>
        (assert (asking-question (question gift-gaming-epoch) (answers 1 2 3 4)))
)

(defrule ask-gift-gaming-genre          
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (or     (info (feature purpose-gaming) (value "si"))
                (info (feature oldpc-type) (value "gaming")) )
        (not (inferred (feature gaming-perf)))
        =>
        (assert (asking-question (question gift-gaming-genre) (answers 0 1 2 3 4 5 6 7 8 9 10)))
)

;;====================================================;;
(defrule ask-gift-purpose-study
        (declare (salience ?*zero-priority*)) 
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (not (info (feature purpose-work) (value "si")))
        (not (info (feature purpose-gaming) (value "si")))
        (not (info (feature purpose-internet) (value "si")))
        (not (info (feature purpose-family) (value "si")))
        (or     (info (feature user-life) (value "studio"))
                (inferred (feature age) (value "boy"|"young"|"adult"|"elder")) )
        (not (result (feature purpose)))
        =>
        (assert (asking-question (question gift-purpose-study) (answers s n)))
)

(defrule ask-gift-study-progs   
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (info (feature purpose-study) (value "si"))
        =>
        (assert (asking-question (question gift-study-progs) (answers s n)))
)

(defrule ask-gift-study-voyage  
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (info (feature purpose-study) (value "si"))
        (not (inferred (feature comptype)))
        =>
        (assert (asking-question (question gift-study-voyage) (answers s n)))
)

;;====================================================;;
(defrule ask-gift-purpose-internet
        (declare (salience ?*zero-priority*))      
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (not (result (feature purpose)))
        (not (info (feature purpose-work) (value "si")))
        (not (info (feature purpose-gaming) (value "si")))
        (not (info (feature purpose-study) (value "si")))
        (not (info (feature purpose-family) (value "si")))
        (or     (info (feature user-life) (value "pensione")) 
                (inferred (feature age) (value "boy"|"young"|"adult"|"elder")) )
        =>
        (assert (asking-question (question gift-purpose-internet) (answers s n)))
)

(defrule ask-gift-internet-voyage
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (info (feature purpose-internet) (value "si"))
        (not (inferred (feature comptype)))
        =>
        (assert (asking-question (question gift-internet-voyage) (answers s n)))
)

;;====================================================;;
(defrule ask-gift-purpose-family
        (declare (salience ?*zero-priority*))        
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (not (info (feature purpose-work) (value "si")))
        (not (info (feature purpose-gaming) (value "si")))
        (not (info (feature purpose-study) (value "si")))
        (not (info (feature purpose-internet) (value "si")))
        (inferred (feature age) (value "young"|"adult"|"elder"))
        (not (result (feature purpose)))
        =>
        (assert (asking-question (question gift-purpose-family) (answers s n)))
)

;;====================================================;;
(defrule ask-gift-purpose-work
        (declare (salience ?*zero-priority*))  
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (not (info (feature user-life) (value "disoccupato"|"pensione")))
        (not (inferred (feature age) (value "child"|"boy"|"elder")))
        (not (info (feature purpose-family) (value "si")))
        (not (info (feature purpose-gaming) (value "si")))
        (not (info (feature purpose-study) (value "si")))
        (not (info (feature purpose-internet) (value "si")))
        (not (result (feature purpose)))
        =>
        (assert (asking-question (question gift-purpose-work) (answers s n)))
)

(defrule ask-gift-work-type     
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (info (feature purpose-work) (value "si"))
        =>
        (assert (asking-question (question gift-work-type) (answers 1 2 3 4)))
)

(defrule ask-gift-work-risk     
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (info (feature purpose-work) (value "si"))
        (info (feature work-type) (value "manodopera"|"sconosciuto"))
        =>
        (assert (asking-question (question gift-work-risk) (answers s n)))
)

(defrule ask-gift-work-graphic  
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (or     (and    (info (feature purpose-work) (value "si"))
                        (info (feature work-type) (value "tecnico-professionale")) )
                (info (feature oldpc-type) (value "workstation")) )
        (not (info (feature work-audio) (value "si")))
        (not (info (feature work-data) (value "si")))
        (not (inferred (feature work-perf)))
        =>
        (assert (asking-question (question gift-work-graphic) (answers s n)))
)

(defrule ask-gift-work-audio    
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (or     (and    (info (feature purpose-work) (value "si"))
                        (info (feature work-type) (value "tecnico-professionale")) )
                (info (feature oldpc-type) (value "workstation")) )
        (not (info (feature work-data) (value "si")))
        (not (info (feature work-graphic) (value "si")))
        (not (inferred (feature work-perf)))
        =>
        (assert (asking-question (question gift-work-audio) (answers s n)))
)

(defrule ask-gift-work-data     
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (or     (and    (info (feature purpose-work) (value "si"))
                        (info (feature work-type) (value "tecnico-professionale")) )
                (info (feature oldpc-type) (value "workstation")) )
        (not (info (feature work-audio) (value "si")))
        (not (info (feature work-graphic) (value "si")))
        (not (inferred (feature work-perf)))
        =>
        (assert (asking-question (question gift-work-data) (answers s n)))
)

(defrule ask-gift-work-voyage           
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (info (feature purpose-work) (value "si"))
        (not (inferred (feature comptype)))
        =>
        (assert (asking-question (question gift-work-voyage) (answers s n)))
)

;;====================================================;;
(defrule ask-gift-voyage        
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (not (inferred (feature comptype)))
        =>
        (assert (asking-question (question gift-voyage) (answers s n)))
)

(defrule ask-gift-still-space
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (inferred (feature comptype) (value "desktop"))
        (not (result (feature purpose)))
        =>
        (assert (asking-question (question gift-still-space) (answers s n)))
)

(defrule ask-gift-brand
        (not (retraction))
        (info (feature user-gift) (value "si"))
        =>
        (assert (asking-question (question gift-brand) (answers 1 2 3 4 5)))
)

(defrule ask-gift-tablet        
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (inferred (feature comptype) (value "laptop"))     
        (not (info (feature work-risk) (value "si")))
        =>
        (assert (asking-question (question gift-tablet) (answers s n)))
)

(defrule ask-gift-big-display           
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (or     (and    (info (feature tablet) (value "si"))
                        (inferred (feature age) (value "elder")) )
                (and    (info (feature purpose-gaming) (value "si")) 
                        (inferred (feature comptype) (value "laptop")) ) )
        =>
        (assert (asking-question (question gift-big-display) (answers s n)))
)

;;====================================================;;
(defrule ask-gift-details-hdd   
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (info (feature details) (value "si"))
        =>
        (assert (asking-question (question gift-details-hdd) (answers 1 2 3 4 5)))
)

(defrule ask-gift-details-battery
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (info (feature details) (value "si"))
        (inferred (feature comptype) (value "laptop"))
        =>
        (assert (asking-question (question gift-details-battery) (answers s n i)))
)

(defrule ask-gift-details-screen-resolution
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (info (feature details) (value "si"))
        (info (feature user-exp) (value "basso"|"medio"|"alto"|"altissimo"))
        (or     (inferred (feature comptype) (value "laptop"))
                (result (feature purpose) (value 3)) )       ; all-in-one
        =>
        (assert (asking-question (question gift-details-screen-resolution) (answers s n i)))
)

(defrule ask-gift-details-cd
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (info (feature details) (value "si"))
        =>
        (assert (asking-question (question gift-details-cd) (answers s n i)))
)

(defrule ask-gift-details-fingerprint
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (info (feature details) (value "si"))
        (info (feature user-exp) (value "medio"|"alto"|"altissimo"))
        (inferred (feature comptype) (value "laptop"))
        (inferred (feature work-perf) (value "normal"|"high"))
        (result (feature purpose) (value 1|2|7|8))         ;workstation tablet-pc laptop ultrabook
        =>
        (assert (asking-question (question gift-details-fingerprint) (answers s n i)))
)

(defrule ask-gift-details-hdmi
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (info (feature details) (value "si"))
        (info (feature user-exp) (value "medio"|"alto"|"altissimo"))
        (not (result (feature purpose) (value 9|10)))   ;tablet toughbook
        =>
        (assert (asking-question (question gift-details-hdmi) (answers s n i)))
)

(defrule ask-gift-details-usb
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (info (feature details) (value "si"))
        (info (feature user-exp) (value "basso"|"medio"|"alto"|"altissimo"))
        (not (result (feature purpose) (value 9)))   ;tablet
        =>
        (assert (asking-question (question gift-details-usb) (answers 1 2 3 4 5)))
)

(defrule ask-gift-details-gaming
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (info (feature details) (value "si"))
        (info (feature gaming-genre) (value ~"sconosciuto"))
        (result (feature purpose) (value 5))         ;gaming
        =>
        (assert (asking-question (question gift-details-usb) (answers s n i)))
)

(defrule ask-gift-details-extendibility
        (declare (salience ?*normal-priority*))
        (not (retraction))
        (info (feature user-gift) (value "si"))
        (info (feature details) (value "si"))
        (info (feature user-exp) (value "alto"|"altissimo"))
        =>
        (assert (asking-question (question gift-details-extendibility) (answers s n)))
)