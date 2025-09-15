% --- Turn Off singleton variable warnings ------------------------
:- style_check(-singleton).

% --- Boolean domain ---------------------------------------------------------
val(0). val(1).

% --- Variable list ------------------------
vars([commonS, less_commonS, seriousS, male, age_above70, pre_condition, infected]).


% --- joint probability table P([A=0,B=0,C=1,...], probability) ------------------------
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=0, age_above70=0, pre_condition=0, infected=0], 0.1437859539789070000000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=0, age_above70=0, pre_condition=0, infected=1], 0.0002197187599872160000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=0, age_above70=0, pre_condition=1, infected=0], 0.0292825183764781000000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=0, age_above70=0, pre_condition=1, infected=1], 0.0004693991690635990000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=0, age_above70=1, pre_condition=0, infected=0], 0.0075802972195589600000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=0, age_above70=1, pre_condition=1, infected=0], 0.0016778523489932900000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=0, age_above70=1, pre_condition=1, infected=1], 0.0000399488654522212000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=1, age_above70=0, pre_condition=0, infected=0], 0.1435462607861940000000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=1, age_above70=0, pre_condition=0, infected=1], 0.0004294503036113770000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=1, age_above70=0, pre_condition=1, infected=0], 0.0284735538510706000000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=1, age_above70=0, pre_condition=1, infected=1], 0.0006991051454138700000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=1, age_above70=1, pre_condition=0, infected=0], 0.0077201182486417400000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=1, age_above70=1, pre_condition=0, infected=1], 0.0000499360818152764000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=1, age_above70=1, pre_condition=1, infected=0], 0.0015879674017257900000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=1, age_above70=1, pre_condition=1, infected=1], 0.0000199744327261106000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=0, age_above70=0, pre_condition=0, infected=0], 0.0046041067433684900000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=0, age_above70=0, pre_condition=0, infected=1], 0.0000898849472674976000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=0, age_above70=0, pre_condition=1, infected=0], 0.0007989773090444230000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=0, age_above70=0, pre_condition=1, infected=1], 0.0002396931927133270000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=0, age_above70=1, pre_condition=0, infected=0], 0.0178072067753276000000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=0, age_above70=1, pre_condition=0, infected=1], 0.0003595397890699900000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=0, age_above70=1, pre_condition=1, infected=0], 0.0039149888143176700000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=0, age_above70=1, pre_condition=1, infected=1], 0.0006291946308724830000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=1, age_above70=0, pre_condition=0, infected=0], 0.0047938638542665400000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=1, age_above70=0, pre_condition=0, infected=1], 0.0000699105145413870000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=1, age_above70=0, pre_condition=1, infected=0], 0.0009288111217641420000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=1, age_above70=0, pre_condition=1, infected=1], 0.0002197187599872160000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=1, age_above70=1, pre_condition=0, infected=0], 0.0184164269734740000000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=1, age_above70=1, pre_condition=0, infected=1], 0.0006491690635985940000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=1, age_above70=1, pre_condition=1, infected=0], 0.0036553211888782400000).
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=1, male=1, age_above70=1, pre_condition=1, infected=1], 0.0009787472035794180000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=0, age_above70=0, pre_condition=0, infected=0], 0.0575463406839246000000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=0, age_above70=0, pre_condition=0, infected=1], 0.0032258708852668600000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=0, age_above70=0, pre_condition=1, infected=0], 0.0113255033557047000000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=0, age_above70=0, pre_condition=1, infected=1], 0.0054030840524129100000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=0, age_above70=1, pre_condition=0, infected=0], 0.0029362416107382600000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=0, age_above70=1, pre_condition=0, infected=1], 0.0001398210290827740000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=0, age_above70=1, pre_condition=1, infected=0], 0.0006491690635985940000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=0, age_above70=1, pre_condition=1, infected=1], 0.0003395653563438800000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=1, age_above70=0, pre_condition=0, infected=0], 0.0573565835730265000000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=1, age_above70=0, pre_condition=0, infected=1], 0.0047139661233621000000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=1, age_above70=0, pre_condition=1, infected=0], 0.0113055289229786000000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=1, age_above70=0, pre_condition=1, infected=1], 0.0079797858740811800000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=1, age_above70=1, pre_condition=0, infected=0], 0.0032758069670821300000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=1, age_above70=1, pre_condition=0, infected=1], 0.0002696548418024930000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=1, age_above70=1, pre_condition=1, infected=0], 0.0007490412272291470000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=0, male=1, age_above70=1, pre_condition=1, infected=1], 0.0004494247363374880000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=0, age_above70=0, pre_condition=0, infected=0], 0.0020773410035155000000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=0, age_above70=0, pre_condition=0, infected=1], 0.0011185682326621900000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=0, age_above70=0, pre_condition=1, infected=0], 0.0003695270054330460000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=0, age_above70=0, pre_condition=1, infected=1], 0.0016978267817194000000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=0, age_above70=1, pre_condition=0, infected=0], 0.0075802972195589600000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=0, age_above70=1, pre_condition=0, infected=1], 0.0043544263342921100000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=0, age_above70=1, pre_condition=1, infected=0], 0.0016079418344519000000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=0, age_above70=1, pre_condition=1, infected=1], 0.0073006551613934200000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=1, age_above70=0, pre_condition=0, infected=0], 0.0018276605944391200000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=1, age_above70=0, pre_condition=0, infected=1], 0.0014980824544582900000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=1, age_above70=0, pre_condition=1, infected=0], 0.0004394375199744330000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=1, age_above70=0, pre_condition=1, infected=1], 0.0028463566634707600000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=1, age_above70=1, pre_condition=0, infected=0], 0.0080297219558964500000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=1, age_above70=1, pre_condition=0, infected=1], 0.0055329178651326300000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=1, age_above70=1, pre_condition=1, infected=0], 0.0015380313199105100000).
j_prob_sym_bio([commonS=0, less_commonS=1, seriousS=1, male=1, age_above70=1, pre_condition=1, infected=1], 0.0110059124320869000000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=0, age_above70=0, pre_condition=0, infected=0], 0.0273849472674976000000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=0, age_above70=0, pre_condition=0, infected=1], 0.0009188239054010870000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=0, age_above70=0, pre_condition=1, infected=0], 0.0053331735378715200000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=0, age_above70=0, pre_condition=1, infected=1], 0.0017976989453499500000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=0, age_above70=1, pre_condition=0, infected=0], 0.0016678651326302300000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=0, age_above70=1, pre_condition=0, infected=1], 0.0000998721636305529000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=0, age_above70=1, pre_condition=1, infected=0], 0.0003295781399808250000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=0, age_above70=1, pre_condition=1, infected=1], 0.0000898849472674976000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=1, age_above70=0, pre_condition=0, infected=0], 0.0271652285075104000000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=1, age_above70=0, pre_condition=0, infected=1], 0.0015879674017257900000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=1, age_above70=0, pre_condition=1, infected=0], 0.0056228028124001300000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=1, age_above70=0, pre_condition=1, infected=1], 0.0026366251198466000000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=1, age_above70=1, pre_condition=0, infected=0], 0.0013982102908277400000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=1, age_above70=1, pre_condition=0, infected=1], 0.0000499360818152764000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=1, age_above70=1, pre_condition=1, infected=0], 0.0003795142217961010000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=0, male=1, age_above70=1, pre_condition=1, infected=1], 0.0001797698945349950000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=0, age_above70=0, pre_condition=0, infected=0], 0.0008688878235858100000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=0, age_above70=0, pre_condition=0, infected=1], 0.0003695270054330460000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=0, age_above70=0, pre_condition=1, infected=0], 0.0002297059763502720000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=0, age_above70=0, pre_condition=1, infected=1], 0.0006991051454138700000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=0, age_above70=1, pre_condition=0, infected=0], 0.0037152444870565700000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=0, age_above70=1, pre_condition=0, infected=1], 0.0014581335890060700000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=0, age_above70=1, pre_condition=1, infected=0], 0.0006391818472355390000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=0, age_above70=1, pre_condition=1, infected=1], 0.0025767018216682600000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=1, age_above70=0, pre_condition=0, infected=0], 0.0009987216363055290000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=1, age_above70=0, pre_condition=0, infected=1], 0.0005093480345158200000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=1, age_above70=0, pre_condition=1, infected=0], 0.0002297059763502720000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=1, age_above70=0, pre_condition=1, infected=1], 0.0008589006072227550000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=1, age_above70=1, pre_condition=0, infected=0], 0.0035155001597954600000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=1, age_above70=1, pre_condition=0, infected=1], 0.0019375199744327300000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=1, age_above70=1, pre_condition=1, infected=0], 0.0006391818472355390000).
j_prob_sym_bio([commonS=1, less_commonS=0, seriousS=1, male=1, age_above70=1, pre_condition=1, infected=1], 0.0038850271652285100000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=0, age_above70=0, pre_condition=0, infected=0], 0.0102868328539469000000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=0, age_above70=0, pre_condition=0, infected=1], 0.0119147491211250000000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=0, age_above70=0, pre_condition=1, infected=0], 0.0022770853307766100000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=0, age_above70=0, pre_condition=1, infected=1], 0.0207534356024289000000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=0, age_above70=1, pre_condition=0, infected=0], 0.0006591562799616490000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=0, age_above70=1, pre_condition=0, infected=1], 0.0007590284435922020000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=0, age_above70=1, pre_condition=1, infected=0], 0.0000599232981783317000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=0, age_above70=1, pre_condition=1, infected=1], 0.0010286832853946900000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=1, age_above70=0, pre_condition=0, infected=0], 0.0115552093320550000000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=1, age_above70=0, pre_condition=0, infected=1], 0.0168384467881112000000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=1, age_above70=0, pre_condition=1, infected=0], 0.0021073026526046700000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=1, age_above70=0, pre_condition=1, infected=1], 0.0301913550655161000000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=1, age_above70=1, pre_condition=0, infected=0], 0.0006491690635985940000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=1, age_above70=1, pre_condition=0, infected=1], 0.0007190795781399810000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=1, age_above70=1, pre_condition=1, infected=0], 0.0001498082454458290000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=0, male=1, age_above70=1, pre_condition=1, infected=1], 0.0016578779162671800000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=0, age_above70=0, pre_condition=0, infected=0], 0.0003695270054330460000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=0, age_above70=0, pre_condition=0, infected=1], 0.0036053851070629600000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=0, age_above70=0, pre_condition=1, infected=0], 0.0001298338127197190000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=0, age_above70=0, pre_condition=1, infected=1], 0.0066614733141578800000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=0, age_above70=1, pre_condition=0, infected=0], 0.0013682486417385700000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=0, age_above70=1, pre_condition=0, infected=1], 0.0157398529881751000000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=0, age_above70=1, pre_condition=1, infected=0], 0.0002696548418024930000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=0, age_above70=1, pre_condition=1, infected=1], 0.0265060722275487000000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=1, age_above70=0, pre_condition=0, infected=0], 0.0002996164908916590000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=1, age_above70=0, pre_condition=0, infected=1], 0.0057226749760306800000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=1, age_above70=0, pre_condition=1, infected=0], 0.0000599232981783317000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=1, age_above70=0, pre_condition=1, infected=1], 0.0106863215084692000000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=1, age_above70=1, pre_condition=0, infected=0], 0.0016578779162671800000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=1, age_above70=1, pre_condition=0, infected=1], 0.0232702141259188000000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=1, age_above70=1, pre_condition=1, infected=0], 0.0002097315436241610000).
j_prob_sym_bio([commonS=1, less_commonS=1, seriousS=1, male=1, age_above70=1, pre_condition=1, infected=1], 0.0418264621284756000000).


% edge case to avoid zero probability
j_prob_sym_bio([commonS=0, less_commonS=0, seriousS=0, male=0, age_above70=1, pre_condition=0, infected=1], 0.0000099872163630552900).


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
% e.g., get([a=1,b=0], a, Val).
%       Result: Val=1.
%       get([a=1,b=0], Var, 1).
%       Result: Var=a.
get([V=Val|_], V, Val) :- !.
get([_|T], V, Val) :- get(T, V, Val).


% --- Enumerate and order all complete assignments consistent with Conditions -------------
% e.g., complete_world([commonS=0, less_commonS=1, seriousS=0, male=0, age_above70=0, infected=1], World).
%       Result: World = [commonS=0, less_commonS=1, seriousS=0, male=0, age_above70=0, pre_condition=0, infected=1];
%               World = [commonS=0, less_commonS=1, seriousS=0, male=0, age_above70=0, pre_condition=1, infected=1].
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


% ------------------sum all joint probabilities of complete worlds consistent with Conditions------------------
% e.g., query_joint_prob_sym_bio([infected=1,commonS=1, less_commonS=0, seriousS=0, age_above70=0, pre_condition=1], P).
%       Result: P = 0.288125.
query_joint_prob_sym_bio(Conditions, SumP) :-
    findall(P, (complete_world(Conditions, W), j_prob_sym_bio(W,P)), Ps),
    sum_list(Ps, SumP).


% ------------------multiply all conditional probabilities of history conditions given infected status------------------
% query P(A|B)
% Conditions A: [close=0,travel=1]
% GivenCondition B: infected=1
% e.g., query_joint_prob_history([close=0,travel=1], infected=1, P).
%       Result: P = 0.04200.
query_joint_prob_history([],_, 1.0).
query_joint_prob_history([C|Cs],GivenCondition, ProductP) :-
    c_prob(C, GivenCondition, TempP),
    query_joint_prob_history(Cs, GivenCondition, NextP),
    ProductP is TempP * NextP.


% ----- Posterior: P(Query | Evidence) by enumeration and normalization ---------
% Usage: prob(Var=Val, EvidenceList, P).
% Arguments:
%   Query: a single variable assignment, e.g., infected=1
%   Evidence_sym_bio: list of variable assignments for symptoms and bio factors, e.g., [commonS=1, less_commonS=1, seriousS=0]
%   Evidence_history: list of variable assignments for history factors, e.g., [close=1, indoor=1, travel=0, plastic=1, copper=0]
%   P: the computed posterior probability P( infected=1 | Evidence)
%   P_joint_1_sym_bio: the joint probability P(infected=1, Evidence_sym_bio)
%   P_joint_0_sym_bio: the joint probability P(infected=0, Evidence_sym_bio)
%   P_con_1_history: the conditional probability P(Evidence_history | infected=1)
%   P_con_0_history: the conditional probability P(Evidence_history | infected=0)
% Example query:
% ?- prob(infected=1,[commonS=1, less_commonS=1, seriousS=0],[close=1, indoor=1, travel=0, plastic=1, copper=0], P, P_joint_1_sym_bio, P_joint_0_sym_bio, P_con_1_history, P_con_0_history).
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

% ---- Helper to extract the value from the query Var=Val ----
% e.g. extrat_infected_value(infected=1, Val).
%      Result: Val=1.
extrat_infected_value(V=Val, Val).



% --------- Convenience demos (run ?- demo.) ---------------------------------
demo :-
    %demo1
    prob(infected=1,[commonS=1, less_commonS=1, seriousS=0, male=1, age_above70=1, pre_condition=1],[close=1, indoor=1, travel=0, plastic=1, copper=0], P1, P_joint_infected_1_sym_bio1, P_joint_infected_0_sym_bio1, P_con_infected_1_history1, P_con_infected_0_history1),
    format("Demo1:~n"),
    format("swi-prolog command: prob(infected=1,[commonS=1, less_commonS=1, seriousS=0, male=1, age_above70=1, pre_condition=1],[close=1, indoor=1, travel=0, plastic=1, copper=0], P1, P_joint_infected_1_sym_bio1, P_joint_infected_0_sym_bio1, P_con_infected_1_history1, P_con_infected_0_history1).~n"),
    format("P(commonS=1, less_commonS=1, seriousS=0, male=1, age_above70=1, pre_condition=1, close=1, indoor=1, travel=0, plastic=1, copper=0)= ~6f~n", [P1]),
    format("P(infected=1,sym,bio) (joint)     = ~6f~n", [P_joint_infected_1_sym_bio1]),
    format("P(infected=0,sym,bio) (joint)     = ~6f~n", [P_joint_infected_0_sym_bio1]),
    format("P(history | infected=1)           = ~6f~n", [P_con_infected_1_history1]),
    format("P(history | infected=0)           = ~6f~n", [P_con_infected_0_history1]),
    %demo2
    prob(infected=1,[commonS=0, less_commonS=0, seriousS=1, male=0, age_above70=0, pre_condition=0],[close=0], P2, P_joint_infected_1_sym_bio2, P_joint_infected_0_sym_bio2, P_con_infected_1_history2, P_con_infected_0_history2),
    format("Demo2:~n"),
    format("swi-prolog command: prob(infected=1,[commonS=0, less_commonS=0, seriousS=1, male=0, age_above70=0, pre_condition=0],[close=0], P2, P_joint_infected_1_sym_bio2, P_joint_infected_0_sym_bio2, P_con_infected_1_history2, P_con_infected_0_history2).~n"),
    format("P(infected=1 | commonS=0, less_commonS=0, seriousS=1, male=0, age_above70=0, pre_condition=0, close=0)= ~6f~n", [P2]),
    format("P(infected=1,sym,bio) (joint)     = ~6f~n", [P_joint_infected_1_sym_bio2]),
    format("P(infected=0,sym,bio) (joint)     = ~6f~n", [P_joint_infected_0_sym_bio2]),
    format("P(history | infected=1)           = ~6f~n", [P_con_infected_1_history2]),
    format("P(history | infected=0)           = ~6f~n", [P_con_infected_0_history2]),
    %demo3
    prob(infected=1,[commonS=1, less_commonS=0, seriousS=0, age_above70=0, pre_condition=1],[], P3, P_joint_infected_1_sym_bio3, P_joint_infected_0_sym_bio3, P_con_infected_1_history3, P_con_infected_0_history3),
    format("Demo3:~n"),
    format("swi-prolog command: prob(infected=1,[commonS=1, less_commonS=0, seriousS=0, age_above70=0, pre_condition=1],[], P3, P_joint_infected_1_sym_bio3, P_joint_infected_0_sym_bio3, P_con_infected_1_history3, P_con_infected_0_history3).~n"),
    format("P(infected=1 | commonS=1, less_commonS=0, seriousS=0, age_above70=0, pre_condition=1)= ~6f~n", [P3]),
    format("P(infected=1,sym,bio) (joint)     = ~6f~n", [P_joint_infected_1_sym_bio3]),
    format("P(infected=0,sym,bio) (joint)     = ~6f~n", [P_joint_infected_0_sym_bio3]),
    format("P(history | infected=1)           = ~6f~n", [P_con_infected_1_history3]),
    format("P(history | infected=0)           = ~6f~n", [P_con_infected_0_history3]).