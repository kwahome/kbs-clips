;------------------------------------------------------------------
;  This is a ClIPS program to diognose for ebola.
;   Author: Kelvin Wahome
;   Date: 30-10-2015
;   
;------------------------------------------------------------------

(deftemplate early_signs 
    "Initial signs and symptoms experienced by ebola patients. Symptoms also exhibit in other diseases such as flu, malaria, cholera and typhoid"
    (slot temperature)
    (slot headache)
    (slot muscle_joint_aches)
)

(deftemplate flu_symptoms
	"Symptoms that identify a flu"
	(slot running_nose)
	(slot cough)
)

(deftemplate malaria_symptoms
	"Symptoms that identify malaria"
	(slot bloody_stool)
	(slot chills)
	(slot anaemia)
)

(deftemplate cholera_symptoms
	"Symptoms that identify cholera"
	(slot sunken_eyes)
	(slot clammy_skin)
)

(deftemplate typhoid_symptoms
	"Symptoms that identify typhoid"
	(slot rash)
)

(deftemplate stage_two_symptoms
	"Symptoms that are common in Ebola, Malaria, Cholera and Typhoid"
	(slot diarrhoea)
	(slot vomiting)
)

(deftemplate ebola_symptoms
	"Symptoms identifying ebola positively"
	(slot hemmorhage)
	(slot travel)
	(slot contact)
)

;Intialize
(defrule init 
    (initial-fact)
	=>  
	(printout t crlf "--------------------------------------------------------------------" crlf crlf)
    (printout t "WELCOME TO EBOLA VIRUS DIAGNOSIS EXPERT SYSTEM" crlf crlf)

    (printout t "Ebola virus disease (EVD), formerly known as Ebola haemorrhagic fever, is a severe, often fatal illness in humans. The virus is transmitted to people from wild animals and spreads in the human population through human-to-human transmission.The average EVD case fatality rate is around 50%. Case fatality rates have varied from 25% to 90% in past outbreaks." crlf crlf)

	(printout t "--------------------------------------------------------------------" crlf crlf)


    ;provide initial signs and symptoms information
    (printout t "Provide an answer to the following questions by giving a yes or no" crlf crlf)
)


(defrule GetTemperature
   =>
   (printout t crlf "Enter patient's temperature: ")
   (bind ?response (read))
   (assert (temperature ?response))
)

(defrule GetHeadache
   =>
   (printout t crlf crlf "Does patient have persistent or severe headaches? (yes | no): ")
   (bind ?response (read))
   (assert (headache ?response))
)

(defrule GetMuscleJointAches
   =>
   (printout t crlf crlf "Does patient have muscle and/or joint aches? (yes | no) ")
   (bind ?response (read))
   (assert (muscle_joint_aches ?response))
)

(defrule HasFever
   (temperature ?temp)
   (test (>= ?temp 38))
   =>
   (assert (fever high))
   (printout t crlf crlf "Patient has a fever" crlf)
)

(defrule StageOneDiagnosis
    (fever high)
    (headache yes)
    (muscle_joint_aches yes)
	=>
    (assert (stage_one positive))
    (printout t crlf crlf "Patient may be suffering from either a" crlf "->flu" crlf "->malaria" crlf "->cholera" crlf "->typhoid" crlf "->ebola" crlf)
)

(defrule FluSymptoms
	=>
	(printout t crlf "--------------------------------------------------------------------" crlf crlf)
    (printout t "TEST FOR FLU" crlf crlf)
   	(printout t "Does patient have a running nose? (yes | no): ")
   	(bind ?response (read))
   	(assert (running_nose ?response))

   	(printout t crlf crlf "Does patient have a cough? (yes | no): ")
   	(bind ?response (read))
   	(assert (cough ?response))
)

(defrule PositiveFluDiagnosis
	(or
		(running_nose yes)
		(cough yes))
	=>
	(assert(flu positive))
	(printout t crlf "--------------------------------------------------------------------" crlf crlf "Patient is most likely suffering from a flu." crlf)
	(printout t crlf "--------------------------------------------------------------------" crlf crlf)
)

(defrule NegativeFluDiagnosis
	(running_nose no)
	(cough no)
	=>
	(assert(flu positive))
	(printout t crlf "--------------------------------------------------------------------" crlf crlf)
    (printout t "DIAGNOSIS:" crlf crlf)
	(printout t "Patient is not suffering from a flu." crlf)
)

(defrule GetDiarrhoea_vomiting
	=>
	(printout t crlf "--------------------------------------------------------------------" crlf crlf)
    (printout t "MORE SYMPTOMS" crlf crlf)
   	(printout t "Is patient experiencing Diarrhea? (yes | no): ")
   	(bind ?response (read))
   	(assert (diarrhoea ?response))

   	(printout t crlf crlf "Has patient experienced vomiting? (yes | no): ")
   	(bind ?response (read))
   	(assert (vomiting ?response))
)

;Stage two diagnosis for malaria, typhoid, cholera, typhoid
(defrule StageTwoDiagnosis
	(or 
		(diarrhoea yes)
		(vomiting yes))
	=>
	(assert (stage_two positive))
	(printout t crlf "--------------------------------------------------------------------" crlf crlf)
    (printout t crlf crlf "Patient may be suffering from either a" crlf "->malaria" crlf "->cholera" crlf "->typhoid" crlf "->ebola" crlf)
)

;START OF MALARIA DIAGNOSIS

(defrule MalariaSymptoms
	=>
	(printout t crlf "--------------------------------------------------------------------" crlf crlf)
    (printout t "TEST FOR MALARIA" crlf crlf)
   	(printout t "Is patient having bloody stool? (yes | no): ")
   	(bind ?response (read))
   	(assert (bloody_stool ?response))

   	(printout t crlf crlf "Is patient experiencing shaking chills that are moderate to severe? (yes | no) ")
   	(bind ?response (read))
   	(assert (chills ?response))

   	(printout t crlf crlf "Does patient have anaemia? (yes | no) ")
   	(bind ?response (read))
   	(assert (anaemia ?response))
)

(defrule PositiveMalariaDiagnosis
	(or
		(and
			(bloody_stool yes)
			(chills yes)
			)
		(and
			(bloody_stool yes)
			(anaemia yes)
			)
		(and
			(chills yes)
			(anaemia yes)
			)
	)

	=>
	(assert (malaria positive))
	(printout t crlf crlf "DIAGNOSIS: Patient is likely suffering from malaria. Lab test recommended" crlf)
)

(defrule FurtherMalariaDiagnosis
	(or
		(and
			(bloody_stool no)
			(chills no)
			(anaemia yes)
			)
		(and
			(bloody_stool no)
			(anaemia no)
			(chills yes)
			)
		(and
			(chills no)
			(anaemia no)
			(bloody_stool yes)
			)
	)

	=>
	(assert (malaria negative))
	(printout t crlf crlf "DIAGNOSIS: Patient is likely suffering from malaria. Lab test recommended" crlf)
)

(defrule NegativeMalariaDiagnosis
	
	(bloody_stool no)
	(chills no)
	(anaemia no)

	=>
	(assert (malaria negative))
	(printout t crlf crlf "DIAGNOSIS: Patient is not suffering from malaria" crlf)
)


;END OF MALARIA DIAGNOSIS


(defrule CholeraSymptoms
	(malaria negative)
	=>
	(printout t crlf "--------------------------------------------------------------------" crlf crlf)
    (printout t "TEST FOR CHOLERA" crlf crlf)

   	(printout t "Is patient having sunken eyes? (yes | no) :")
   	(bind ?response (read))
   	(assert (sunken_eyes ?response))

   	(printout t crlf crlf "Is patient having clammy skin? (yes | no) ")
   	(bind ?response (read))
   	(assert (clammy_skin ?response))
)

(defrule PositiveCholeraDiagnosis
	(or
		(sunken_eyes yes)
		(clammy_skin yes)
	)
	=>
	(assert (cholera positive))
	(printout t "Patient suffering from cholera. Lab test recommended" crlf)
)

(defrule NegativeCholeraDiagnosis
	(sunken_eyes no)
	(clammy_skin no)
	=>
	(assert (cholera negative))
	(printout t crlf "Patient is not suffering from cholera" crlf)
)

(defrule TyphoidSymptoms
	(malaria negative)
	(cholera negative)
	=>
	(printout t crlf "--------------------------------------------------------------------" crlf crlf)
    (printout t "TEST FOR TYPHOID" crlf crlf)

   	(printout t "Is patient having a rash made up of small pink spots on the trunk of the body? (yes | no) ")
   	(bind ?response (read))
   	(assert (rash ?response))
)

(defrule PositiveTyphoidDiagnosis
	(rash yes)
	=>
	(assert (typhoid positive))
	(printout t crlf crlf "DIAGNOSIS: Patient suffering from typhoid. Lab test recommended" crlf)
)

(defrule NegativeTyphoidDiagnosis
	(rash no)
	=>
	(assert (typhoid negative))
	(printout t crlf crlf "DIAGNOSIS: Patient is not suffering from typhoid" crlf)
)

(defrule EbolaSymptoms
	;(malaria negative)
	;(cholera negative)
	=>
	(printout t crlf "--------------------------------------------------------------------" crlf crlf)
    (printout t "CONFIRM ITS EBOLA" crlf crlf)

   	(printout t "Is patient having unexplained hemmorhage? (yes | no) ")
   	(bind ?response (read))
   	(assert (hemmorhage ?response))
)

(defrule GetTravel
	(or
		(hemmorhage yes)
		(hemmorhage no)
	)
	=>
	(printout t crlf crlf "Has patient travelled to SIERRA LEONE, LIBERIA, NIGERIA, GUINEA in the last 21 days? (yes | no)	")
   	(bind ?response (read))
   	(assert (travel ?response))
)

(defrule GetExposureFromTravel
	(travel yes)
	=>
	(printout t crlf crlf "Has patient had contact with people suspected/confirmed to have ebola during the travel? (yes | no) ")
   	(bind ?response (read))
   	(assert (contact ?response))
)

(defrule GetExposureFromContact
	(travel no)
	=>
	(printout t crlf crlf "Has patient had contact with people who have travelled to SIERRA LEONE, LIBERIA, NIGERIA, GUINEA in the last 21 days? (yes | no) ")
   	(bind ?response (read))
   	(assert (contact ?response))
)

(defrule PositiveEbolaDiagnosis
	(or
		(hemmorhage yes)
		(contact yes)
	)
	=>
	(assert (typhoid positive))
	(printout t crlf crlf "*************************************************************************" crlf)
	(printout t "*There is strong evidence to suggest patient is suffering from EBOLA.   *" crlf)
	(printout t "*Recommending isolation.                                                *" crlf)
	(printout t "*************************************************************************" crlf crlf)
)

(defrule NegativeEbolaDiagnosis
	(hemmorhage no)
	(contact no)
	=>
	(assert (typhoid positive))
	(printout t crlf crlf "*************************************************************************" crlf)
	(printout t "*Patient is most likely not suffering from ebola.                       *" crlf)
	(printout t "*Recommending monitoring.                                               *" crlf)
	(printout t "*************************************************************************" crlf crlf)
)