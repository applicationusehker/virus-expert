% --- Boolean domain ---------------------------------------------------------
val(true). val(false).

% --- BN structure: Cloudy -> {Sprinkler, Rain} -> WetGrass ------------------

% P(Cloudy)
p_cloudy(true,  0.5).
p_cloudy(false, 0.5).

% P(Sprinkler | Cloudy)
p_sprinkler(true,  true, 0.1).
p_sprinkler(true,  false,0.9).
p_sprinkler(false, true, 0.5).
p_sprinkler(false, false,0.5).

% P(Rain | Cloudy)
p_rain(true,  true, 0.8).
p_rain(true,  false,0.2).
p_rain(false, true, 0.2).
p_rain(false, false,0.8).

% P(WetGrass | Sprinkler, Rain)
p_wg(true,  true,  true,  0.99).
p_wg(true,  true,  false, 0.01).
p_wg(true,  false, true,  0.90).
p_wg(true,  false, false, 0.10).
p_wg(false, true,  true,  0.90).
p_wg(false, true,  false, 0.10).
p_wg(false, false, true,  0.00).
p_wg(false, false, false, 1.00).

% --- Variable list (topological order is convenient) ------------------------
vars([cloudy,sprinkler,rain,wet_grass]).

% --- Helper: get Var's value from an assignment list Var=Val ----------------
get([V=Val|_], V, Val) :- !.
get([_|T], V, Val) :- get(T, V, Val).

% --- Local probability for a node given parents (from a complete world) -----
local_prob(World, cloudy=Val, P) :- p_cloudy(Val, P).

local_prob(World, sprinkler=Val, P) :-
    get(World, cloudy, C),
    ( Val=true  -> p_sprinkler(true,  C, P)
    ; Val=false -> p_sprinkler(false, C, P)
    ).

local_prob(World, rain=Val, P) :-
    get(World, cloudy, C),
    ( Val=true  -> p_rain(true,  C, P)
    ; Val=false -> p_rain(false, C, P)
    ).

local_prob(World, wet_grass=Val, P) :-
    get(World, sprinkler, S),
    get(World, rain,      R),
    p_wg(S, R, Val, P).

% --- Joint probability of a complete world (all vars assigned) --------------
joint_prob(World, P) :-
    vars(Vs),
    maplist(local_prob(World), [cloudy=_,sprinkler=_,rain=_,wet_grass=_], Ps0),
    % The pattern above creates fresh placeholders; recompute with actual values:
    get(World, cloudy,     C),    local_prob(World, cloudy=C,     P1),
    get(World, sprinkler,  S),    local_prob(World, sprinkler=S,  P2),
    get(World, rain,       R),    local_prob(World, rain=R,       P3),
    get(World, wet_grass,  W),    local_prob(World, wet_grass=W,  P4),
    P is P1*P2*P3*P4.

% --- Enumerate all complete assignments consistent with Evidence -------------
complete_world(World, Evidence) :-
    vars(Vs),
    assign_all(Vs, Evidence, World),
    consistent(World, Evidence).

assign_all([], Acc, Acc).
assign_all([V|Vs], Acc, Out) :-
    ( member(V=_, Acc) ->
        assign_all(Vs, Acc, Out)
    ; val(Val),
      assign_all(Vs, [V=Val|Acc], Out)
    ).

consistent(World, []).
consistent(World, [V=Val|Es]) :-
    get(World, V, Val),
    consistent(World, Es).

% --- Sum of joint probabilities for a formula (possibly partial assignment) --
sum_over_hidden(Conditions, SumP) :-
    % Conditions is a list like [rain=true, wet_grass=true] or [].
    findall(P, (complete_world(W, Conditions), joint_prob(W,P)), Ps),
    sum_list(Ps, SumP).

% --- Posterior: P(Query | Evidence) by enumeration and normalization ---------
% Usage: prob(Var=Val, EvidenceList, P).
prob(Query, Evidence, P) :-
    % Build full condition lists for numerator and denominator
    sum_over_hidden([Query|Evidence], Num),
    sum_over_hidden(Evidence, Den),
    ( Den =:= 0.0 -> P = 0.0 ; P is Num / Den ).

% --------- Convenience demos (run ?- demo.) ---------------------------------
demo :-
    prob(wet_grass=true, [], P1),
    format("P(WetGrass=true) = ~6f~n", [P1]),
    prob(rain=true, [wet_grass=true], P2),
    format("P(Rain=true | WetGrass=true) = ~6f~n", [P2]),
    prob(sprinkler=true, [wet_grass=true], P3),
    format("P(Sprinkler=true | WetGrass=true) = ~6f~n", [P3]),
    prob(rain=true, [sprinkler=false, wet_grass=true], P4),
    format("P(Rain=true | Sprinkler=false, WetGrass=true) = ~6f~n", [P4]).



%$ swipl -q -s bn.pl
%?- demo.
%P(WetGrass=true) = 0.647100
%P(Rain=true | WetGrass=true) = 0.357688
%P(Sprinkler=true | WetGrass=true) = 0.580930
%P(Rain=true | Sprinkler=false, WetGrass=true) = 0.000000
%true.
%
%?- prob(rain=true, [cloudy=true], P).
%?- prob(sprinkler=true, [wet_grass=true, rain=false], P).
%?- prob(wet_grass=false, [], P).