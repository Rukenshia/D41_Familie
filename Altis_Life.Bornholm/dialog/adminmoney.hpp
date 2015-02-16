class adminmoney {

  idd = 5800;
  movingEnable = true;
  enableSimulation = true;

  class controlsBackground {

    class Background: Life_RscText
    {
      idc = -1;
      x = 0.41 * safezoneW + safezoneX;
      y = 0.423 * safezoneH + safezoneY;
      w = 0.16 * safezoneW;
      h = 0.234 * safezoneH;
      colorBackground[] = {0,0,0,0.5};
    };
    class Frame: Life_RscFrame
    {
      idc = -1;
      x = 0.41 * safezoneW + safezoneX;
      y = 0.423 * safezoneH + safezoneY;
      w = 0.16 * safezoneW;
      h = 0.234 * safezoneH;
    };
    class target_name: Life_RscText
    {
      idc = 5802;
      text = "";
      style= 0;
      x = 0.464 * safezoneW + safezoneX;
      y = 0.434 * safezoneH + safezoneY;
      w = 0.10 * safezoneW;
      h = 0.022 * safezoneH;
      colorBackground[] = {0,0,0,0.5};
    };
    class Target: Life_RscText
    {
      idc = -1;
      text = "Spieler:";
      style= 0;
      x = 0.415 * safezoneW + safezoneX;
      y = 0.434 * safezoneH + safezoneY;
      w = 0.0360937 * safezoneW;
      h = 0.022 * safezoneH;
      colorBackground[] = {0,0,0,0.5};
    };
    class amount: Life_RscText
    {
      idc = -1;
      text = "Betrag:";
      style= 0;
      x = 0.415 * safezoneW + safezoneX;
      y = 0.467 * safezoneH + safezoneY;
      w = 0.0360937 * safezoneW;
      h = 0.022 * safezoneH;
      colorBackground[] = {0,0,0,0.5};
    };

    class reason: Life_RscText
    {
      idc = -1;
      text = "Grund:";
      style= 0;
      x = 0.415 * safezoneW + safezoneX;
      y = 0.467 * safezoneH + (0.011 * safezoneH) + (0.022 * safezoneH) + safezoneY;
      w = 0.0360937 * safezoneW;
      h = 0.022 * safezoneH;
      colorBackground[] = {0,0,0,0.5};
    };

  };

  class controls {

    class Btn_Give_Money: Life_RscButtonMenu
    {
      idc = 5804;
      text = "Rückerstatten";
      style= 0;
      onButtonClick = "[cursorTarget] call life_fnc_giveAdminMoney; [] call life_fnc_hudUpdate; closeDialog 0;";
      x = 0.42 * safezoneW + safezoneX;
      y = 0.6 * safezoneH + safezoneY;
      w = 0.06 * safezoneW;
      h = 0.0345 * safezoneH;
      sizeEx = 0.023;
      colorBackground[] = {0,0,0,0.5};
    };
    class Btn_Cancel: Life_RscButtonMenu
    {
      idc = -1;
      text = "Abbrechen";
      style= 0;
      onButtonClick = "closeDialog 0;";
      x = 0.498 * safezoneW + safezoneX;
      y = 0.6 * safezoneH + safezoneY;
      w = 0.062 * safezoneW;
      h = 0.033 * safezoneH;
      sizeEx = 0.023;
      colorBackground[] = {0,0,0,0.5};
    };
    class money_edit: Life_RscEdit
    {
      idc = 5805;
      text = "";
      style= 0;
      x = 0.464 * safezoneW + safezoneX;
      y = 0.467 * safezoneH + safezoneY;
      w = 0.10 * safezoneW;
      h = 0.022 * safezoneH;
      colorBackground[] = {0,0,0,0.5};
    };

    class reason_edit: Life_RscEdit
    {
      idc = 5806;
      text = "";
      style= 16;
      x = 0.464 * safezoneW + safezoneX;
      y = 0.467 * safezoneH +  (0.022 * safezoneH) + (0.011 * safezoneH) + safezoneY;
      w = 0.10 * safezoneW;
      h = 0.088 * safezoneH;
      colorBackground[] = {0,0,0,0.5};
    };
  };
};
