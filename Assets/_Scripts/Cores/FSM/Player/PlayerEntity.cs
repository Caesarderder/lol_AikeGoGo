using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public struct SPlayerState
{
    public bool IsKeyIndex;
    public Vector3 Pos;
    public int AcNameHash;
    public float AcPlayTime;
    public bool IsDie;
}

namespace FSM
{
    public class PlayerEntity : Entity,ITimeBackable
    {
        //State
        public PlayerNormalState NormalState;
        public PlayerCrouchState CrouchState;
        //public PlayerCombatState CombatState;
        public PlayerNormalAttackState NormalAttackState;
        public PlayerInstanceAttakState InstanceAttackState;
        public FoolState FoolState;

        //Cores
        public PlayerMovement Movement =>movement?movement:Core.GetCoreComponent<PlayerMovement>(ref movement);
        private PlayerMovement movement;
        public PlayerSense Sense=> sense? sense: Core.GetCoreComponent<PlayerSense>(ref sense);
        private PlayerSense sense;
        public PlayerStats Stats => stats ? stats : Core.GetCoreComponent<PlayerStats>(ref stats);
        private PlayerStats stats;
        
        public Combat Combat=> combat? combat : Core.GetCoreComponent<Combat>(ref combat);
        private Combat combat;
        public PlayerTimeFrozen PlayerTimeFrozen => playerTimeFrozen ? playerTimeFrozen : Core.GetCoreComponent<PlayerTimeFrozen>(ref playerTimeFrozen);
        private PlayerTimeFrozen playerTimeFrozen;
        
        //Data
        public PlayerDataSO Data=> EntityData as PlayerDataSO;

        //Player
        [HideInInspector]
        public Animator Animator;
        [HideInInspector]
        public PlayerInputHandler InputHandler;

        protected override void Awake()
        {
            base.Awake();
            var dm=DataModule.Resolve<GamePlayDM>();
            dm.SetPlayer(this);
            _timeManager = new TimeBackManager();
            dm.TimeBackManager = _timeManager;
            ResManager.MonoManager.Register(dm.TimeBackManager);
            dm.TimeBackManager.Register(this);
        }
        private void Start()
        {
            Animator = GetComponentInChildren<Animator>();
            InputHandler = GetComponent<PlayerInputHandler>();
            NormalState=new PlayerNormalState(this,this,"s_Normal");
            CrouchState = new PlayerCrouchState(this,NormalState,this, "Crouch");
            NormalAttackState= new PlayerNormalAttackState(this,NormalState,this, "NormalAttack");
            InstanceAttackState= new PlayerInstanceAttakState(this,NormalState,this, "InstanceAttack");
            FoolState=new FoolState(this);
            //CombatState = new PlayerCombatState(this, NormalState,"s_Combat");
            StateMachine =new StateMachine();
            StateMachine.Init(NormalState);
        }

        #region TimeBack

        bool _isBack;
        TimeBackManager _timeManager;
        Dictionary<int, SPlayerState> _timeRecords = new(100);

        public void TimeStateRecord(int index)
        {
            var isKeyIndex = Sense.IsGrounded&&StateMachine.CurrentState is PlayerNormalState;
            var curAcInfo=Animator.GetCurrentAnimatorStateInfo(0);
            if ( _timeRecords.ContainsKey(index) )
                _timeRecords[index] = new SPlayerState()
                { 
                    IsKeyIndex=isKeyIndex,
                    Pos=transform.position,
                    AcNameHash=curAcInfo.shortNameHash,
                    AcPlayTime=curAcInfo.normalizedTime,
                    IsDie=isDie,
                };

            else
                _timeRecords[index] = new SPlayerState()
                { 
                    IsKeyIndex=isKeyIndex,
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
            Destroy(gameObject);
        }

        protected override void FixedUpdate()
        {
            if(!_isBack)
            base.FixedUpdate();
        }

        protected override void Update()
        {
            if(!_isBack)
            {
                base.Update();
                if ( !isDie && InputHandler.Spell1&&!PlayerTimeFrozen.IsFrozen&&Stats.CheckIfCanSpell(Data.TimeBackSpCost))
                {
                    Stats.SpChange(-Data.TimeBackSpCost);
                    InputHandler.Spell1 = false;
                    DataModule.Resolve<GamePlayDM>().TimeBackManager.DoTimeBack(GetBackIndex());
                }
            }

        }
        int GetBackIndex()
        {
            var stap = _timeManager.BackIndex;
            var curIndex=_timeManager.GameRecordIndex-stap;
            for(int i = 0;i<100;i++ )
            {
                if(_timeRecords.ContainsKey(curIndex-i))
                {
                    if ( _timeRecords[curIndex-i].IsKeyIndex )
                    {
                        curIndex-=i;
                        break;
                    }

                }
                if(_timeRecords.ContainsKey(curIndex+i))
                {
                    if ( _timeRecords[curIndex+i].IsKeyIndex )
                    {
                        curIndex+=i;
                        break;
                    }
                }
            }
            Debug.Log(" FromIndex: "+_timeManager.GameRecordIndex+"   BackTo" + (curIndex < 1 ? 1 : curIndex));

            return curIndex<1?1:curIndex;

        }
        protected override void OnAnimationFishedTrigger(int i=0)
        {
            StateMachine.CurrentState.AnimationFinishedTrigger(i);
        }

        public void InstanceAttack(SInstanceAttackTarget evt)
        {
            InstanceAttackState.attack=evt;
            StateMachine.ChangeState(InstanceAttackState);


        }
        public void AddBuff(EBuffType type,float value)
         {
            switch ( type )
            {
                case EBuffType.Hp:
                    Stats.HealthChange(value);
                    break;
                case EBuffType.Sp:
                    Stats.SpChange(value);
                    break;
                case EBuffType.MoveSpeed:
                    Movement.VelocityAddation += value;
                    break;
                default:
                    break;
            }
        }
    }

}
