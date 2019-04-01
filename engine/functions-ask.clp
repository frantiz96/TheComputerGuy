;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;                  FUNZIONI PER LE DOMANDE              ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(deffunction ask-question (?question ?number $?allowed-values)
        (if (and (not (eq ?question rejection)) (not (eq ?question want-to-see-hypotetical-final-pc)) (not (eq ?question retraction))   (not (eq ?question retraction-number)) )
         then (printout t crlf "=========================================================="))
        (print-question ?question ?number)
        (if (or  (eq ?question rejection) (eq ?question want-to-see-hypotetical-final-pc) (eq ?question retraction)   (eq ?question retraction-number) )
         then (print-answers ?question $?allowed-values)
         else (print-answers ?question $?allowed-values h w))
        (foreach ?answer $?allowed-values (print-answers ?answer))
        (bind ?answer (read))
        (if (lexemep ?answer)
         then (bind ?answer (lowcase ?answer)))
        (while (not (member$ ?answer $?allowed-values)) do
                (if (eq ?answer h)
                 then (print-help ?question) else 
                (if (eq ?answer w)
                 then (print-why ?question) else
                (printout t crlf "  Inserisci un valore valido tra quelli elencati. " crlf crlf "  ")))
                (bind ?answer (read))
                (if (lexemep ?answer)
                 then (bind ?answer (lowcase ?answer)))
        )
        (if (and  (not (eq ?question rejection)) (not (eq ?question want-to-see-hypotetical-final-pc)) (not (eq ?question retraction))   (not (eq ?question retraction-number)) ) then
                (assert (asked-question (question ?question) (number ?number) (values $?allowed-values) (answer ?answer))))
        ?answer 
)

(deffunction ask (?question ?number $?allowed-values) 
        (bind ?answer (ask-question ?question ?number $?allowed-values))
        (switch ?question 

        ;;=========== SEZIONE UTENTE ===========;;

                (case user-age then             
                        (if (eq ?answer 1) 
                         then (assert (info (feature user-age) (value "0<10") (question user-age))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 0<10")) else          
                        (if (eq ?answer 2) 
                         then (assert (info (feature user-age) (value "10<20") (question user-age))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 10<20")) else         
                        (if (eq ?answer 3) 
                         then (assert (info (feature user-age) (value "20<30") (question user-age))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 20<30")) else         
                        (if (eq ?answer 4) 
                         then (assert (info (feature user-age) (value "30<40") (question user-age))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 30<40")) else         
                        (if (eq ?answer 5) 
                         then (assert (info (feature user-age) (value "40<50") (question user-age))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 40<50")) else 
                        (if (eq ?answer 6) 
                         then (assert (info (feature user-age) (value "50<60") (question user-age))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 50<60")) else 
                        (if (eq ?answer 7) 
                         then (assert (info (feature user-age) (value "60<70") (question user-age))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 60<70")) else 
                        (if (eq ?answer 8) 
                         then (assert (info (feature user-age) (value "70<") (question user-age))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 70<")) )))))))))
                (case user-life then            
                        (if (eq ?answer 1) 
                         then (assert (info (feature user-life) (value "studio") (question user-life))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-LIFE STUDIO")) else
                        (if (eq ?answer 2) 
                         then (assert (info (feature user-life) (value "lavoro") (question user-life))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-LIFE LAVORO")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature user-life) (value "disoccupato") (question user-life))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-LIFE DISOCCUPATO")) else
                        (if (eq ?answer 4) 
                         then (assert (info (feature user-life) (value "pensione") (question user-life))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-LIFE PENSIONE")) )))))
                (case user-gift then
                        (if (eq ?answer s) 
                         then (assert (info (feature user-gift) (value "si") (question user-gift))) 
                              (printout t crlf " Bene. " crlf crlf " D'ora in avanti il soggetto delle domande sara' la persona cui hai intenzione di regalare questo pc. " crlf crlf)
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GIFT MODE ON")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature user-gift) (value "no") (question user-gift)))
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GIFT MODE OFF")) )))
                (case user-oldpc then           
                        (if (eq ?answer s) 
                         then (assert (info (feature user-oldpc) (value "si") (question user-oldpc))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-OLDPC SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature user-oldpc) (value "no") (question user-oldpc))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-OLDPC NO")) )))
                (case user-budget then
                        (if (eq ?answer 1) 
                         then (assert (info (feature user-budget) (value "<300") (question user-budget))) 
                              (assert (user-budget (min-budget 10) (max-budget 300)))
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-BUDGET <300")) else       
                        (if (eq ?answer 2) 
                         then (assert (info (feature user-budget) (value "300<600") (question user-budget))) 
                              (assert (user-budget (min-budget 300) (max-budget 600)))
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-BUDGET 300<600")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature user-budget) (value "600<900") (question user-budget))) 
                              (assert (user-budget (min-budget 600) (max-budget 900)))
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-BUDGET 600<900")) else    
                        (if (eq ?answer 4) 
                         then (assert (info (feature user-budget) (value "900<1500") (question user-budget))) 
                              (assert (user-budget (min-budget 900) (max-budget 1500)))
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-BUDGET 900<1500")) else   
                        (if (eq ?answer 5) 
                         then (assert (info (feature user-budget) (value "1500<2500") (question user-budget))) 
                              (assert (user-budget (min-budget 1500) (max-budget 2500)))
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-BUDGET 1500<2500")) else  
                        (if (eq ?answer 6) 
                         then (assert (info (feature user-budget) (value "2500<") (question user-budget))) 
                              (assert (user-budget (min-budget 2500) (max-budget 10000)))
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-BUDGET 2500<")) )))))))   
                (case user-exp then             
                        (if (eq ?answer 0) 
                         then (assert (info (feature user-exp) (value "zero") (question user-exp))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-EXP ZERO")) else
                        (if (eq ?answer 1) 
                         then (assert (info (feature user-exp) (value "bassissimo") (question user-exp))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-EXP BASSISSIMO")) else
                        (if (eq ?answer 2) 
                         then (assert (info (feature user-exp) (value "basso") (question user-exp))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-EXP BASSO")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature user-exp) (value "medio") (question user-exp))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-EXP MEDIO")) else
                        (if (eq ?answer 4) 
                         then (assert (info (feature user-exp) (value "alto") (question user-exp))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-EXP ALTO")) else
                        (if (eq ?answer 5) 
                         then (assert (info (feature user-exp) (value "altissimo") (question user-exp))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-EXP ALTISSIMO")) )))))))

                (case oldpc-purpose then        
                        (if (eq ?answer s) 
                         then (assert (info (feature oldpc-purpose) (value "si") (question oldpc-purpose))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-PURPOSE SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature oldpc-purpose) (value "no") (question oldpc-purpose))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-PURPOSE NO")) )))
                (case oldpc-type then           
                        (if (eq ?answer 0) 
                         then (assert (info (feature oldpc-type) (value "sconosciuto") (question oldpc-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-TYPE SCONOSCIUTO")) else
                        (if (eq ?answer 1) 
                         then (assert (info (feature oldpc-type) (value "workstation") (question oldpc-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-TYPE WORKSTATION")) else
                        (if (eq ?answer 2) 
                         then (assert (info (feature oldpc-type) (value "tablet-pc") (question oldpc-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-TYPE TABLET-PC")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature oldpc-type) (value "all-in-one") (question oldpc-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-TYPE ALL-IN-ONE")) else
                        (if (eq ?answer 4) 
                         then (assert (info (feature oldpc-type) (value "netbook") (question oldpc-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-TYPE NETBOOK")) else
                        (if (eq ?answer 5) 
                         then (assert (info (feature oldpc-type) (value "gaming") (question oldpc-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-TYPE GAMING")) else
                        (if (eq ?answer 6) 
                         then (assert (info (feature oldpc-type) (value "desktop") (question oldpc-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-TYPE DESKTOP")) else
                        (if (eq ?answer 7) 
                         then (assert (info (feature oldpc-type) (value "laptop") (question oldpc-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-TYPE LAPTOP")) else
                        (if (eq ?answer 8) 
                         then (assert (info (feature oldpc-type) (value "ultrabook") (question oldpc-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-TYPE ULTRABOOK")) else
                        (if (eq ?answer 9) 
                         then (assert (info (feature oldpc-type) (value "toughbook") (question oldpc-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-TYPE TOUGHBOOK")) else
                        (if (eq ?answer 10) 
                         then (assert (info (feature oldpc-type) (value "tablet") (question oldpc-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-TYPE TOUGHBOOK")) ))))))))))))
                (case oldpc-why then            
                        (if (eq ?answer 0) 
                         then (assert (info (feature oldpc-why) (value "no") (question oldpc-why))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-WHY NO")) else
                        (if (eq ?answer 1) 
                         then (assert (info (feature oldpc-why) (value "lento-vecchio") (question oldpc-why))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-WHY LENTO-VECCHIO")) else
                        (if (eq ?answer 2) 
                         then (assert (info (feature oldpc-why) (value "non-portabile") (question oldpc-why))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-WHY NON-PORTABILE")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature oldpc-why) (value "rotto") (question oldpc-why))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-WHY ROTTO")) else
                        (if (eq ?answer 4) 
                         then (assert (info (feature oldpc-why) (value "sconosciuto") (question oldpc-why))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-WHY SCONOSCIUTO")) ))))))
                
                (case purpose-gaming then       
                        (if (eq ?answer s) 
                         then (assert (info (feature purpose-gaming) (value "si") (question purpose-gaming))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: PURPOSE-GAMING SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature purpose-gaming) (value "no") (question purpose-gaming))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: PURPOSE-GAMING NO")) )))
                (case gaming-graphic then
                        (if (eq ?answer 1) 
                         then (assert (info (feature gaming-graphic) (value "bassissimo") (question gaming-graphic))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GRAPHIC BASSISSIMO")) else
                        (if (eq ?answer 2) 
                         then (assert (info (feature gaming-graphic) (value "basso") (question gaming-graphic))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GRAPHIC BASSO")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature gaming-graphic) (value "medio") (question gaming-graphic))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GRAPHIC MEDIO")) else
                        (if (eq ?answer 4) 
                         then (assert (info (feature gaming-graphic) (value "alto") (question gaming-graphic))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GRAPHIC ALTO")) else
                        (if (eq ?answer 5) 
                         then (assert (info (feature gaming-graphic) (value "altissimo") (question gaming-graphic))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GRAPHIC ALTISSIMO")) else
                        (if (eq ?answer 6) 
                         then (assert (info (feature gaming-graphic) (value "mobile") (question gaming-graphic))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GRAPHIC MOBILE")) )))))))
                (case gaming-epoch then         
                        (if (eq ?answer 1) 
                         then (assert (info (feature gaming-epoch) (value "2014-2017") (question gaming-epoch))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-EPOCH 2014-2017")) else
                        (if (eq ?answer 2) 
                         then (assert (info (feature gaming-epoch) (value "2007-2014") (question gaming-epoch))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-EPOCH 2007-2014")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature gaming-epoch) (value "2000-2007") (question gaming-epoch))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-EPOCH 2000-2007")) else
                        (if (eq ?answer 4) 
                         then (assert (info (feature gaming-epoch) (value "mobile") (question gaming-epoch))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-EPOCH MOBILE")) )))))
                (case gaming-genre then
                        (if (eq ?answer 0) 
                         then (assert (info (feature gaming-genre) (value "sconosciuto") (question gaming-genre))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GENRE SCONOSCIUTO")) else
                        (if (eq ?answer 1) 
                         then (assert (info (feature gaming-genre) (value "super-mario") (question gaming-genre))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GENRE SUPER-MARIO")) else
                        (if (eq ?answer 2) 
                         then (assert (info (feature gaming-genre) (value "call-of-duty") (question gaming-genre))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GENRE CALL-OF-DUTY")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature gaming-genre) (value "tomb-raider") (question gaming-genre))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GENRE TOMB-RAIDER")) else
                        (if (eq ?answer 4) 
                         then (assert (info (feature gaming-genre) (value "the-last-of-us") (question gaming-genre))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GENRE THE-LAST-OF-US")) else
                        (if (eq ?answer 5) 
                         then (assert (info (feature gaming-genre) (value "x-plane") (question gaming-genre))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GENRE X-PLANE")) else
                        (if (eq ?answer 6) 
                         then (assert (info (feature gaming-genre) (value "civilization") (question gaming-genre))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GENRE CIVILIZATION")) else
                        (if (eq ?answer 7) 
                         then (assert (info (feature gaming-genre) (value "need-for-speed") (question gaming-genre))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GENRE NEED-FOR-SPEED")) else
                        (if (eq ?answer 8) 
                         then (assert (info (feature gaming-genre) (value "fifa") (question gaming-genre))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GENRE FIFA")) else
                        (if (eq ?answer 9) 
                         then (assert (info (feature gaming-genre) (value "league-of-legends") (question gaming-genre))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GENRE LEAGUE-OF-LEGENDS")) else
                        (if (eq ?answer 10) 
                         then (assert (info (feature gaming-genre) (value "clash-royale") (question gaming-genre))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GENRE CLASH-ROYALE")) ))))))))))))
                        
                (case purpose-study then        
                        (if (eq ?answer s) 
                         then (assert (info (feature purpose-study) (value "si") (question purpose-study))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: PURPOSE-STUDY SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature purpose-study) (value "no") (question purpose-study))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: PURPOSE-STUDY NO")) )))
                (case study-progs then          
                        (if (eq ?answer s) 
                         then (assert (info (feature study-progs) (value "si") (question study-progs))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: STUDY-PROGS SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature study-progs) (value "no") (question study-progs))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: STUDY-PROGS NO")) )))
                (case study-voyage then                 
                        (if (eq ?answer s) 
                         then (assert (info (feature study-voyage) (value "si") (question study-voyage))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: STUDY-VOYAGE SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature study-voyage) (value "no") (question study-voyage))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: STUDY-VOYAGE NO")) )))

                (case purpose-internet then     
                        (if (eq ?answer s) 
                         then (assert (info (feature purpose-internet) (value "si") (question purpose-internet))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: PURPOSE-INTERNET SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature purpose-internet) (value "no") (question purpose-internet))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: PURPOSE-INTERNET NO")) )))
                (case internet-voyage then              
                        (if (eq ?answer s) 
                         then (assert (info (feature internet-voyage) (value "si") (question internet-voyage))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: INTERNET-VOYAGE SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature internet-voyage) (value "no") (question internet-voyage))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: INTERNET-VOYAGE NO")) )))

                (case purpose-family then       
                        (if (eq ?answer s) 
                         then (assert (info (feature purpose-family) (value "si") (question purpose-family))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: PURPOSE-FAMILY SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature purpose-family) (value "no") (question purpose-family))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: PURPOSE-FAMILY NO")) )))
                
                (case purpose-work then         
                        (if (eq ?answer s) 
                         then (assert (info (feature purpose-work) (value "si") (question purpose-work))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: PURPOSE-WORK SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature purpose-work) (value "no") (question purpose-work))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: PURPOSE-WORK NO")) )))
                (case work-type then            
                        (if (eq ?answer 1) 
                         then (assert (info (feature work-type) (value "amministrativo") (question work-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-TYPE AMMINISTRATIVO")) else
                        (if (eq ?answer 2) 
                         then (assert (info (feature work-type) (value "tecnico-professionale") (question work-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-TYPE TECNICO-PROFESSIONALE")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature work-type) (value "manodopera") (question work-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-TYPE MANODOPERA")) else
                        (if (eq ?answer 4) 
                         then (assert (info (feature work-type) (value "sconosciuto") (question work-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-TYPE SCONOSCIUTO")) )))))
                (case work-risk then            
                        (if (eq ?answer s) 
                         then (assert (info (feature work-risk) (value "si") (question work-risk))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-RISK SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature work-risk) (value "no") (question work-risk))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-RISK NO")) )))
                (case work-graphic then         
                        (if (eq ?answer s) 
                         then (assert (info (feature work-graphic) (value "si") (question work-graphic))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-GRAPHIC SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature work-graphic) (value "no") (question work-graphic))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-GRAPHIC NO")) )))
                (case work-audio then           
                        (if (eq ?answer s) 
                         then (assert (info (feature work-audio) (value "si") (question work-audio))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-AUDIO SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature work-audio) (value "no") (question work-audio))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-AUDIO NO")) )))
                (case work-data then            
                        (if (eq ?answer s) 
                         then (assert (info (feature work-data) (value "si") (question work-data))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-DATA SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature work-data) (value "no") (question work-data))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-DATA NO")) )))
                (case work-voyage then          
                        (if (eq ?answer s) 
                         then (assert (info (feature work-voyage) (value "si") (question work-voyage))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-VOYAGE SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature work-voyage) (value "no") (question work-voyage))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-VOYAGE NO")) )))
                
                (case voyage then       
                        (if (eq ?answer s) 
                         then (assert (info (feature voyage) (value "si") (question voyage))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: VOYAGE SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature voyage) (value "no") (question voyage))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: VOYAGE NO")) )))
                (case still-space then  
                        (if (eq ?answer s) 
                         then (assert (info (feature still-space) (value "si") (question still-space))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: STILL-SPACE SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature still-space) (value "no") (question still-space))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: STILL-SPACE NO")) )))

                (case brand then                
                        (if (eq ?answer 1) 
                         then (assert (info (feature brand) (value "pochissimo") (question brand))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: BRAND POCHISSIMO")) else
                        (if (eq ?answer 2) 
                         then (assert (info (feature brand) (value "poco") (question brand))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: BRAND POCO")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature brand) (value "abbastanza") (question brand))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: BRAND ABBASTANZA")) else
                        (if (eq ?answer 4) 
                         then (assert (info (feature brand) (value "molto") (question brand))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: BRAND MOLTO")) else
                        (if (eq ?answer 5) 
                         then (assert (info (feature brand) (value "moltissimo") (question brand))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: BRAND MOLTISSIMO")) ))))))
                
                (case tablet then       
                        (if (eq ?answer s) 
                         then (assert (info (feature tablet) (value "si") (question tablet))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: TABLET SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature tablet) (value "no") (question tablet))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: TABLET NO")) )))

                (case big-display then  
                        (if (eq ?answer s) 
                         then (assert (info (feature big-display) (value "si") (question big-display))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: BIG-DISPLAY SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature big-display) (value "no") (question big-display))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: BIG-DISPLAY NO")) )))

                (case details then      
                        (if (eq ?answer s) 
                         then (assert (info (feature details) (value "si") (question details))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature details) (value "no") (question details))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS NO")) )))
                (case details-hdd then          
                        (if (eq ?answer 1) 
                         then (assert (info (feature details-hdd) (value "pochissimo") (question details-hdd))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-HDD POCHISSIMO")) else
                        (if (eq ?answer 2) 
                         then (assert (info (feature details-hdd) (value "poco") (question details-hdd))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-HDD POCO")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature details-hdd) (value "abbastanza") (question details-hdd))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-HDD ABBASTANZA")) else
                        (if (eq ?answer 4) 
                         then (assert (info (feature details-hdd) (value "molto") (question details-hdd))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-HDD MOLTO")) else
                        (if (eq ?answer 5) 
                         then (assert (info (feature details-hdd) (value "moltissimo") (question details-hdd))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-HDD MOLTISSIMO")) ))))))
                (case details-battery then      
                        (if (eq ?answer s) 
                         then (assert (info (feature details-battery) (value "si") (question details-battery))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-BATTERY SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature details-battery) (value "no") (question details-battery))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-BATTERY NO")) else
                        (if (eq ?answer i) 
                         then (assert (info (feature details-battery) (value "indifferente") (question details-battery))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-BATTERY INDIFFERENTE")) ))))
                (case details-screen-resolution then    
                        (if (eq ?answer s) 
                         then (assert (info (feature details-screen-resolution) (value "si") (question details-screen-resolution))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-SCREEN-RESOLUTION SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature details-screen-resolution) (value "no") (question details-screen-resolution))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-SCREEN-RESOLUTION NO")) else
                        (if (eq ?answer i) 
                         then (assert (info (feature details-screen-resolution) (value "indifferente") (question details-screen-resolution))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-SCREEN-RESOLUTION INDIFFERENTE")) ))))
                (case details-wireless then     
                        (if (eq ?answer s) 
                         then (assert (info (feature details-wireless) (value "si") (question details-wireless))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-WIRELESS SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature details-wireless) (value "no") (question details-wireless))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-WIRELESS NO")) else
                        (if (eq ?answer i) 
                         then (assert (info (feature details-wireless) (value "indifferente") (question details-wireless))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-WIRELESS INDIFFERENTE")) ))))
                (case details-bluetooth then    
                        (if (eq ?answer s) 
                         then (assert (info (feature details-bluetooth) (value "si") (question details-bluetooth))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-BLUETOOTH SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature details-bluetooth) (value "no") (question details-bluetooth))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-BLUETOOTH NO")) else
                        (if (eq ?answer i) 
                         then (assert (info (feature details-bluetooth) (value "indifferente") (question details-wireless))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-BLUETOOTH INDIFFERENTE")) ))))
                (case details-cd then   
                        (if (eq ?answer s) 
                         then (assert (info (feature details-cd) (value "si") (question details-cd))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-CD SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature details-cd) (value "no") (question details-cd))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-CD NO")) else
                        (if (eq ?answer i) 
                         then (assert (info (feature details-cd) (value "indifferente") (question details-cd))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-CD INDIFFERENTE")) ))))
                (case details-usb then  
                        (if (eq ?answer 1) 
                         then (assert (info (feature details-usb) (value "pochissime") (question details-usb))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-USB POCHISSIME")) else
                        (if (eq ?answer 2) 
                         then (assert (info (feature details-usb) (value "poche") (question details-usb))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-USB POCHE")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature details-usb) (value "abbastanza") (question details-usb))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-USB ABBASTANZA")) else
                        (if (eq ?answer 4) 
                         then (assert (info (feature details-usb) (value "molte") (question details-usb))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-USB MOLTE")) else
                        (if (eq ?answer 5) 
                         then (assert (info (feature details-usb) (value "moltissime") (question details-usb))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-USB MOLTISSIME")) ))))))
                (case details-sim then  
                        (if (eq ?answer s) 
                         then (assert (info (feature details-sim) (value "si") (question details-sim))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-SIM SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature details-sim) (value "no") (question details-sim))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-SIM NO")) else
                        (if (eq ?answer i) 
                         then (assert (info (feature details-sim) (value "indifferente") (question details-sim))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-SIM INDIFFERENTE")) ))))
                (case details-smartcard then    
                        (if (eq ?answer s) 
                         then (assert (info (feature details-smartcard) (value "si") (question details-smartcard))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-SMARTCARD SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature details-smartcard) (value "no") (question details-smartcard))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-SMARTCARD NO")) else
                        (if (eq ?answer i) 
                         then (assert (info (feature details-smartcard) (value "indifferente") (question details-smartcard))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-SMARTCARD INDIFFERENTE")) ))))
                (case details-fingerprint then  
                        (if (eq ?answer s) 
                         then (assert (info (feature details-fingerprint) (value "si") (question details-fingerprint))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-FINGERPRINT SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature details-fingerprint) (value "no") (question details-fingerprint))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-FINGERPRINT NO")) else
                        (if (eq ?answer i) 
                         then (assert (info (feature details-fingerprint) (value "indifferente") (question details-fingerprint))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-FINGERPRINT INDIFFERENTE")) ))))
                (case details-hdmi then         
                        (if (eq ?answer s) 
                         then (assert (info (feature details-hdmi) (value "si") (question details-hdmi))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-HDMI SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature details-hdmi) (value "no") (question details-hdmi))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-HDMI NO")) else
                        (if (eq ?answer i) 
                         then (assert (info (feature details-hdmi) (value "indifferente") (question details-hdmi))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-HDMI INDIFFERENTE")) ))))
                (case details-sdcard then       
                        (if (eq ?answer s) 
                         then (assert (info (feature details-sdcard) (value "si") (question details-sdcard))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-SDCARD SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature details-sdcard) (value "no") (question details-sdcard))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-SDCARD NO")) else
                        (if (eq ?answer i) 
                         then (assert (info (feature details-sdcard) (value "indifferente") (question details-sdcard))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-SDCARD INDIFFERENTE")) ))))
                (case details-daylight-sensor then      
                        (if (eq ?answer s) 
                         then (assert (info (feature details-daylight-sensor) (value "si") (question details-daylight-sensor))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-DAYLIGHT-SENSOR SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature details-daylight-sensor) (value "no") (question details-daylight-sensor))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-DAYLIGHT-SENSOR NO")) else
                        (if (eq ?answer i) 
                         then (assert (info (feature details-daylight-sensor) (value "indifferente") (question details-daylight-sensor))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-DAYLIGHT-SENSOR INDIFFERENTE")) ))))
                (case details-gaming then       
                        (if (eq ?answer s) 
                         then (assert (info (feature details-gaming) (value "si") (question details-gaming))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-GAMING SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature details-gaming) (value "no") (question details-gaming))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-GAMING NO")) else
                        (if (eq ?answer i) 
                         then (assert (info (feature details-gaming) (value "indifferente") (question details-gaming))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-GAMING INDIFFERENTE")) ))))
                (case details-esata then        
                        (if (eq ?answer s) 
                         then (assert (info (feature details-esata) (value "si") (question details-esata))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-ESATA SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature details-esata) (value "no") (question details-esata))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-ESATA NO")) else
                        (if (eq ?answer i) 
                         then (assert (info (feature details-esata) (value "indifferente") (question details-esata))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-ESATA INDIFFERENTE")) ))))
                (case details-extendibility then        
                        (if (eq ?answer s) 
                         then (assert (info (feature details-extendibility) (value "si") (question details-extendibility))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-EXTENDIBILITY SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature details-extendibility) (value "no") (question details-extendibility))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-EXTENDIBILITY NO")) else
                        (if (eq ?answer i)         
                          then (assert (info (feature details-extendibility) (value "indifferente") (question details-extendibility))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-EXTENDIBILITY INDIFFERENTE")) ))))

                
        ;;=========== SEZIONE REGALO ===========;;

                (case gift-user-age then        
                        (if (eq ?answer 1) 
                         then (assert (info (feature user-age) (value "0<10") (question gift-user-age))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 0<10")) else          
                        (if (eq ?answer 2) 
                         then (assert (info (feature user-age) (value "10<20") (question gift-user-age))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 10<20")) else         
                        (if (eq ?answer 3) 
                         then (assert (info (feature user-age) (value "20<30") (question gift-user-age))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 20<30")) else         
                        (if (eq ?answer 4) 
                         then (assert (info (feature user-age) (value "30<40") (question gift-user-age))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 30<40")) else         
                        (if (eq ?answer 5) 
                         then (assert (info (feature user-age) (value "40<50") (question gift-user-age))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 40<50")) else 
                        (if (eq ?answer 6) 
                         then (assert (info (feature user-age) (value "50<60") (question gift-user-age))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 50<60")) else 
                        (if (eq ?answer 7) 
                         then (assert (info (feature user-age) (value "60<70") (question gift-user-age))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 60<70")) else 
                        (if (eq ?answer 8) 
                         then (assert (info (feature user-age) (value "70<") (question gift-user-age))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-AGE 70<")) )))))))))
                (case gift-user-life then       
                        (if (eq ?answer 1) 
                         then (assert (info (feature user-life) (value "studio") (question gift-user-life))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-LIFE STUDIO")) else
                        (if (eq ?answer 2) 
                         then (assert (info (feature user-life) (value "lavoro") (question gift-user-life))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-LIFE LAVORO")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature user-life) (value "disoccupato") (question gift-user-life))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-LIFE DISOCCUPATO")) else
                        (if (eq ?answer 4) 
                         then (assert (info (feature user-life) (value "pensione") (question gift-user-life))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-LIFE PENSIONE")) )))))
                (case gift-user-oldpc then      
                        (if (eq ?answer s) 
                         then (assert (info (feature user-oldpc) (value "si") (question gift-user-oldpc))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-OLDPC SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature user-oldpc) (value "no") (question gift-user-oldpc))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: USER-OLDPC NO")) )))

                (case gift-oldpc-purpose then   
                        (if (eq ?answer s) 
                         then (assert (info (feature oldpc-purpose) (value "si") (question gift-oldpc-purpose))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-PURPOSE SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature oldpc-purpose) (value "no") (question gift-oldpc-purpose))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-PURPOSE NO")) )))
                (case gift-oldpc-type then      
                        (if (eq ?answer 0) 
                         then (assert (info (feature oldpc-type) (value "sconosciuto") (question oldpc-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-TYPE SCONOSCIUTO")) else
                        (if (eq ?answer 1) 
                         then (assert (info (feature oldpc-type) (value "workstation") (question oldpc-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-TYPE WORKSTATION")) else
                        (if (eq ?answer 2) 
                         then (assert (info (feature oldpc-type) (value "tablet-pc") (question oldpc-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-TYPE TABLET-PC")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature oldpc-type) (value "all-in-one") (question oldpc-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-TYPE ALL-IN-ONE")) else
                        (if (eq ?answer 4) 
                         then (assert (info (feature oldpc-type) (value "netbook") (question oldpc-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-TYPE NETBOOK")) else
                        (if (eq ?answer 5) 
                         then (assert (info (feature oldpc-type) (value "gaming") (question oldpc-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-TYPE GAMING")) else
                        (if (eq ?answer 6) 
                         then (assert (info (feature oldpc-type) (value "desktop") (question oldpc-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-TYPE DESKTOP")) else
                        (if (eq ?answer 7) 
                         then (assert (info (feature oldpc-type) (value "laptop") (question oldpc-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-TYPE LAPTOP")) else
                        (if (eq ?answer 8) 
                         then (assert (info (feature oldpc-type) (value "ultrabook") (question oldpc-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-TYPE ULTRABOOK")) else
                        (if (eq ?answer 9) 
                         then (assert (info (feature oldpc-type) (value "toughbook") (question oldpc-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-TYPE TOUGHBOOK")) else
                        (if (eq ?answer 10) 
                         then (assert (info (feature oldpc-type) (value "tablet") (question oldpc-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-TYPE TABLET")) ))))))))))))
                (case gift-oldpc-why then       
                        (if (eq ?answer 0) 
                         then (assert (info (feature oldpc-why) (value "no") (question gift-oldpc-why))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-WHY NO")) else
                        (if (eq ?answer 1) 
                         then (assert (info (feature oldpc-why) (value "lento-vecchio") (question gift-oldpc-why))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-WHY LENTO-VECCHIO")) else
                        (if (eq ?answer 2) 
                         then (assert (info (feature oldpc-why) (value "non-portabile") (question gift-oldpc-why))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-WHY NON-PORTABILE")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature oldpc-why) (value "rotto") (question gift-oldpc-why))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-WHY ROTTO")) else
                        (if (eq ?answer 4) 
                         then (assert (info (feature oldpc-why) (value "sconosciuto") (question gift-oldpc-why))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: OLDPC-WHY SCONOSCIUTO")) ))))))
                
                (case gift-purpose-gaming then   
                        (if (eq ?answer s) 
                         then (assert (info (feature purpose-gaming) (value "si") (question gift-purpose-gaming))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: PURPOSE-GAMING SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature purpose-gaming) (value "no") (question gift-purpose-gaming))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: PURPOSE-GAMING NO")) )))
                (case gift-gaming-graphic then  
                        (if (eq ?answer 1) 
                         then (assert (info (feature gaming-graphic) (value "bassissimo") (question gift-gaming-graphic))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GRAPHIC BASSISSIMO")) else
                        (if (eq ?answer 2) 
                         then (assert (info (feature gaming-graphic) (value "basso") (question gift-gaming-graphic))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GRAPHIC BASSO")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature gaming-graphic) (value "medio") (question gift-gaming-graphic))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GRAPHIC MEDIO")) else
                        (if (eq ?answer 4) 
                         then (assert (info (feature gaming-graphic) (value "alto") (question gift-gaming-graphic))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GRAPHIC ALTO")) else
                        (if (eq ?answer 5) 
                         then (assert (info (feature gaming-graphic) (value "altissimo") (question gift-gaming-graphic))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GRAPHIC ALTISSIMO")) else
                        (if (eq ?answer 6) 
                         then (assert (info (feature gaming-graphic) (value "mobile") (question gift-gaming-graphic))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GRAPHIC MOBILE")) )))))))
                (case gift-gaming-epoch then    
                        (if (eq ?answer 1) 
                         then (assert (info (feature gaming-epoch) (value "2014-2017") (question gift-gaming-epoch))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-EPOCH 2014-2017")) else
                        (if (eq ?answer 2) 
                         then (assert (info (feature gaming-epoch) (value "2007-2014") (question gift-gaming-epoch))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-EPOCH 2007-2014")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature gaming-epoch) (value "2000-2007") (question gift-gaming-epoch))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-EPOCH 2000-2007")) else
                        (if (eq ?answer 4) 
                         then (assert (info (feature gaming-epoch) (value "mobile") (question gift-gaming-epoch))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-EPOCH MOBILE")) )))))
                (case gift-gaming-genre then    
                        (if (eq ?answer 0) 
                         then (assert (info (feature gaming-genre) (value "sconosciuto") (question gift-gaming-genre))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GENRE SCONOSCIUTO")) else
                        (if (eq ?answer 1) 
                         then (assert (info (feature gaming-genre) (value "super-mario") (question gift-gaming-genre))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GENRE SUPER-MARIO")) else
                        (if (eq ?answer 2) 
                         then (assert (info (feature gaming-genre) (value "call-of-duty") (question gift-gaming-genre))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GENRE CALL-OF-DUTY")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature gaming-genre) (value "tomb-raider") (question gift-gaming-genre))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GENRE TOMB-RAIDER")) else
                        (if (eq ?answer 4) 
                         then (assert (info (feature gaming-genre) (value "the-last-of-us") (question gift-gaming-genre))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GENRE THE-LAST-OF-US")) else
                        (if (eq ?answer 5) 
                         then (assert (info (feature gaming-genre) (value "x-plane") (question gift-gaming-genre))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GENRE X-PLANE")) else
                        (if (eq ?answer 6) 
                         then (assert (info (feature gaming-genre) (value "civilization") (question gift-gaming-genre))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GENRE CIVILIZATION")) else
                        (if (eq ?answer 7) 
                         then (assert (info (feature gaming-genre) (value "need-for-speed") (question gift-gaming-genre))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GENRE NEED-FOR-SPEED")) else
                        (if (eq ?answer 8) 
                         then (assert (info (feature gaming-genre) (value "fifa") (question gift-gaming-genre))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GENRE FIFA")) else
                        (if (eq ?answer 9) 
                         then (assert (info (feature gaming-genre) (value "league-of-legends") (question gift-gaming-genre))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GENRE LEAGUE-OF-LEGENDS")) else
                        (if (eq ?answer 10) 
                         then (assert (info (feature gaming-genre) (value "clash-royale") (question gift-gaming-genre))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: GAMING-GENRE CLASH-ROYALE")) ))))))))))))
                        
                (case gift-purpose-study then   
                        (if (eq ?answer s) 
                         then (assert (info (feature purpose-study) (value "si") (question gift-purpose-study))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: PURPOSE-STUDY SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature purpose-study) (value "no") (question gift-purpose-study))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: PURPOSE-STUDY NO")) )))
                (case gift-study-progs then             
                        (if (eq ?answer s) 
                         then (assert (info (feature study-progs) (value "si") (question gift-study-progs))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: STUDY-PROGS SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature study-progs) (value "no") (question gift-study-progs))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: STUDY-PROGS NO")) )))
                (case gift-study-voyage then            
                        (if (eq ?answer s) 
                         then (assert (info (feature study-voyage) (value "si") (question gift-study-voyage))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: STUDY-VOYAGE SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature study-voyage) (value "no") (question gift-study-voyage))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: STUDY-VOYAGE NO")) )))

                (case gift-purpose-internet then 
                        (if (eq ?answer s) 
                         then (assert (info (feature purpose-internet) (value "si") (question gift-purpose-internet))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: PURPOSE-INTERNET SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature purpose-internet) (value "no") (question gift-purpose-internet))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: PURPOSE-INTERNET NO")) )))
                (case gift-internet-voyage then 
                        (if (eq ?answer s) 
                         then (assert (info (feature internet-voyage) (value "si") (question gift-internet-voyage))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: INTERNET-VOYAGE SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature internet-voyage) (value "no") (question gift-internet-voyage))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: INTERNET-VOYAGE NO")) )))

                (case gift-purpose-family then 
                        (if (eq ?answer s) 
                         then (assert (info (feature purpose-family) (value "si") (question gift-purpose-family))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: PURPOSE-FAMILY SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature purpose-family) (value "no") (question gift-purpose-family))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: PURPOSE-FAMILY NO")) )))
                
                (case gift-purpose-work then    
                        (if (eq ?answer s) 
                         then (assert (info (feature purpose-work) (value "si") (question gift-purpose-work))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: PURPOSE-WORK SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature purpose-work) (value "no") (question gift-purpose-work))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: PURPOSE-WORK NO")) )))
                (case gift-work-type then       
                        (if (eq ?answer 1) 
                         then (assert (info (feature work-type) (value "amministrativo") (question gift-work-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-TYPE AMMINISTRATIVO")) else
                        (if (eq ?answer 2) 
                         then (assert (info (feature work-type) (value "tecnico-professionale") (question gift-work-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-TYPE TECNICO-PROFESSIONALE")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature work-type) (value "manodopera") (question gift-work-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-TYPE MANODOPERA")) else
                        (if (eq ?answer 4) 
                         then (assert (info (feature work-type) (value "sconosciuto") (question gift-work-type))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-TYPE SCONOSCIUTO")) )))))
                (case gift-work-risk then       
                        (if (eq ?answer s) 
                         then (assert (info (feature work-risk) (value "si") (question gift-work-risk))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-RISK SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature work-risk) (value "no") (question gift-work-risk))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-RISK NO")) )))
                (case gift-work-graphic then    
                        (if (eq ?answer s) 
                         then (assert (info (feature work-graphic) (value "si") (question gift-work-graphic))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-GRAPHIC SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature work-graphic) (value "no") (question gift-work-graphic))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-GRAPHIC NO")) )))
                (case gift-work-audio then      
                        (if (eq ?answer s) 
                         then (assert (info (feature work-audio) (value "si") (question gift-work-audio))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-AUDIO SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature work-audio) (value "no") (question gift-work-audio))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-AUDIO NO")) )))
                (case gift-work-data then       
                        (if (eq ?answer s) 
                         then (assert (info (feature work-data) (value "si") (question gift-work-data))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-DATA SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature work-data) (value "no") (question gift-work-data))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-DATA NO")) )))
                (case gift-work-voyage then     
                        (if (eq ?answer s) 
                         then (assert (info (feature work-voyage) (value "si") (question gift-work-voyage))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-VOYAGE SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature work-voyage) (value "no") (question gift-work-voyage))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: WORK-VOYAGE NO")) )))
                
                (case gift-voyage then          
                        (if (eq ?answer s) 
                         then (assert (info (feature voyage) (value "si") (question gift-voyage))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: VOYAGE SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature voyage) (value "no") (question gift-voyage))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: VOYAGE NO")) )))
                (case gift-still-space then 
                        (if (eq ?answer s) 
                         then (assert (info (feature still-space) (value "si") (question gift-still-space))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: STILL-SPACE SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature still-space) (value "no") (question gift-still-space))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: STILL-SPACE NO")) )))

                (case gift-brand then           
                        (if (eq ?answer 1) 
                         then (assert (info (feature brand) (value "pochissimo") (question gift-brand))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: BRAND POCHISSIMO")) else
                        (if (eq ?answer 2) 
                         then (assert (info (feature brand) (value "poco") (question gift-brand))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: BRAND POCO")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature brand) (value "abbastanza") (question gift-brand))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: BRAND ABBASTANZA")) else
                        (if (eq ?answer 4) 
                         then (assert (info (feature brand) (value "molto") (question gift-brand))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: BRAND MOLTO")) else
                        (if (eq ?answer 5) 
                         then (assert (info (feature brand) (value "moltissimo") (question gift-brand))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: BRAND MOLTISSIMO")) ))))))
                        
                (case gift-tablet then          
                        (if (eq ?answer s) 
                         then (assert (info (feature tablet) (value "si") (question gift-tablet))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: TABLET SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature tablet) (value "no") (question gift-tablet))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: TABLET NO")) )))

                (case gift-big-display then             
                        (if (eq ?answer s) 
                         then (assert (info (feature big-display) (value "si") (question gift-big-display))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: big-display SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature big-display) (value "no") (question gift-big-display))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: big-display NO")) )))

                (case gift-details-hdd then             
                        (if (eq ?answer 1) 
                         then (assert (info (feature details-hdd) (value "pochissimo") (question gift-details-hdd))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-HDD POCHISSIMO")) else
                        (if (eq ?answer 2) 
                         then (assert (info (feature details-hdd) (value "poco") (question gift-details-hdd))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-HDD POCO")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature details-hdd) (value "abbastanza") (question gift-details-hdd))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-HDD ABBASTANZA")) else
                        (if (eq ?answer 4) 
                         then (assert (info (feature details-hdd) (value "molto") (question gift-details-hdd))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-HDD MOLTO")) else
                        (if (eq ?answer 5) 
                         then (assert (info (feature details-hdd) (value "moltissimo") (question gift-details-hdd))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-HDD MOLTISSIMO")) ))))))               
                (case gift-details-battery then         
                        (if (eq ?answer s) 
                         then (assert (info (feature details-battery) (value "si") (question gift-details-battery))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-BATTERY SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature details-battery) (value "no") (question gift-details-battery))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-BATTERY NO")) else
                        (if (eq ?answer i) 
                         then (assert (info (feature details-battery) (value "indifferente") (question gift-details-battery))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-BATTERY INDIFFERENTE")) ))))
                (case gift-details-screen-resolution then       
                        (if (eq ?answer s) 
                         then (assert (info (feature details-screen-resolution) (value "si") (question gift-details-screen-resolution))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-SCREEN-RESOLUTION SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature details-screen-resolution) (value "no") (question gift-details-screen-resolution))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-SCREEN-RESOLUTION NO")) else
                        (if (eq ?answer i) 
                         then (assert (info (feature details-screen-resolution) (value "indifferente") (question gift-details-screen-resolution))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-SCREEN-RESOLUTION INDIFFERENTE")) ))))
                (case gift-details-cd then      
                        (if (eq ?answer s) 
                         then (assert (info (feature details-cd) (value "si") (question gift-details-cd))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-CD SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature details-cd) (value "no") (question gift-details-cd))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-CD NO")) else
                        (if (eq ?answer i) 
                         then (assert (info (feature details-cd) (value "indifferente") (question gift-details-cd))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-CD INDIFFERENTE")) ))))
                (case gift-details-fingerprint then     
                        (if (eq ?answer s) 
                         then (assert (info (feature details-fingerprint) (value "si") (question gift-details-fingerprint))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-FINGERPRINT SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature details-fingerprint) (value "no") (question gift-details-fingerprint))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-FINGERPRINT NO")) else
                        (if (eq ?answer i) 
                         then (assert (info (feature details-fingerprint) (value "indifferente") (question gift-details-fingerprint))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-FINGERPRINT INDIFFERENTE")) ))))
                (case gift-details-hdmi then     
                        (if (eq ?answer s) 
                         then (assert (info (feature details-hdmi) (value "si") (question gift-details-hdmi))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-HDMI SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature details-hdmi) (value "no") (question gift-details-hdmi))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-HDMI NO")) else
                        (if (eq ?answer i) 
                         then (assert (info (feature details-hdmi) (value "indifferente") (question gift-details-hdmi))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-HDMI INDIFFERENTE")) ))))
                (case gift-details-usb then     
                        (if (eq ?answer 1) 
                         then (assert (info (feature details-usb) (value "pochissime") (question gift-details-usb))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-USB POCHISSIME")) else
                        (if (eq ?answer 2) 
                         then (assert (info (feature details-usb) (value "poche") (question gift-details-usb))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-USB POCHE")) else
                        (if (eq ?answer 3) 
                         then (assert (info (feature details-usb) (value "abbastanza") (question gift-details-usb))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-USB ABBASTANZA")) else
                        (if (eq ?answer 4) 
                         then (assert (info (feature details-usb) (value "molte") (question gift-details-usb))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-USB MOLTE")) else
                        (if (eq ?answer 5) 
                         then (assert (info (feature details-usb) (value "moltissime") (question gift-details-usb))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-USB MOLTISSIME")) ))))))
                (case gift-details-gaming then  
                        (if (eq ?answer s) 
                         then (assert (info (feature details-gaming) (value "si") (question gift-details-gaming))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-GAMING SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature details-gaming) (value "no") (question gift-details-gaming))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-GAMING NO")) else
                        (if (eq ?answer i) 
                         then (assert (info (feature details-gaming) (value "indifferente") (question gift-details-gaming))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-GAMING INDIFFERENTE")) ))))
                (case gift-details-extendibility then        
                        (if (eq ?answer s) 
                         then (assert (info (feature details-extendibility) (value "si") (question gift-details-extendibility))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-EXTENDIBILITY SI")) else
                        (if (eq ?answer n) 
                         then (assert (info (feature details-extendibility) (value "no") (question gift-details-extendibility))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-EXTENDIBILITY NO")) else 
                        (if (eq ?answer i) 
                         then (assert (info (feature details-extendibility) (value "indifferente") (question gift-details-extendibility))) 
                              (if (eq ?*debug-mode* TRUE) then (printout t crlf " -> Info: DETAILS-EXTENDIBILITY INDIFFERENTE")) ))))
                
                (case rejection then
                        (if (eq ?answer s)
                                then    (printout t crlf "Grazie per aver utilizzato il sistema!" crlf crlf)
                                        (halt) else
                        (if (eq ?answer n)
                                then (assert (rejection)))))
                (case want-to-see-hypotetical-final-pc then
                        (if (eq ?answer s)
                                then (assert (want-to-see yes)) else
                        (if (eq ?answer n)
                                then (assert (want-to-see no)))))

                (case retraction then 
                        (if (eq ?answer s) 
                                then (assert (print-qna 1)) else
                        (if (eq ?answer n) 
                                then    (printout t crlf "Grazie per aver utilizzato il sistema!" crlf crlf) 
                                        (halt) )))
                (case retraction-number then 
                        (assert (reasked-question (question ?answer)))
                        (assert (pull-question ?answer)))

                (default
                        (if (eq ?*debug-mode* TRUE) then (printout t "CLIPS-Exception!!! - Ask")))
        )
)

(deffunction ask-boolean (?question ?number)
        (ask ?question ?number s n)
)