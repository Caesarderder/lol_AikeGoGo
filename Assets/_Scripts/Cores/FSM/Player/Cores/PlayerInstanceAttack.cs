using System.Collections;
using System.Collections.Generic;
using UnityEngine;
namespace FSM
{
    public class PlayerInstanceAttack : CoreComponent
    {
        //FSM
        private PlayerEntity Player;
        private PlayerStats Stats;
        private PlayerInputHandler inputHandler;
        PlayerMovement movement;
        PlayerTimeFrozen timeFrozen;
        bool _isAttack;
 
        protected override void Awake()
        {
            base.Awake();
            Player=GetComponentInParent<PlayerEntity>();
            timeFrozen = Player.PlayerTimeFrozen;
            Stats = Player.Stats;
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
            timeFrozen.Enter();
            //player.Animator.SetTrigger(_animationName);
            EventAggregator.Subscribe<SInstanceAttackTarget>(ApplyAttack);
            EventAggregator.Publish(new SStartInstanceAttack());
        }
        public void Exit()
        {
            _isAttack = false;
            EventAggregator.Unsubscribe<SInstanceAttackTarget>(ApplyAttack);
            EventAggregator.Publish(new SEndInstanceAttack());
            timeFrozen.Exit();
            //movement.UseGravity = true;
            //movement.CanMove= true;
            Debug.Log("Exit");
        }
        void ApplyAttack(SInstanceAttackTarget evt)
        {
            Player.InstanceAttack(evt);
            Player.Movement.ResetCamera();
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
                else if(Stats.CheckIfCanSpell(Player.Data.InstaceAttackSpCost))
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
