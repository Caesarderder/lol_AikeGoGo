using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace FSM
{
    public class InteractorEntity : Entity
    {
        //State
        public InteractorNormalState NormalState;
        public InteractorActionState ActionState;
        public DieState DieState;

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
            DieState=new DieState(this);

            Animator = GetComponentInChildren<Animator>();
            StateMachine.Init(NormalState);
            trigger.action=OnAnimationFishedTrigger;
            Stats.ChannelHealthChange += OnHealthChange;
        }

        public override void Die()
        {
            base.Die();
            Animator.SetTrigger("Death");
            StateMachine.ChangeState(DieState);
        }

        public void OnHealthChange(float value)
        {
            Die();
        }

        public void EnterInteractAction(int index)
        {
            ActionState.index=index;
            StateMachine.ChangeState(ActionState);

        }

        protected override void FixedUpdate()
        {
            base.FixedUpdate();
        }

        protected override void Update()
        {
            base.Update();
            
        }
        protected override void OnAnimationFishedTrigger()
        {
            if(!isDie)
            StateMachine.CurrentState.AnimationFinishedTrigger();
        }
    }

}
