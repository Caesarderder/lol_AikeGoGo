using FSM;
using System.Collections.Generic;
using System.Linq;
using UniRx.Triggers;
using UnityEngine;
using UnityEngine.PlayerLoop;

public class MapManager : MonoBehaviour
{
    PlayerEntity _player;
    private List<MapBlock> blocks = new List<MapBlock>(5);

    public List<MapBlock> prefab_Blocks;
    Transform startPos;
    Transform spwanPos;
    Transform destoryPos;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        _player = DataModule.Resolve<GamePlayDM>().GetPlayer();
        startPos=transform.GetChild(0);
        spwanPos=transform.GetChild(1);
        destoryPos=transform.GetChild(2);

        var dirtyBlocks=GetComponentsInChildren<MapBlock>();    
        foreach(MapBlock block in dirtyBlocks)
        {
            block.SelfDestory();
        }
        Init();
    }

    private void FixedUpdate()
    {
        var moveSpeed=_player.Movement.MoveSpeed;
        foreach ( MapBlock block in blocks )
        {
            block.Tick(moveSpeed);
        }
    }
    void Init()
    {
        //生成4个随机的MapBlock
        //生成第一个
        var block=GetRandomBlockPrefab();
        var go=Instantiate(block,  startPos.position, block.transform.rotation,transform).GetComponent<MapBlock>();
        blocks.Add(go);

        for ( int i = 0; i < 3; i++ )
        {
            SpwanBlock();
        }
    }

    void Update()
    {
        MapTick();
    }

    void MapTick()
    {

        if ( blocks[0].CurPos < destoryPos.position.x )
        {
            blocks[0].SelfDestory();
            blocks.RemoveAt(0);
        }
        if ( blocks[blocks.Count-1].ChildPos< spwanPos.position.x )
        {
            SpwanBlock();
        }
    }

    MapBlock SpwanBlock()
    {
        var prefab= GetRandomBlockPrefab();
        var parent = blocks[blocks.Count - 1];
        var block=Instantiate(prefab,  parent.GetChildPos(), prefab.transform.rotation,transform).GetComponent<MapBlock>();

        parent.SetNextBlock(parent);
        block.Spawn(parent);
        blocks.Add(block);
        return block;
    }

    MapBlock GetRandomBlockPrefab()
    {
        var max = prefab_Blocks.Count;
        return prefab_Blocks[Random.Range(0,max)];
    }

}
