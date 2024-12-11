using FSM;
using System.Collections.Generic;
using System.Linq;
using UniRx.Triggers;
using UnityEngine;
using UnityEngine.PlayerLoop;

public class MapManager : MonoBehaviour,ITimeBackable
{
    PlayerEntity _player;
    private List<MapBlock> blocks = new List<MapBlock>(5);

    public List<MapBlock> prefab_Blocks;
    Transform startPos;
    Transform spwanPos;
    Transform destoryPos;

    #region TimeBack
    [SerializeField]
    Transform ekkoTran;
    [SerializeField]
    LineRenderer lineRenderer;
    [SerializeField]
    Transform _recordTran;

    Dictionary<int, Vector3> ekkoPos = new();
    bool _isBack;
    float _recordTimer;
    TimeBackManager _timeManager;
    public void TimeStateRecord(int index)
    {
        if ( ekkoPos.ContainsKey(index) )
            ekkoPos[index] = ekkoTran.InverseTransformPoint(_recordTran.transform.position);
        else
            ekkoPos.Add(index,ekkoTran.InverseTransformPoint(_recordTran.transform.position));
    }
    public void TimeBackStart(int index)
    {
        lineRenderer.positionCount = 0;
        _isBack = true;
    }
    public void TimeBackTick(int index)
    {
        if ( ekkoPos.ContainsKey(index) )
        {
            ekkoPos.Remove(index);
        }
    }

    public void TimeBackEnd(int index)
    {
        _isBack = false;
        RenderLine();
    }
    void RenderLine()
    {
        //在玩家右边的不记录，超出5米的不渲染
        var playerPos=_player.transform.position;
        var list=ekkoPos.Where(x => GetWorldPos(x.Value).x <= playerPos.x && GetWorldPos(x.Value).x > (playerPos.x - 10)).Select(x=>(x.Key,x.Value)).ToList();
        //list.;
        //list.Insert(0,(0,_recordTran.position));
        list.Reverse();

        lineRenderer.positionCount = list.Count;
        lineRenderer.SetPositions(list.Select(x=>GetWorldPos(x.Value)).ToArray());
    }
    Vector3 GetWorldPos(Vector3 local)
    {
        return ekkoTran.TransformPoint(local);
    }

    #endregion

    Camera mainCamera;
    Vector2 resolution;
    void Start()
    {
            mainCamera = Camera.main;
        resolution=mainCamera.pixelRect.size;

        _player = DataModule.Resolve<GamePlayDM>().GetPlayer();
        _timeManager= DataModule.Resolve<GamePlayDM>().TimeBackManager;
        _timeManager.Register(this);

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
        FailCheck();
    }

    bool isFail=false;
    void FailCheck()
    {
        if(!isFail&&!_isBack)
        {
            mainCamera = Camera.main;
            var pos = mainCamera.WorldToScreenPoint(_player.transform.position);
            if ( pos.x < 0f )
            {
                if ( _player.Stats.CheckIfDoTimeBack() )
                {

                }
                else
                {
                    isFail = true;
                    EventAggregator.Publish(new SGameOver());

                }
            }
        }


    }

    void MapTick()
    {
        if ( !_isBack)
        {
            RenderLine();
            if ( blocks[0].CurPos < destoryPos.position.x )
            {
                blocks[0].SelfDestory();
                blocks.RemoveAt(0);
            }
            if ( blocks[blocks.Count - 1].ChildPos < spwanPos.position.x )
            {
                SpwanBlock();
            }

            var moveSpeed = _player.Movement.MapMoveSpeed;
            foreach ( MapBlock block in blocks )
            {
                block.Tick(moveSpeed);
            }

            ekkoTran.position -=Vector3.right* moveSpeed * Time.deltaTime;
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
