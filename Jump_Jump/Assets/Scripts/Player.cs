using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
public class Player : MonoBehaviour {
	void Start () {
        LuaManager.Instance.LuaClient.luaState.DoFile("Player.lua");
        LuaManager.Instance.LuaClient.CallFunc("Play.Awake", this.gameObject);

	}
	
	void Update () {
        LuaManager.Instance.LuaClient.CallFunc("Play.Update", gameObject);
	}

    private void OnCollisionStay(Collision collision)
    {
        LuaManager.Instance.LuaClient.CallFunc("Play.OnCollisionStay", collision.gameObject);
    }



}
