% A4Q2 - create a knowledge base
% Define diseases, symptoms, and certainty factors using lists
% List of symptoms corresponding to a disease are obtained from
% Princeton University Health Services and NHS inform.
%
% diseases covered are:: influenza, conjunctivitis, mononeucleosis,
% alzhiemers, common_cold, allergies, gastroenteritis, coivd, diabetes,
% heart_failure, food_poisioning, malaria, cholera, ebola, hiv,
% thyroid, lung_cancer, breast_cancer.
%
% symptoms covered are: fever, fatigue, no_appetite, body_pain,
% nasal_congestion, short_breaths, cough, runny_nose, itchy_eyes,
% watery_eyes, headache, red_eyes, burning_eyes, pus_discharge,
% crusting_of_eyes, sore_throat, disorientation, speech_problems,
% hallucinations, anxiety, sneezing, abdominal_pain, diarrhea, nausea,
% slow_healing, weight_loss, dehydrated, swollen_ankles, swollen_legs,
% conjunctiviti, sweat, chills, vomiting, diarrhoea, low_bp, restlessness,
% swollen_glands, anxiety, goiter, hair_loss, hand_tremors, blood_cough,
% throat_lumps, voice_hoarseness, decreased_vision, abdominal_pain,
% respitory_infections, nipple_discharge, breast_lumps,
% pneumonia,taxoplasmosis,bluish_face,blood_vomit,
% blurry_vision,rapid_weight_loss, dark_urine.
%
% non-serious symptoms are considered to be fatigue ,runny/congested
% nose, body_pain, headache, nausea provided they are not associated
% with certain diseases; determining this makes use of default rules.
%
% Areas that the knowledge base lacks in and how to improve them are:
% 1. The system does not handle overlapping symptoms, a fix would be to
% ensure that could_be(..), does not check for a strict subset but
% rather to use flexible matching via ranges/thresholds, the same could
% be extended to identifying treatments
%
% 2. I could've implemented a
% system where there are sub-symptoms of existing symtoms to get a
% better diagnostic
%
% 3. I could have also assigned weights to the list of
% symptoms for each disease to better certainity factor calculations.
%
% 4. Symptoms would be more realistic if they could be assigned ranges
% such as headaches could be severe or mild or slight, the same could be
% extended to pain/irritation levels
%
% 4.Adding more sympotoms and treatments for each disease, adding more
% diseases, aquiring more accurate certainity factors and using better
% certainity combination methods such as the Bayesian method of
% probability wold elevate the knowledge base
%
% How the system works, note that symptoms are considered to be
% independent
% -users will enter their symptom*s* along with a certainity
% factor that represents the servierity of their respective symptom. The
% system will then list the diseases that are associated with that group
% of symptoms and the likelihoof of the diagnosis being correct by the
% calculated certainity factor of the output. done by entering:
% disease_w_multiple_symptoms(Disease, [symptoms], [certainity factor
% wrt to symps], Certainity).
%
% -if a user is only aware of a single symptom, and want the same
% output as above, enter, the need for this was difference in
% calculating certainity factors using
% one premise:
% disease_w_single_symptom(Disease, [symptom], [certainity
% factor wrt to symp], Certainity).
%
% -if a user is curious about what diagnosis they could possibly obtain
% considering how common the disease is given a list of symptom(s), then
% enter
% could_be([symptoms], Disease, Certainity).
%
% -a user can also ask for treatements depending on a disease and how
% sure they are about having it. To get this list enter
% print_treatments_w_cf(Disease, CertainityofHavingDisease). where
% CertainityofHavingDisease must bean integer.
%
%  -a user can ask for treatment of non-serious symptoms
%
%  if the user is curious as to which diseases are treated using
%  treatment X, then the printedlist of diseases can be aquired by
%  entering print_disease_given_treatment(Treatment).
%  There are varius Treatment values, e.g fluid_replacement.
%  System testing results are after code.







%Diseases, their list of independent symptoms + their certainityfactors
disease(influenza, [fever, cough, headache, body_pain, fatigue]).
disease(conjunctivitis, [itchy_eyes, red_eyes, burning_eyes, pus_discharge, crusting_of_eyes, decreased_vision]).
disease(mononeucleosis, [fatigue, sore_throat, no_appetite, body_pain, abdominal_pain]).
disease(alzheimers, [disorientation, speech_problems, hallucinations, anxiety]).
disease(common_cold, [runny_nose, nasal_congestion, sneezing, sore_throat, headache, body_pain]).
disease(allergies, [itchy_eyes, watery_eyes, runny_nose, nasal_congestion, sneezing, sore_throat]).
disease(gastroenteritis, [abdominal_pain, diarrhea, nausea, headaches, body_pain]).
disease(covid,[fever,bluish_face,cough,fatigue,body_pain,short_breaths,no_appetite,headache,runny_nose,nasal_congestion,conjunctivitis,hair_loss]).
disease(diabetes, [fatigue, slow_healing, weight_loss, dehydrated, hair_loss]).
disease(heart_failure, [short_breaths, cough, fatigue, swollen_ankles, swollen_legs]).
disease(food_poisoning, [abdominal_pain, blood_vomit, blurry_vision, nausea, vomiting, fever, chills]).
disease(malaria, [fever, headache, sweat, chills, body_pain, vomiting, diarrhoea]).
disease(cholera, [dark_urine,vomiting, dehydration, diarrohea, low_bp, restlessness]).
disease(ebola, [fever, body_pain, fatigue, sore_throat, no_appetite, diarrhoea]).
disease(hiv, [chills, fever, fatigue, body_pain, headache, sore_throat, swollen_glands, pneumonia, taxoplasmosis]).
disease(thyroid,[anxiety, fatigue, goiter, hair_loss, hand_tremors, weight_loss, rapid_weight_loss]).
disease(lung_cancer, [short_breaths, no_appetite, weight_loss, fatigue, cough, blood_cough, body_pain, swollen_glands, respitory_infections]).
disease(breast_cancer, [short_breaths,sore_throat, blood_cough, throat_lumps, weight_loss, voice_hoarseness, nipple_discharge, breast_lumps]).





% diseases and their certainity factors estimated by determining how
% common the illness is
disease_cf(influenza, 0.11).
disease_cf(conjunctivitis, 0.65).
disease_cf(mononeucleosis,0.4).
disease_cf(alzheimers,0.1).
disease_cf(common_cold, 0.7).
disease_cf(allergies, 0.6).
disease_cf(gastroenteritis, 0.5).
disease_cf(covid,0.25).
disease_cf(diabetes,0.5 ).
disease_cf(heart_failure,0.34).
disease_cf(food_poisioning, 0.37).
disease_cf(malaria, 0.1).
disease_cf(cholera, 0.2).
disease_cf(ebola, 0.13).
disease_cf(hiv,0.1).
disease_cf(thyroid, 0.5).
disease_cf(lung_cancer,0.3).
disease_cf(breast_cancer,0.3 ).



treatments_of_non_serious_symptoms([fatigue, runny_nose, nasal_congestion, body_pain, headache, nausea], [rest, hydration, easy_body_movement, less_stress]).

% here the certainity factor represents the effectiveness of the
% treatment
treatment(influenza, oseltamivir, 0.8).
treatment(influenza, fluids_replacement, 0.6).
treatment(influenza, ibuprofen, 0.55).
treatment(influenza, acetaminophen, 0.55).
treatment(influenza, gargle_salt_water, 0.3).
treatment(influenza, nasal_saline_spray, 0.2).

treatment(conjunctivitis, antibiotic_eyedrops, 0.9).
treatment(conjunctivitis, antihistamine_drops, 0.7).
treatment(conjunctivitis, lubricating_eye_drops, 0.4).
treatment(conjunctivitis, cold_compress, 0.4).
treatment(conjunctivitis, good_hygine, 0.2).

treatment(mononeucleosis, acetaminophen, 0.6).
treatment(mononeucleosis, hydration, 0.4).
treatment(mononeucleosis, avoid_contact_sports, 0.6).
treatment(mononeucleosis, monitior_symptoms_and_consult, 0.8).

treatment(alzheimers, rivastigmine, 0.85).
treatment(alzheimers, donepezil, 0.85).
treatment(alzheimers, memantine, 0.6).
treatment(alzheimers, cognitive_simulation, 0.5).
treatment(alzheimers, supportive_care, 0.5).

treatment(common_cold, paracetamol, 0.8).
treatment(common_cold, ibuprofen, 0.9).
treatment(common_cold, decongestants, 0.6).
%anitviral meds are not effective for common colds but influenza
treatment(common_cold, antiviral_meds, 0.3).
treatment(common_cold, salt_gargles, 0.3).

treatment(allergies, nasal_corticosteroids, 0.8).
treatment(allergies, immunotherapy, 0.9).
treatment(allergies, mast_cell_sprays_long_term, 0.6).
treatment(allergies, decongestants, 0.5).

treatment(gastroenteritis, rehydration_therapy, 0.7).
treatment(gastroenteritis, promethazine, 0.8).
treatment(gastroenteritis, odansetron, 0.7).
treatment(gastroenteritis, lactoballicus_probiotic, 0.75).
treatment(gastroenteritis, loperamide, 0.6).

treatment(covid, remdesivir, 0.5).
treatment(covid, imdevimab, 0.8).
treatment(covid, dexamethasone, 0.7).
treatment(covid, oxygen_therapy, 0.6).
treatment(covid, pain_relivers, 0.4).

treatment(diabetes, insulin_therapy, 0.9).
treatment(diabetes, metformin, 0.85).
treatment(diabetes, dpp_inhibitors, 0.8).
treatment(diabetes, gluecose_monitoring, 0.6).
treatment(diabetes, bariatric_surgery, 0.8).

treatment(heart_failure, diuretics, 0.8).
treatment(heart_failure, beta_blockers, 0.7).
treatment(heart_failure, digoxin, 0.85).
treatment(heart_failure, cardiac_resynchronization_therapy, 0.7).
treatment(heart_failure, implant_defibrillator, 0.9).
treatment(heart_failure, cardiac_rehabillitation, 0.6).

treatment(food_poisoning, fluid_replacement, 0.9).
treatment(food_poisoning, antiemetics, 0.7).
treatment(food_poisoning, ceftriaxone, 0.8).
treatment(food_poisoning, azithromycin, 0.8).
treatment(food_poisoning, lactoballicus_probiotic, 0.5).

treatment(malaria ,artemisinin_therapy, 0.8).
treatment(malaria, chloroquine, 0.7).
treatment(malaria, mefloquine, 0.7).
treatment(malaria, doxcycline, 0.6).


treatment(cholera, rehydration_therapy, 0.85).
treatment(cholera, fluid_replacement, 0.85).
treatment(cholera, azithromycin, 0.6).
treatment(cholera, zinc_supplements, 0.4).

treatment(ebola, inmazeb, 0.8).
treatment(ebola, ebanga, 0.8).
treatment(ebola, supportive_care, 0.6).
treatment(ebola, rehydration, 0.7).
treatment(ebola, oxygen_therapy, 0.7).

treatment(hiv, antiretroviral_therapy, 0.9).
treatment(hiv, prophylaxis_exposure, 0.7).

treatment(thyroid, levothyroxin, 0.8).
treatment(thyroid, antithyroid_meds, 0.9).
treatment(thyroid, iodine_therapy, 0.85).
treatment(thyroid, surgery, 0.8).
treatment(thyroid, beta_blockers, 0.4).

treatment(lung_cancer, chemotherapy, 0.75).
treatment(lung_cancer, radiation_therapy, 0.6).
treatment(lung_cancer, surgery, 0.8).
treatment(lung_cancer, immunotherapy, 0.6).
treatment(lung_cancer, targeted_therapy, 0.5).

treatment(breast_cancer, surgery, 0.8).
treatment(breast_cancer, radiation_therapy, 0.6).
treatment(breast_cancer, chemotherapy, 0.75).
treatment(breast_cancer, hormone_therapy, 0.6).
treatment(breast_cancer, immunotherapy, 0.6).


serious_symptom_of([decreased_vision], conjunctivitis).
serious_symptom_of([abdominal_pain], mononeucleosis).
serious_symptom_of([headache, bluish_face,short_breaths], covid).
serious_symptom_of([short_breaths], heart_failure).
serious_symptom_of([short_breaths, blood_cough, respiratory_infections], lung_cancer).
serious_symptom_of([breast_lumps, nipple_discharge], breast_cancer).
serious_symptom_of([sweat, chills], malaria).
serious_symptom_of([pneumonia, taxoplasmosis], hiv).
serious_symptom_of([rapid_weight_loss, fatigue], thyroid).
serious_symptom_of([dark_urine,vomiting], cholera).
serious_symptom_of([body_pain, fatigue], ebola).
serious_symptom_of([hallucinations, disorientation], alzheimers).
serious_symptom_of([blood_vomit, blurry_vision], food_poisoning).



% this rule gives what sickness the user might have with its
% certainity factor if they list symptoms
could_be(Symptoms, D, Y):-
    disease(D, DSymptoms),
    subset(Symptoms, DSymptoms),
    disease_cf(D, Y).

disease_w_single_symptom(Disease, Symptom, CFofSymptom, Certainity):-
    could_be([Symptom], Disease, Y),
    Certainity is Y*CFofSymptom.

%how the patient is feeling with certainity factors is given by disease
disease_w_multiple_symptoms(Disease, Symptoms, [H|T], Certainity):-
     could_be(Symptoms, Disease, Y),
     sum_cf_list(T, Cf),
     product_cf_list(T, PCf),
     Variable is H+Cf -(H*PCf),
     Certainity is (Variable*Y)/(Variable + Y).


% calculates the certainity factor of a disease when the user enters
% Helper predicate to sum a list of certainty factors
sum_cf_list([], 0).
sum_cf_list([Symptom_CF | T], Total) :-
    sum_cf_list(T, TTotal),
    Total is TTotal + Symptom_CF.

product_cf_list([], 1).
product_cf_list([Symptom_Cf|T], Product):-
    product_cf_list(T, TProduct),
    Product is TProduct*Symptom_Cf.


get_treatment_of_nonserious_symptoms(Symptoms, Treatments):- treatments_of_non_serious_symptoms(CommonSymptoms, Treatments),
    subset(CommonSymptoms, Symptoms).


get_treatments_w_cf(Disease, CFofHavingDisease, Treatment, CFofTreatment):-
    treatment(Disease,Treatment, CF), CFofTreatment is CFofHavingDisease*CF.


%default rule
not_serious(Symptoms, Disease):-
    serious_symptom_of(ScarySymptoms, Disease),
    not( subset(Symptoms, ScarySymptoms) ),
    disease(Disease, ListofSymptoms),
    subset(Symptoms, ListofSymptoms).

consult_expert_for(Name):-
    patient_has(Symptom, Disease, Name),
    serious_symptom_of(ScarySymptoms, Disease),
    subset([Symptom], ScarySymptoms).

print_treatments_w_cf(Disease, CertainityofHavingDisease):-
    get_treatments_w_cf(Disease, CertainityofHavingDisease, Treatment, CFofTreatment),
    write(Treatment), write(- hasEffectiveness), write(-), write(CFofTreatment), nl, fail.

print_disease_given_treatment(Treatment):-
    treatment(Disease, Treatment, Cf), write(Disease), nl, fail.

