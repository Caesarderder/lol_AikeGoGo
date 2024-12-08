using System.Collections.Generic;
using UnityEngine;
using UnityEngine.PlayerLoop;

public class MonoManager : MonoBehaviour
{
    public Transform UIRoot;
    public Transform AudioPool;

    List<IUpdate> UpdateList=new();

    void Awake()
    {
        
    }

    public void Register(IUpdate update)
    {
        if(!UpdateList.Contains(update))
            UpdateList.Add(update);
    }
    public void UnRegister(IUpdate update)
    {

        if(UpdateList.Contains(update))
            UpdateList.Remove(update);
    }

    // Update is called once per frame
    void Update()
    {
        foreach ( var item in UpdateList )
        {
            item?.Tick();
        }
        
    }
}
