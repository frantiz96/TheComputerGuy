;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;             FUNZIONI DI VISUALIZZAZIONE               ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(deffunction print-welcome-screen ()
    (printout t crlf crlf crlf crlf crlf crlf crlf crlf crlf crlf crlf)
    (printout t "                     ========================== " crlf)
    (printout t "                         'The Computer Guy'     " crlf)
    (printout t "                        ====================    " crlf)
    (printout t "                                                " crlf)
    (printout t "                           _______________      " crlf)
    (printout t "                          |  ___________  |     " crlf)
    (printout t "                          | |           | |     " crlf)
    (printout t "                          | |   0   0   | |     " crlf)
    (printout t "                          | |     -     | |     " crlf)
    (printout t "                          | |   \\___/   | |    " crlf)
    (printout t "                          | |___     ___| |     " crlf)
    (printout t "                          |_____|\\_/|_____|    " crlf)
    (printout t "                            _|__|/ \\|_|_       " crlf)
    (printout t "                           / ********** \\      " crlf)
    (printout t "                         /  ************  \\    " crlf)
    (printout t "                        --------------------    " crlf)
    (printout t crlf crlf)
    (printout t "  Questo programma cerchera' di capire il computer che fa per te. " crlf crlf)
    (printout t "  Rispondi sinceramente alle domande." crlf)
)

(deffunction print-question (?question ?number)
        (printout t crlf)
        (if (and (not (eq ?question rejection))  (not (eq ?question want-to-see-hypotetical-final-pc))  (not (eq ?question retraction))   (not (eq ?question retraction-number)) ) then 
                (printout t "  " ?number ". "))
        (switch ?question

        ;;=========== SEZIONE UTENTE ===========;;

                (case user-age then
                        (printout t "Quanti anni hai? " crlf crlf))
                (case user-life then
                        (printout t "Cosa fai nella vita? " crlf crlf))
                (case user-gift then
                        (printout t "Il pc che stai per comprare e' un regalo? " crlf crlf))
                (case user-oldpc then
                        (printout t "Hai gia' avuto un pc prima d'ora? " crlf crlf))
                (case user-budget then
                        (printout t "Quanto sei disposto a spendere per questo pc? " crlf crlf))
                (case user-exp then
                        (printout t "Quanto te ne intendi di computer? " crlf crlf))

                (case oldpc-purpose then
                        (printout t "Stai cercando di prendere un pc simile al tuo precedente? " crlf crlf))
                (case oldpc-type then
                        (printout t "Che tipo di pc era quello che hai gia' avuto in passato? " crlf crlf))
                (case oldpc-why then
                        (printout t "Aveva/Ha problemi il pc precedente? " crlf crlf))
                
                (case purpose-gaming then
                        (printout t "Devi usare il pc principalmente per giocare? " crlf crlf))
                (case gaming-graphic then
                        (printout t "A quale gioco si avvicina di piu' la grafica dei giochi con cui ti diverti? " crlf crlf))
                (case gaming-epoch then
                        (printout t "A quale epoca di giochi sei maggiormente interessato? " crlf crlf))
                (case gaming-genre then
                        (printout t "A quale genere di giochi sei maggiormente interessato? " crlf crlf))
                
                (case purpose-study then
                        (printout t "Devi usare il pc principalmente per studiare? " crlf crlf))
                (case study-progs then
                        (printout t "Utilizzi applicazioni particolari per aiutarti nello studio? " crlf crlf))
                (case study-voyage then
                        (printout t "Ti capita di studiare in viaggio col pc o di dover spostare il pc frequentemente? " crlf crlf))
                
                (case purpose-internet then
                        (printout t "Devi usare il pc principalmente per navigare? " crlf crlf))
                (case internet-voyage then
                        (printout t "Necessiti di usare internet in viaggio col pc o di dover spostare il pc frequentemente? " crlf crlf))
        
                (case purpose-family then
                        (printout t "Deve essere un pc principalmente ad uso familiare? " crlf crlf))
                
                (case purpose-work then
                        (printout t "Devi usare il pc principalmente per lavorare? " crlf crlf))
                (case work-type then
                        (printout t "Quale dei seguenti di avvicina di piu' alla tipologia di lavoro che svolgi? " crlf crlf))
                (case work-risk then
                        (printout t "Il tuo lavoro prevede l'utilizzo del pc in ambienti esposti a rischi? " crlf crlf))
                (case work-graphic then
                        (printout t "Lavori con la grafica 3D? " crlf crlf))
                (case work-audio then
                        (printout t "Lavori con tante tracce audio? " crlf crlf))
                (case work-data then
                        (printout t "Gestisci grandissime quantita' di dati nel tuo lavoro? (ordine di milioni) " crlf crlf))
                (case work-voyage then
                        (printout t "Hai bisogno di usare il pc in viaggio per lavorare? " crlf crlf))  
       
                (case voyage then
                        (printout t "Hai bisogno di portare il pc in giro? " crlf crlf))
                (case still-space then
                        (printout t "Ci sono problemi di spazio sulla scrivania dove verra' appoggiato il pc? " crlf crlf))
                
                (case brand then
                        (printout t "E' importante per te la marca del pc? " crlf crlf))

                (case tablet then
                        (printout t "Ti trovi bene con dispositivi di tipo tablet con schermo tattile? " crlf crlf))

                (case big-display then
                        (printout t "Necessiti di uno schermo grande? " crlf crlf))
                
                (case details then
                        (printout t "Vuoi avere piu' dettagli sulle periferiche e componentistica? " crlf crlf))

                (case details-hdd then
                        (printout t "Di quanto spazio di archiviazione hai bisogno? " crlf crlf))
                (case details-battery then
                        (printout t "Necessiti di una batteria estesa? " crlf crlf))
                (case details-screen-resolution then
                        (printout t "Hai bisogno di uno schermo ad alta risoluzione? " crlf crlf))
                (case details-wireless then
                        (printout t "Hai bisogno di una connessione senza fili? " crlf crlf))
                (case details-bluetooth then
                        (printout t "Necessiti di un modulo per il bluetooth? " crlf crlf))
                (case details-cd then
                        (printout t "Hai bisogno di leggere cd dal pc? " crlf crlf))
                (case details-usb then
                        (printout t "Di quante porte usb hai bisogno? " crlf crlf))
                (case details-sim then
                        (printout t "Hai bisogno di inserire una sim nel pc per poterti collegare alla rete dati mobile? " crlf crlf))
                (case details-smartcard then
                        (printout t "Hai bisogno di leggere le smart-card dal pc? " crlf crlf))
                (case details-fingerprint then
                        (printout t "Potrebbe tornarti utile un sistema a riconoscimento di impronte? " crlf crlf))
                (case details-hdmi then
                        (printout t "Hai bisogno di una porta hdmi o simili (vga, dvi, displayport, minidisplayport)? " crlf crlf))
                (case details-sdcard then
                        (printout t "Hai bisogno di leggere schede sd e micro-sd? " crlf crlf))
                (case details-daylight-sensor then
                        (printout t "Ti piacerebbe avere un sensore di luce ambientale? " crlf crlf))
                (case details-gaming then
                        (printout t "Vuoi prendere anche una periferica di gioco in combinazione? " crlf crlf))
                (case details-esata then
                        (printout t "Potresti trovare utile avere una porta eSata? " crlf crlf))
                (case details-extendibility then
                        (printout t "Stai cercando un pc che sia facilmente estendibile? " crlf crlf))


        ;;=========== SEZIONE REGALO ===========;;

                (case gift-user-age then
                        (printout t "Quanti anni ha? " crlf crlf))
                (case gift-user-life then
                        (printout t "Cosa fa nella vita? " crlf crlf))
                (case gift-user-oldpc then
                        (printout t "Pensi che abbia gia' avuto un pc prima d'ora? " crlf crlf))
                
                (case gift-oldpc-purpose then
                        (printout t "Stai cercando di prendere un pc simile al suo precedente? " crlf crlf))
                (case gift-oldpc-type then
                        (printout t "Che tipo di pc e' quello che ha gia' avuto in passato? " crlf crlf))
                (case gift-oldpc-why then
                        (printout t "Secondo te aveva problemi il suo pc precedente? " crlf crlf))
                
                (case gift-purpose-gaming then
                        (printout t "Deve usare il pc principalmente per giocare? " crlf crlf))
                (case gift-gaming-graphic then
                        (printout t "A quale gioco si avvicina di piu' la grafica dei giochi con cui si diverte? " crlf crlf))
                (case gift-gaming-epoch then
                        (printout t "A quale epoca di giochi credi sia maggiormente interessato? " crlf crlf))
                (case gift-gaming-genre then
                        (printout t "A quale genere di giochi pensi sia maggiormente interessato? " crlf crlf))
                
                (case gift-purpose-study then
                        (printout t "Deve usare il pc principalmente per studiare? " crlf crlf))
                (case gift-study-progs then
                        (printout t "Secondo te utilizza applicazioni particolari per aiutarsi nello studio? " crlf crlf))
                (case gift-study-voyage then
                        (printout t "Secondo te gli capita di studiare in viaggio col pc o di dover spostare il pc frequentemente? " crlf crlf))
                
                (case gift-purpose-internet then
                        (printout t "Deve usare il pc principalmente per navigare? " crlf crlf))
                (case gift-internet-voyage then
                        (printout t "Necessita di usare internet in viaggio col pc o di dover spostare il pc frequentemente? " crlf crlf))

                (case gift-purpose-family then
                        (printout t "Deve essere un pc principalmente ad uso familiare? " crlf crlf))
                
                (case gift-purpose-work then
                        (printout t "Deve usare il pc principalmente per lavorare? " crlf crlf))
                (case gift-work-type then
                        (printout t "Quale dei seguenti di avvicina di piu' alla tipologia di lavoro che svolge? " crlf crlf))
                (case gift-work-risk then
                        (printout t "Il suo lavoro prevede l'utilizzo del pc in ambienti esposti a rischi? " crlf crlf))
                (case gift-work-graphic then
                        (printout t "Da quello che sai, lavora con la grafica 3D? " crlf crlf))
                (case gift-work-audio then
                        (printout t "Secondo te lavora con tante tracce audio? " crlf crlf))
                (case gift-work-data then
                        (printout t "A tuo avviso, gestisce grandissime quantita' di dati nel tuo lavoro? (ordine di milioni)" crlf crlf))
                (case gift-work-voyage then
                        (printout t "Secondo te, avra' bisogno di usare il pc in viaggio? " crlf crlf)) 
                
                (case gift-voyage then
                        (printout t "Avra' il bisogno di portare il pc in giro? " crlf crlf))
                (case gift-still-space then
                        (printout t "Supponi ci possano essere problemi di spazio sulla scrivania dove verra' appoggiato il pc? " crlf crlf))
                
                (case gift-brand then
                        (printout t "Secondo te e' importante per lui/lei la marca del pc? " crlf crlf))

                (case gift-tablet then
                        (printout t "A tuo avviso, pensi si trovi bene con dispositivi di tipo tablet con schermo tattile? " crlf crlf))

                (case gift-big-display then
                        (printout t "A tuo avviso, ha bisogno di uno schermo grande? " crlf crlf))

                (case gift-details-hdd then
                        (printout t "Di quanto spazio di archiviazione avra' bisogno? " crlf crlf))
                (case gift-details-battery then
                        (printout t "Necessita di una batteria a lunga durata? " crlf crlf))
                (case gift-details-screen-resolution then
                        (printout t "Secondo te, ha bisogno di uno schermo ad alta risoluzione? " crlf crlf))
                (case gift-details-cd then
                        (printout t "Ha bisogno di leggere cd dal pc? " crlf crlf))
                (case gift-details-fingerprint then
                        (printout t "Gli potrebbe tornare utile un sistema a riconoscimento di impronte? " crlf crlf))
                (case gift-details-hdmi then
                        (printout t "Potrebbe aver bisogno di una porta hdmi o simili (vga, dvi, displayport, minidisplayport)? " crlf crlf))
                (case gift-details-usb then
                        (printout t "Di quante porte usb ha bisogno? " crlf crlf))
                (case gift-details-gaming then
                        (printout t "Vuoi prendere anche una periferica di gioco in combinazione? " crlf crlf))
                (case gift-details-extendibility then
                        (printout t "Secondo te vorrebbe un pc che sia facilmente estendibile? " crlf crlf))

                (case rejection then
                        (printout t "  Sei soddisfatto di questa configurazione o vuoi che provi a cercarne un'altra?" crlf crlf))
                (case want-to-see-hypotetical-final-pc then
                        (printout t "  Vorresti vedere i dettagli di questa configurazione o vuoi che provi a cercarne un'altra?" crlf crlf))

                (case retraction then           
                        (printout t "  Vuoi rivedere le risposte che hai dato?" crlf crlf))
                (case retraction-number then
                        (printout t "  Inserisci il numero della domanda relativa alla risposta che vuoi cambiare: "))
                
                (default
                        (printout t "CLIPS-Exception!!! - Print Question: " ?question crlf))
        )
)

(deffunction print-why-help (?answer)
        (if (and (neq ?answer s) (neq ?answer n) (neq ?answer i)) then
                (if (eq ?answer h) then
                        (printout t crlf " (h) Non ho capito la domanda in realta'. " crlf) else
                (if (eq ?answer w)
                        then (printout t " (w) Perche' mi fai questa domanda?" crlf crlf "  ") else
                (printout t "  *CLIPS PROBLEM*" crlf))))
)

(deffunction print-yes-no (?answer)
        (if (eq ?answer s)
                then (printout t " (s) Si. " crlf) else
        (if (eq ?answer n)
                then (printout t " (n) No. " crlf)))
)

(deffunction print-yes-no-indifferent (?answer)
        (if (eq ?answer s)
                then (printout t " (s) Si. " crlf) else
        (if (eq ?answer n)
                then (printout t " (n) No. " crlf) else
        (if (eq ?answer i)
                then (printout t " (i) Indifferente. " crlf))))
)

(deffunction print-probably-yes-no (?answer)
        (if (eq ?answer s)
                then (printout t " (s) Probabilmente si. " crlf) else
        (if (eq ?answer n)
                then (printout t " (n) Non credo. " crlf)))
)

(deffunction print-answers (?question $?answers)
        (foreach ?answer $?answers
                (switch ?question

                ;;=========== SEZIONE UTENTE ===========;;

                        (case user-age then             
                                (if (eq ?answer 1)
                                 then (printout t " (1) Meno di 10 anni. " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Tra i 10 e i 20 anni. " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Tra i 20 e i 30 anni. " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) Tra i 30 e i 40 anni. " crlf) else
                                (if (eq ?answer 5)
                                 then (printout t " (5) Tra i 40 e i 50 anni. " crlf) else
                                (if (eq ?answer 6)
                                 then (printout t " (6) Tra i 50 e i 60 anni. " crlf) else
                                (if (eq ?answer 7)
                                 then (printout t " (7) Tra i 60 e i 70 anni. " crlf) else
                                (if (eq ?answer 8)
                                 then (printout t " (8) Piu' di 70 anni. " crlf) else
                                (print-why-help ?answer) )))))))))
                        (case user-life then            
                                (if (eq ?answer 1)
                                 then (printout t " (1) Sto ancora studiando. " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Guadagno un salario. " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Sono disoccupato. " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) Sono in pensione. " crlf) else
                                (print-why-help ?answer) )))))
                        (case user-gift then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case user-oldpc then           
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case user-budget then          
                                (if (eq ?answer 1)
                                 then (printout t " (1) Meno di 300 euro. " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Tra i 300 e i 600 euro. " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Tra i 600 e i 900 euro. " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) Tra i 900 e i 1500 euro. " crlf) else
                                (if (eq ?answer 5)
                                 then (printout t " (5) Tra i 1500 e i 2500 euro. " crlf) else
                                (if (eq ?answer 6)
                                 then (printout t " (6) Piu' di 2500 euro. " crlf) else
                                (print-why-help ?answer) )))))))
                        (case user-exp then             
                                (if (eq ?answer 0)
                                 then (printout t " (0) Non so cosa e' un computer. " crlf) else
                                (if (eq ?answer 1)
                                 then (printout t " (1) Posso usare senza problemi la tastiera e il mouse. " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Conosco le caratteristiche generiche di un pc, limitandomi ad un uso comune. " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) So cosa e' una cpu e un banco di ram, ma non vado oltre il 'sentito dire'. " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) Sono in grado di eseguire upgrade di componenti del pc in maniera affidabile e studiata. " crlf) else
                                (if (eq ?answer 5)
                                 then (printout t " (5) Posso individuare ogni minimo dettaglio delle caratteristiche di un pc che non conosco a colpo d'occhio." crlf) else
                                (print-why-help ?answer) )))))))

                        (case oldpc-purpose then        
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case oldpc-type then           
                                (if (eq ?answer 0)
                                 then (printout t " (0) Non lo so. " crlf) else
                                (if (eq ?answer 1)
                                 then (printout t " (1) Workstation. " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Tablet PC. " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) All-in-One. " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) Netbook. " crlf) else
                                (if (eq ?answer 5)
                                 then (printout t " (5) Gaming PC. " crlf) else
                                (if (eq ?answer 6)
                                 then (printout t " (6) Desktop. " crlf) else
                                (if (eq ?answer 7)
                                 then (printout t " (7) Laptop. " crlf) else
                                (if (eq ?answer 8)
                                 then (printout t " (8) Ultrabook. " crlf) else
                                (if (eq ?answer 9)
                                 then (printout t " (9) Toughbook. " crlf) else
                                (if (eq ?answer 10)
                                 then (printout t " (10) Tablet. " crlf) else
                                (print-why-help ?answer) ))))))))))))
                        (case oldpc-why then            
                                (if (eq ?answer 0)
                                 then (printout t " (0) No. " crlf) else
                                (if (eq ?answer 1)
                                 then (printout t " (1) Si, e' lento e/o vecchio. " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Si, non e' abbastanza portatile. " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Si, si e' rotto. " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) Si, ma non rientra tra le motivazioni precedenti. " crlf) else
                                (print-why-help ?answer) ))))))
                        
                        (case purpose-gaming then       
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case gaming-graphic then       
                                (if (eq ?answer 1)
                                 then (printout t " (1) Super Mario. (bassissima)" crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) League of Legends. (bassa)" crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Fallout 3. (media)" crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) The Elder Scrolls V: Skyrim. (alta)" crlf) else
                                (if (eq ?answer 5)
                                 then (printout t " (5) Far Cry Primal. (altissima)" crlf) else
                                (if (eq ?answer 6)
                                 then (printout t " (6) Clash Royale. (giochi mobile)" crlf) else
                                (print-why-help ?answer) )))))))
                        (case gaming-epoch then         
                                (if (eq ?answer 1)
                                 then (printout t " (1) Meno di 3 anni fa. (2014-2017) " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Meno di 10 anni fa. (2007-2014) " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Piu' di 10 anni fa. (2000-2007) " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) Giochi mobile. (2010-2017) " crlf) else 
                                (print-why-help ?answer) )))))
                        (case gaming-genre then         
                                (if (eq ?answer 0)
                                 then (printout t " (0) Nessuno dei seguenti. " crlf) else
                                (if (eq ?answer 1)
                                 then (printout t " (1) Super Mario      (... Baldur's Gate ..... Pokemon ...) " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Call of Duty     (... Metal Gear Solid .. Far Cry ...) " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Tomb Raider      (... Uncharted ......... Fallout ...) " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) The Last of Us   (... Syberia ........... Life is Strange ...) " crlf) else
                                (if (eq ?answer 5)
                                 then (printout t " (5) X-Plane          (... The Sims .......... Transport Tycoon Deluxe ...) " crlf) else
                                (if (eq ?answer 6)
                                 then (printout t " (6) Civilization     (... Total War ......... Age of Empires ...) " crlf) else
                                (if (eq ?answer 7)
                                 then (printout t " (7) Need for Speed   (... FlatOut ........... F1 ..... GTA ... ) " crlf) else
                                (if (eq ?answer 8)
                                 then (printout t " (8) Fifa             (... Tekken ............ WWE ..... Rocket League ...) " crlf) else
                                (if (eq ?answer 9)
                                 then (printout t " (9) DOTA             (... Warcraft .......... League of Legends ...) " crlf) else
                                (if (eq ?answer 10)
                                 then (printout t " (10) Fruit Ninja     (... Clash Royale ...... Candy Crush ...) " crlf) else
                                (print-why-help ?answer) ))))))))))))

                        (case purpose-study then        
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case study-progs then          
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case study-voyage then                 
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )

                        (case purpose-internet then             
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case internet-voyage then              
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )

                        (case purpose-family then               
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )                 

                        (case purpose-work then                 
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case work-type then            
                                (if (eq ?answer 1)
                                 then (printout t " (1) Lavoro amministrativo. " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Lavoro tecnico-professionale. " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Lavoro di manodopera. " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) Nessuno dei precedenti. " crlf) else
                                (print-why-help ?answer) )))))
                        (case work-risk then            
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case work-graphic then         
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case work-audio then   
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case work-data then    
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case work-voyage then  
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )
                
                        (case voyage then       
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case still-space then          
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )                

                        (case brand then                
                                (if (eq ?answer 1)
                                 then (printout t " (1) Pochissimo. " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Poco. " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Abbastanza. " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) Molto. " crlf) else
                                (if (eq ?answer 5)
                                 then (printout t " (5) Moltissimo. " crlf) else
                                (print-why-help ?answer) ))))))

                        (case tablet then       
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )

                        (case big-display then  
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )                       
                        
                        (case details then              
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )
                        
                        (case details-hdd then          
                                (if (eq ?answer 1)
                                 then (printout t " (1) Pochissimo. " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Poco. " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Abbastanza. " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) Molto. " crlf) else
                                (if (eq ?answer 5)
                                 then (printout t " (5) Moltissimo. " crlf) else
                                (print-why-help ?answer) ))))))
                        (case details-battery then
                                (print-yes-no-indifferent ?answer)
                                (print-why-help ?answer) )
                        (case details-screen-resolution then            
                                (print-yes-no-indifferent ?answer)
                                (print-why-help ?answer) )
                        (case details-wireless then             
                                (print-yes-no-indifferent ?answer)
                                (print-why-help ?answer) )
                        (case details-bluetooth then            
                                (print-yes-no-indifferent ?answer)
                                (print-why-help ?answer) )
                        (case details-cd then           
                                (print-yes-no-indifferent ?answer)
                                (print-why-help ?answer) )
                        (case details-usb then          
                                (if (eq ?answer 1)
                                 then (printout t " (1) Pochissime. " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Poche. " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Abbastanza. " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) Molte. " crlf) else
                                (if (eq ?answer 5)
                                 then (printout t " (5) Moltissime. " crlf) else
                                (print-why-help ?answer) ))))))
                        (case details-sim then          
                                (print-yes-no-indifferent ?answer)
                                (print-why-help ?answer) )
                        (case details-smartcard then            
                                (print-yes-no-indifferent ?answer)
                                (print-why-help ?answer) )
                        (case details-fingerprint then          
                                (print-yes-no-indifferent ?answer)
                                (print-why-help ?answer) )
                        (case details-hdmi then         
                                (print-yes-no-indifferent ?answer)
                                (print-why-help ?answer) )
                        (case details-sdcard then               
                                (print-yes-no-indifferent ?answer)
                                (print-why-help ?answer) )
                        (case details-daylight-sensor then              
                                (print-yes-no-indifferent ?answer)
                                (print-why-help ?answer) )
                        (case details-gaming then               
                                (print-yes-no-indifferent ?answer)
                                (print-why-help ?answer) )
                        (case details-esata then                
                                (print-yes-no-indifferent ?answer)
                                (print-why-help ?answer) )
                        (case details-extendibility then        
                                (print-yes-no-indifferent ?answer)
                                (print-why-help ?answer) )

                ;;=========== SEZIONE REGALO ===========;;
                        
                        (case gift-user-age then                
                                (if (eq ?answer 1)
                                 then (printout t " (1) Meno di 10 anni. " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Tra i 10 e i 20 anni. " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Tra i 20 e i 30 anni. " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) Tra i 30 e i 40 anni. " crlf) else
                                (if (eq ?answer 5)
                                 then (printout t " (5) Tra i 40 e i 50 anni. " crlf) else
                                (if (eq ?answer 6)
                                 then (printout t " (6) Tra i 50 e i 60 anni. " crlf) else
                                (if (eq ?answer 7)
                                 then (printout t " (7) Tra i 60 e i 70 anni. " crlf) else
                                (if (eq ?answer 8)
                                 then (printout t " (8) Piu' di 70 anni. " crlf) else
                                (print-why-help ?answer) )))))))))
                        (case gift-user-life then               
                                (if (eq ?answer 1)
                                 then (printout t " (1) Sta ancora studiando. " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Guadagna un salario. " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) E' disoccupato. " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) E' in pensione. " crlf) else
                                (print-why-help ?answer) )))))
                        (case gift-user-oldpc then
                                (print-probably-yes-no ?answer)
                                (print-why-help ?answer) )

                        (case gift-oldpc-purpose then   
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case gift-oldpc-type then              
                                (if (eq ?answer 0)
                                 then (printout t " (0) Non lo so. " crlf) else
                                (if (eq ?answer 1)
                                 then (printout t " (1) Workstation. " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Tablet PC. " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) All-in-One. " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) Netbook. " crlf) else
                                (if (eq ?answer 5)
                                 then (printout t " (5) Gaming PC. " crlf) else
                                (if (eq ?answer 6)
                                 then (printout t " (6) Desktop. " crlf) else
                                (if (eq ?answer 7)
                                 then (printout t " (7) Laptop. " crlf) else
                                (if (eq ?answer 8)
                                 then (printout t " (8) Ultrabook. " crlf) else
                                (if (eq ?answer 9)
                                 then (printout t " (9) Toughbook. " crlf) else
                                (if (eq ?answer 10)
                                 then (printout t " (10) Tablet. " crlf) else
                                (print-why-help ?answer) ))))))))))))
                        (case gift-oldpc-why then               
                                (if (eq ?answer 0)
                                 then (printout t " (0) Non che io sapessi. " crlf) else
                                (if (eq ?answer 1)
                                 then (printout t " (1) Si, probabilmente e' lento e/o vecchio. " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Si, probabilmente non e' abbastanza portatile. " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Si, probabilmente si e' rotto. " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) Si, ma probabilmente non rientra tra le motivazioni precedenti. " crlf) else
                                (print-why-help ?answer) ))))))
                        
                        (case gift-purpose-gaming then  
                                (print-probably-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case gift-gaming-graphic then  
                                (if (eq ?answer 1)
                                 then (printout t " (1) Super Mario. (bassissima)" crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) League of Legends. (bassa)" crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Fallout 3. (media)" crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) The Elder Scrolls V: Skyrim. (alta)" crlf) else
                                (if (eq ?answer 5)
                                 then (printout t " (5) Far Cry Primal. (altissima)" crlf) else
                                (if (eq ?answer 6)
                                 then (printout t " (6) Clash Royale. (giochi mobile)" crlf) else
                                (print-why-help ?answer) )))))))
                        (case gift-gaming-epoch then    
                                (if (eq ?answer 1)
                                 then (printout t " (1) A mio avviso, meno di 3 anni fa. (2014-2017) " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) A mio avviso, meno di 10 anni fa. (2007-2014) " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) A mio avviso, piu' di 10 anni fa. (2000-2007) " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) A mio avviso, giochi mobile. (2010-2017) " crlf) else 
                                (print-why-help ?answer) )))))
                        (case gift-gaming-genre then    
                                (if (eq ?answer 0)
                                 then (printout t " (0) Nessuno dei seguenti. " crlf) else
                                (if (eq ?answer 1)
                                 then (printout t " (1) Super Mario      (... Baldur's Gate ..... Pokemon ...) " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Call of Duty     (... Metal Gear Solid .. Far Cry ...) " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Tomb Raider      (... Uncharted ......... Fallout ...) " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) The Last of Us   (... Syberia ........... Life is Strange ...) " crlf) else
                                (if (eq ?answer 5)
                                 then (printout t " (5) X-Plane          (... The Sims .......... Transport Tycoon Deluxe ...) " crlf) else
                                (if (eq ?answer 6)
                                 then (printout t " (6) Civilization     (... Total War ......... Age of Empires ...) " crlf) else
                                (if (eq ?answer 7)
                                 then (printout t " (7) Need for Speed   (... FlatOut ........... F1 ..... GTA ... ) " crlf) else
                                (if (eq ?answer 8)
                                 then (printout t " (8) Fifa             (... Tekken ............ WWE ..... Rocket League ...) " crlf) else
                                (if (eq ?answer 9)
                                 then (printout t " (9) DOTA             (... Warcraft .......... League of Legends ...) " crlf) else
                                (if (eq ?answer 10)
                                 then (printout t " (10) Fruit Ninja     (... Clash Royale ...... Candy Crush ...) " crlf) else
                                (print-why-help ?answer) ))))))))))))

                        (case gift-purpose-study then   
                                (print-probably-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case gift-study-progs then             
                                (if (eq ?answer s)
                                 then (printout t " (s) Credo di si. " crlf) else
                                (if (eq ?answer n)
                                 then (printout t " (n) Credo di no. " crlf) else
                                (print-why-help ?answer) )))
                        (case gift-study-voyage then            
                                (if (eq ?answer s)
                                 then (printout t " (s) Credo di si. " crlf) else
                                (if (eq ?answer n)
                                 then (printout t " (n) Credo di no. " crlf) else
                                (print-why-help ?answer) )))

                        (case gift-purpose-internet then                
                                (print-probably-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case gift-internet-voyage then                 
                                (if (eq ?answer s)
                                 then (printout t " (s) Credo di si. " crlf) else
                                (if (eq ?answer n)
                                 then (printout t " (n) Credo di no. " crlf) else
                                (print-why-help ?answer) )))

                        (case gift-purpose-family then          
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )

                        (case gift-purpose-work then            
                                (print-probably-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case gift-work-type then               
                                (if (eq ?answer 1)
                                 then (printout t " (1) Lavoro amministrativo. " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Lavoro tecnico-professionale. " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Lavoro di manodopera. " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) Nessuno dei precedenti. " crlf) else
                                (print-why-help ?answer) )))))
                        (case gift-work-risk then               
                                (print-probably-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case gift-work-graphic then    
                                (print-probably-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case gift-work-audio then      
                                (print-probably-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case gift-work-data then       
                                (print-probably-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case gift-work-voyage then     
                                (print-probably-yes-no ?answer)
                                (print-why-help ?answer) )
                        
                        (case gift-voyage then  
                                (print-probably-yes-no ?answer)
                                (print-why-help ?answer) )
                        (case gift-still-space then             
                                (print-yes-no ?answer)
                                (print-why-help ?answer) )

                        (case gift-brand then           
                                (if (eq ?answer 1)
                                 then (printout t " (1) Pochissimo. " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Poco. " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Abbastanza. " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) Molto. " crlf) else
                                (if (eq ?answer 5)
                                 then (printout t " (5) Moltissimo. " crlf) else
                                (print-why-help ?answer) ))))))

                        (case gift-tablet then  
                                (print-probably-yes-no ?answer)
                                (print-why-help ?answer) )

                        (case gift-big-display then     
                                (print-probably-yes-no ?answer)
                                (print-why-help ?answer) )

                        (case gift-details-hdd then             
                                (if (eq ?answer 1)
                                 then (printout t " (1) Pochissimo. " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Poco. " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Abbastanza. " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) Molto. " crlf) else
                                (if (eq ?answer 5)
                                 then (printout t " (5) Moltissimo. " crlf) else
                                (print-why-help ?answer) ))))))
                        (case gift-details-battery then         
                                (print-yes-no-indifferent ?answer)
                                (print-why-help ?answer) )
                        (case gift-details-screen-resolution then               
                                (print-yes-no-indifferent ?answer)
                                (print-why-help ?answer) )
                        (case gift-details-cd then              
                                (print-yes-no-indifferent ?answer)
                                (print-why-help ?answer) )
                        (case gift-details-fingerprint then             
                                (print-yes-no-indifferent ?answer)
                                (print-why-help ?answer) )
                        (case gift-details-hdmi then         
                                (print-yes-no-indifferent ?answer)
                                (print-why-help ?answer) )
                        (case gift-details-usb then             
                                (if (eq ?answer 1)
                                 then (printout t " (1) Pochissime. " crlf) else
                                (if (eq ?answer 2)
                                 then (printout t " (2) Poche. " crlf) else
                                (if (eq ?answer 3)
                                 then (printout t " (3) Abbastanza. " crlf) else
                                (if (eq ?answer 4)
                                 then (printout t " (4) Molte. " crlf) else
                                (if (eq ?answer 5)
                                 then (printout t " (5) Moltissime. " crlf) else
                                (print-why-help ?answer) ))))))
                        (case gift-details-gaming then          
                                (print-yes-no-indifferent ?answer)
                                (print-why-help ?answer) )
                        (case gift-details-extendibility then        
                                (print-yes-no-indifferent ?answer)
                                (print-why-help ?answer) )

                        (case rejection then
                                (if (eq ?answer s)
                                        then (printout t " (s) Si, va bene questa qui. " crlf) else
                                (if (eq ?answer n)
                                        then (printout t " (n) Non va bene, prova a cercarne un'altra. " crlf crlf "  ") else
                                (printout t "  *CLIPS PROBLEM*" crlf) )))

                        (case want-to-see-hypotetical-final-pc then
                                (if (eq ?answer s)
                                        then (printout t " (s) Si, vediamo! " crlf) else
                                (if (eq ?answer n)
                                        then (printout t " (n) No, grazie, prova a cercarne un'altra. " crlf crlf "  ") else
                                (printout t "  *CLIPS PROBLEM*" crlf) )))

                        (case retraction then
                                (if (eq ?answer s)
                                 then (printout t " (s) Si, voglio rivederle. " crlf) else
                                (if (eq ?answer n)
                                 then (printout t " (n) No, vanno bene. " crlf crlf "  ") else
                                (printout t "  *CLIPS PROBLEM*" crlf) )))
                        (case retraction-number then
                                (printout t))
                        
                        (default
                                (printout t "CLIPS-Exception!!! - Print Answers: " ?question crlf))
                )
        )
)

(deffunction print-why (?question)
        (if (and (not (eq ?question rejection)) (not (eq ?question want-to-see-hypotetical-final-pc)) (not (eq ?question retraction))   (not (eq ?question retraction-number)) ) then
                (printout t crlf "  Ti faccio questa domanda perche' sto cercando di capire "))
        (switch ?question

        ;;=========== SEZIONE UTENTE ===========;;

                (case user-age then             
                        (printout t "la tua eta', in modo da comprendere meglio le tue esigenze e le successive domande da porti. "))
                (case user-life then            
                        (printout t "le attivita' che compi ogni giorno, cosi' da poter trovare il computer per poterle svolgere nel migliore dei modi. "))             
                (case user-gift then    
                        (printout t "se comprerai il computer per qualcun'altro e di conseguenza le esigenze che avra' chi utilizzera' il computer. "))         
                (case user-oldpc then           
                        (printout t "se e' la prima volta che acquisti un computer o se ne hai gia' avuto uno e ne cerchi uno simile. "))               
                (case user-budget then          
                        (printout t "il tuo budget a disposizione per questo acquisto cosi' da poter trovare il computer con il miglior rapporto prezzo/prestazioni. "))                
                (case user-exp then             
                        (printout t "se e quanto conosci a livello informatico, in modo da poter valutare esigenze particolari come la possibilita' di modificare autonomamente il computer. "))

                (case oldpc-purpose then        
                        (printout t "se hai bisogno di un computer con caratteristiche simili a quello che gia' possiedi. "))
                (case oldpc-type then           
                        (printout t "la tipologia del tuo vecchio computer per provare a trovarne uno simile. "))
                (case oldpc-why then            
                        (printout t "eventuali problemi del vecchio computer (ad esempio, la non portabilita') per poterne trovare uno nuovo che possa risolverli (ad esempio, un computer portatile). "))

                (case purpose-gaming then       
                        (printout t "se utilizzi regolarmente il computer con giochi che potrebbero richiedere capacita' grafiche avanzate. "))
                (case gaming-graphic then       
                        (printout t "di quanta potenza grafica hai bisogno per poter avere la miglior esperienza di gioco. "))
                (case gaming-epoch then         
                        (printout t "quanto recenti e complessi a livello grafico sono i giochi. "))
                (case gaming-genre then         
                        (printout t "lo stile grafico dei giochi a cui sei interessato. "))
                
                (case purpose-study then        
                        (printout t "se utilizzi questo computer regolarmente per studiare. "))
                (case study-progs then          
                        (printout t "se utilizzi programmi che potrebbero richiedere prestazioni di calcolo elevate. "))
                (case study-voyage then                 
                        (printout t "se hai bisogno di un computer che sia facilmente trasportabile e che non abbia un peso eccessivo per agevolarti nei tuoi spostamenti. "))

                (case purpose-internet then     
                        (printout t "se utilizzi questo computer regolarmente per navigare in internet (social network/posta elettronica/video/eCommerce). "))
                (case internet-voyage then              
                        (printout t "se hai bisogno di un computer che sia facilmente trasportabile e che non abbia un peso eccessivo per agevolarti nei tuoi spostamenti. "))

                (case purpose-family then               
                        (printout t "se questo computer verra' utilizzato regolarmente da tutti i componenti della famiglia per navigare in internet o lavorare. "))
                
                (case purpose-work then         
                        (printout t "se stai cercando un computer per il tuo lavoro giornaliero. "))
                (case work-type then            
                        (printout t "se hai bisogno di un computer con caratteristiche particolari che possa essere sempre affidabile durante il lavoro. "))
                (case work-risk then            
                        (printout t "se utilizzi il computer in un ambiente a rischio in modo da poter trovare un computer che sia molto robusto ed affidabile. "))
                (case work-graphic then         
                        (printout t "se hai bisogno di un computer con elevate capacita' di elaborazione grafica. "))
                (case work-audio then           
                        (printout t "se necessiti di un computer che abbia la potenza di calcolo adeguata per poter gestire molte tracce audio o strumenti virtuali. "))
                (case work-data then            
                        (printout t "se hai bisogno di un computer che sia in grado di elaborare una grande quantita' di dati in modo affidabile e veloce. "))
                (case work-voyage then          
                        (printout t "se hai bisogno di un computer facilmente trasportabile e che non abbia un peso eccessivo per agevolarti nei tuoi spostamenti lavorativi. "))
                
                (case voyage then       
                        (printout t "se hai necessita' di effettuare spostamenti con il computer cosi' da poterne scegliere uno che sia poco ingombrante e facilmente trasportabile. "))
                (case still-space then          
                        (printout t "se hai particolari esigenze di spazio sulla scrivania dove utilizzerai il computer in modo da capire se le dimensioni del computer dovranno essere contenute. "))
                
                (case brand then                
                        (printout t "se preferisci un computer di una marca i cui prodotti sono molto affidabili e quindi per trovare un computer di qualita' adeguata. "))
                
                (case tablet then       
                        (printout t "se un computer tablet con schermo tattile potrebbe essere comodo o meno per le tue esigenze. "))

                (case big-display then  
                        (printout t "se hai bisogno di un computer con uno schermo grande per motivi di gioco o per problemi di vista. "))                

                (case details then
                        (printout t "se hai delle esigenze particolari sui componenti che costituiranno il computer che stai cercando. "))              
                (case details-hdd then          
                        (printout t "la quantita' di file e documenti che memorizzerai sul computer. "))                
                (case details-battery then
                        (printout t "se la durata della batteria e' fondamentale oppure puoi anche farne a meno. "))            
                (case details-screen-resolution then
                        (printout t "se scegliere un computer che abbia una risoluzione dello schermo molto elevata. "))                
                (case details-wireless then
                        (printout t "se necessiti di un computer in grado di collegarsi alla rete wireless. "))                
                (case details-bluetooth then
                        (printout t "se hai bisogno di un computer con un ricevitore bluetooth integrato per collegare dispositivi senza fili al computer. "))          
                (case details-cd then
                        (printout t "se utilizzerai spesso dei cd o dei dvd con il computer. "))                
                (case details-usb then
                        (printout t "la quantita' di porte usb a cui collegare i vari dispositivi. "))            
                (case details-sim then
                        (printout t "se hai bisogno di un computer con uno slot per le sim dedicato per poterti collegare alla rete dati mobile. "))                
                (case details-smartcard then
                        (printout t "se utilizzerai delle smartcard (ad esempio, carte di credito) con il computer. "))                
                (case details-fingerprint then
                        (printout t "se preferisci proteggere i dati sul tuo computer tramite la tua impronta digitale per un livello di sicurezza molto elevato. "))           
                (case details-hdmi then
                        (printout t "se collegherai monitor o televisori esterni al computer. "))               
                (case details-sdcard then
                        (printout t "se utilizzerai il computer per gestire il contenuto di schede di memoria. "))              
                (case details-daylight-sensor then
                        (printout t "se il computer dovra' avere un dispositivo in grado di rilevare la luce dell'ambiente in cui ti trovi e adattare di conseguenza la luminosita' dello schermo. "))          
                (case details-gaming then
                        (printout t "se hai bisogno di periferiche esterne per poter giocare in modo adeguato. "))              
                (case details-esata then
                        (printout t "se devo cercare un computer a cui poter collegare hard disk esterni o dispositivi ad alte prestazioni tramite la porta eSata. "))       
                (case details-extendibility then        
                        (printout t "se, una volta acquistato il computer, avrai esigenze di espansione e aumento di potenza del computer. "))     

        ;;=========== SEZIONE REGALO ===========;;

                (case gift-user-age then        
                        (printout t "l'eta' della persona a cui farai questo regalo, in modo da comprendere meglio le sue esigenze, ad esempio capire se studia oppure lavora. "))              
                (case gift-user-life then       
                        (printout t "le attivita' che la persona a cui farai questo regalo compie ogni giorno, cosi' da poter trovare il computer per poterle svolgere nel migliore dei modi. "))               
                (case gift-user-oldpc then      
                        (printout t "se la persona a cui farai questo regalo ha gia' avuto un computer e ne cercha uno simile. "))              
                
                (case gift-oldpc-purpose then   
                        (printout t "se la persona a cui farai questo regalo ha bisogno di un computer con caratteristiche simili a quello attuale. "))
                (case gift-oldpc-type then      
                        (printout t "la tipologia del suo vecchio computer per provare a trovarne uno simile. "))
                (case gift-oldpc-why then       
                        (printout t "eventuali problemi del vecchio computer (ad esempio, la non portabilita') per poterne trovare uno nuovo che possa risolverli (ad esempio, un computer portatile). "))

                (case gift-purpose-gaming then  
                        (printout t "se la persona a cui farai questo regalo utilizza regolarmente il computer con giochi che potrebbero richiedere capacita' grafiche avanzate. "))
                (case gift-gaming-graphic then
                        (printout t "di quanta potenza grafica ha bisogno per poter avere la miglior esperienza di gioco. "))
                (case gift-gaming-epoch then    
                        (printout t "quanto recenti e complessi a livello grafico sono i giochi. "))
                (case gift-gaming-genre then    
                        (printout t "lo stile grafico dei giochi che la persona a cui farai questo regalo preferisce. "))
                
                (case gift-purpose-study then   
                        (printout t "se la persona a cui farai questo regalo utilizza il computer regolarmente per studiare. "))
                (case gift-study-progs then             
                        (printout t "se utilizza programmi che potrebbero richiedere prestazioni di calcolo elevate. "))
                (case gift-study-voyage then    
                        (printout t "se ha bisogno di un computer che sia facilmente trasportabile e che non abbia un peso eccessivo negli spostamenti. "))

                (case gift-purpose-internet then 
                        (printout t "se la persona a cui farai questo regalo utilizza il computer regolarmente per navigare in internet (social network/posta elettronica/video/eCommerce). "))
                (case gift-internet-voyage then 
                        (printout t "se ha bisogno di un computer che sia facilmente trasportabile e che non abbia un peso eccessivo negli spostamenti. "))
                
                (case gift-purpose-family then 
                        (printout t "se questo computer verra' utilizzato regolarmente da tutti i componenti della famiglia della persona a cui lo regalerai per navigare in internet o lavorare. "))
                
                (case gift-purpose-work then    
                        (printout t "se stai cercando un computer che la persona a cui lo regalerai utilizzera' per il suo lavoro giornaliero. "))
                (case gift-work-type then       
                        (printout t "se ha bisogno di un computer con caratteristiche particolari che possa essere sempre affidabile durante il lavoro. "))
                (case gift-work-risk then       
                        (printout t "se utilizzera' il computer in un ambiente a rischio in modo da poter trovare un computer che sia molto robusto ed affidabile. "))
                (case gift-work-graphic then    
                        (printout t "se ha bisogno di un computer con elevate capacita' di elaborazione grafica. "))
                (case gift-work-audio then      
                        (printout t "se necessita di un computer che abbia la potenza di calcolo necessaria per poter gestire molte tracce audio o strumenti virtuali. "))
                (case gift-work-data then       
                        (printout t "se ha bisogno di un computer che sia in grado di elaborare una grande quantita' di dati in modo affidabile e veloce. "))
                (case gift-work-voyage then     
                        (printout t "se ha bisogno di un computer che sia facilmente trasportabile e che non abbia un peso eccessivo negli spostamenti lavorativi. "))
                
                (case gift-voyage then  
                        (printout t "se ha necessita' di effettuare spostamenti con il computer cosi' da poterne scegliere uno che sia poco ingombrante e facilmente trasportabile. "))
                (case gift-still-space then 
                        (printout t "se ci sono particolari esigenze di spazio sulla scrivania dove sara' utilizzato il computer in modo da capire se le dimensioni del computer dovranno essere contenute. "))
                
                (case gift-brand then   
                        (printout t "se preferisce un computer di una marca i cui prodotti siano molto affidabili e quindi per trovare un computer di qualita' adeguata. "))
                
                (case gift-tablet then  
                        (printout t "se un computer tablet con schermo tattile potrebbe essere comodo o meno per chi ricevera' il tuo regalo. "))

                (case gift-big-display then     
                        (printout t "se ha bisogno di un computer con uno schermo grande per motivi di gioco o per problemi di vista. "))

                (case gift-details-hdd then     
                        (printout t "la quantita' di file e documenti che saranno memorizzati sul computer. "))         
                (case gift-details-battery then
                        (printout t "se la durata della batteria e' fondamentale oppure ne potra' anche fare a meno. "))                
                (case gift-details-screen-resolution then
                        (printout t "se scegliere un computer che abbia una risoluzione dello schermo molto elevata. "))                
                (case gift-details-cd then
                        (printout t "se utilizzera' spesso dei cd o dei dvd con il computer. "))                
                (case gift-details-fingerprint then
                        (printout t "se preferisce proteggere i dati sul computer tramite l'impronta digitale per un livello di sicurezza molto elevato. "))    
                (case gift-details-hdmi then
                        (printout t "se colleghera' monitor o televisori esterni al computer. "))            
                (case gift-details-usb then
                        (printout t "la quantita' di porte usb a cui collegare i vari dispositivi. "))            
                (case gift-details-gaming then
                        (printout t "se ha bisogno di periferiche esterne per poter giocare in modo adeguato. "))    
                (case gift-details-extendibility then        
                        (printout t "se, una volta acquistato il computer, potrebbe avere esigenze di espansione e aumento di potenza del computer. "))           

                (default
                        (printout t "CLIPS-Exception!!! - Why Question"))
        )
        (printout t crlf crlf "  Inserisci un valore valido tra quelli elencati. " crlf crlf "  ")
)

(deffunction print-help (?question)
        (if (and  (not (eq ?question rejection)) (not (eq ?question want-to-see-hypotetical-final-pc)) (not (eq ?question retraction))   (not (eq ?question retraction-number)) ) then 
                (printout t crlf "  Questa domanda ti sta chiedendo "))
        (switch ?question

        ;;=========== SEZIONE UTENTE ===========;;

                (case user-age then             
                        (printout t "la fascia d'eta' in cui ti trovi. "))              
                (case user-life then            
                        (printout t "di cosa ti occupi nella tua vita. "))              
                (case user-gift then    
                        (printout t "se stai comprando un computer che regalerai ad un'altra persona. "))
                (case user-oldpc then           
                        (printout t "se gia' possiedi (o hai posseduto) un computer prima di questo che stai comprando. "))               
                (case user-budget then          
                        (printout t "la quantita' di denaro che hai a disposizione per questo acquisto. "))                
                (case user-exp then             
                        (printout t "il tuo livello di esperienza con l'utilizzo e la modifica dei componenti di un computer. "))

                (case oldpc-purpose then        
                        (printout t "se il computer che stai comprando dovra' essere simile a quello che gia' hai. "))
                (case oldpc-type then           
                        (printout t "la tipologia di computer di cui attualmente sei in possesso o che avevi prima. "))
                (case oldpc-why then            
                        (printout t "le motivazioni per cui il computer che hai attualmente non soddisfa piu' le tue esigenze. "))

                (case purpose-gaming then       
                        (printout t "se utilizzi regolarmente il computer per giocare. "))
                (case gaming-graphic then       
                        (printout t "a quale tra questi e' simile la grafica dei giochi che utilizzi con il computer. "))
                (case gaming-epoch then         
                        (printout t "se i giochi che utilizzi sono piu' o meno recenti. "))
                (case gaming-genre then         
                        (printout t "a quale genere si avvicinano i giochi che utilizzi. "))
                
                (case purpose-study then        
                        (printout t "se utilizzi regolarmente il computer per aiutarti nello studio. "))
                (case study-progs then          
                        (printout t "se fai uso di programmi per studiare che possono richiedere prestazioni elevate (ad esempio, CAD o simulazioni fisiche). "))
                (case study-voyage then                 
                        (printout t "se dovrai spostare spesso questo computer in altri ambienti (ad esempio, se sei pendolare). "))

                (case purpose-internet then     
                        (printout t "se utilizzi regolarmente il computer per navigare in internet (social network/posta elettronica/video/eCommerce). "))
                (case internet-voyage then      
                        (printout t "se dovrai utilizzare internet anche quando sei in viaggio o dovrai spostare spesso il computer in altri ambienti. "))

                (case purpose-family then       
                        (printout t "se questo computer verra' utilizzato regolarmente da tutti i componenti della famiglia per navigare in internet o studiare. "))
                                
                (case purpose-work then         
                        (printout t "se utilizzi regolarmente il computer nel tuo lavoro di tutti i giorni. "))
                (case work-type then            
                        (printout t "il tipo di lavoro che svolgi per il quale utilizzi il computer. "))
                (case work-risk then            
                        (printout t "se il computer sara' utilizzato in situazioni rischiose in cui potrebbe danneggiarsi facilmente. "))
                (case work-graphic then         
                        (printout t "se utilizzi programmi di modellazione 3D o simili che possono richiedere prestazioni elevate. "))
                (case work-audio then           
                        (printout t "se lavori con programmi di elaborazione audio che utilizzano molte tracce audio o strumenti virtuali. "))
                (case work-data then            
                        (printout t "se il tuo lavoro consiste nell'elaborare grandi quantita' di dati in modo efficiente ed affidabile. "))
                (case work-voyage then          
                        (printout t "se dovrai effettuare molti spostamenti lavorativi dove utilizzerai questo computer. "))

                (case voyage then       
                        (printout t "se dovrai spostarti spesso portando questo computer con te. "))
                (case still-space then  
                        (printout t "se la scrivania dove sara' posto il computer ha spazio sufficiente per poterlo utilizzare in modo adeguato. "))

                (case brand then                
                        (printout t "se preferisci acquistare prodotti di una marca piu' o meno affidabile. "))         

                (case tablet then       
                        (printout t "se non hai problemi nell'utilizzare dei tablet con schermo tattile regolarmente. "))

                (case big-display then  
                        (printout t "se, per motivi di gioco o per problemi di vista, hai bisogno di uno schermo molto grande. "))
                
                (case details then
                        (printout t "se hai esigenze particolari sulle componenti (disco rigido, batteria, schermo, ecc.) del computer che stai acquistando. "))                
                (case details-hdd then          
                        (printout t "quanti file o documenti pensi che dovrai salvare sul computer. "))         
                (case details-battery then
                        (printout t "se la durata della batteria e' molto importante nell'uso che farai del computer. "))               
                (case details-screen-resolution then
                        (printout t "se hai bisogno di utilizzare uno schermo a risoluzione molto alta per motivi lavorativi o di gioco. "))            
                (case details-wireless then
                        (printout t "se collegherai il computer ad una rete WiFi. "))               
                (case details-bluetooth then
                        (printout t "se utilizzerai il computer con dispositivi senza fili basati sulla tecnologia bluetooth (cuffie, mouse/tastiera, gamepad, cellulari). "))          
                (case details-cd then
                        (printout t "se utilizzerai il computer per vedere film, per ascoltare musica o per installare programmi e giochi presenti su CD o su DVD. "))          
                (case details-usb then
                        (printout t "quanti dispositivi usb (chiavette usb, mouse/tastiera, gamepad, webcam, microfono, cuffie, dischi esterni) pensi di collegare al computer. "))             
                (case details-sim then
                        (printout t "se utilizzerai una sim all'interno del computer per collegarti alla rete dati mobile. "))               
                (case details-smartcard then
                        (printout t "se utilizzerai smartcard (come card per l'autenticazione o carte di credito) con il computer. "))             
                (case details-fingerprint then
                        (printout t "se pensi di utilizzare la tua impronta digitale per proteggere i dati presenti nel computer con un livello di sicurezza elevato. "))               
                (case details-hdmi then
                        (printout t "se collegherai il computer a monitor, televisori o videoproiettori esterni. "))            
                (case details-sdcard then
                        (printout t "se utilizzerai il computer per gestire i dati presenti su schede di memoria (come quelle delle macchine fotografiche o dei cellulari). "))         
                (case details-daylight-sensor then
                        (printout t "se pensi che un sensore in grado di rilevare la luce nell'ambiente in cui si trova il computer e che regoli di conseguenza la luminosita' dello schermo possa tornarti utile. "))          
                (case details-gaming then
                        (printout t "se vorresti un computer che includa anche una periferica per giocare (gamepad, joystick o volante). "))            
                (case details-esata then
                        (printout t "se utilizzerai dispositivi eSata ad alte prestazioni (come dischi esterni) con il computer. "))
                (case details-extendibility then        
                        (printout t "se cerchi un computer i cui componenti possano essere facilmente aggiunti o aggiornati nel corso del tempo. "))
      

        ;;=========== SEZIONE REGALO ===========;;

                (case gift-user-age then        
                        (printout t "la fascia d'eta' in cui si trova la persona a cui farai questo regalo. "))
                (case gift-user-life then       
                        (printout t "di cosa si occupa la persona che ricevera' il regalo nella sua vita. "))
                (case gift-user-oldpc then      
                        (printout t "se la persona a cui farai questo regalo possiede (o ha posseduto) un computer prima di questo che ricevera'. "))
                
                (case gift-oldpc-purpose then   
                        (printout t "se il computer che regalerai sara' simile a quello che la persona che lo ricevera' ha gia'. "))
                (case gift-oldpc-type then      
                        (printout t "la tipologia di computer che la persona a cui lo regalerai gia' possiede o che possedeva in passato. "))
                (case gift-oldpc-why then       
                        (printout t "le motivazioni per cui il computer che gia' ha la persona a cui regalerai questo computer non soddisfa piu' le sue esigenze. "))

                (case gift-purpose-gaming then  
                        (printout t "se la persona che ricevera' il regalo utilizza regolarmente il computer per giocare. "))
                (case gift-gaming-graphic then  
                        (printout t "a quali tra questi e' simile il livello grafico dei giochi che la persona a cui regalerai il pc preferisce. "))
                (case gift-gaming-epoch then    
                        (printout t "se i giochi a cui giochera' sono piu' o meno recenti. "))
                (case gift-gaming-genre then    
                        (printout t "a quale genere si avvicinano i giochi che la persona che ricevera' il computer utilizza. "))
                
                (case gift-purpose-study then   
                        (printout t "se la persona alla quale regalerai il computer utilizza regolarmente il computer per aiutarsi nello studio. "))
                (case gift-study-progs then     
                        (printout t "se la persona alla quale regalerai il computer fa uso di programmi per studiare che posson richiedere presetazioni elevate (ad esempio, CAD o simulazioni fisiche). "))
                (case gift-study-voyage then    
                        (printout t "se la persona a cui regalerai il computer dovra' spostare spesso questo computer in altri ambienti (ad esempio, se e' pendolare). "))

                (case gift-purpose-internet then 
                        (printout t "se la persona a cui regalerai questo computer lo utilizzera' regolarmente per navigare in internet (social network/posta elettronica/video/eCommerce). "))
                (case gift-internet-voyage then 
                        (printout t "se la persona a cui regalerai questo computer dovra' utilizzare internet anche in viaggio o dovra' spostare spesso il computer in altri ambienti. "))

                (case gift-purpose-family then 
                        (printout t "se questo computer verra' utilizzato regolarmente da tutti i componenti della famiglia della persona a cui lo regalerai per navigare in internet o lavorare. "))
                
                (case gift-purpose-work then    
                        (printout t "se la persona a cui regalerai questo computer lo usera' nel lavoro di tutti i giorni. "))
                (case gift-work-type then       
                        (printout t "il tipo di lavoro che la persona a cui regalerai il computer svolge e per il quale utilizzera' il computer. "))
                (case gift-work-risk then       
                        (printout t "se la persona a cui regalerai il computer lo utilizzera' in situazioni rischiose in cui potrebbe danneggiarsi facilmente. "))
                (case gift-work-graphic then    
                        (printout t "se la persona a cui regalerai il computer utilizza programmi di modellazione 3D o simili che possono richiedere prestazioni elevate. "))
                (case gift-work-audio then      
                        (printout t "se la persona a cui regalerai il computer fa uso di programmi di elaborazione audio che utilizzano molte tracce audio o strumenti virtuali. "))
                (case gift-work-data then       
                        (printout t "se il lavoro della persona che ricevera' il computer consiste nell'elaborare grandi quantita' di dati in modo efficiente ed affidabile. "))
                (case gift-work-voyage then     
                        (printout t "se la persona che ricevera' il computer dovra' effettuare molti spostamenti lavorativi dove utilizzera' questo computer. "))
                
                (case gift-voyage then  
                        (printout t "se la persona a cui regalerai il computer dovra' spostarsi spesso portando con se' questo computer. "))
                (case gift-still-space then 
                        (printout t "se la scrivania dove la persona utilizzera' il computer ha spazio sufficiente per poterlo utilizzare in modo adeguato. "))

                (case gift-brand then   
                        (printout t "se la persona che ricevera' il regalo preferisce acquistare prodotti di una marca piu' o meno affidabile. "))
        
                (case gift-tablet then  
                        (printout t "se la persona che lo ricevera' non ha problemi nell'utilizzare dispositivi tablet con schermo tattile regolarmente. "))

                (case gift-big-display then     
                        (printout t "se, per motivi di gioco o per problemi di vista, la persona che ricevera' il computer ha bisogno di uno schermo molto grande. "))

                (case gift-details-hdd then     
                        (printout t "quanti file o documenti pensi che dovra' salvare sul computer che ricevera' da te. "))             
                (case gift-details-battery then
                        (printout t "se la durata della batteria e' molto importante nell'uso che la persona che ricevera' il regalo fara' del computer. "))           
                (case gift-details-screen-resolution then
                        (printout t "se ha bisogno di utilizzare uno schermo a risoluzione molto alta per motivi lavorativi o di gioco. "))             
                (case gift-details-cd then
                        (printout t "se utilizzera' il computer per vedere film, per ascoltare musica o per installare programmi e giochi presenti su CD o su DVD. "))          
                (case gift-details-fingerprint then
                        (printout t "se pensi che la persona che ricevera' il computer utilizzera' la sua impronta digitale per proteggere i dati presenti nel computer con un livello di sicurezza elevato. "))
                (case gift-details-hdmi then
                        (printout t "se colleghera' il computer a monitor, televisori o videoproiettori esterni. "))                
                (case gift-details-usb then
                        (printout t "quanti dispositivi usb (chiavette usb, mouse/tastiera, gamepad, webcam, microfono, cuffie, dischi esterni) pensi che colleghera' al computer. "))          
                (case gift-details-gaming then
                        (printout t "se la persona che avra' questo regalo gradira' ricevere un computer che includa anche una periferica per giocare (gamepad, joystick o volante). "))  
                (case gift-details-extendibility then        
                        (printout t "se pensi che cerchi un computer i cui componenti possano essere facilmente aggiunti o aggiornati nel corso del tempo. "))              

                (default  
                        (printout t "CLIPS-Exception!!! - Help Question"))
        )
        (printout t crlf crlf "  Inserisci un valore valido tra quelli elencati. " crlf crlf "  ")
)

(deffunction print-detail-missing (?detail)
        (switch ?detail
                (case better-quality then
                    (return "ha qualita' migliore rispetto a quella richiesta"))
                (case worse-quality then
                    (return "ha qualita' inferiore rispetto a quella richiesta"))
                (case better-performance then
                    (return "ha prestazioni migliori rispetto a quelle richieste"))
                (case worse-performance then
                    (return "ha prestazioni inferiori rispetto a quelle richieste"))
                (case hdd-space then
                    (return "non ha lo spazio su disco richiesto"))
                (case usb-ports then
                    (return "non ha il numero di porte USB richiesto"))
                (case battery then
                    (return "non ha la capacita' di batteria richiesta"))
                (case screen-resolution then
                    (return "non ha la risoluzione dello schermo richiesta"))
                (case wireless then
                    (return "non ha la connettivita' wireless"))
                (case bluetooth then
                    (return "non ha la connettivita' bluetooth"))
                (case cd then
                    (return "non ha la possibilita' di leggere cd e dvd"))
                (case sim then
                    (return "non ha la possibilita' di inserire schede sim"))
                (case smartcard then
                    (return "non ha la possibilita' di leggere smartcard"))
                (case fingerprint then
                    (return "non ha il lettore di impronte digitali"))
                (case hdmi then
                    (return "non ha la porta hdmi (o simili)"))
                (case sdcard then
                    (return "non ha la possibilita' di leggere schede di memoria"))
                (case daylight-sensor then
                    (return "non ha il sensore di luce ambientale"))
                (case gaming then
                    (return "non ha periferiche di gaming associate"))
                (case esata then
                    (return "non ha porte di tipo eSata"))
                (case extendibility then
                    (return "non ha il livello di estendibilita' richiesto"))
                (default
                    (return ""))
        )
)

(deffunction print-hypotetical-final-pc (?model-name ?price ?min-budget ?max-budget $?what)
    (printout t crlf crlf "  ")
    (printout t "Non ho trovato nessun pc che sia perfetto per te, ma ho trovato il pc: " ?model-name crlf "  ")
    (printout t "che soddisfa le tue richieste ")

    (bind ?out-of-budget false)

    (if (< ?price ?min-budget) then
        (bind ?euro (- ?min-budget ?price))
        (bind ?out-of-budget true)
        (printout t "e che costa " (format nil "%5.2f" ?euro) " euro in meno rispetto al budget minimo")
    else (if (> ?price ?max-budget) then
        (bind ?euro (- ?price ?max-budget))
        (bind ?out-of-budget true)
        (printout t "e che costa " (format nil "%5.2f" ?euro) " euro in piu' rispetto al budget massimo")))

    (if (> (length$ ?what) 1) then
        (if (eq ?out-of-budget true) then
            (printout t ", ma ")
        else
            (printout t "ma "))
    )

    (foreach ?detail ?what
        (if (neq ?detail budget) then
            (if (< ?detail-index (length$ ?what)) then
                (printout t (print-detail-missing ?detail) " e ")
            else
                (printout t (print-detail-missing ?detail))))
    )

    (printout t "." crlf)
)