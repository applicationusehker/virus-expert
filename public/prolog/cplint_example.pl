% Example in LPAD style (save as sprinkler_lpad.pl and consult with cplint loaded)
:- use_module('library/pita.pl').
:- pita.
:- begin_lpad.

0.5::cloudy.

% Sprinkler | Cloudy
0.1::sprinkler ; 0.9::no_sprinkler :- cloudy.
0.5::sprinkler ; 0.5::no_sprinkler :- \+ cloudy.

% Rain | Cloudy
0.8::rain ; 0.2::no_rain :- cloudy.
0.2::rain ; 0.8::no_rain :- \+ cloudy.

% WetGrass | Sprinkler, Rain
0.99::wet :- sprinkler,  rain.
0.90::wet :- sprinkler,  \+ rain.
0.90::wet :- \+ sprinkler, rain.
0.00::wet :- \+ sprinkler, \+ rain.

:- end_lpad.


%?- prob(wet, P).                         % P(WetGrass=true)
%?- prob(rain, P).                        % P(Rain=true)
%?- prob(rain, wet, P).                   % P(Rain=true | WetGrass=true)
%?- prob(sprinkler, wet, P).              % P(Sprinkler=true | WetGrass=true)