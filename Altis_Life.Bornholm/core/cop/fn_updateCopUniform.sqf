/*
  File: fn_updateCopUniform.sqf
  Author: Jan Christophersen

  Description:
  Updates the cop uniforms to our custom skins.
*/

if ((side player) != west) exitWith {};

switch (uniform player) do {
  case "D41_police_man_uniform":
  {
    player setObjecttextureGlobal [0, "textures\police_uniform.paa"];
  };
  case "U_I_CombatUniform_tshirt":
  {
    player setObjecttextureGlobal [0, "textures\police_uniform_zoll.paa"];
  };
};

if (!isNull unitBackpack player) then {
  (unitBackpack player) setObjectTextureGlobal [0, ""];
};
