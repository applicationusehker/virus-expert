% --- Turn Off singleton variable warnings ------------------------
:- style_check(-singleton).

% --- Boolean domain ---------------------------------------------------------
val(0). val(1).

% --- Variable list ------------------------
vars([commonS, less_commonS, seriousS, male, age_above70, pre_condition, infected]).


% --- joint probability table P([A=0,B=0,C=1,...], probability) ------------------------
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=0, age_above70=0, pre_condition=0, infected=0], 0.14396).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=0, age_above70=0, pre_condition=0, infected=1], 0.00021).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=0, age_above70=0, pre_condition=1, infected=0], 0.02931).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=0, age_above70=0, pre_condition=1, infected=1], 0.00046).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=0, age_above70=1, pre_condition=0, infected=0], 0.00758).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=0, age_above70=1, pre_condition=1, infected=0], 0.00167).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=0, age_above70=1, pre_condition=1, infected=1], 0.00003).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=1, age_above70=0, pre_condition=0, infected=0], 0.14372).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=1, age_above70=0, pre_condition=0, infected=1], 0.00042).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=1, age_above70=0, pre_condition=1, infected=0], 0.0285).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=1, age_above70=0, pre_condition=1, infected=1], 0.00069).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=1, age_above70=1, pre_condition=0, infected=0], 0.00772).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=1, age_above70=1, pre_condition=0, infected=1], 0.00004).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=1, age_above70=1, pre_condition=1, infected=0], 0.00158).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=1, age_above70=1, pre_condition=1, infected=1], 0.00001).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=0, age_above70=0, pre_condition=0, infected=0], 0.0046).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=0, age_above70=0, pre_condition=0, infected=1], 0.00008).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=0, age_above70=0, pre_condition=1, infected=0], 0.00079).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=0, age_above70=0, pre_condition=1, infected=1], 0.00023).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=0, age_above70=1, pre_condition=0, infected=0], 0.01782).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=0, age_above70=1, pre_condition=0, infected=1], 0.00035).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=0, age_above70=1, pre_condition=1, infected=0], 0.00391).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=0, age_above70=1, pre_condition=1, infected=1], 0.00062).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=1, age_above70=0, pre_condition=0, infected=0], 0.00479).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=1, age_above70=0, pre_condition=0, infected=1], 0.00006).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=1, age_above70=0, pre_condition=1, infected=0], 0.00092).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=1, age_above70=0, pre_condition=1, infected=1], 0.00021).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=1, age_above70=1, pre_condition=0, infected=0], 0.01843).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=1, age_above70=1, pre_condition=0, infected=1], 0.00064).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=1, age_above70=1, pre_condition=1, infected=0], 0.00365).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=1, age_above70=1, pre_condition=1, infected=1], 0.00097).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=0, age_above70=0, pre_condition=0, infected=0], 0.05761).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=0, age_above70=0, pre_condition=0, infected=1], 0.00322).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=0, age_above70=0, pre_condition=1, infected=0], 0.01133).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=0, age_above70=0, pre_condition=1, infected=1], 0.0054).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=0, age_above70=1, pre_condition=0, infected=0], 0.00293).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=0, age_above70=1, pre_condition=0, infected=1], 0.00013).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=0, age_above70=1, pre_condition=1, infected=0], 0.00064).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=0, age_above70=1, pre_condition=1, infected=1], 0.00033).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=1, age_above70=0, pre_condition=0, infected=0], 0.05742).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=1, age_above70=0, pre_condition=0, infected=1], 0.00471).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=1, age_above70=0, pre_condition=1, infected=0], 0.01131).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=1, age_above70=0, pre_condition=1, infected=1], 0.00798).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=1, age_above70=1, pre_condition=0, infected=0], 0.00327).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=1, age_above70=1, pre_condition=0, infected=1], 0.00026).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=1, age_above70=1, pre_condition=1, infected=0], 0.00074).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=1, age_above70=1, pre_condition=1, infected=1], 0.00044).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=0, age_above70=0, pre_condition=0, infected=0], 0.00207).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=0, age_above70=0, pre_condition=0, infected=1], 0.00111).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=0, age_above70=0, pre_condition=1, infected=0], 0.00036).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=0, age_above70=0, pre_condition=1, infected=1], 0.00169).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=0, age_above70=1, pre_condition=0, infected=0], 0.00758).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=0, age_above70=1, pre_condition=0, infected=1], 0.00435).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=0, age_above70=1, pre_condition=1, infected=0], 0.0016).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=0, age_above70=1, pre_condition=1, infected=1], 0.0073).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=1, age_above70=0, pre_condition=0, infected=0], 0.00182).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=1, age_above70=0, pre_condition=0, infected=1], 0.00149).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=1, age_above70=0, pre_condition=1, infected=0], 0.00043).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=1, age_above70=0, pre_condition=1, infected=1], 0.00284).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=1, age_above70=1, pre_condition=0, infected=0], 0.00803).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=1, age_above70=1, pre_condition=0, infected=1], 0.00553).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=1, age_above70=1, pre_condition=1, infected=0], 0.00153).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=1, age_above70=1, pre_condition=1, infected=1], 0.01101).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=0, age_above70=0, pre_condition=0, infected=0], 0.02741).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=0, age_above70=0, pre_condition=0, infected=1], 0.00091).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=0, age_above70=0, pre_condition=1, infected=0], 0.00533).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=0, age_above70=0, pre_condition=1, infected=1], 0.00179).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=0, age_above70=1, pre_condition=0, infected=0], 0.00166).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=0, age_above70=1, pre_condition=0, infected=1], 0.00009).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=0, age_above70=1, pre_condition=1, infected=0], 0.00032).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=0, age_above70=1, pre_condition=1, infected=1], 0.00008).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=1, age_above70=0, pre_condition=0, infected=0], 0.02719).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=1, age_above70=0, pre_condition=0, infected=1], 0.00158).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=1, age_above70=0, pre_condition=1, infected=0], 0.00562).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=1, age_above70=0, pre_condition=1, infected=1], 0.00263).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=1, age_above70=1, pre_condition=0, infected=0], 0.00139).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=1, age_above70=1, pre_condition=0, infected=1], 0.00004).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=1, age_above70=1, pre_condition=1, infected=0], 0.00037).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=1, age_above70=1, pre_condition=1, infected=1], 0.00017).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=0, age_above70=0, pre_condition=0, infected=0], 0.00086).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=0, age_above70=0, pre_condition=0, infected=1], 0.00036).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=0, age_above70=0, pre_condition=1, infected=0], 0.00022).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=0, age_above70=0, pre_condition=1, infected=1], 0.00069).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=0, age_above70=1, pre_condition=0, infected=0], 0.00371).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=0, age_above70=1, pre_condition=0, infected=1], 0.00145).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=0, age_above70=1, pre_condition=1, infected=0], 0.00063).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=0, age_above70=1, pre_condition=1, infected=1], 0.00257).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=1, age_above70=0, pre_condition=0, infected=0], 0.00099).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=1, age_above70=0, pre_condition=0, infected=1], 0.0005).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=1, age_above70=0, pre_condition=1, infected=0], 0.00022).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=1, age_above70=0, pre_condition=1, infected=1], 0.00085).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=1, age_above70=1, pre_condition=0, infected=0], 0.00351).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=1, age_above70=1, pre_condition=0, infected=1], 0.00193).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=1, age_above70=1, pre_condition=1, infected=0], 0.00063).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=1, age_above70=1, pre_condition=1, infected=1], 0.00388).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=0, age_above70=0, pre_condition=0, infected=0], 0.01029).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=0, age_above70=0, pre_condition=0, infected=1], 0.01192).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=0, age_above70=0, pre_condition=1, infected=0], 0.00227).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=0, age_above70=0, pre_condition=1, infected=1], 0.02077).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=0, age_above70=1, pre_condition=0, infected=0], 0.00065).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=0, age_above70=1, pre_condition=0, infected=1], 0.00075).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=0, age_above70=1, pre_condition=1, infected=0], 0.00005).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=0, age_above70=1, pre_condition=1, infected=1], 0.00102).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=1, age_above70=0, pre_condition=0, infected=0], 0.01156).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=1, age_above70=0, pre_condition=0, infected=1], 0.01685).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=1, age_above70=0, pre_condition=1, infected=0], 0.0021).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=1, age_above70=0, pre_condition=1, infected=1], 0.03022).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=1, age_above70=1, pre_condition=0, infected=0], 0.00064).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=1, age_above70=1, pre_condition=0, infected=1], 0.00071).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=1, age_above70=1, pre_condition=1, infected=0], 0.00014).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=1, age_above70=1, pre_condition=1, infected=1], 0.00165).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=0, age_above70=0, pre_condition=0, infected=0], 0.00036).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=0, age_above70=0, pre_condition=0, infected=1], 0.0036).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=0, age_above70=0, pre_condition=1, infected=0], 0.00012).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=0, age_above70=0, pre_condition=1, infected=1], 0.00666).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=0, age_above70=1, pre_condition=0, infected=0], 0.00136).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=0, age_above70=1, pre_condition=0, infected=1], 0.01575).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=0, age_above70=1, pre_condition=1, infected=0], 0.00026).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=0, age_above70=1, pre_condition=1, infected=1], 0.02653).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=1, age_above70=0, pre_condition=0, infected=0], 0.00029).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=1, age_above70=0, pre_condition=0, infected=1], 0.00572).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=1, age_above70=0, pre_condition=1, infected=0], 0.00005).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=1, age_above70=0, pre_condition=1, infected=1], 0.01069).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=1, age_above70=1, pre_condition=0, infected=0], 0.00165).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=1, age_above70=1, pre_condition=0, infected=1], 0.02329).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=1, age_above70=1, pre_condition=1, infected=0], 0.0002).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=1, age_above70=1, pre_condition=1, infected=1], 0.04187).


% --- Conditional probability table P(A=0 | B=1, probability)----------------
% Format: c_prob(A=Val, B=InfectedVal, Probability)
c_prob(close=0, infected=0, 0.253076450326583).
c_prob(close=1, infected=0, 0.746923549673417).
c_prob(close=0, infected=1, 0.0491459394665868).
c_prob(close=1, infected=1, 0.950854060533413).
c_prob(indoor=0, infected=0, 0.328254748667229).
c_prob(indoor=1, infected=0, 0.671745251332771).
c_prob(indoor=0, infected=1, 0.145406719275464).
c_prob(indoor=1, infected=1, 0.854593280724536).
c_prob(travel=0, infected=0, 0.253076450326583).
c_prob(travel=1, infected=0, 0.746923549673417).
c_prob(travel=0, infected=1, 0.0491459394665868).
c_prob(travel=1, infected=1, 0.950854060533413).
c_prob(plastic=0, infected=0, 0.253076450326583).
c_prob(plastic=1, infected=0, 0.746923549673417).
c_prob(plastic=0, infected=1, 0.250457829720641).
c_prob(plastic=1, infected=1, 0.749542170279359).
c_prob(copper=0, infected=0, 0.253076450326583).
c_prob(copper=1, infected=0, 0.746923549673417).
c_prob(copper=0, infected=1, 0.250457829720641).
c_prob(copper=1, infected=1, 0.749542170279359).




% --- Helper: get Var's value from an assignment list Var=Val ----------------
get([V=Val|_], V, Val) :- !.
get([_|T], V, Val) :- get(T, V, Val).


% --- Enumerate and order all complete assignments consistent with Conditions -------------
complete_world(Conditions, OrderedWorld) :-
    vars(Vs),
    assign_all(Vs, Conditions, World),
    reorder_all(Vs, World, OrderedWorld),
    consistent(Conditions, OrderedWorld).

assign_all([], Conditions, Conditions).
assign_all([V|Vs], Conditions, Out) :-
    ( member(V=_, Conditions) ->
        assign_all(Vs, Conditions, Out)
    ; val(Val),
      assign_all(Vs, [V=Val|Conditions], Out)
    ).

reorder_all([], _, []).
reorder_all([V|Vs], World, OrderedWorld) :-
    get(World, V, Val),
    append([V=Val], TempOrderedWorld, OrderedWorld),
    reorder_all(Vs, World, TempOrderedWorld).

consistent([], World).
consistent([V=Val|Es], World) :-
    get(World, V, Val),
    consistent(Es, World).


% --- Variable list ------------------------
query_joint_prob_sym_bio(Conditions, SumP) :-
    findall(P, (complete_world(Conditions, W), j_prob_sym_bio(W,P)), Ps),
    sum_list(Ps, SumP).


% query P(A|B)
% Conditions A: [close=0,travel=1]
% GivenCondition B: infected=1
query_joint_prob_history([],_, 1.0).
query_joint_prob_history([C|Cs],GivenCondition, ProductP) :-
    c_prob(C, GivenCondition, TempP),
    query_joint_prob_history(Cs, GivenCondition, NextP),
    ProductP is TempP * NextP.


% --- Posterior: P(Query | Evidence) by enumeration and normalization ---------
% Usage: prob(Var=Val, EvidenceList, P).
prob(Query, Evidence_sym_bio, Evidence_history, P, P_joint_1_sym_bio, P_joint_0_sym_bio, P_con_1_history, P_con_0_history) :-
    % Build full condition lists for numerator and denominator
    query_joint_prob_sym_bio([infected=0|Evidence_sym_bio], P_joint_0_sym_bio),
    query_joint_prob_sym_bio([infected=1|Evidence_sym_bio], P_joint_1_sym_bio),
    query_joint_prob_history(Evidence_history, infected=0, P_con_0_history),
    query_joint_prob_history(Evidence_history, infected=1, P_con_1_history),
    Denominator is (P_joint_0_sym_bio * P_con_0_history + P_joint_1_sym_bio * P_con_1_history),
    extrat_infected_value(Query, InfectedVal),
    ( Denominator =:= 0.000 ->
        P = 0.000 
    ;
        ( InfectedVal =:= 1 -> 
            P is P_joint_1_sym_bio * P_con_1_history/Denominator
        ;   P is P_joint_0_sym_bio * P_con_0_history/Denominator
        )
    ).

extrat_infected_value(V=Val, Val).



% --------- Convenience demos (run ?- demo.) ---------------------------------
demo :-
    prob(infected=1,[commonS=1, less_commonS=1, seriousS=1, male=1, age_above70=0, pre_condition=0],[close=1, indoor=1], P, P_joint_infected_1_sym_bio, P_joint_infected_0_sym_bio, P_con_infected_1_history, P_con_infected_0_history),
    format("P(infected=1 | commonS=1, less_commonS=1, seriousS=1, male=1, age_above70=0, pre_condition=0, close=1, indoor=1)               = ~6f~n", [P]),
    format("P(infected=1,sym,bio) (joint)     = ~6f~n", [P_joint_infected_1_sym_bio]),
    format("P(infected=0,sym,bio) (joint)     = ~6f~n", [P_joint_infected_0_sym_bio]),
    format("P(history | infected=1)           = ~6f~n", [P_con_infected_1_history]),
    format("P(history | infected=0)           = ~6f~n", [P_con_infected_0_history]).