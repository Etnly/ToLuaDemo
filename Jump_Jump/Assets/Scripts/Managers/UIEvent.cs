using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.IO;
using LuaInterface;

public class UIEvent : MonoBehaviour {

    public static void AddButtonOnClick(GameObject game, LuaFunction function)
    {
        if (game == null)
            return;
        Button btn = game.GetComponent<Button>();
        btn.onClick.AddListener(
            delegate () {
                function.Call(game);
            }
        );
    }
}
