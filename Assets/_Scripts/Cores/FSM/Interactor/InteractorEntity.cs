using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public struct SEntityState
{
    public Vector3 Pos;
    public int AcNameHash;
    public float AcPlayTime;
    public bool IsDie;
}

namespace FSM
{
    public class InteractorEntity : Entity,ITimeBackable
    {
        //State
        public InteractorNormalState NormalState;
        public InteractorActionState ActionState;
        public FoolState FoolState;

        //Cores
        public InteractCore Interact => interact? interact: Core.GetCoreComponent<InteractCore>(ref interact);
        private InteractCore interact;
        public Stats Stats => stats ? stats : Core.GetCoreComponent<Stats>(ref stats);
        private Stats stats;

        //Player
        [HideInInspector]
        public Animator Animator;

        [SerializeField]
        AnimationTrigger trigger;

        private void Start()
        {
            NormalState=new InteractorNormalState(this,"Normal");
            ActionState = new InteractorActionState(this,NormalState);
            FoolState=new FoolState(this);

            Animator = GetComponentInChildren<Animator>();
            StateMachine.Init(NormalState);
            trigger.action=OnAnimationFishedTrigger;
            Stats.ChannelHealthChange += OnHealthChange;

            _timeManager=DataModule.Resolve<GamePlayDM>().TimeBackManager;
            _timeManager.Register(this);
        }

        private void OnDestroy()
        {
            _timeManager.UnRegister(this);
            
        }

        #region TimeBack

        bool _isBack;
        TimeBackManager _timeManager;
        Dictionary<int, SEntityState> _timeRecords = new(100);

        public void TimeStateRecord(int index)
        {
            var curAcInfo=Animator.GetCurrentAnimatorStateInfo(0);
            if ( _timeRecords.ContainsKey(index) )
                _timeRecords[index] = new SEntityState()
                { 
                    Pos=transform.position,
                    AcNameHash=curAcInfo.shortNameHash,
                    AcPlayTime=curAcInfo.normalizedTime,
                    IsDie=isDie,
                };

            else
                _timeRecords[index] = new SEntityState()
                { 
                    Pos=transform.position,
                    AcNameHash=curAcInfo.shortNameHash,
                    AcPlayTime=curAcInfo.normalizedTime,
                    IsDie=isDie,
                };
        }
        public void TimeBackStart(int index)
        {
            StateMachine.ChangeState(FoolState);
            Animator.speed=-0.5f;
            _isBack = true;
        }
        public void TimeBackTick(int index)
        {
            if ( _timeRecords.ContainsKey(index) )
            {
                var info = _timeRecords[index];
                transform.position = info.Pos;
                //Animator.Play(info.AcNameHash);
                Animator.Play(info.AcNameHash,0,info.AcPlayTime);
                isDie= info.IsDie;
                _timeRecords.Remove(index);
            }
        }
        public void TimeBackEnd(int index)
        {
            StateMachine.ChangeState(isDie?FoolState:NormalState);
            Animator.speed=1f;
            _isBack = false;
        }

        #endregion


        public override void Die()
        {
            if ( _isBack )
                return;
            base.Die();
            Animator.SetTrigger("Death");
            StateMachine.ChangeState(FoolState);
        }

        public void OnHealthChange(float value)
        {
            if(!_isBack)
            Die();
        }

        public void EnterInteractAction(int index)
        {
            ActionState.index = index;
            StateMachine.ChangeState(ActionState);

        }

        protected override void FixedUpdate()
        {
            if(!_isBack)
            base.FixedUpdate();
        }

        protected override void Update()
        {
            if(!_isBack)
            base.Update();
            
        }
        protected override void OnAnimationFishedTrigger()
        {
            if(!isDie&&!_isBack)
            StateMachine.CurrentState.AnimationFinishedTrigger();
        }
    }

}
