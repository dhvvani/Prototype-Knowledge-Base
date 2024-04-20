# Prototype-Knowledge-Base
Uses rule-based decision making, along with certainty factors to determine the likelihood of an illness given a list of symptoms. 
To use the prototype knowledge base, download and run the file in prolog. You can test the knowledge base by entering your current symptoms and the output will be a list of possible sicknesses with a given certainty. The higher the certainty value, the more likely the patient is suffering from the disease. 

Please note that the list of symptoms corresponding to a disease are obtained from Princeton University Health Services and NHS inform.
Illnessses covered are: influenza, conjunctivitis, mononucleosis, Alzheimer's, common_cold, allergies, gastroenteritis, covid, diabetes, heart_failure, food_poisioning, malaria, cholera, ebola, HIV, thyroid, lung_cancer, breast_cancer.

Symptoms covered are: fever, fatigue, no_appetite, body_pain, nasal_congestion, short_breaths, cough, runny_nose, itchy_eyes, watery_eyes, headache, red_eyes, burning_eyes, pus_discharge, crusting_of_eyes, sore_throat, disorientation, speech_problems, hallucinations, anxiety, sneezing, abdominal_pain, diarrhea, nausea, slow_healing, weight_loss, dehydrated, swollen_ankles, swollen_legs, conjunctiviti, sweat, chills, vomiting, diarrhoea, low_bp, restlessness, swollen_glands, anxiety, goiter, hair_loss, hand_tremors, blood_cough, throat_lumps, voice_hoarseness, decreased_vision, abdominal_pain, respitory_infections, nipple_discharge, breast_lumps, pneumonia,taxoplasmosis,bluish_face,blood_vomit, blurry_vision,rapid_weight_loss, dark_urine.

Non-serious symptoms are considered to be fatigue ,runny/congested, nose, body_pain, headache, nausea provided they are not associated with certain diseases; determining this makes use of default rules.

Areas that the knowledge base lacks in and how to improve them are:
1. The system does not handle overlapping symptoms, a fix would be to ensure that could_be(..), does not check for a strict subset but rather to use flexible matching via ranges/thresholds, the same could be extended to identifying treatments

2. I could've implemented a system where there are sub-symptoms of existing symptoms to get a better diagnostic

3. I could have also assigned weights to the list of symptoms for each disease to better certainty factor calculations.

4. Symptoms would be more realistic if they could be assigned ranges such as headaches could be severe or mild or slight, the same could be extended to pain/irritation levels

5. Adding more symptoms and treatments for each disease, adding more diseases, acquiring more accurate certainty factors and using better certainty combination methods such as the Bayesian method of probability would elevate the knowledge base

How the system works, note that symptoms are considered to be independent
- users will enter their symptom(s) along with a certainty factor that represents the severity of their respective symptom. The system will then list the diseases that are associated with that group of symptoms and the likelihood of the diagnosis being correct by the calculated certainty factor of the output. done by entering:
disease_w_multiple_symptoms(Disease, [symptoms], [certainty factor wrt to symps], Certainty).

- if a user is only aware of a single symptom, and want the same output as above, enter, the need for this was difference in calculating certainty factors using one premise:
disease_w_single_symptom(Disease, [symptom], [certainity factor wrt to symp], Certainty).

- if a user is curious about what diagnosis they could possibly obtain considering how common the disease is given a list of symptom(s), then enter
could_be([symptoms], Disease, Certainty).

- a user can also ask for treatments depending on a disease and how sure they are about having it. To get this list enter
print_treatments_w_cf(Disease, CertainityofHavingDisease)
where CertainityofHavingDisease must bean integer.

- a user can ask for treatment of non-serious symptoms

if the user is curious as to which diseases are treated using treatment X, then the printed list of diseases can be acquired by entering print_disease_given_treatment(Treatment).

There are various Treatment values, e.g fluid_replacement.
