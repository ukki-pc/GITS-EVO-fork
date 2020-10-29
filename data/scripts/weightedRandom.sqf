// (LENGTH, %MIDDLEPOS, NEGATION(true of false), Y OFFSET +,PRECISION (DEFAULT 100)) 
weightedRandom = 
{

prec = 100;
negation = 1;
result = [];
total = 0;
num = 0;

arrayLenght = _this select 0;
positionInPercent =  _this select 1;
c = _this select 2;
negation = _this select 3;
prec =  _this select 4;

if(isNil "negation") then {negation = true};
if(isNil "c") then {c = 0};
if(isNil "prec") then {prec = 100};

//hint format ["length: %1, position %2, negation: %3, c: %4, prec: %5", arrayLenght, positionInPercent,negation, c, prec];

if(negation) then
{
    negation = -1;
}
else
{
    negation = 1;
};

if(positionInPercent <= 100 && positionInPercent >= 0 ) then{
    hiki = abs(50- abs(positionInPercent -50)); 
}
else{
    hiki = 0;
};
offset = 0;
a =  negation*1/(arrayLenght*(arrayLenght/(prec)/(1+(hiki*(0.0606)))));
b = (positionInPercent/100)*arrayLenght;
b = b-0.5;
	//Finds the lowest y point from parabola
    for [{_i=0}, {_i<arrayLenght}, {_i=_i+1}] do
    {
    num =  a*((_i-b)^2)- c;
    if(num < offset) then {
        offset = num;
		};
    };

	//Save the results in an array
	for [{_i=0}, {_i<arrayLenght}, {_i=_i+1}] do
    {
    num =  a*((_i-b)^2)- offset;
    num = round num;
    if(_i==0) then 
	{
        result set [_i, 0];
	}
    else
	{
		result set [_i, (result select _i-1)];
	};

	for [{_y=0}, {_y<num}, {_y=_y+1}] do
        {
			result set [_i, (result select _i)+1];
            total = total + 1;
        };
    };

// // Generate the number from the pool
// barvalues = [];
//  for [{_d=0}, {_d<10}, {_d=_d+1}] do
//  {
// 	 barvalues set [_d, 0];
//  };

//    for [{_d=0}, {_d<300}, {_d=_d+1}] do
//     {

    muuttujainen = 1+ round random total;
    for [{_i=0}, {_i<arrayLenght}, {_i=_i+1}] do
    {			
		if(muuttujainen <= (result select _i)) then
		{
		randomNum = _i;
		//barValues set [_i, (barValues select _i) + 1];
		_i = arrayLenght;
		};
    };
	// };
//systemChat str barValues;
randomNum;
};