using System.Collections.Generic;
using UnityEngine;
using UnityEngine.PlayerLoop;

public class EkkoTail : MonoBehaviour,ITimeBackable
{
    public int RecordCount = 100;
    LineRenderer lineRenderer;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        lineRenderer = GetComponent<LineRenderer>();
        _timeManager = DataModule.Resolve<GamePlayDM>().TimeBackManager;
        _timeManager.Register(this);
    }

    #region TimeBack
    bool _isBack;
    TimeBackManager _timeManager;
    Dictionary<int, Vector3> _timeRecords = new(100);

    public void TimeStateRecord(int index)
    {
        if ( _timeRecords.ContainsKey(index) )
            _timeRecords[index] = transform.position;
        else
            _timeRecords.Add(index, transform.position);
        
    }

    public void TimeBackStart(int index)
    {
        _isBack = true;
    }
    public void TimeBackTick(int index)
    {
        if ( _timeRecords.ContainsKey(index) )
        {
            transform.position = _timeRecords[index];
            _timeRecords.Remove(index);
        }
    }
    public void TimeBackEnd(int index)
    {
        _isBack = false;
    }

    #endregion
    // Update is called once per frame
    void Update()
    {

    }
}
