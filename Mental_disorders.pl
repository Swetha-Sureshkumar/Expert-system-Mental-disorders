go :-
 nl,write("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"),
 nl,
 nl,write("                     Warsaw University of Technology                     "),
 nl,write("                    WELCOME TO DISORDER EXPERT SYSTEM                    "),
 nl,write("          Get your diagnosis by answering yes or no to the               "),
 nl,write("                           question/symtoms asked                        "),
 nl,write("                      by Swetha Suresh Kumar(324353)                     "),
 nl,
 nl,write("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"),
 nl,nl,

assumption(Disorder),
nl,
write('Condition was diagnosed as '),
write(Disorder),
undo.

assumption(anorexia_nervosa)  :- anorexia_nervosa, !.
assumption(bulima_nervosa)     :- bulima_nervosa, !.
assumption(asperger_syndrome)      :- asperger_syndrome, !.
assumption(dyslexia)      :- dyslexia, !.
assumption(autism)  :- autism, !.
assumption(tourettes_syndrome)  :- tourettes_syndrome, !.
assumption(bipolar_disorder)  :- bipolar_disorder, !.
assumption(schizophrenia)  :- schizophrenia, !.
assumption(down_syndrome)  :- down_syndrome, !.
assumption(fragile_X_syndrome)  :- fragile_X_syndrome, !.
assumption(unknown). /*The diagnose was not found*/

anorexia_nervosa :-
validate(abnormal_eating_habits),
validate(strong_desire_to_be_thin),
validate(food_restriction),
validate(low_weight).

bulima_nervosa :-
validate(abnormal_eating_habits),
validate(strong_desire_to_be_thin),
validate(binge_eating),
validate(purging).

asperger_syndrome :-
validate(affected_nervous_system),
validate(brain_function-abnormal),
validate(genetic_and_enviromental),
validate(social_skill-low),
validate(specialty-psychiatry),
validate(behavior-restricted_and_repetitive).

dyslexia :-
validate(affected_nervous_system),
validate(brain_function-abnormal),
validate(genetic_and_enviromental),
validate(trouble_reading),
validate(perceptions-low),
validate(social_skill-normal).

autism :-
validate(affected_nervous_system),
validate(brain_function-abnormal),
validate(genetic_and_enviromental),
validate(impaired_communication),
validate(social_skill-low).


tourettes_syndrome :-
validate(affected_nervous_system),
validate(brain_function-abnormal),
validate(genetic_and_enviromental),
validate(specialty-neurology),
validate(symptom-motor_tics),
validate(social_skill-normal).


bipolar_disorder :-
validate(symptom-false_beliefs),
validate(mentality-manic_depressive),
validate(cause-genetic_and_enviromental),
validate(elevated_moods).

schizophrenia :-
validate(symptom-false_beliefs),
validate(mentality-manic_depressive),
validate(cause-genetic_and_enviromental),
validate(hallucinations).

down_syndrome :-
validate(abnormalities_in_genome),
validate(small_and_slanted_eyes),
validate(intellectual_disability).


fragile_X_syndrome :-
validate(abnormalities_in_genome),
validate(delayed_physical_growth),
validate(long_and_narrow),
validate(intellectual_disability).

ask(Question) :-
write('Do you have the symptom:'),
write(Question),
write('? '),
read(Response),

( (Response == yes ; Response == y)
->
assert(yes(Question)) ;
assert(no(Question)), fail).
:- dynamic yes/1,no/1.

% VALIDATING RESPONSES
validate(S) :-
 (yes(S)
  ->
   true ;
 (no(S)
  ->
   fail ;
 ask(S))).

/* undo all yes/no assertions*/
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.
