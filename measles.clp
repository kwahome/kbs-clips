; This is a very simple example of a CLIPS knowledge base,
; just using the pattern matching to create new knowledge.

; We have modified this to use binding to prompt users for input.

; To simplify this, we will no longer use a single "Patient"
; object, but instead separate objects for each symptom (note
; that we will only perform inference on one patient at a time).

; TO simplify this even further, since there are no longer any 
; entities, we can just assert facts of the form (attribute value),
; which means that we will no longer need the deftemplates.


; Our first rules will be used to gather symptoms from the user.
; Note that there are no conditions, which meand that they will
; always fire. The action is to print a prompt, bind the (read)
; to a variable, and then assert a new fact using that value.

(defrule GetTemperature
   =>
   (printout t "Enter patient temperature: ")
   (bind ?response (read))
   (assert (temperature ?response)))

(defrule GetSpots
   =>
   (printout t "Does the patient have spots (yes or no): ")
   (bind ?response (read))
   (assert (spots ?response)))

(defrule GetRash
   =>
   (printout t "Does the patient have a rash (yes or no): ")
   (bind ?response (read))
   (assert (rash ?response)))

(defrule GetSoreThroat
   =>
   (printout t "Does the patient have a sore throat (yes or no): ")
   (bind ?response (read))
   (assert (sore_throat ?response)))

; We can also ask for certain information only if necessary. For example,
; it doesn't make sense to ask whether the patient has been innoculated
; unless there is a possiblity of measles.

(defrule GetInnoculated
   (fever high)
   (spots yes)
   =>
   (printout t "Has the patient been innoculated for measles (yes or no): ")
   (bind ?response (read))
   (assert (innoculated ?response)))

; Rules for concluding fever from temperature.

; Note that these rules find the patient temperature, and then bind
; it to ?t. The next part uses the test keyword to evaluate the
; conditional expression as true or false.

(defrule Fever1
   (temperature ?t)
   (test (>= ?t 38))
   =>
   (assert (fever high))
   (printout t "High fever diagnosed" crlf))

(defrule Fever2
   (temperature ?t)
   (test (and (< ?t 101) (> ?t 40)))
   =>
   (assert (fever mild))
   (printout t "Mild fever diagnosed" crlf))

; Rules for determining diagnosis on the basis of patient symptoms
; Salience added to give this rule priority

(defrule Measles
   (declare (salience 100))
   (spots yes)
   (innoculated no)
   (fever high)
   =>
   (assert (diagnosis measles))
   (printout t "Measles diagnosed" crlf))

; Modified to only fire if no measles

(defrule Allergy1
   (declare (salience -100))
   (and (spots yes)
        (not (diagnosis measles)))      
   =>
   (assert (diagnosis allergy))
   (printout t "Allergy diagnosed from spots and lack of measles" crlf))   

(defrule Allergy2
   (rash yes)
   =>
   (assert (diagnosis allergy))
   (printout t "Allergy diagnosed from rash" crlf))

(defrule Flu
   (sore_throat yes)
   (fever mild|high)
   =>
   (assert (diagnosis flu))
   (printout t "Flu diagnosed" crlf))

; Rules for recommedaing treatments on the basis of
; Diagnosis facts created.

(defrule Penicillin
   (diagnosis measles)
   =>
   (assert (treatment penicillin))
   (printout t "Penicillin prescribed" crlf))

(defrule Allergy_pills
   (diagnosis allergy)
   =>
   (assert (treatment allergy_shot))
   (printout t "Allergy shot prescribed" crlf))

(defrule Bed_rest
   (diagnosis flu)
   =>
   (assert (treatment bed_rest))
   (printout t "Bed rest prescribed" crlf))

; Finally, if there are no diagnosis facts, we print the 
; metaknowledge that the expert system does not apply to
; this problem, and another expert must be consulted. Note
; that the salience must be set to make this the last rule
; checked.

(defrule None
   (declare (salience -100))
   (not (diagnosis ?))
   =>
   (printout t "No diagnosis possible -- consult human expert" crlf))
