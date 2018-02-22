:- compile('../lib/gorgias').
:- compile('../ext/lpwnf').
:- compile('./predicates.pl').
:- compile('./bits.pl').
:- dynamic check-price/1,match-interests/1,blockedbypublisher/1,match-geography/1,ad/4,sex/1,age/1,
                    geography/1,categorybysex/2,categorybyage/2,check-age/1,check-sex/1,policy/1.

%%%%%%%%%%%% FUNCTIONS %%%%%%%%%%%%%%%%%%%%

match-interests(B):-ad(B,I,_,_),interests(I).
match-geography(B):-ad(B,_,_,G),geography(G).
check-price(B):-ad(B,_,P,_),P==highprice.



check-age(B):-ad(B,I,_,_),age(A),categorybyage(I,A).
check-sex(B):-ad(B,I,_,_),sex(S),categorybysex(I,S).
categorybyage(I,A):-    A>=10,A<15 -> (I=sports; I=entertainment; I=pets);
                        A>=15,A<20->(I=sports;I=entertainment;I=clothes;I=cosmetics;I=food;I=technology;I=pets);
                        A>=20,A<40->(I=entertainment;I=clothes;I=food;I=cosmetics;I=travelling;I=technology;I=cars;I=sports;I=pets);
                        A>=40,A<60->(I=clothes;I=food;I=cosmetics;I=travelling;I=health);
                        A>=60,A<80->(I=health;I=food).
categorybysex(I,S):-    S==female ->(I=health;I=food;I=pets;I=cosmetics;I=entertainment;I=travelling;I=sports;I=technology;I=clothes);
                        S==male->(I=health;I=food;I=pets;I=cars;I=entertainment;I=travelling;I=sports;I=technology).

%%%%%%%%%%%%%%% OPTIONS THAT ARE AGAINST %%%%%%%%%%% 						
										
complement(show(ad,1),show(ad,I)):-member(I,[2,3,4,5,6,7,8,9,10]).
complement(show(ad,2),show(ad,I)):-member(I,[1,3,4,5,6,7,8,9,10]).
complement(show(ad,3),show(ad,I)):-member(I,[1,2,4,5,6,7,8,9,10]).
complement(show(ad,4),show(ad,I)):-member(I,[1,2,3,5,6,7,8,9,10]).
complement(show(ad,5),show(ad,I)):-member(I,[1,2,3,4,6,7,8,9,10]).
complement(show(ad,6),show(ad,I)):-member(I,[1,2,3,4,5,7,8,9,10]).
complement(show(ad,7),show(ad,I)):-member(I,[1,2,3,4,5,6,8,9,10]).
complement(show(ad,8),show(ad,I)):-member(I,[1,2,3,4,5,6,7,9,10]).
complement(show(ad,9),show(ad,I)):-member(I,[1,2,3,4,5,6,7,8,10]).
complement(show(ad,10),show(ad,I)):-member(I,[1,2,3,4,5,6,7,8,9]).


% Arguments for Options

%%%%%%%%%%%%%%% OPTIONS BUT CHECKS IF THE AD EXISTS OR IF IT IS BLOCKED %%%%%%%%%%% 

rule(r(ad,1), show(ad,1), []):-ad(1,_,_,_),not(blockedbypublisher(1)).
rule(r(ad,2), show(ad,2), []):-ad(2,_,_,_),not(blockedbypublisher(2)).
rule(r(ad,3), show(ad,3), []):-ad(3,_,_,_),not(blockedbypublisher(3)).
rule(r(ad,4), show(ad,4), []):-ad(4,_,_,_),not(blockedbypublisher(4)).
rule(r(ad,5), show(ad,5), []):-ad(5,_,_,_),not(blockedbypublisher(5)).
rule(r(ad,6), show(ad,6), []):-ad(6,_,_,_),not(blockedbypublisher(6)).
rule(r(ad,7), show(ad,7), []):-ad(7,_,_,_),not(blockedbypublisher(7)).
rule(r(ad,8), show(ad,8), []):-ad(8,_,_,_),not(blockedbypublisher(8)).
rule(r(ad,9), show(ad,9), []):-ad(9,_,_,_),not(blockedbypublisher(9)).
rule(r(ad,10), show(ad,10), []):-ad(10,_,_,_),not(blockedbypublisher(10)).


% Normal Policy
 
%%%%%%%%%%%% 100 PREFER ADS ON USER INTERESTS %%%%%%%%%%%%%%%%%%%%

rule(i(ad,1), prefer(r(ad,1),r(ad,I)),[]):-member(I,[2,3,4,5,6,7,8,9,10]),match-interests(1),not(match-geography(1)),not(check-price(1)).
rule(i(ad,2), prefer(r(ad,2),r(ad,I)),[]):-member(I,[1,3,4,5,6,7,8,9,10]),match-interests(2),not(match-geography(2)),not(check-price(2)).
rule(i(ad,3), prefer(r(ad,3),r(ad,I)),[]):-member(I,[1,2,4,5,6,7,8,9,10]),match-interests(3),not(match-geography(3)),not(check-price(3)).
rule(i(ad,4), prefer(r(ad,4),r(ad,I)),[]):-member(I,[1,2,3,5,6,7,8,9,10]),match-interests(4),not(match-geography(4)),not(check-price(4)).
rule(i(ad,5), prefer(r(ad,5),r(ad,I)),[]):-member(I,[1,2,3,4,6,7,8,9,10]),match-interests(5),not(match-geography(5)),not(check-price(5)).
rule(i(ad,6), prefer(r(ad,6),r(ad,I)),[]):-member(I,[1,2,3,4,5,7,8,9,10]),match-interests(6),not(match-geography(6)),not(check-price(6)).
rule(i(ad,7), prefer(r(ad,7),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,8,9,10]),match-interests(7),not(match-geography(7)),not(check-price(7)).
rule(i(ad,8), prefer(r(ad,8),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,9,10]),match-interests(8),not(match-geography(8)),not(check-price(8)).
rule(i(ad,9), prefer(r(ad,9),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,10]),match-interests(9),not(match-geography(9)),not(check-price(9)).
rule(i(ad,10), prefer(r(ad,10),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,9]),match-interests(10),not(match-geography(10)),not(check-price(10)).


%%%%%%%%%%%%%%%%%%% 001 PREFER AD ON USER GEOGRAPGY %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rule(g(ad,1), prefer(r(ad,1),r(ad,I)),[]):-member(I,[2,3,4,5,6,7,8,9,10]),match-geography(1),not(match-interests(1)),not(check-price(1)).
rule(g(ad,2), prefer(r(ad,2),r(ad,I)),[]):-member(I,[1,3,4,5,6,7,8,9,10]),match-geography(2),not(match-interests(2)),not(check-price(2)).
rule(g(ad,3), prefer(r(ad,3),r(ad,I)),[]):-member(I,[1,2,4,5,6,7,8,9,10]),match-geography(3),not(match-interests(3)),not(check-price(3)).
rule(g(ad,4), prefer(r(ad,4),r(ad,I)),[]):-member(I,[1,2,3,5,6,7,8,9,10]),match-geography(4),not(match-interests(4)),not(check-price(4)).
rule(g(ad,5), prefer(r(ad,5),r(ad,I)),[]):-member(I,[1,2,3,4,6,7,8,9,10]),match-geography(5),not(match-interests(5)),not(check-price(5)).
rule(g(ad,6), prefer(r(ad,6),r(ad,I)),[]):-member(I,[1,2,3,4,5,7,8,9,10]),match-geography(6),not(match-interests(6)),not(check-price(6)).
rule(g(ad,7), prefer(r(ad,7),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,8,9,10]),match-geography(7),not(match-interests(7)),not(check-price(7)).
rule(g(ad,8), prefer(r(ad,8),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,9,10]),match-geography(8),not(match-interests(8)),not(check-price(8)).
rule(g(ad,9), prefer(r(ad,9),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,10]),match-geography(9),not(match-interests(9)),not(check-price(9)).
rule(g(ad,10), prefer(r(ad,10),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,9]),match-geography(10),not(match-interests(10)),not(check-price(10)).


%%%%%%%%%%%%%%%%%%%% 010 PREFER AD WITH HIGHPRICE %%%%%%%%%%%%%%%%%

rule(h(ad,1), prefer(r(ad,1),r(ad,I)),[]):-member(I,[2,3,4,5,6,7,8,9,10]),check-price(1),not(match-interests(1)),not(match-geography(1)).
rule(h(ad,2), prefer(r(ad,2),r(ad,I)),[]):-member(I,[1,3,4,5,6,7,8,9,10]),check-price(2),not(match-interests(2)),not(match-geography(2)).
rule(h(ad,3), prefer(r(ad,3),r(ad,I)),[]):-member(I,[1,2,4,5,6,7,8,9,10]),check-price(3),not(match-interests(3)),not(match-geography(3)).
rule(h(ad,4), prefer(r(ad,4),r(ad,I)),[]):-member(I,[1,2,3,5,6,7,8,9,10]),check-price(4),not(match-interests(4)),not(match-geography(4)).
rule(h(ad,5), prefer(r(ad,5),r(ad,I)),[]):-member(I,[1,2,3,4,6,7,8,9,10]),check-price(5),not(match-interests(5)),not(match-geography(5)).
rule(h(ad,6), prefer(r(ad,6),r(ad,I)),[]):-member(I,[1,2,3,4,5,7,8,9,10]),check-price(6),not(match-interests(6)),not(match-geography(6)).
rule(h(ad,7), prefer(r(ad,7),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,8,9,10]),check-price(7),not(match-interests(7)),not(match-geography(7)).
rule(h(ad,8), prefer(r(ad,8),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,9,10]),check-price(8),not(match-interests(8)),not(match-geography(8)).
rule(h(ad,9), prefer(r(ad,9),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,10]),check-price(9),not(match-interests(9)),not(match-geography(9)).
rule(h(ad,10), prefer(r(ad,10),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,9]),check-price(10),not(match-interests(10)),not(match-geography(10)).

%%%%%%%%%%%%%%%%%%%% 011 PREFER AD WITH HIGHPRICE AND GEOGRAPHY %%%%%%%%%%%%%%%%%

rule(hg(ad,1), prefer(r(ad,1),r(ad,I)),[]):-member(I,[2,3,4,5,6,7,8,9,10]),check-price(1),match-geography(1),not(match-interests(1)).
rule(hg(ad,2), prefer(r(ad,2),r(ad,I)),[]):-member(I,[1,3,4,5,6,7,8,9,10]),check-price(2),match-geography(2),not(match-interests(2)).
rule(hg(ad,3), prefer(r(ad,3),r(ad,I)),[]):-member(I,[1,2,4,5,6,7,8,9,10]),check-price(3),match-geography(3),not(match-interests(3)).
rule(hg(ad,4), prefer(r(ad,4),r(ad,I)),[]):-member(I,[1,2,3,5,6,7,8,9,10]),check-price(4),match-geography(4),not(match-interests(4)).
rule(hg(ad,5), prefer(r(ad,5),r(ad,I)),[]):-member(I,[1,2,3,4,6,7,8,9,10]),check-price(5),match-geography(5),not(match-interests(5)).
rule(hg(ad,6), prefer(r(ad,6),r(ad,I)),[]):-member(I,[1,2,3,4,5,7,8,9,10]),check-price(6),match-geography(6),not(match-interests(6)).
rule(hg(ad,7), prefer(r(ad,7),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,8,9,10]),check-price(7),match-geography(7),not(match-interests(7)).
rule(hg(ad,8), prefer(r(ad,8),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,9,10]),check-price(8),match-geography(8),not(match-interests(8)).
rule(hg(ad,9), prefer(r(ad,9),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,10]),check-price(9),match-geography(9),not(match-interests(9)).
rule(hg(ad,10), prefer(r(ad,10),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,9]),check-price(10),match-geography(10),not(match-interests(10)).

%%%%%%%%%%%%%%%%%%%% 101 PREFER AD WITH USER INTERESTS AND USER GEOGRAPGY %%%%%%%%%%%%%%%%%

rule(ig(ad,1), prefer(r(ad,1),r(ad,I)),[]):-member(I,[2,3,4,5,6,7,8,9,10]),match-interests(1),match-geography(1),not(check-price(1)).
rule(ig(ad,2), prefer(r(ad,2),r(ad,I)),[]):-member(I,[1,3,4,5,6,7,8,9,10]),match-interests(2),match-geography(2),not(check-price(2)).
rule(ig(ad,3), prefer(r(ad,3),r(ad,I)),[]):-member(I,[1,2,4,5,6,7,8,9,10]),match-interests(3),match-geography(3),not(check-price(3)).
rule(ig(ad,4), prefer(r(ad,4),r(ad,I)),[]):-member(I,[1,2,3,5,6,7,8,9,10]),match-interests(4),match-geography(4),not(check-price(4)).
rule(ig(ad,5), prefer(r(ad,5),r(ad,I)),[]):-member(I,[1,2,3,4,6,7,8,9,10]),match-interests(5),match-geography(5),not(check-price(5)).
rule(ig(ad,6), prefer(r(ad,6),r(ad,I)),[]):-member(I,[1,2,3,4,5,7,8,9,10]),match-interests(6),match-geography(6),not(check-price(6)).
rule(ig(ad,7), prefer(r(ad,7),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,8,9,10]),match-interests(7),match-geography(7),not(check-price(7)).
rule(ig(ad,8), prefer(r(ad,8),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,9,10]),match-interests(8),match-geography(8),not(check-price(8)).
rule(ig(ad,9), prefer(r(ad,9),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,10]),match-interests(9),match-geography(9),not(check-price(9)).
rule(ig(ad,10), prefer(r(ad,10),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,9]),match-interests(10),match-geography(10),not(check-price(10)).

%%%%%%%%%%%%%%%%%%%% 110 PREFER AD WITH USER INTERESTS HIGHPRICE %%%%%%%%%%%%%%%%%

rule(ih(ad,1), prefer(r(ad,1),r(ad,I)),[]):-member(I,[2,3,4,5,6,7,8,9,10]),match-interests(1),check-price(1),not(match-geography(1)).
rule(ih(ad,2), prefer(r(ad,2),r(ad,I)),[]):-member(I,[1,3,4,5,6,7,8,9,10]),match-interests(2),check-price(2),not(match-geography(2)).
rule(ih(ad,3), prefer(r(ad,3),r(ad,I)),[]):-member(I,[1,2,4,5,6,7,8,9,10]),match-interests(3),check-price(3),not(match-geography(3)).
rule(ih(ad,4), prefer(r(ad,4),r(ad,I)),[]):-member(I,[1,2,3,5,6,7,8,9,10]),match-interests(4),check-price(4),not(match-geography(4)).
rule(ih(ad,5), prefer(r(ad,5),r(ad,I)),[]):-member(I,[1,2,3,4,6,7,8,9,10]),match-interests(5),check-price(5),not(match-geography(5)).
rule(ih(ad,6), prefer(r(ad,6),r(ad,I)),[]):-member(I,[1,2,3,4,5,7,8,9,10]),match-interests(6),check-price(6),not(match-geography(6)).
rule(ih(ad,7), prefer(r(ad,7),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,8,9,10]),match-interests(7),check-price(7),not(match-geography(7)).
rule(ih(ad,8), prefer(r(ad,8),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,9,10]),match-interests(8),check-price(8),not(match-geography(8)).
rule(ih(ad,9), prefer(r(ad,9),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,10]),match-interests(9),check-price(9),not(match-geography(9)).
rule(ih(ad,10), prefer(r(ad,10),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,9]),match-interests(10),check-price(10),not(match-geography(10)).

%%%%%%%%%%%%%%%%%%%% 111 PREFER AD WITH USER INTERESTS HIGHPRICE AND USER GEOGRAPGY %%%%%%%%%%%%%%%%%

rule(ihg(ad,1), prefer(r(ad,1),r(ad,I)),[]):-member(I,[2,3,4,5,6,7,8,9,10]),match-interests(1),check-price(1),match-geography(1).
rule(ihg(ad,2), prefer(r(ad,2),r(ad,I)),[]):-member(I,[1,3,4,5,6,7,8,9,10]),match-interests(2),check-price(2),match-geography(2).
rule(ihg(ad,3), prefer(r(ad,3),r(ad,I)),[]):-member(I,[1,2,4,5,6,7,8,9,10]),match-interests(3),check-price(3),match-geography(3).
rule(ihg(ad,4), prefer(r(ad,4),r(ad,I)),[]):-member(I,[1,2,3,5,6,7,8,9,10]),match-interests(4),check-price(4),match-geography(4).
rule(ihg(ad,5), prefer(r(ad,5),r(ad,I)),[]):-member(I,[1,2,3,4,6,7,8,9,10]),match-interests(5),check-price(5),match-geography(5).
rule(ihg(ad,6), prefer(r(ad,6),r(ad,I)),[]):-member(I,[1,2,3,4,5,7,8,9,10]),match-interests(6),check-price(6),match-geography(6).
rule(ihg(ad,7), prefer(r(ad,7),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,8,9,10]),match-interests(7),check-price(7),match-geography(7).
rule(ihg(ad,8), prefer(r(ad,8),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,9,10]),match-interests(8),check-price(8),match-geography(8).
rule(ihg(ad,9), prefer(r(ad,9),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,10]),match-interests(9),check-price(9),match-geography(9).
rule(ihg(ad,10), prefer(r(ad,10),r(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,9]),match-interests(10),check-price(10),match-geography(10).








%%%%%%%%%%%%%%%%%%%% SPECIAL POLICY FROM PUBLISHER 1 %%%%%%%%%%%%%%%%%%

%%%%%%% 100 PREFER ADS WITH USER INTERESTS THAN HIGHPRICE %%%%%%%%%%%%%%%%%%
rule(pi(ad,1), prefer(i(ad,1),h(ad,I)),[]):-policy(1),member(I,[2,3,4,5,6,7,8,9,10]).
rule(pi(ad,2), prefer(i(ad,2),h(ad,I)),[]):-policy(1),member(I,[1,3,4,5,6,7,8,9,10]).
rule(pi(ad,3), prefer(i(ad,3),h(ad,I)),[]):-policy(1),member(I,[1,2,4,5,6,7,8,9,10]).
rule(pi(ad,4), prefer(i(ad,4),h(ad,I)),[]):-policy(1),member(I,[1,2,3,5,6,7,8,9,10]).
rule(pi(ad,5), prefer(i(ad,5),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,6,7,8,9,10]).
rule(pi(ad,6), prefer(i(ad,6),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,7,8,9,10]).
rule(pi(ad,7), prefer(i(ad,7),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,8,9,10]).
rule(pi(ad,8), prefer(i(ad,8),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,9,10]).
rule(pi(ad,9), prefer(i(ad,9),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,10]).
rule(pi(ad,10), prefer(i(ad,10),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,9]).

%%%%%%% 100 PREFER ADS WITH USER INTERESTS THAN USER GEOGRAPGY %%%%%%%%%%%%%%%%%%
rule(pi(ad,1), prefer(i(ad,1),g(ad,I)),[]):-policy(1),member(I,[2,3,4,5,6,7,8,9,10]).
rule(pi(ad,2), prefer(i(ad,2),g(ad,I)),[]):-policy(1),member(I,[1,3,4,5,6,7,8,9,10]).
rule(pi(ad,3), prefer(i(ad,3),g(ad,I)),[]):-policy(1),member(I,[1,2,4,5,6,7,8,9,10]).
rule(pi(ad,4), prefer(i(ad,4),g(ad,I)),[]):-policy(1),member(I,[1,2,3,5,6,7,8,9,10]).
rule(pi(ad,5), prefer(i(ad,5),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,6,7,8,9,10]).
rule(pi(ad,6), prefer(i(ad,6),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,7,8,9,10]).
rule(pi(ad,7), prefer(i(ad,7),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,8,9,10]).
rule(pi(ad,8), prefer(i(ad,8),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,9,10]).
rule(pi(ad,9), prefer(i(ad,9),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,10]).
rule(pi(ad,10), prefer(i(ad,10),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,9]).

%%%%%%% 100 PREFER ADS WITH USER INTERESTS THAN HIGHPRICE AND USER GEOGRAPGY %%%%%%%%%%%%%%%%%%
rule(pi(ad,1), prefer(i(ad,1),hg(ad,I)),[]):-policy(1),member(I,[2,3,4,5,6,7,8,9,10]).
rule(pi(ad,2), prefer(i(ad,2),hg(ad,I)),[]):-policy(1),member(I,[1,3,4,5,6,7,8,9,10]).
rule(pi(ad,3), prefer(i(ad,3),hg(ad,I)),[]):-policy(1),member(I,[1,2,4,5,6,7,8,9,10]).
rule(pi(ad,4), prefer(i(ad,4),hg(ad,I)),[]):-policy(1),member(I,[1,2,3,5,6,7,8,9,10]).
rule(pi(ad,5), prefer(i(ad,5),hg(ad,I)),[]):-policy(1),member(I,[1,2,3,4,6,7,8,9,10]).
rule(pi(ad,6), prefer(i(ad,6),hg(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,7,8,9,10]).
rule(pi(ad,7), prefer(i(ad,7),hg(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,8,9,10]).
rule(pi(ad,8), prefer(i(ad,8),hg(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,9,10]).
rule(pi(ad,9), prefer(i(ad,9),hg(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,10]).
rule(pi(ad,10), prefer(i(ad,10),hg(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,9]).

%%%%%%% 010 PREFER ADS WITH HIGHPRICE THAN USER GEOGRAPGY %%%%%%%%%%%%%%%%%%
rule(ph(ad,1), prefer(h(ad,1),g(ad,I)),[]):-policy(1),member(I,[2,3,4,5,6,7,8,9,10]).
rule(ph(ad,2), prefer(h(ad,2),g(ad,I)),[]):-policy(1),member(I,[1,3,4,5,6,7,8,9,10]).
rule(ph(ad,3), prefer(h(ad,3),g(ad,I)),[]):-policy(1),member(I,[1,2,4,5,6,7,8,9,10]).
rule(ph(ad,4), prefer(h(ad,4),g(ad,I)),[]):-policy(1),member(I,[1,2,3,5,6,7,8,9,10]).
rule(ph(ad,5), prefer(h(ad,5),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,6,7,8,9,10]).
rule(ph(ad,6), prefer(h(ad,6),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,7,8,9,10]).
rule(ph(ad,7), prefer(h(ad,7),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,8,9,10]).
rule(ph(ad,8), prefer(h(ad,8),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,9,10]).
rule(ph(ad,9), prefer(h(ad,9),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,10]).
rule(ph(ad,10), prefer(h(ad,10),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,9]).

%%%%%%% 011 PREFER ADS WITH HIGHPRICE AND GEOGRAPHY THAN HIGHPRICE ONLY %%%%%%%%%%%%%%%%%%

rule(phg(ad,1), prefer(hg(ad,1),h(ad,I)),[]):-policy(1),member(I,[2,3,4,5,6,7,8,9,10]).
rule(phg(ad,2), prefer(hg(ad,2),h(ad,I)),[]):-policy(1),member(I,[1,3,4,5,6,7,8,9,10]).
rule(phg(ad,3), prefer(hg(ad,3),h(ad,I)),[]):-policy(1),member(I,[1,2,4,5,6,7,8,9,10]).
rule(phg(ad,4), prefer(hg(ad,4),h(ad,I)),[]):-policy(1),member(I,[1,2,3,5,6,7,8,9,10]).
rule(phg(ad,5), prefer(hg(ad,5),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,6,7,8,9,10]).
rule(phg(ad,6), prefer(hg(ad,6),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,7,8,9,10]).
rule(phg(ad,7), prefer(hg(ad,7),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,8,9,10]).
rule(phg(ad,8), prefer(hg(ad,8),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,9,10]).
rule(phg(ad,9), prefer(hg(ad,9),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,10]).
rule(phg(ad,10), prefer(hg(ad,10),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,9]).

%%%%%%% 011 PREFER ADS WITH HIGHPRICE AND GEOGRAPHY THAN USER GEOGRAPHY ONLY %%%%%%%%%%%%%%%%%%

rule(phg(ad,1), prefer(hg(ad,1),g(ad,I)),[]):-policy(1),member(I,[2,3,4,5,6,7,8,9,10]).
rule(phg(ad,2), prefer(hg(ad,2),g(ad,I)),[]):-policy(1),member(I,[1,3,4,5,6,7,8,9,10]).
rule(phg(ad,3), prefer(hg(ad,3),g(ad,I)),[]):-policy(1),member(I,[1,2,4,5,6,7,8,9,10]).
rule(phg(ad,4), prefer(hg(ad,4),g(ad,I)),[]):-policy(1),member(I,[1,2,3,5,6,7,8,9,10]).
rule(phg(ad,5), prefer(hg(ad,5),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,6,7,8,9,10]).
rule(phg(ad,6), prefer(hg(ad,6),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,7,8,9,10]).
rule(phg(ad,7), prefer(hg(ad,7),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,8,9,10]).
rule(phg(ad,8), prefer(hg(ad,8),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,9,10]).
rule(phg(ad,9), prefer(hg(ad,9),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,10]).
rule(phg(ad,10), prefer(hg(ad,10),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,9]).

%%%%%%% 101 PREFER ADS WITH USER INTERESTS AND GEOGRAPHY THAN USER GEOGRAPHY ONLY %%%%%%%%%%%%%%%%%%

rule(pig(ad,1), prefer(ig(ad,1),g(ad,I)),[]):-policy(1),member(I,[2,3,4,5,6,7,8,9,10]).
rule(pig(ad,2), prefer(ig(ad,2),g(ad,I)),[]):-policy(1),member(I,[1,3,4,5,6,7,8,9,10]).
rule(pig(ad,3), prefer(ig(ad,3),g(ad,I)),[]):-policy(1),member(I,[1,2,4,5,6,7,8,9,10]).
rule(pig(ad,4), prefer(ig(ad,4),g(ad,I)),[]):-policy(1),member(I,[1,2,3,5,6,7,8,9,10]).
rule(pig(ad,5), prefer(ig(ad,5),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,6,7,8,9,10]).
rule(pig(ad,6), prefer(ig(ad,6),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,7,8,9,10]).
rule(pig(ad,7), prefer(ig(ad,7),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,8,9,10]).
rule(pig(ad,8), prefer(ig(ad,8),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,9,10]).
rule(pig(ad,9), prefer(ig(ad,9),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,10]).
rule(pig(ad,10), prefer(ig(ad,10),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,9]).

%%%%%%% 101 PREFER ADS WITH USER INTERESTS AND GEOGRAPHY THAN USER INTERESTS ONLY %%%%%%%%%%%%%%%%%%

rule(pig(ad,1), prefer(ig(ad,1),i(ad,I)),[]):-policy(1),member(I,[2,3,4,5,6,7,8,9,10]).
rule(pig(ad,2), prefer(ig(ad,2),i(ad,I)),[]):-policy(1),member(I,[1,3,4,5,6,7,8,9,10]).
rule(pig(ad,3), prefer(ig(ad,3),i(ad,I)),[]):-policy(1),member(I,[1,2,4,5,6,7,8,9,10]).
rule(pig(ad,4), prefer(ig(ad,4),i(ad,I)),[]):-policy(1),member(I,[1,2,3,5,6,7,8,9,10]).
rule(pig(ad,5), prefer(ig(ad,5),i(ad,I)),[]):-policy(1),member(I,[1,2,3,4,6,7,8,9,10]).
rule(pig(ad,6), prefer(ig(ad,6),i(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,7,8,9,10]).
rule(pig(ad,7), prefer(ig(ad,7),i(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,8,9,10]).
rule(pig(ad,8), prefer(ig(ad,8),i(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,9,10]).
rule(pig(ad,9), prefer(ig(ad,9),i(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,10]).
rule(pig(ad,10), prefer(ig(ad,10),i(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,9]).

%%%%%%% 101 PREFER ADS WITH USER INTERESTS AND GEOGRAPHY THAN HIGHPRICE ONLY %%%%%%%%%%%%%%%%%%

rule(pig(ad,1), prefer(ig(ad,1),h(ad,I)),[]):-policy(1),member(I,[2,3,4,5,6,7,8,9,10]).
rule(pig(ad,2), prefer(ig(ad,2),h(ad,I)),[]):-policy(1),member(I,[1,3,4,5,6,7,8,9,10]).
rule(pig(ad,3), prefer(ig(ad,3),h(ad,I)),[]):-policy(1),member(I,[1,2,4,5,6,7,8,9,10]).
rule(pig(ad,4), prefer(ig(ad,4),h(ad,I)),[]):-policy(1),member(I,[1,2,3,5,6,7,8,9,10]).
rule(pig(ad,5), prefer(ig(ad,5),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,6,7,8,9,10]).
rule(pig(ad,6), prefer(ig(ad,6),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,7,8,9,10]).
rule(pig(ad,7), prefer(ig(ad,7),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,8,9,10]).
rule(pig(ad,8), prefer(ig(ad,8),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,9,10]).
rule(pig(ad,9), prefer(ig(ad,9),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,10]).
rule(pig(ad,10), prefer(ig(ad,10),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,9]).

%%%%%%% 101 PREFER ADS WITH USER INTERESTS AND GEOGRAPHY THAN HIGHPRICE AND GEOGRAPHY %%%%%%%%%%%%%%%%%%

rule(pig(ad,1), prefer(ig(ad,1),hg(ad,I)),[]):-policy(1),member(I,[2,3,4,5,6,7,8,9,10]).
rule(pig(ad,2), prefer(ig(ad,2),hg(ad,I)),[]):-policy(1),member(I,[1,3,4,5,6,7,8,9,10]).
rule(pig(ad,3), prefer(ig(ad,3),hg(ad,I)),[]):-policy(1),member(I,[1,2,4,5,6,7,8,9,10]).
rule(pig(ad,4), prefer(ig(ad,4),hg(ad,I)),[]):-policy(1),member(I,[1,2,3,5,6,7,8,9,10]).
rule(pig(ad,5), prefer(ig(ad,5),hg(ad,I)),[]):-policy(1),member(I,[1,2,3,4,6,7,8,9,10]).
rule(pig(ad,6), prefer(ig(ad,6),hg(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,7,8,9,10]).
rule(pig(ad,7), prefer(ig(ad,7),hg(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,8,9,10]).
rule(pig(ad,8), prefer(ig(ad,8),hg(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,9,10]).
rule(pig(ad,9), prefer(ig(ad,9),hg(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,10]).
rule(pig(ad,10), prefer(ig(ad,10),hg(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,9]).


%%%%%%% 110 PREFER ADS WITH USER INTERESTS AND HIGHPRICE THAN USER GEOGRAPGY ONLY %%%%%%%%%%%%%%%%%%

rule(pih(ad,1), prefer(ih(ad,1),g(ad,I)),[]):-policy(1),member(I,[2,3,4,5,6,7,8,9,10]).
rule(pih(ad,2), prefer(ih(ad,2),g(ad,I)),[]):-policy(1),member(I,[1,3,4,5,6,7,8,9,10]).
rule(pih(ad,3), prefer(ih(ad,3),g(ad,I)),[]):-policy(1),member(I,[1,2,4,5,6,7,8,9,10]).
rule(pih(ad,4), prefer(ih(ad,4),g(ad,I)),[]):-policy(1),member(I,[1,2,3,5,6,7,8,9,10]).
rule(pih(ad,5), prefer(ih(ad,5),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,6,7,8,9,10]).
rule(pih(ad,6), prefer(ih(ad,6),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,7,8,9,10]).
rule(pih(ad,7), prefer(ih(ad,7),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,8,9,10]).
rule(pih(ad,8), prefer(ih(ad,8),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,9,10]).
rule(pih(ad,9), prefer(ih(ad,9),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,10]).
rule(pih(ad,10), prefer(ih(ad,10),g(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,9]).


%%%%%%% 110 PREFER ADS WITH USER INTERESTS AND HIGHPRICE THAN HIGHPRICE ONLY %%%%%%%%%%%%%%%%%%

rule(pih(ad,1), prefer(ih(ad,1),h(ad,I)),[]):-policy(1),member(I,[2,3,4,5,6,7,8,9,10]).
rule(pih(ad,2), prefer(ih(ad,2),h(ad,I)),[]):-policy(1),member(I,[1,3,4,5,6,7,8,9,10]).
rule(pih(ad,3), prefer(ih(ad,3),h(ad,I)),[]):-policy(1),member(I,[1,2,4,5,6,7,8,9,10]).
rule(pih(ad,4), prefer(ih(ad,4),h(ad,I)),[]):-policy(1),member(I,[1,2,3,5,6,7,8,9,10]).
rule(pih(ad,5), prefer(ih(ad,5),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,6,7,8,9,10]).
rule(pih(ad,6), prefer(ih(ad,6),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,7,8,9,10]).
rule(pih(ad,7), prefer(ih(ad,7),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,8,9,10]).
rule(pih(ad,8), prefer(ih(ad,8),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,9,10]).
rule(pih(ad,9), prefer(ih(ad,9),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,10]).
rule(pih(ad,10), prefer(ih(ad,10),h(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,9]).

%%%%%%% 110 PREFER ADS WITH USER INTERESTS AND HIGHPRICE THAN USER INTERESTS ONLY %%%%%%%%%%%%%%%%%%

rule(pih(ad,1), prefer(ih(ad,1),i(ad,I)),[]):-policy(1),member(I,[2,3,4,5,6,7,8,9,10]).
rule(pih(ad,2), prefer(ih(ad,2),i(ad,I)),[]):-policy(1),member(I,[1,3,4,5,6,7,8,9,10]).
rule(pih(ad,3), prefer(ih(ad,3),i(ad,I)),[]):-policy(1),member(I,[1,2,4,5,6,7,8,9,10]).
rule(pih(ad,4), prefer(ih(ad,4),i(ad,I)),[]):-policy(1),member(I,[1,2,3,5,6,7,8,9,10]).
rule(pih(ad,5), prefer(ih(ad,5),i(ad,I)),[]):-policy(1),member(I,[1,2,3,4,6,7,8,9,10]).
rule(pih(ad,6), prefer(ih(ad,6),i(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,7,8,9,10]).
rule(pih(ad,7), prefer(ih(ad,7),i(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,8,9,10]).
rule(pih(ad,8), prefer(ih(ad,8),i(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,9,10]).
rule(pih(ad,9), prefer(ih(ad,9),i(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,10]).
rule(pih(ad,10), prefer(ih(ad,10),i(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,9]).

%%%%%%% 110 PREFER ADS WITH USER INTERESTS AND HIGHPRICE THAN USER INTERESTS AND USER GEOGRAPHY %%%%%%%%%%%%%%%%%%

rule(pih(ad,1), prefer(ih(ad,1),ig(ad,I)),[]):-policy(1),member(I,[2,3,4,5,6,7,8,9,10]).
rule(pih(ad,2), prefer(ih(ad,2),ig(ad,I)),[]):-policy(1),member(I,[1,3,4,5,6,7,8,9,10]).
rule(pih(ad,3), prefer(ih(ad,3),ig(ad,I)),[]):-policy(1),member(I,[1,2,4,5,6,7,8,9,10]).
rule(pih(ad,4), prefer(ih(ad,4),ig(ad,I)),[]):-policy(1),member(I,[1,2,3,5,6,7,8,9,10]).
rule(pih(ad,5), prefer(ih(ad,5),ig(ad,I)),[]):-policy(1),member(I,[1,2,3,4,6,7,8,9,10]).
rule(pih(ad,6), prefer(ih(ad,6),ig(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,7,8,9,10]).
rule(pih(ad,7), prefer(ih(ad,7),ig(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,8,9,10]).
rule(pih(ad,8), prefer(ih(ad,8),ig(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,9,10]).
rule(pih(ad,9), prefer(ih(ad,9),ig(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,10]).
rule(pih(ad,10), prefer(ih(ad,10),ig(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,9]).

%%%%%%% 110 PREFER ADS WITH USER INTERESTS AND HIGHPRICE THAN HIGHPRICE AND USER GEOGRAPHY %%%%%%%%%%%%%%%%%%

rule(pih(ad,1), prefer(ih(ad,1),hg(ad,I)),[]):-policy(1),member(I,[2,3,4,5,6,7,8,9,10]).
rule(pih(ad,2), prefer(ih(ad,2),hg(ad,I)),[]):-policy(1),member(I,[1,3,4,5,6,7,8,9,10]).
rule(pih(ad,3), prefer(ih(ad,3),hg(ad,I)),[]):-policy(1),member(I,[1,2,4,5,6,7,8,9,10]).
rule(pih(ad,4), prefer(ih(ad,4),hg(ad,I)),[]):-policy(1),member(I,[1,2,3,5,6,7,8,9,10]).
rule(pih(ad,5), prefer(ih(ad,5),hg(ad,I)),[]):-policy(1),member(I,[1,2,3,4,6,7,8,9,10]).
rule(pih(ad,6), prefer(ih(ad,6),hg(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,7,8,9,10]).
rule(pih(ad,7), prefer(ih(ad,7),hg(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,8,9,10]).
rule(pih(ad,8), prefer(ih(ad,8),hg(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,9,10]).
rule(pih(ad,9), prefer(ih(ad,9),hg(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,10]).
rule(pih(ad,10), prefer(ih(ad,10),hg(ad,I)),[]):-policy(1),member(I,[1,2,3,4,5,6,7,8,9]).

%%%%%%%%%%%%%%%%%%%%% 111  PREFER ADS WITH USER INTEERESTS HIGHPRICE AND USER GEO THAN USER INTERESTS ONLY %%%%%%%%%%%%%%%%%%%

rule(pihg(ad,1), prefer(ihg(ad,1),i(ad,I)),[]):-member(I,[2,3,4,5,6,7,8,9,10]).
rule(pihg(ad,2), prefer(ihg(ad,2),i(ad,I)),[]):-member(I,[1,3,4,5,6,7,8,9,10]).
rule(pihg(ad,3), prefer(ihg(ad,3),i(ad,I)),[]):-member(I,[1,2,4,5,6,7,8,9,10]).
rule(pihg(ad,4), prefer(ihg(ad,4),i(ad,I)),[]):-member(I,[1,2,3,5,6,7,8,9,10]).
rule(pihg(ad,5), prefer(ihg(ad,5),i(ad,I)),[]):-member(I,[1,2,3,4,6,7,8,9,10]).
rule(pihg(ad,6), prefer(ihg(ad,6),i(ad,I)),[]):-member(I,[1,2,3,4,5,7,8,9,10]).
rule(pihg(ad,7), prefer(ihg(ad,7),i(ad,I)),[]):-member(I,[1,2,3,4,5,6,8,9,10]).
rule(pihg(ad,8), prefer(ihg(ad,8),i(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,9,10]).
rule(pihg(ad,9), prefer(ihg(ad,9),i(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,10]).
rule(pihg(ad,10), prefer(ihg(ad,10),i(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,9]).

%%%%%%%%%%%%%%%%%%%%% 111  PREFER ADS WITH USER INTEERESTS HIGHPRICE AND USER GEO THAN HIGHPRICE ONLY %%%%%%%%%%%%%%%%%%%

rule(pihg(ad,1), prefer(ihg(ad,1),h(ad,I)),[]):-member(I,[2,3,4,5,6,7,8,9,10]).
rule(pihg(ad,2), prefer(ihg(ad,2),h(ad,I)),[]):-member(I,[1,3,4,5,6,7,8,9,10]).
rule(pihg(ad,3), prefer(ihg(ad,3),h(ad,I)),[]):-member(I,[1,2,4,5,6,7,8,9,10]).
rule(pihg(ad,4), prefer(ihg(ad,4),h(ad,I)),[]):-member(I,[1,2,3,5,6,7,8,9,10]).
rule(pihg(ad,5), prefer(ihg(ad,5),h(ad,I)),[]):-member(I,[1,2,3,4,6,7,8,9,10]).
rule(pihg(ad,6), prefer(ihg(ad,6),h(ad,I)),[]):-member(I,[1,2,3,4,5,7,8,9,10]).
rule(pihg(ad,7), prefer(ihg(ad,7),h(ad,I)),[]):-member(I,[1,2,3,4,5,6,8,9,10]).
rule(pihg(ad,8), prefer(ihg(ad,8),h(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,9,10]).
rule(pihg(ad,9), prefer(ihg(ad,9),h(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,10]).
rule(pihg(ad,10), prefer(ihg(ad,10),h(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,9]).

%%%%%%%%%%%%%%%%%%%%% 111  PREFER ADS WITH USER INTEERESTS HIGHPRICE AND USER GEO THAN USER GEOGRAPHY ONLY %%%%%%%%%%%%%%%%%%%

rule(pihg(ad,1), prefer(ihg(ad,1),g(ad,I)),[]):-member(I,[2,3,4,5,6,7,8,9,10]).
rule(pihg(ad,2), prefer(ihg(ad,2),g(ad,I)),[]):-member(I,[1,3,4,5,6,7,8,9,10]).
rule(pihg(ad,3), prefer(ihg(ad,3),g(ad,I)),[]):-member(I,[1,2,4,5,6,7,8,9,10]).
rule(pihg(ad,4), prefer(ihg(ad,4),g(ad,I)),[]):-member(I,[1,2,3,5,6,7,8,9,10]).
rule(pihg(ad,5), prefer(ihg(ad,5),g(ad,I)),[]):-member(I,[1,2,3,4,6,7,8,9,10]).
rule(pihg(ad,6), prefer(ihg(ad,6),g(ad,I)),[]):-member(I,[1,2,3,4,5,7,8,9,10]).
rule(pihg(ad,7), prefer(ihg(ad,7),g(ad,I)),[]):-member(I,[1,2,3,4,5,6,8,9,10]).
rule(pihg(ad,8), prefer(ihg(ad,8),g(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,9,10]).
rule(pihg(ad,9), prefer(ihg(ad,9),g(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,10]).
rule(pihg(ad,10), prefer(ihg(ad,10),g(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,9]).

%%%%%%%%%%%%%%%%%%%%% 111  PREFER ADS WITH USER INTEERESTS HIGHPRICE AND USER GEO THAN USER GEOGRAPHY AND HIGHPRICE %%%%%%%%%%%%%%%%%%%

rule(pihg(ad,1), prefer(ihg(ad,1),hg(ad,I)),[]):-member(I,[2,3,4,5,6,7,8,9,10]).
rule(pihg(ad,2), prefer(ihg(ad,2),hg(ad,I)),[]):-member(I,[1,3,4,5,6,7,8,9,10]).
rule(pihg(ad,3), prefer(ihg(ad,3),hg(ad,I)),[]):-member(I,[1,2,4,5,6,7,8,9,10]).
rule(pihg(ad,4), prefer(ihg(ad,4),hg(ad,I)),[]):-member(I,[1,2,3,5,6,7,8,9,10]).
rule(pihg(ad,5), prefer(ihg(ad,5),hg(ad,I)),[]):-member(I,[1,2,3,4,6,7,8,9,10]).
rule(pihg(ad,6), prefer(ihg(ad,6),hg(ad,I)),[]):-member(I,[1,2,3,4,5,7,8,9,10]).
rule(pihg(ad,7), prefer(ihg(ad,7),hg(ad,I)),[]):-member(I,[1,2,3,4,5,6,8,9,10]).
rule(pihg(ad,8), prefer(ihg(ad,8),hg(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,9,10]).
rule(pihg(ad,9), prefer(ihg(ad,9),hg(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,10]).
rule(pihg(ad,10), prefer(ihg(ad,10),hg(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,9]).

%%%%%%%%%%%%%%%%%%%%% 111  PREFER ADS WITH USER INTEERESTS HIGHPRICE AND USER GEO THAN USER INTERESTS AND HIGHPRICE %%%%%%%%%%%%%%%%%%%

rule(pihg(ad,1), prefer(ihg(ad,1),ih(ad,I)),[]):-member(I,[2,3,4,5,6,7,8,9,10]).
rule(pihg(ad,2), prefer(ihg(ad,2),ih(ad,I)),[]):-member(I,[1,3,4,5,6,7,8,9,10]).
rule(pihg(ad,3), prefer(ihg(ad,3),ih(ad,I)),[]):-member(I,[1,2,4,5,6,7,8,9,10]).
rule(pihg(ad,4), prefer(ihg(ad,4),ih(ad,I)),[]):-member(I,[1,2,3,5,6,7,8,9,10]).
rule(pihg(ad,5), prefer(ihg(ad,5),ih(ad,I)),[]):-member(I,[1,2,3,4,6,7,8,9,10]).
rule(pihg(ad,6), prefer(ihg(ad,6),ih(ad,I)),[]):-member(I,[1,2,3,4,5,7,8,9,10]).
rule(pihg(ad,7), prefer(ihg(ad,7),ih(ad,I)),[]):-member(I,[1,2,3,4,5,6,8,9,10]).
rule(pihg(ad,8), prefer(ihg(ad,8),ih(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,9,10]).
rule(pihg(ad,9), prefer(ihg(ad,9),ih(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,10]).
rule(pihg(ad,10), prefer(ihg(ad,10),ih(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,9]).

%%%%%%%%%%%%%%%%%%%%% 111  PREFER ADS WITH USER INTEERESTS HIGHPRICE AND USER GEO THAN USER INTERESTS AND GEOGRAPHY %%%%%%%%%%%%%%%%%%%

rule(pihg(ad,1), prefer(ihg(ad,1),ig(ad,I)),[]):-member(I,[2,3,4,5,6,7,8,9,10]).
rule(pihg(ad,2), prefer(ihg(ad,2),ig(ad,I)),[]):-member(I,[1,3,4,5,6,7,8,9,10]).
rule(pihg(ad,3), prefer(ihg(ad,3),ig(ad,I)),[]):-member(I,[1,2,4,5,6,7,8,9,10]).
rule(pihg(ad,4), prefer(ihg(ad,4),ig(ad,I)),[]):-member(I,[1,2,3,5,6,7,8,9,10]).
rule(pihg(ad,5), prefer(ihg(ad,5),ig(ad,I)),[]):-member(I,[1,2,3,4,6,7,8,9,10]).
rule(pihg(ad,6), prefer(ihg(ad,6),ig(ad,I)),[]):-member(I,[1,2,3,4,5,7,8,9,10]).
rule(pihg(ad,7), prefer(ihg(ad,7),ig(ad,I)),[]):-member(I,[1,2,3,4,5,6,8,9,10]).
rule(pihg(ad,8), prefer(ihg(ad,8),ig(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,9,10]).
rule(pihg(ad,9), prefer(ihg(ad,9),ig(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,10]).
rule(pihg(ad,10), prefer(ihg(ad,10),ig(ad,I)),[]):-member(I,[1,2,3,4,5,6,7,8,9]).