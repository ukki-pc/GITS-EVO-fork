// Skips time -KilJoy
sleep 1.0;
_temp = compile BIS_EVO_gdate_packed;
_date = call _temp;
setDate _date;

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
   sleep 10.0;
   setDate [date select 0,date select 1,date select 2,date select 3,(date select 4)+1];
};