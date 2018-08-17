using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BoxControl : MonoBehaviour {

	// Use this for initialization
	void Start () {
        
        LuaManager.Instance.LuaClient.luaState.DoFile("BoxControl.lua");
        LuaManager.Instance.LuaClient.CallFunc("Box.Awake", this.gameObject);

	}
	
	// Update is called once per frame
	void Update () {
        LuaManager.Instance.LuaClient.CallFunc("Box.Update", this.gameObject);
	}


}
