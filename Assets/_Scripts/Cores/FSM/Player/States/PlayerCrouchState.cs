using System.Collections;
using System.Collections.Generic;
using UnityEngine;
namespace FSM
{
    public class PlayerCrouchState : ActionState
    {
        private PlayerEntity player;
        private PlayerMovement movement;
        private Combat Combat;

        private PlayerInputHandler inputHandler;
        private PlayerDataSO data;


        //State
        private Collider collider;
        private string _animationName;

        public PlayerCrouchState(Entity Entity, PlayerNormalState NormalState,PlayerEntity player, string anmationName):base(Entity,NormalState)
        {
            this.player = player;
            movement = player.Movement;
            Combat= player.Combat;
            inputHandler = player.InputHandler;
            data = player.Data;
            _animationName = anmationName;
            collider= player.GetComponentInChildren<Collider>();
        }

        public override void Enter()
        {
            base.Enter();
            Combat.CanReceiveDamage = false;
            movement.CanMove = true;
            movement._controller.center= new Vector3(0,0.34f,0);
            movement._controller.height= 0.5f;
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
            //movement.SetTargetMoveSpeed(move * data.CrouchMoveSpeed);
            movement.SetMoveSPeedOffset(data.CrouchMoveSpeed);
            movement.HorizontalMove();
        }

        public override void Exit()
        {
            base.Exit();
            Debug.Log("Exit");
            movement._controller.center= new Vector3(0, 0.85f, 0);
            movement._controller.height= 1.69f;
            Combat.CanReceiveDamage = true;
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
