Note that all certainities range from 0 to 1
1. obtaining a list of diseases that match my symptoms using could_be,
here the certainit yrepresents how common the disease is.


?-could_be([fever, headache], Disease, Certainity).
Disease = influenza,
Certainity = 0.11 ;
Disease = covid,
Certainity = 0.25 ;
Disease = malaria,
Certainity = 0.1 ;
Disease = hiv,
Certainity = 0.1 ;

?- could_be([cough, fatigue], Disease, Certainity).
Disease = influenza,
Certainity = 0.11 ;
Disease = covid,
Certainity = 0.25 ;
Disease = heart_failure,
Certainity = 0.34 ;
Disease = lung_cancer,
Certainity = 0.3 ;
false.

2. obtaining the certainity of a disease given the certainity of a
single symptom. Use Here Certainity represents the likelihood of having
the disease.

?- disease_w_single_symptom(Disease, fever, 0.8, Certainity).
Disease = influenza,
Certainity = 0.08800000000000001 ;
Disease = covid,
Certainity = 0.2 ;
Disease = malaria,
Certainity = 0.08000000000000002 ;
Disease = ebola,
Certainity = 0.10400000000000001 ;
Disease = hiv,
Certainity = 0.08000000000000002 ;
false.

?- disease_w_single_symptom(Disease, headache, 0.95, Certainity).
Disease = influenza,
Certainity = 0.1045 ;
Disease = common_cold,
Certainity = 0.6649999999999999 ;
Disease = covid,
Certainity = 0.2375 ;
Disease = malaria,
Certainity = 0.095 ;
Disease = hiv,
Certainity = 0.095 ;
false.

3. obtaining the certainity of a disease that matches multiple
symptoms and calculated using the certainities of having each of the
symptoms

?- disease_w_multiple_symptoms(Disease, [fever, headache], [0.8, 0.9], Certainity).
Disease = influenza,
Certainity = 10.111317254174397 ;
Disease = covid,
Certainity = 5.020408163265306 ;
Disease = malaria,
Certainity = 11.020408163265305 ;
Disease = hiv,
Certainity = 11.020408163265305 ;
false.

?- disease_w_multiple_symptoms(Disease, [body_pain, fatigue], [0.5, 0.9], Certainity).
Disease = influenza,
Certainity = 0.09858490566037735 ;
Disease = mononeucleosis,
Certainity = 0.28148148148148144 ;
Disease = covid,
Certainity = 0.19791666666666666 ;
Disease = ebola,
Certainity = 0.11435185185185184 ;
Disease = hiv,
Certainity = 0.09047619047619047 ;
Disease = lung_cancer,
Certainity = 0.22799999999999998 ;
false.


4. getting the certainity that represents the effctiveness of a
treatment given the certainity of having a specific disease:

?- get_treatments_w_cf(malaria, 0.7, Treatment, Certainity).
Treatment = artemisinin_therapy,
Certainity = 0.5599999999999999 ;
Treatment = chloroquine,
Certainity = 0.48999999999999994 ;
Treatment = mefloquine,
Certainity = 0.48999999999999994 ;
Treatment = doxcycline,
Certainity = 0.42.

?- get_treatments_w_cf(common_cold, 1, Treatment, Certainity).
Treatment = paracetamol,
Certainity = 0.8 ;
Treatment = ibuprophen,
Certainity = 0.9 ;
Treatment = decongestants,
Certainity = 0.6 ;
Treatment = antiviral_meds,
Certainity = 0.3 ;
Treatment = salt_gargles,
Certainity = 0.3.

5. printing the list of treatements and their certainity which
represents their effectiveness given a disease and the certainity of
having it.

?- print_treatments_w_cf(heart_failure, 0.5).
diuretics-hasEffectiveness-0.4
beta_blockers-hasEffectiveness-0.35
digoxin-hasEffectiveness-0.425
cardiac_resynchronization_therapy-hasEffectiveness-0.35
implant_defibrillator-hasEffectiveness-0.45
cardiac_rehabillitation-hasEffectiveness-0.3
false.


?- print_treatments_w_cf(food_poisoning, 0.8).
fluid_replacement-hasEffectiveness-0.7200000000000001
antiemetics-hasEffectiveness-0.5599999999999999
ceftriaxone-hasEffectiveness-0.6400000000000001
azithromycin-hasEffectiveness-0.6400000000000001
lactoballicus_probiotic-hasEffectiveness-0.4

6. get the list of diseases that could be treated with a specific
treatment, could be used as a learning tool.

?- print_disease_given_treatment(immunotherapy).
allergies
lung_cancer
breast_cancer
false.

?- print_disease_given_treatment(fluid_replacement).
food_poisoning
cholera
false.

?- print_disease_given_treatment(ibuprofen).
influenza
common_cold
false.

?- print_disease_given_treatment(radiation_therapy).
lung_cancer
breast_cancer
false.

7. determine if a set of symptoms is serious specific to a given
disease:

?- not_serious([short_breaths, headache], covid).
false.

?- not_serious([vomiting, diarrhoea], malaria).
true.

?- not_serious([anxiety, hair_loss, weight_loss], thyroid).
true.

8. could add statements to the domain for a given patients name using
assert(patient_feels_like(symptom, possible_disease, patient_name)
and then determine if they need to consult a doctor.

?-  assert(patient_has(chills, malaria, janny)).
true.

?- consult_expert_for(janny).
true.

?- assert(patient_has(chills, lung_cancer, john)).
true.

?- consult_expert_for(john).
false.

?- assert(patient_has(short_breaths, hiv, james)).
true.

?- consult_expert_for(james).
false.
