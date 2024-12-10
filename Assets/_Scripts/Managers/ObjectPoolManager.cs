using UnityEngine;
using System;
using System.Collections.Generic;

[Serializable]
public struct SGoPool
{
    public int index;
    public GameObject go;

}
public class ObjectPoolManager
{
    public Dictionary<int, GameObject> dic_index2Go=new();
    public Dictionary<GameObject, int> dic_go2Index=new();

    private Dictionary<int, Queue<GameObject>> dic_pools=new();

    public ObjectPoolManager()
    {

    }

    #region GameObjectPool

    public void InitGoPools(List<SGoPool> pools)
    {
        dic_pools.Clear();
        dic_pools=new();

        foreach ( SGoPool pool in pools ) {

            dic_index2Go.Add(pool.index, pool.go);
            dic_go2Index.Add( pool.go,pool.index);

            dic_pools.Add(pool.index, new());

        }
    }

    private void GenerateGo(int index,int count=3)
    {
        var pool=dic_pools[index];
        for ( int i = 0; i < count; i++ ) {

            var go=GameObject.Instantiate(dic_index2Go[index].gameObject);
            pool.Enqueue(go);
        }
    }

    public GameObject GetGoFromPool(int index)
    {
        var pool = dic_pools[index];
        if(pool.Count<=0)
        {
            GenerateGo(index);
        }    
        return pool.Dequeue();

    }

    public void BackGoToPool(int index,GameObject go)
    {
        dic_pools[index].Enqueue(go);
    }

    #endregion
}