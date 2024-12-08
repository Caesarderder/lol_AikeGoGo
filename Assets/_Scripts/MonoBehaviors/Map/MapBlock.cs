using System.Collections.Generic;
using UnityEngine;

public class MapBlock : MonoBehaviour,ITimeBackable
{
    public MapBlock ParentBlock;
    public MapBlock ChildBlock;

    Transform childPos;

    public float ChildPos => childPos.transform.position.x;
    public float CurPos => transform.position.x;

    #region TimeBack
    bool _isBack;
    TimeBackManager _timeManager;
    Dictionary<int,Vector3> _timeRecords = new(100);

    public void TimeStateRecord(int index)
    {
        if(_timeRecords.ContainsKey(index))
            _timeRecords[index]=transform.position;
        else
            _timeRecords.Add(index, transform.position);
    }
    public void TimeBackStart() { 
        _isBack = true;
    }
    public void TimeBackTick(int index)
    {
        if(_timeRecords.ContainsKey(index))
            transform.position = _timeRecords[index];
    }
    public void TimeBackEnd()
    {
        _isBack = false;
    }

    #endregion

    private void Awake()
    {
        childPos=transform.GetChild(0);
    }
    private void Start()
    {
        _timeManager=DataModule.Resolve<GamePlayDM>().TimeBackManager;
        _timeManager.Register(this);
    }

    public void Spawn(MapBlock lastBlock)
    {
        ParentBlock = lastBlock;
    }

    public Vector3 GetChildPos()
    {
        return childPos.position;
    }

    public void SetNextBlock(MapBlock next)
    {
        ChildBlock = next;
    }


    public void Tick(float speed)
    {
        Move(speed);

    }

    void Move(float speed)
    {
        if(!_isBack)
        {
            var pos = transform.position;
            transform.position = pos + new Vector3(-speed * Time.deltaTime, pos.y, pos.z);
        }
    }
    
    public void Hide()
    {

    }

    public void SelfDestory()
    {
        if(ChildBlock!=null)
            ChildBlock.ParentBlock = null;
        Destroy(gameObject);
    }
}
