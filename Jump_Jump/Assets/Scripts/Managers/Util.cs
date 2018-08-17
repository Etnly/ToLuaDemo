using UnityEngine;
using System;
using System.IO;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using System.Security.Cryptography;
using DG.Tweening;
using System.Text.RegularExpressions;
using LuaInterface;


public class Util {

    public static int Int(object o)
    {
        return Convert.ToInt32(o);
    }

    public static float Float(object o)
    {
        return (float)Math.Round(Convert.ToSingle(o), 2);
    }

    public static long Long(object o)
    {
        return Convert.ToInt64(o);
    }
    public static int Random(int min, int max)
    {
        return UnityEngine.Random.Range(min, max);
    }

    public static float Random(float min, float max)
    {
        return UnityEngine.Random.Range(min, max);
    }

    public static void Destroy(UnityEngine.Object o, float time)
    {
        UnityEngine.GameObject.Destroy(o, time);
    }
    //摄像机DoTween移动
    public static void DoMove(Camera cam,Vector3 vec, float time)
    {
        cam.transform.DOMove(vec, time);
    }
    //GameObject DoTween移动
    public static void DoMove(GameObject obj, Vector3 vec, float time)
    {
        obj.transform.DOMove(vec, time);
    }

    public static void DoScale(GameObject obj, float f, float time)
    {
        obj.transform.DOScale(f, time);
    }

    public static void DoScale(GameObject obj, Vector3 vec, float time)
    {
        obj.transform.DOScale(vec, time);
    }

    public static void DoLocalMoveX(GameObject obj, float f, float time)
    {
        obj.transform.DOLocalMoveX(f, time);
    }

    public static void DoLocalMoveY(GameObject obj, float f, float time)
    {
        obj.transform.DOLocalMoveY(f, time);
    }

    public static void DoLocalMoveZ(GameObject obj, float f, float time)
    {
        obj.transform.DOLocalMoveZ(f, time);
    }

    public static void SetActive(GameObject obj, bool b)
    {
        obj.SetActive(b);
    }

    public static void LookAt(GameObject obj, Transform tran)
    {
        obj.transform.LookAt(tran);
            
    }
}
