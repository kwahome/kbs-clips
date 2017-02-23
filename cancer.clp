;------------------------------------------------------------------
;  This is a ClIPS program providing cancer awareness knowledge.
;   Author: Kelvin Wahome
;   Date: 30-10-2015
;   
;------------------------------------------------------------------

(defrule Menu
(not (iffoundChoice ?))
=>
(printout t crlf crlf crlf
" Choose one of the cancers listed
below" crlf crlf
" 1.) Breast Cancer. " crlf crlf
" 2.)  BladderCancer." crlf crlf
" 3.) Penile Cancer." crlf crlf
" 4.) Cervical Cancer." crlf crlf
" 5.) EXIT OF SYSTEM.." crlf crlf crlf
" Enter your choice number: " )
(assert (iffoundChoice (read))))
;; Rules Breast Cancer Awareness
;;------------------R0-------------
(defrule breast-cancer
(iffoundChoice 1)
?retractCh1 <- (iffoundChoice 1)
(not (ifyesnoriskfactorchoice ?))
=>
(retract ?retractCh1)
(printout t crlf crlf crlf " Do you want to know if you have the risk factors for Breast Cancer? (yes | no) " crlf crlf " Your answer: " )
(assert (ifyesnoriskfactorchoice (read))))
;;------------------R1------------------
(defrule breast-cancer1
(ifyesnoriskfactorchoice yes)
?retractChy <- (ifyesnoriskfactorchoice yes)
(not (ifYesNofemalechoice ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Are you female ? (Yes | No) " crlf crlf "
 Your answer: " )
(assert (ifYesNofemalechoice (read))))
;;------------------R2------------------
(defrule breast-cancer2
(ifYesNofemalechoice yes)
?retractChy <- (ifYesNofemalechoice yes)
(not (ifYesNoAgechoice ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Are you above the age of 55? (Yes | No) " crlf crlf
" Your answer: " )
(assert (ifYesNoAgechoice (read))))
;;------------------R3------------------
(defrule breast-cancer3
(ifYesNoAgechoice yes)
?retractChy <- (ifYesNoAgechoice yes)
(not (ifYesNoRacechoice ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Are you caucasian? (Yes | No) " crlf crlf
" Your answer: " )
(assert (ifYesNoRacechoice (read))))
;;------------------R4------------------
(defrule breast-cancer4
(ifYesNoRacechoice yes)
?retractChy <- (ifYesNoRacechoice yes)
(not (ifYesNoHistorychoice ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Do you have an immediate family member who has been diagnosed with breast or ovarian cancer? (Yes | No) " crlf crlf
" Your answer: " )
(assert (ifYesNoHistorychoice (read))))
;;------------------R5------------------
(defrule breast-cancer5
(ifYesNoHistorychoice yes)
?retractChy <- (ifYesNoHistorychoice yes)
(not (ifYesNoPersonalchoice ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Have you been diagnosed with cancer in one breast or have abnormal breast cells been detected in you before such as atypical hyperplasia,lobular carcinoma in situ(LCIS) or ductal carcinoma in situ(DCIS) ? (Yes | No) " crlf crlf
" Your answer: " )
(assert (ifYesNoPersonalchoice (read))))
;;------------------R6------------------
(defrule breast-cancer6
(ifYesNoPersonalchoice yes)
?retractChy <- (ifYesNoPersonalchoice yes)
(not (ifYesNoMenstrualchoice ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Did you begin your menstruation early(before the age of 12)? or have you arrived at menopouse late(after the age of 55) ? (Yes | No) " crlf crlf
" Your answer: " )
(assert (ifYesNoMenstrualchoice (read))))
;;------------------R7------------------
(defrule breast-cancer7
(ifYesNoMenstrualchoice yes)
?retractChy <- (ifYesNoMenstrualchoice yes)
(not (ifYesNoBirthchoice ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Did you have your first child at an older age  ? (Yes | No) " crlf crlf
" Your answer: " )
(assert (ifYesNoBirthchoice (read))))
;;------------------R8------------------
(defrule breast-cancer8
(ifYesNoBirthchoice yes)
?retractChy <- (ifYesNoBirthchoice yes)
(not (ifYesNoGenomechoice ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Have you carried out genetic tests where mutations in genes such as BRCA1 and BRCA2 were noticed? (Yes | No) " crlf crlf
" Your answer: " )
(assert (ifYesNoGenomechoice (read))))
;;------------------R9------------------
(defrule breast-cancer9
(ifYesNoGenomechoice yes)
?retractChy <- (ifYesNoGenomechoice yes)
(not (ifYesNoDensechoice ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Have you carried out a mammogram test and it indicated you have dense breasts? (Yes | No) " crlf crlf
" Your answer: " )
(assert (ifYesNoDensechoice (read))))
;;------------------R10------------------
(defrule breast-cancer10
(ifYesNoDensechoice yes)
?retractChy <- (ifYesNoDensechoice yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You are Highly likely to be having Breast cancer due to the following reasons:
You are a caucasian female, above the age of 55 with a history of breast or ovarian cancer in your family. You had earlier on been diagnosed with breast cancer in one breast or abnormal breast cells had been detected. You took a genetic test that determined you had mutations in BRCA1 and BRCA2 genes. Your mammogram showed you had dense breasts.You either started menstruating early or had your menopause at a late age.You had your first child at a late age.
Please Visit your nearest health facility for conclusive tests. "crlf crlf )
)
;;------------------R11------------------
(defrule breast-cancer11
(ifYesNoDensechoice no)
?retractChy <- (ifYesNoDensechoice no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You are Highly likely to be having Breast cancer due to the following reasons:
You are a caucasian female, above the age of 55 with a history of breast or ovarian cancer in your family. You had earlier on been diagnosed with breast cancer in one breast or abnormal breast cells had been detected. You took a genetic test that determined you had mutations in BRCA1 and BRCA2 genes. You either started menstruating early or had your menopause at a late age.You had your first child at a late age.
You tested positive for 8 out of 9 tests carried in this exam.
Please Visit your nearest health facility for conclusive tests. "crlf crlf )
)
;;------------------R12------------------
(defrule breast-cancer12
(ifYesNoGenomechoice no)
?retractChy <- (ifYesNoGenomechoice no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You are Highly likely to be having Breast cancer due to the following reasons:
You are a caucasian female, above the age of 55 with a history of breast or ovarian cancer in your family. You had earlier on been diagnosed with breast cancer in one breast or abnormal breast cells had been detected.You either started menstruating early or had your menopause at a late age.You had your first child at a late age. 
You tested positive for 7 out of 9 tests carried in this exam.
you probably need to go for a mammogram and a genetic tests.
Please Visit your nearest health facility for conclusive tests. "crlf crlf )
)
;;------------------R13------------------
(defrule breast-cancer13
(ifYesNoBirthchoice no)
?retractChy <- (ifYesNoBirthchoice no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You are Most likely to be having Breast cancer due to the following reasons:
You are a caucasian female, above the age of 55 with a history of breast or ovarian cancer in your family. You had earlier on been diagnosed with breast cancer in one breast or abnormal breast cells had been detected.  You either started menstruating early or had your menopause at a late age.
You tested positive for 6 out of 9 tests carried in this exam.
you probably need to go for a mammogram and a genetic tests.
Please Visit your nearest health facility for conclusive tests. "crlf crlf )
)
;;------------------R14------------------
(defrule breast-cancer14
(ifYesNoMenstrualchoice no)
?retractChy <- (ifYesNoMenstrualchoice no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You are Most likely to be having Breast cancer due to the following reasons:
You are a caucasian female, above the age of 55 with a history of breast or ovarian cancer in your family. You had earlier on been diagnosed with breast cancer in one breast or abnormal breast cells had been detected.  
You tested positive for 5 out of 9 tests carried in this exam.
you probably need to go for a mammogram and a genetic tests.
Please Visit your nearest health facility for conclusive tests. "crlf crlf )
)
;;------------------R15------------------
(defrule breast-cancer15
(ifYesNoPersonalchoice no)
?retractChy <- (ifYesNoPersonalchoice no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You  may be having Breast cancer due to the following reasons:
You are a caucasian female, above the age of 55 with a history of breast or ovarian cancer in your family.  
You tested positive for 4 out of 9 tests carried in this exam.
you probably need to go for a mammogram and a genetic tests.
Please Visit your nearest health facility for conclusive tests. "crlf crlf )
)
;;------------------R16------------------
(defrule breast-cancer16
(ifYesNoHistorychoice no)
?retractChy <- (ifYesNoHistorychoice no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You  may be having Breast cancer due to the following reasons:
You are a caucasian female, above the age of 55.
You tested positive for 3 out of 9 tests carried in this exam.
you probably need to go for a mammogram and a genetic tests.
Please Visit your nearest health facility for conclusive tests. "crlf crlf )
)
;;------------------R17------------------
(defrule breast-cancer17
(ifYesNoRacechoice no)
?retractChy <- (ifYesNoRacechoice no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You  may be having Breast cancer due to the following reasons:
You are a female, above the age of 55.
You tested positive for 2 out of 9 tests carried in this exam.
you probably need to go for a mammogram and a genetic tests.
Please Visit your nearest health facility for conclusive tests. "crlf crlf )
)
;;------------------R18------------------
(defrule breast-cancer18
(ifYesNoAgechoice no)
?retractChy <- (ifYesNoAgechoice no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You  may not be having Breast cancer due to the following reasons:
You are a female.
You tested positive for 1 out of 9 tests carried in this exam.
you probably need to go for a mammogram and a genetic tests.
Please Visit your nearest health facility for conclusive tests. "crlf crlf )
)
;;------------------R19------------------
(defrule breast-cancer19
(ifYesNofemalechoice no)
?retractChy <- (ifYesNofemalechoice no)
=>
(retract ?retractChy)
(printout t crlf crlf crlf " You  may not be having Breast cancer due to the following reasons:
You are  male.
You tested positive for 0 out of 9 tests carried in this exam.
you probably need to go for a mammogram and a genetic tests.
Please Visit your nearest health facility for conclusive tests. "crlf crlf )
)
;;------------------R20------------------
(defrule breast-cancer20
(ifyesnoriskfactorchoice no)
?retractChy <- (ifyesnoriskfactorchoice no)
(not (ifYesNoDnT ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf " Do you want to find out about:
1. Diagnosis of breast cancer
2. Treatment of Breast cancer (Yes | No) " crlf crlf "
 Your answer: " )
(assert (ifYesNoDnT (read))))
;;------------------R21------------------
(defrule breast-cancer21
(ifYesNoDnT yes)
?retractChy <- (ifYesNoDnT yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf "1. Diagnosis of breast cancer is done through:
 Mammograms
A mammogram is an x-ray of the breast. Screening mammograms are used to look for breast disease in women who have no signs or symptoms of a breast problem. Screening mammograms usually take 2 views (x-ray pictures taken from different angles) of each breast.
For a mammogram, the breast is pressed between 2 plates to flatten and spread the tissue. This may be uncomfortable for a moment, but it is necessary to produce a good, readable mammogram. The compression only lasts a few seconds.
If you have breast symptoms (like a lump or nipple discharge) or an abnormal result on a screening mammogram, you will have a diagnostic mammogram. This will include more images of the area of concern.
If your diagnostic mammogram shows that the abnormal area is more suspicious for cancer, a biopsy will be is needed to tell if it is cancer.
Even if the mammograms show no tumor, if you or your doctor can feel a lump, a biopsy is usually needed to make sure it isn't cancer. One exception would be if an ultrasound exam finds that the lump is a simple cyst (a fluid-filled sac), which is very unlikely to be cancerous.
If cancer is found, a diagnostic mammogram is often done to get more thorough views of both breasts. This is to check for any other abnormal areas that could be cancer as well.

Nipple discharge exam

If you are having nipple discharge, some of the fluid may be collected and looked at under a microscope to see if any cancer cells are in it. Most nipple discharges or secretions are not cancer. In general, if the secretion appears milky or clear green, cancer is very unlikely. If the discharge is red or red-brown, suggesting that it contains blood, it might possibly be caused by cancer, although an injury, infection, or benign tumors are more likely causes.
Even when no cancer cells are found in a nipple discharge, doctors cannot be sure breast cancer is not present. If you have a suspicious mass, it will be necessary to biopsy the mass, even if the nipple discharge does not contain cancer cells.

2. Treatment of Breast cancer includes:
   The main types of treatment for breast cancer are:
    Surgery
    Radiation therapy
    Chemotherapy
    Hormone therapy
    Targeted therapy
    Bone-directed therapy
Treatments can be classified into broad groups, based on how they work and when they are used. "crlf crlf )
)

q.txt
Displaying q.txt.
