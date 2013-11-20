_pathtosuicide = "Scripts\";
_EXECscript1 = 'player execVM "'+_pathtosuicide+'%1"';
 
Suicideconfirm =
[
    ["",true],
        ["CONFIRM SUICIDE", [2], "", -5, [["expression", format[_EXECscript1, "suicide.sqf"]]], "1", "1"],
        ["", [-1], "", -5, [["expression", ""]], "1", "0"],
            ["IM NOT DONE YET", [3], "", -3, [["expression", ""]], "1", "1"]
];
 
 
showCommandingMenu "#USER:Suicideconfirm";