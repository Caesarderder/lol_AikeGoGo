using System.Collections;
using System.Collections.Generic;
using UnityEngine;
namespace FSM
{
    public class PlayerNormalAttackState : ActionState
    {
        private PlayerEntity player;
        private PlayerMovement movement;

        private PlayerInputHandler inputHandler;
        private PlayerDataSO data;


        //State
        private Collider collider;
        private string _animationName;

        public PlayerNormalAttackState(Entity Entity, PlayerNormalState NormalState,PlayerEntity player, string anmationName):base(Entity,NormalState)
        {
            this.player = player;
            movement = player.Movement;
            inputHandler = player.InputHandler;
            data = player.Data;
            _animationName = anmationName;
        }

        public override void Enter()
        {
            base.Enter();
            movement.CanMove = true;
            player.Animator.SetTrigger(_animationName);
            Debug.Log("Enter");
            HorizontalMove();
            //collider.enabled = false;
        }

        public override void PhysicsUpdate()
        {
            base.PhysicsUpdate();
            HorizontalMove();
        }

        private void CheckIfTransition()
        {
            //if (inputHandler.Crouch == false||inputHandler.Jump)
            //{
            //    player.StateMachine.ChangeState(player.NormalState);
            //}

        }

        private void HorizontalMove()
        {
            //var move = inputHandler.MoveNormalized;
            movement.SetTargetMoveSpeed(data.CrouchMoveSpeed);
            movement.HorizontalMove();
        }

        public override void Exit()
        {
            base.Exit();
            Debug.Log("Exit");
            //player.Animator.SetBool(_animationName,false);

            //collider.enabled = true;
        }

        public override void LogicUpdate()
        {
            base.LogicUpdate();
            //CheckIfTransition();
        }

        

    }
}
