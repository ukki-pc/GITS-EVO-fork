class mando_hitch_hud
{
  idd = 100;
  movingEnable =  1;
  duration     =  10000;
  fadein       =  0;
  fadeout      =  0;
  name = "mando_hitch_hud";

  //onLoad = "mando_hitch_hud = (_this select 0)";
  onLoad = "uiNamespace setVariable [""mando_hitch_hud"", _this select 0]";

  class controls 
  {
	  class MANDOHITCH_BACKGROUND
	  {
	     idc = 101;
             type = 0;
             colorText[] = {1, 1, 1, 1};
             font = "Bitstream";
	     colorBackground[] = {0, 0, 1, 0.2};
	     text = ;
	     style = 128;
	     sizeEx = 0.015;
	     x = 0.3 - 0.3;
	     y = 0.3;
	     w = 0.4;
	     h = 0.4;
	  };


	  class MANDOHITCH_MARK
	  {
	     idc = 102;
             type = 0;
             style = 48;
             font = "Bitstream";
             sizeEx = 0.04;
             colorBackground[] = {0, 0, 0, 0};
             colorText[] = {0.5, 1, 0.5, 1};
             text = "mando_hitch\mando_hitch_circle.paa";
             x = 0.5-0.03/2 - 0.3;
             y = 0.5-0.05/2;
             w = 0.04;
             h = 0.05;
          };

	  class MANDOHITCH_CROSS
	  {
	     idc = 103;
             type = 0;
             style = 48;
             font = "Bitstream";
             sizeEx = 0.04;
             colorBackground[] = {0, 0, 0, 0};
             colorText[] = {0.5, 1, 0.5, 1};
             text = "mando_hitch\mando_hitch_cross.paa";
             x = 0.5-0.02- 0.3;
             y = 0.5-0.025;
             w = 0.04;
             h = 0.05;
          };

	  class MANDOHITCH_ICON
	  {
	     idc = 104;
             type = 0;
             style = 48;
             font = "Bitstream";
             sizeEx = 0.04;
             colorBackground[] = {0, 0, 0, 0};
             colorText[] = {1, 1, 1, 1};
             text = "";
             x = 0.3- 0.3;
             y = 0.7 - 0.05;
             w = 0.05;
             h = 0.05;
          };

	  class MANDOHITCH_TEXT
	  {
	     idc = 105;
             type = 0;
	     style = 0;
  	     x = 0.5 - 0.15- 0.3;
  	     y = 0.7 - 0.05;
  	     w = 0.3;
  	     h = 0.03;
             colorText[] = {0.5, 1, 0.5, 1};
             colorBackground[] = {0, 0, 0, 0};
             font = "Bitstream";
             sizeEx = 0.02;
	     text = "";
          };

	  class MANDOHITCH_TEXT2
	  {
	     idc = 107;
             type = 0;
	     style = 0;
  	     x = 0.5 - 0.15- 0.3;
  	     y = 0.7;
  	     w = 0.3;
  	     h = 0.03;
             colorText[] = {0.5, 1, 0.5, 1};
             colorBackground[] = {0, 0, 0, 0};
             font = "Bitstream";
             sizeEx = 0.02;
	     text = "";
          };


          class MANDOHITCH_LINE
          {
             idc = 106;
             type = 0;
             style = 176;
             x = 0.5- 0.3;
             y = 0.5;
             w = 0.1;
             h = 0.1;
             colorText[] = {0.5, 1, 0.5, 1};
             colorBackground[] = {1, 0, 0, 1};
             font = "Bitstream";
             sizeEx = 0.02;
             text = "";
          };
   };
};
