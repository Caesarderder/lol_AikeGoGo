using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace FSM
{
    public class PlayerEntity : Entity
    {
        //State
        public PlayerNormalState NormalState;
        public PlayerCrouchState CrouchState;
        //public PlayerCombatState CombatState;
        public PlayerNormalAttackState NormalAttackState;

        //Cores
        public PlayerMovement Movement =>movement?movement:Core.GetCoreComponent<PlayerMovement>(ref movement);
        private PlayerMovement movement;
        public PlayerSense Sense=> sense? sense: Core.GetCoreComponent<PlayerSense>(ref sense);
        private PlayerSense sense;
        
        public Combat Combat=> combat? combat : Core.GetCoreComponent<Combat>(ref combat);
        private Combat combat;
        
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
            dm.TimeBackManager = new TimeBackManager();
            ResManager.MonoManager.Register(dm.TimeBackManager);
        }
        private void Start()
        {
            Animator = GetComponentInChildren<Animator>();
            InputHandler = GetComponent<PlayerInputHandler>();
            NormalState=new PlayerNormalState(this,this,"s_Normal");
            CrouchState = new PlayerCrouchState(this,NormalState,this, "Crouch");
            NormalAttackState= new PlayerNormalAttackState(this,NormalState,this, "NormalAttack");
            //CombatState = new PlayerCombatState(this, NormalState,"s_Combat");
            StateMachine =new StateMachine();
            StateMachine.Init(NormalState);
        }

        public override void Die()
        {
            base.Die();
            Destroy(gameObject);
        }

        protected override void FixedUpdate()
        {
            base.FixedUpdate();
        }

        protected override void Update()
        {
            base.Update();
            if(!isDie&&InputHandler.Spell1)
            {
                InputHandler.Spell1 = false;
                DataModule.Resolve<GamePlayDM>().TimeBackManager.DoTimeBack(1);
            }

        }
        protected override void OnAnimationFishedTrigger()
        {
            StateMachine.CurrentState.AnimationFinishedTrigger();
        }
    }

}
