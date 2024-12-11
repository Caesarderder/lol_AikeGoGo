using DG.Tweening;
using FSM;
using System.Collections.Generic;
using UnityEngine;

public class Drug : MonoBehaviour,ITimeBackable
{
    Transform player;
    [SerializeField]
    ParticleSystem particle;

    [SerializeField]
    Transform Sense,boomPos;
    bool isSHow;

    //InstanceAttackTarget target;
    private void Awake()
    {
        //target = new InstanceAttackTarget();
        //target.Init(this, transform);
        _isAlive=true;
        _lastState=true;
    }
    private void Update()
    {
        if(!isSHow&&player!=null)
        {
            if(player.transform.position.x>Sense.transform.position.x)
            {
                isSHow = true;
                particle.Stop();
                particle.Play();
            }
        }
    }
    private void Start()
    {
        player=DataModule.Resolve<GamePlayDM>().GetPlayer().transform;
        _timeManager=DataModule.Resolve<GamePlayDM>().TimeBackManager;
        _timeManager.Register(this);
    }
    private void OnTriggerEnter(Collider other)
    {
        if(!_isBack)
        {

            var player = other.GetComponentInParent<PlayerEntity>();
            if ( player != null )
            {

                EventAggregator.Publish(new SPlayAudio()
                {
                    type = 0
                });

                SetState(false);

                var go = Manager<ObjectPoolManager>.Inst.GetGoFromPool(3).GetComponent<ParticlePool>();
                go.Play(3, boomPos.position);


                _timeManager.Record();

                var index = _timeManager.GameRecordIndex;
                if ( _timeRecords.ContainsKey(index) )
                    _timeRecords[index] = true;
                else
                    _timeRecords.Add(index, true);
                _lastState = _isAlive;
            }
        }
    }
    private void OnEnable()
    {
        //target.OnEnable();
    }
    private void OnDisable()
    {
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
public struct SPlayAudio
{
    public int type;

}
