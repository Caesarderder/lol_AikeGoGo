using System.Collections;
using System.Collections.Generic;
using UnityEngine;
namespace FSM
{
    public class PlayerInstanceAttack : CoreComponent
    {
        //FSM
        private PlayerEntity Player;
        private PlayerInputHandler inputHandler;
        PlayerMovement movement;
        bool _isAttack;
 
        protected override void Awake()
        {
            base.Awake();
            Player=GetComponentInParent<PlayerEntity>();
            inputHandler=GetComponentInParent<PlayerInputHandler>();
        }
        private void Start()
        {
            movement=Player.Movement;
            
        }
        public void Enter()
        {
            _isAttack = true;
            movement.CanMove = true;
            //player.Animator.SetTrigger(_animationName);
            EventAggregator.Subscribe<SInstanceAttackTarget>(ApplyAttack);
            EventAggregator.Publish(new SStartInstanceAttack());
        }
        public void Exit()
        {
            _isAttack = false;
            EventAggregator.Unsubscribe<SInstanceAttackTarget>(ApplyAttack);
            EventAggregator.Publish(new SEndInstanceAttack());
            //movement.UseGravity = true;
            //movement.CanMove= true;
            Debug.Log("Exit");
        }
        void ApplyAttack(SInstanceAttackTarget evt)
        {
            Player.InstanceAttack(evt);
            Exit();
        }

        public override void LogicUpdate()
        {
            base.LogicUpdate();
            if(inputHandler.Spell2)
            {
                if(_isAttack)
                {
                    Exit();
                }
                else
                    Enter();
                inputHandler.Spell2 = false;
            }
        }

        public override void PhysicsUpdate()
        {
            base.PhysicsUpdate();
        }
    }
}
