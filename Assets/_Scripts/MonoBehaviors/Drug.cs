using System.Collections.Generic;
using UnityEngine;

public class Drug : MonoBehaviour,IAttackable,ITimeBackable
{
    InstanceAttackTarget target;
    private void Awake()
    {
        target = new InstanceAttackTarget();
        target.Init(this, transform);
        _isAlive=true;
        _lastState=true;
    }
    private void Start()
    {
        _timeManager=DataModule.Resolve<GamePlayDM>().TimeBackManager;
        _timeManager.Register(this);
    }
    private void OnEnable()
    {
        target.OnEnable();
    }
    private void OnDisable()
    {
        target.OnDisable();
    }
    public void ReceiveDamage(float id ,float damage)
    {
        SetState(false);
        _timeManager.Record();

        var index = _timeManager.GameRecordIndex;
        if(_timeRecords.ContainsKey(index))
            _timeRecords[index]= true;
        else
            _timeRecords.Add(index, true);
        _lastState=_isAlive;
    }    
    void SetState(bool isActive)
    {
        _lastState = _isAlive;
        _isAlive =isActive;
        DataModule.Resolve<GamePlayDM>().SetDrugScore(isActive?-1:1);
        gameObject.SetActive(_isAlive);
    }
    #region TimeBack

    bool _lastState;
    bool _isAlive;
    bool _isBack;
    TimeBackManager _timeManager;
    Dictionary<int,bool> _timeRecords = new(4);

    public void TimeStateRecord(int index)
    {
    }
    public void TimeBackStart(int index) { 
        _isBack = true;
    }
    public void TimeBackTick(int index)
    {
        if(_timeRecords.ContainsKey(index))
        {
            SetState(_timeRecords[index]);
            _timeRecords.Remove(index);
        }
    }
    public void TimeBackEnd(int index)
    {
        _isBack = false;
    }

    #endregion

}
