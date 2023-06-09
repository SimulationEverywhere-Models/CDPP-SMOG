% residential.ma
% Model A: Smog in the Residential Neighborhood (Cell-DEVS)

[top]
components : residential
in : in_factory in_highway
link : in_factory in_factory@residential
link : in_highway in_highway@residential

[residential]
type : cell
dim : (9, 10)
delay : inertial
defaultDelayTime  : 500
border : wrapped
neighbors :			residential(-1,0)
neighbors :  residential(0,-1)  residential(0,0)  residential(0,1)
neighbors :			residential(1,0)

initialvalue : 0
initialrowvalue :  0      0000000000
initialrowvalue :  1      0000000000
initialrowvalue :  2      0100000000
initialrowvalue :  3      0000000000
initialrowvalue :  4      0000000000
initialrowvalue :  5      0000000000
initialrowvalue :  6      0000000000
initialrowvalue :  7      0000000000
initialrowvalue :  8      0000000100

in : in_factory in_highway
link : in_factory in_factory@residential(0,9)
link : in_highway in_highway@residential(1,9)

portInTransition : in_factory@residential(0,9) diffussionRule
portInTransition : in_highway@residential(1,9) diffussionRule
localtransition : diffussionRule

[diffussionRule]
rule : 1 500 {	((0,0) = 1 and not ((-1,0) = 0 and (0,-1) = 0 and (0,1) = 0 and (1,0) = 0)) or
		((0,0) = 0 and ((-1,0) = 1 or (0,-1) = 1 or (0,1) = 1 or (1,0) = 1))
	   }
rule : 0 500 {(-1,0) = 0 and (0,-1) = 0 and (0,1) = 0 and (1,0) = 0 and (0,0) = 1}
rule : {(0,0)} 500 {t}

%select : {(-1,0), (0,1), (0,0), (0,-1), (1,0)}
%select : (-1,0), (0,1), (0,0), (0,-1), (1,0)
select : (-1,0) (0,1) (0,0) (0,-1) (1,0)	% NorthEast -> SouthWest
