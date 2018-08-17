using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LuaManager : MonoBehaviour {

    private static LuaManager _instance;
    public static LuaManager Instance{
        get{
            return _instance;
        }
    }

    private LuaClient _luaClient;
    public LuaClient LuaClient
    {
        get
        {
            return _luaClient;
        }
    }
	// Use this for initialization
	void Awake () {
        _instance = this;
        DontDestroyOnLoad(this.gameObject);
        _luaClient = this.gameObject.AddComponent<LuaClient>();
	}
}
