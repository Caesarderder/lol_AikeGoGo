using System.Collections.Generic;
using UnityEngine;

public class EkkoTimeBackView : MonoBehaviour
{
    Dictionary<int, Material[]> info=new();
    [SerializeField]
    Material[] materials;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        var meshRender=GetComponentsInChildren<SkinnedMeshRenderer>();
        for ( int i = 0; i < meshRender.Length; i++ ) {
            info.Add(i, meshRender[i].materials);
        }
        
    }
    public void Enter()
    {

        var meshRender=GetComponentsInChildren<SkinnedMeshRenderer>();
        for ( int i = 0; i < meshRender.Length; i++ ) {
             meshRender[i].materials=materials;
        }

    }
    public void Exit()
    {
        var meshRender=GetComponentsInChildren<SkinnedMeshRenderer>();
        for ( int i = 0; i < meshRender.Length; i++ ) {
             meshRender[i].materials=info[i];
        }

    }

}
