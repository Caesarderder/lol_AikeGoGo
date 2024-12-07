using System.Collections;
using System.Collections.Generic;
using UnityEngine;
namespace FSM
{
    public class PlayerNormalAttackState : ActionState
    {
        private PlayerEntity player;
        private PlayerMovement movement;
        private Combat combat;

        private PlayerInputHandler inputHandler;
        private PlayerDataSO data;



        //State
        AttackUid attackUid = new();
        private Collider collider;
        private string _animationName;

        public PlayerNormalAttackState(Entity Entity, PlayerNormalState NormalState,PlayerEntity player, string anmationName):base(Entity,NormalState)
        {
            this.player = player;
            movement = player.Movement;
            combat = player.Combat;
            inputHandler = player.InputHandler;
            data = player.Data;
            _animationName = anmationName;
        }

        public override void Enter()
        {
            base.Enter();
            movement.CanMove = true;
            attackUid.Reset();
            player.Animator.SetTrigger(_animationName);
            combat.AddAttackHandler(ApplyAttack);
            HorizontalMove();
        }
        public override void Exit()
        {
            base.Exit();
            combat.RemoveAttackHandler(ApplyAttack);
            Debug.Log("Exit");
        }

        void ApplyAttack(IAttackable attackable)
        {
            attackable.ReceiveDamage(attackUid.value,data.NormalAttackDamage);
        }

        public override void PhysicsUpdate()
        {
            base.PhysicsUpdate();
            HorizontalMove();
        }

        private void CheckIfTransition()
        {
            if ( inputHandler.Crouch == false || inputHandler.Jump )
            {
                player.StateMachine.ChangeState(player.NormalState);
            }

        }
        private void HorizontalMove()
        {
            movement.SetTargetMoveSpeed(data.AttackMoveSpeed);
            movement.HorizontalMove();
        }


        public override void LogicUpdate()
        {
            base.LogicUpdate();
            //CheckIfTransition();
        }

        

    }
}
