class RscTitles
{
	class logo
	{
		idd=-1;
		movingEnable = 0;
		duration=12;
		name = "logo";
		controls[]=
		{
			Picture
		};  
		class Picture : RscPicture
		{
			x = -0.5;
 			y = -0.5;
 			w = 0.15; 
			h = 0.2;
			text = "addin\fx\logo.paa";
			sizeEx = 1;
			style=48;
		};
	};
};
class CfgSounds
{
	sounds[] = 
	{
	};
 	class bark 
	{
	name="bark";
	sound[]={\addin\fx\bark.ogg,0.4,1};
	titles[] = {};
	};
 	class growl
	{
	name="growl";
	sound[]={\addin\fx\growl.ogg,0.5,1};
	titles[] = {};
	};
	class teleport
	{
	name="teleport";
	sound[]={\addin\fx\teleport.ogg,0.7,1};
	titles[] = {};
	};
	 class whistleFollow 
	{
	name="whistleFollow";
	sound[]={\addin\fx\whistleFollow.ogg,0.8,1};
	titles[] = {};
	};
 	class whistleStay
	{
	name="whistleStay";
	sound[]={\addin\fx\whistleStay.ogg,0.8,1};
	titles[] = {};
	};
	class WhistleFind
	{
	name="WhistleFind";
	sound[]={\addin\fx\whistleFind.ogg,0.8,1};
	titles[] = {};
	};
 	class whistleNon
	{
	name="whistleNon";
	sound[]={\addin\fx\whistleNon.ogg,0.9,1};
	titles[] = {};
	};
class playerSnoring
	{
	name="playerSnoring";
	sound[]={\sound\snoring.ogg,0.9,1};
	titles[] = {};
	};
	class drink_water
	{
	name="drink_water";
	sound[]={\sound\drink_water.ogg,1,1};
	titles[] = {};
	};
	class nam
	{
		name = "Siren1";
		sound[] = {\sound\SirenLoopMono.ogg, db-6, 1.0};
		titles[] = {""};
	};
	class eve
	{
		name = "Siren2";
		sound[] = {\sound\Sirens.ogg, db-6, 1.0};
		titles[] = {""};
	};
	class puk
	{
		name = "Siren3";
		sound[] = {\sound\Sirens2.ogg, db-6, 1.0};
		titles[] = {""};
	};
};